/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : localhost:3306
 Source Schema         : rentalplatform

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 10/10/2024 16:46:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for b_ad
-- ----------------------------
DROP TABLE IF EXISTS `b_ad`;
CREATE TABLE `b_ad`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `link` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_ad
-- ----------------------------

-- ----------------------------
-- Table structure for b_address
-- ----------------------------
DROP TABLE IF EXISTS `b_address`;
CREATE TABLE `b_address`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mobile` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `desc` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `default` tinyint(1) NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_address_user_id_a37a8d6a_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_address_user_id_a37a8d6a_fk_b_user_id` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_address
-- ----------------------------

-- ----------------------------
-- Table structure for b_classification
-- ----------------------------
DROP TABLE IF EXISTS `b_classification`;
CREATE TABLE `b_classification`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_classification
-- ----------------------------
INSERT INTO `b_classification` VALUES (10, '手动轮椅', '2024-09-12 19:14:08.168543');
INSERT INTO `b_classification` VALUES (11, '电动轮椅', '2024-09-12 19:14:14.126043');

-- ----------------------------
-- Table structure for b_comment
-- ----------------------------
DROP TABLE IF EXISTS `b_comment`;
CREATE TABLE `b_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `comment_time` datetime(6) NULL DEFAULT NULL,
  `like_count` int NOT NULL,
  `thing_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_comment_thing_id_57ab492b_fk_b_thing_id`(`thing_id`) USING BTREE,
  INDEX `b_comment_user_id_46f0670f_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_comment_thing_id_57ab492b_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_comment_user_id_46f0670f_fk_b_user_id` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_comment
-- ----------------------------
INSERT INTO `b_comment` VALUES (5, '好啊', '2024-09-27 14:53:12.473042', 0, 20, 7);

-- ----------------------------
-- Table structure for b_error_log
-- ----------------------------
DROP TABLE IF EXISTS `b_error_log`;
CREATE TABLE `b_error_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `log_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_error_log
-- ----------------------------
INSERT INTO `b_error_log` VALUES (1, '127.0.0.1', '/myapp/index/maintainance/create', 'POST', '参数错误', '2024-09-19 18:39:16.978005');
INSERT INTO `b_error_log` VALUES (2, '127.0.0.1', '/myapp/index/maintainance/create', 'POST', '参数错误', '2024-09-19 18:40:05.463871');
INSERT INTO `b_error_log` VALUES (3, '127.0.0.1', '/myapp/index/maintainance/create', 'POST', '参数错误', '2024-09-19 18:40:57.810637');
INSERT INTO `b_error_log` VALUES (4, '127.0.0.1', '/myapp/index/maintainance/create', 'POST', '参数错误', '2024-09-19 18:41:12.536731');

-- ----------------------------
-- Table structure for b_login_log
-- ----------------------------
DROP TABLE IF EXISTS `b_login_log`;
CREATE TABLE `b_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `ua` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `log_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_login_log
-- ----------------------------
INSERT INTO `b_login_log` VALUES (1, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-01 15:33:00.183158');
INSERT INTO `b_login_log` VALUES (2, 'admin123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-01 15:41:34.882002');
INSERT INTO `b_login_log` VALUES (3, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-01 15:41:40.940998');
INSERT INTO `b_login_log` VALUES (4, 'bbb', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-01 16:00:28.592540');
INSERT INTO `b_login_log` VALUES (5, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36', '2024-02-01 16:05:51.070794');
INSERT INTO `b_login_log` VALUES (6, 'admin123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-12 13:05:52.754499');
INSERT INTO `b_login_log` VALUES (7, 'admin123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-12 13:05:54.480030');
INSERT INTO `b_login_log` VALUES (8, 'admin123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-12 13:06:50.322109');
INSERT INTO `b_login_log` VALUES (9, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-12 13:10:07.200006');
INSERT INTO `b_login_log` VALUES (10, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-12 13:10:24.927031');
INSERT INTO `b_login_log` VALUES (11, 'xxxiazn@gmail.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-12 17:22:51.296624');
INSERT INTO `b_login_log` VALUES (12, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-12 19:41:45.600338');
INSERT INTO `b_login_log` VALUES (13, 'xxxiazn@gmail.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-13 10:21:40.743447');
INSERT INTO `b_login_log` VALUES (14, 'xxxiazn@gmail.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-17 11:24:01.337145');
INSERT INTO `b_login_log` VALUES (15, '3580222@gmail.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-18 21:20:24.688659');
INSERT INTO `b_login_log` VALUES (16, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-19 10:49:40.460603');
INSERT INTO `b_login_log` VALUES (17, 'admin123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-20 01:56:19.456809');
INSERT INTO `b_login_log` VALUES (18, 'admin123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-20 01:58:51.673297');
INSERT INTO `b_login_log` VALUES (19, '3580222@gmail.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-20 21:39:21.699201');
INSERT INTO `b_login_log` VALUES (20, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-21 15:39:18.429456');
INSERT INTO `b_login_log` VALUES (21, '3580222@gmail.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-21 15:55:29.297815');
INSERT INTO `b_login_log` VALUES (22, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-21 16:43:53.592334');
INSERT INTO `b_login_log` VALUES (23, '123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-21 17:28:09.985207');
INSERT INTO `b_login_log` VALUES (24, '3580222@gmail.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-21 17:36:18.225040');
INSERT INTO `b_login_log` VALUES (25, '3580222@gmail.com', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-21 23:12:01.030957');
INSERT INTO `b_login_log` VALUES (26, 'admin', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36', '2024-09-22 00:49:18.693314');
INSERT INTO `b_login_log` VALUES (27, 'admin123', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/129.0.0.0 Safari/537.36', '2024-09-27 15:58:21.592394');

-- ----------------------------
-- Table structure for b_maintainance
-- ----------------------------
DROP TABLE IF EXISTS `b_maintainance`;
CREATE TABLE `b_maintainance`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NULL DEFAULT NULL,
  `thing_id` bigint NULL DEFAULT NULL,
  `order_number` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `thing_title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '轮椅型号',
  `maintainance_date` datetime(6) NULL DEFAULT NULL COMMENT '保养时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_maintainance
-- ----------------------------
INSERT INTO `b_maintainance` VALUES (12, 44, 20, '1727423343078', '剑齿虎T‧剑齿虎TR', '2024-09-30 00:00:00.000000');

-- ----------------------------
-- Table structure for b_notice
-- ----------------------------
DROP TABLE IF EXISTS `b_notice`;
CREATE TABLE `b_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `content` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_notice
-- ----------------------------

-- ----------------------------
-- Table structure for b_op_log
-- ----------------------------
DROP TABLE IF EXISTS `b_op_log`;
CREATE TABLE `b_op_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `re_ip` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `re_time` datetime(6) NULL DEFAULT NULL,
  `re_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `re_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `re_content` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `access_time` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_op_log
-- ----------------------------
INSERT INTO `b_op_log` VALUES (1, '127.0.0.1', '2024-02-01 15:36:41.063888', '/myapp/admin/loginLog/list', 'GET', NULL, '16');
INSERT INTO `b_op_log` VALUES (2, '127.0.0.1', '2024-02-01 15:36:41.799080', '/myapp/admin/opLog/list', 'GET', NULL, '24');
INSERT INTO `b_op_log` VALUES (3, '127.0.0.1', '2024-02-01 15:36:42.668423', '/myapp/admin/errorLog/list', 'GET', NULL, '13');
INSERT INTO `b_op_log` VALUES (4, '127.0.0.1', '2024-02-01 15:36:43.198418', '/myapp/admin/opLog/list', 'GET', NULL, '23');
INSERT INTO `b_op_log` VALUES (5, '127.0.0.1', '2024-02-01 15:36:44.325233', '/myapp/admin/loginLog/list', 'GET', NULL, '2');
INSERT INTO `b_op_log` VALUES (6, '127.0.0.1', '2024-02-01 15:36:44.756778', '/myapp/admin/opLog/list', 'GET', NULL, '13');
INSERT INTO `b_op_log` VALUES (7, '127.0.0.1', '2024-02-01 15:36:45.313922', '/myapp/admin/loginLog/list', 'GET', NULL, '20');
INSERT INTO `b_op_log` VALUES (8, '127.0.0.1', '2024-02-01 15:36:45.873766', '/myapp/admin/notice/list', 'GET', NULL, '24');
INSERT INTO `b_op_log` VALUES (9, '127.0.0.1', '2024-02-01 15:36:46.354445', '/myapp/admin/ad/list', 'GET', NULL, '4');
INSERT INTO `b_op_log` VALUES (10, '127.0.0.1', '2024-02-01 15:36:46.857133', '/myapp/admin/notice/list', 'GET', NULL, '23');
INSERT INTO `b_op_log` VALUES (11, '127.0.0.1', '2024-02-01 15:36:47.241503', '/myapp/admin/ad/list', 'GET', NULL, '16');
INSERT INTO `b_op_log` VALUES (12, '127.0.0.1', '2024-02-01 15:36:48.393975', '/myapp/admin/notice/list', 'GET', NULL, '24');
INSERT INTO `b_op_log` VALUES (13, '127.0.0.1', '2024-02-01 15:36:48.829303', '/myapp/admin/ad/list', 'GET', NULL, '16');
INSERT INTO `b_op_log` VALUES (14, '127.0.0.1', '2024-02-01 15:36:49.231798', '/myapp/admin/notice/list', 'GET', NULL, '14');
INSERT INTO `b_op_log` VALUES (15, '127.0.0.1', '2024-02-01 15:36:49.701148', '/myapp/admin/ad/list', 'GET', NULL, '24');
INSERT INTO `b_op_log` VALUES (16, '127.0.0.1', '2024-02-01 15:36:50.044345', '/myapp/admin/notice/list', 'GET', NULL, '18');
INSERT INTO `b_op_log` VALUES (17, '127.0.0.1', '2024-02-01 15:36:50.710696', '/myapp/admin/loginLog/list', 'GET', NULL, '15');
INSERT INTO `b_op_log` VALUES (18, '127.0.0.1', '2024-02-01 15:36:51.127115', '/myapp/admin/opLog/list', 'GET', NULL, '5');
INSERT INTO `b_op_log` VALUES (19, '127.0.0.1', '2024-02-01 15:36:52.600627', '/myapp/admin/errorLog/list', 'GET', NULL, '2');
INSERT INTO `b_op_log` VALUES (20, '127.0.0.1', '2024-02-01 15:36:53.119801', '/myapp/admin/opLog/list', 'GET', NULL, '4');
INSERT INTO `b_op_log` VALUES (21, '127.0.0.1', '2024-02-01 15:36:53.886807', '/myapp/admin/loginLog/list', 'GET', NULL, '3');
INSERT INTO `b_op_log` VALUES (22, '127.0.0.1', '2024-02-01 15:36:54.696677', '/myapp/admin/opLog/list', 'GET', NULL, '18');

-- ----------------------------
-- Table structure for b_order
-- ----------------------------
DROP TABLE IF EXISTS `b_order`;
CREATE TABLE `b_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_number` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `count` int NOT NULL,
  `status` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `order_time` datetime(6) NULL DEFAULT NULL,
  `pay_time` datetime(6) NULL DEFAULT NULL,
  `receiver_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `receiver_address` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `receiver_phone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `thing_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `start_date` datetime(6) NULL DEFAULT NULL COMMENT '订单开始时间',
  `end_date` datetime(6) NULL DEFAULT NULL COMMENT '订单结束时间',
  `days` int NULL DEFAULT NULL COMMENT '租赁天数',
  `price` float NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_order_thing_id_4e345e2c_fk_b_thing_id`(`thing_id`) USING BTREE,
  INDEX `b_order_user_id_64854046_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_order_thing_id_4e345e2c_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_order_user_id_64854046_fk_b_user_id` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_order
-- ----------------------------
INSERT INTO `b_order` VALUES (39, '1726929552035', 1, '3', '2024-09-21 22:39:12.038595', NULL, '3580222@gmail.com', '上海', '19521268588', NULL, 21, 7, '2024-09-22 00:00:00.000000', '2024-09-23 00:00:00.000000', 1, 400);
INSERT INTO `b_order` VALUES (40, '1726931818668', 1, '7', '2024-09-21 23:16:58.672227', NULL, '3580222@gmail.com', '上海', '19521268588', NULL, 21, 7, '2024-10-13 00:00:00.000000', '2024-10-14 00:00:00.000000', 1, 400);
INSERT INTO `b_order` VALUES (41, '1726933364605', 1, '3', '2024-09-21 23:42:44.604950', NULL, '3580222@gmail.com', '上海', '19521268588', NULL, 21, 7, '2024-09-11 00:00:00.000000', '2024-10-16 00:00:00.000000', 35, 14000);
INSERT INTO `b_order` VALUES (42, '1726933495787', 1, '3', '2024-09-21 23:44:55.787009', NULL, '3580222@gmail.com', '上海', '19521268588', NULL, 20, 7, '2024-09-11 00:00:00.000000', '2024-10-16 00:00:00.000000', 35, 17500);
INSERT INTO `b_order` VALUES (43, '1727420915413', 1, '3', '2024-09-27 15:08:35.450479', NULL, '3580222@gmail.com', '上海', '19521268588', NULL, 21, 7, '2024-09-28 00:00:00.000000', '2024-09-29 00:00:00.000000', 1, 400);
INSERT INTO `b_order` VALUES (44, '1727423343078', 1, '3', '2024-09-27 15:49:03.086215', NULL, '3580222@gmail.com', '上海', '19521268588', NULL, 20, 7, '2024-09-28 00:00:00.000000', '2024-09-29 00:00:00.000000', 1, 500);
INSERT INTO `b_order` VALUES (45, '1727424430557', 1, '2', '2024-09-27 16:07:10.563964', NULL, '3580222@gmail.com', '上海', '19521268588', NULL, 21, 7, '2024-10-01 00:00:00.000000', '2024-10-02 00:00:00.000000', 1, 400);

-- ----------------------------
-- Table structure for b_order_log
-- ----------------------------
DROP TABLE IF EXISTS `b_order_log`;
CREATE TABLE `b_order_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `action` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `log_time` datetime(6) NULL DEFAULT NULL,
  `thing_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_order_log_thing_id_7306f624_fk_b_thing_id`(`thing_id`) USING BTREE,
  INDEX `b_order_log_user_id_1003e839_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_order_log_thing_id_7306f624_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_order_log_user_id_1003e839_fk_b_user_id` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_order_log
-- ----------------------------

-- ----------------------------
-- Table structure for b_record
-- ----------------------------
DROP TABLE IF EXISTS `b_record`;
CREATE TABLE `b_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `record_time` datetime(6) NULL DEFAULT NULL,
  `classification_id` bigint NULL DEFAULT NULL,
  `thing_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_record_classification_id_52591cc9_fk_b_classification_id`(`classification_id`) USING BTREE,
  INDEX `b_record_thing_id_d8e773c0_fk_b_thing_id`(`thing_id`) USING BTREE,
  INDEX `b_record_user_id_7e5958b0_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_record_classification_id_52591cc9_fk_b_classification_id` FOREIGN KEY (`classification_id`) REFERENCES `b_classification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_record_thing_id_d8e773c0_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_record_user_id_7e5958b0_fk_b_user_id` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_record
-- ----------------------------

-- ----------------------------
-- Table structure for b_repair
-- ----------------------------
DROP TABLE IF EXISTS `b_repair`;
CREATE TABLE `b_repair`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_number` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `repair_time` datetime NULL DEFAULT NULL,
  `complete_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_repair
-- ----------------------------
INSERT INTO `b_repair` VALUES (14, '1726929552035', '2024-09-25 00:00:00', '2024-09-21 22:50:50');
INSERT INTO `b_repair` VALUES (15, '1726929552035', '2024-09-17 00:00:00', '2024-09-21 22:52:57');
INSERT INTO `b_repair` VALUES (16, '1727420915413', '2024-09-28 00:00:00', '2024-09-27 15:10:09');
INSERT INTO `b_repair` VALUES (17, '1727423343078', '2024-09-28 00:00:00', '2024-09-27 15:53:13');
INSERT INTO `b_repair` VALUES (18, '1727424430557', '2024-09-28 00:00:00', NULL);

-- ----------------------------
-- Table structure for b_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_tag`;
CREATE TABLE `b_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_tag
-- ----------------------------
INSERT INTO `b_tag` VALUES (12, '超轻量', '2024-09-12 19:11:13.836243');
INSERT INTO `b_tag` VALUES (13, '高背照护', '2024-09-12 19:11:23.340788');
INSERT INTO `b_tag` VALUES (14, '附杯架', '2024-09-12 19:11:51.693028');
INSERT INTO `b_tag` VALUES (15, '拨脚可拆', '2024-09-12 19:12:05.684569');
INSERT INTO `b_tag` VALUES (16, '轻量小巧', '2024-09-12 19:16:05.558073');
INSERT INTO `b_tag` VALUES (17, '高阶机能型', '2024-09-12 19:20:41.383487');
INSERT INTO `b_tag` VALUES (18, '户外远距', '2024-09-12 19:28:08.793325');
INSERT INTO `b_tag` VALUES (19, '姿势变换型', '2024-09-12 19:28:13.262239');
INSERT INTO `b_tag` VALUES (20, '后躺', '2024-09-12 19:30:40.641722');

-- ----------------------------
-- Table structure for b_thing
-- ----------------------------
DROP TABLE IF EXISTS `b_thing`;
CREATE TABLE `b_thing`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `cover` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mobile` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `age` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `location` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `pv` int NOT NULL,
  `recommend_count` int NOT NULL,
  `wish_count` int NOT NULL,
  `collect_count` int NOT NULL,
  `classification_id` bigint NULL DEFAULT NULL,
  `dongli` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `xianzhi` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `xuhang` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `b_thing_classification_id_47675ac4_fk_b_classification_id`(`classification_id`) USING BTREE,
  CONSTRAINT `b_thing_classification_id_47675ac4_fk_b_classification_id` FOREIGN KEY (`classification_id`) REFERENCES `b_classification` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_thing
-- ----------------------------
INSERT INTO `b_thing` VALUES (17, '旅弧2', 'cover/1726139691876.png', '外出旅游轻便轮椅首选车款。\r\n轻量设计，女性也能轻易搬运。\r\nS曲面型座垫，防滑稳姿一次到位\r\n坐的人舒适，推的人轻松。\r\n快拆式拨脚提升使用便利性。', '100', NULL, NULL, NULL, '0', '2024-09-12 19:14:59.039598', 4, 0, 0, 0, 10, NULL, NULL, NULL);
INSERT INTO `b_thing` VALUES (18, '舒弧205 中轮', 'cover/1726139954189.png', '外出走走，无拘无束，\r\n身心灵轻松释放。\r\n追随心中的渴望，\r\n击退出游的限制！', '200', NULL, NULL, NULL, '0', '2024-09-12 19:20:03.731678', 3, 0, 0, 0, 10, NULL, NULL, NULL);
INSERT INTO `b_thing` VALUES (19, '变形金刚', 'cover/1726140057852.png', '高阶机能款手动轮椅，个性化车身搭配高质感骨架烤漆，创新导入辅助配色系统，让使用者操控更上手；兼具高调整性与稳固耐用的先进设计，令人无法忽视的强烈存在感！', '300', NULL, NULL, NULL, '0', '2024-09-12 19:21:44.054592', 22, 0, 0, 0, 10, NULL, NULL, NULL);
INSERT INTO `b_thing` VALUES (20, '剑齿虎T‧剑齿虎TR', 'cover/1726140520153.png', '室外趴趴走首选，每日中长程行驶，具有较好的舒压系统。搭载Tilt-in-Space系统，重量平均分布并释放臀部压力。四轮独立悬吊避震系统设计，调出适合行驶的舒适度。\r\n\r\n剑齿虎是康扬最具代表性的沙发椅大底盘电轮，它拥有精密的四轮独立悬吊避震系统，16吋高速胎后轮，标配铅酸电池40公里续航力。', '500', NULL, NULL, NULL, '0', '2024-09-12 19:29:40.792639', 142, 0, 0, 0, 11, NULL, NULL, NULL);
INSERT INTO `b_thing` VALUES (21, '潜随挺502', 'cover/1726140720120.png', '高阶照护款高背轮椅。\r\n动力辅推缓降功能，\r\n后躺力学再进化。', '400', NULL, NULL, NULL, '3', '2024-09-12 19:32:07.856109', 29, 0, 0, 0, 10, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for b_thing_collect
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_collect`;
CREATE TABLE `b_thing_collect`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `thing_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_collect_thing_id_user_id_45b9f252_uniq`(`thing_id`, `user_id`) USING BTREE,
  INDEX `b_thing_collect_user_id_e5d69968_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_thing_collect_thing_id_8edce8b3_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_thing_collect_user_id_e5d69968_fk_b_user_id` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_thing_collect
-- ----------------------------

-- ----------------------------
-- Table structure for b_thing_tag
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_tag`;
CREATE TABLE `b_thing_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `thing_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_tag_thing_id_tag_id_a5d426b2_uniq`(`thing_id`, `tag_id`) USING BTREE,
  INDEX `b_thing_tag_tag_id_d02b28a1_fk_b_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `b_thing_tag_tag_id_d02b28a1_fk_b_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `b_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_thing_tag_thing_id_fb8ecf3f_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_thing_tag
-- ----------------------------
INSERT INTO `b_thing_tag` VALUES (36, 17, 12);
INSERT INTO `b_thing_tag` VALUES (37, 17, 15);
INSERT INTO `b_thing_tag` VALUES (39, 18, 14);
INSERT INTO `b_thing_tag` VALUES (38, 18, 16);
INSERT INTO `b_thing_tag` VALUES (40, 19, 17);

-- ----------------------------
-- Table structure for b_thing_wish
-- ----------------------------
DROP TABLE IF EXISTS `b_thing_wish`;
CREATE TABLE `b_thing_wish`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `thing_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `b_thing_wish_thing_id_user_id_9d647bbb_uniq`(`thing_id`, `user_id`) USING BTREE,
  INDEX `b_thing_wish_user_id_e2d94f6c_fk_b_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `b_thing_wish_thing_id_f0864b16_fk_b_thing_id` FOREIGN KEY (`thing_id`) REFERENCES `b_thing` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `b_thing_wish_user_id_e2d94f6c_fk_b_user_id` FOREIGN KEY (`user_id`) REFERENCES `b_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_thing_wish
-- ----------------------------

-- ----------------------------
-- Table structure for b_user
-- ----------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `role` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `status` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `mobile` varchar(13) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gender` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `create_time` datetime(6) NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  `push_email` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `push_switch` tinyint(1) NULL DEFAULT NULL,
  `admin_token` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `token` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of b_user
-- ----------------------------
INSERT INTO `b_user` VALUES (1, 'admin', '7ec919b1f0eea04356f34fbbbc0dcd94', '1', '0', NULL, '', NULL, NULL, NULL, NULL, '2024-09-12 13:09:40.598475', 0, NULL, 0, '21232f297a57a5a743894a0e4a801fc3', NULL);
INSERT INTO `b_user` VALUES (2, 'admin123', '0192023a7bbd73250516f069df18b500', '3', '0', NULL, '', '111', NULL, NULL, NULL, '2024-02-01 15:33:18.556459', 0, NULL, 0, '0192023a7bbd73250516f069df18b500', NULL);
INSERT INTO `b_user` VALUES (7, '3580222@gmail.com', '7ec919b1f0eea04356f34fbbbc0dcd94', '2', '0', '小王', 'avatar/1727442485611.jpeg', '19521268588', '3580222@gmail.com', NULL, '上海', '2024-09-12 17:22:49.947267', 0, NULL, 0, NULL, '43f3bc77872127e1b1af96f7dd35a3d7');
INSERT INTO `b_user` VALUES (8, '123', '202cb962ac59075b964b07152d234b70', '2', '0', '123', 'avatar/1726910927321.png', '123', '123@com', NULL, '上海', '2024-09-21 17:28:06.125764', 0, NULL, 0, NULL, '202cb962ac59075b964b07152d234b70');

-- ----------------------------
-- Table structure for fankuicontent
-- ----------------------------
DROP TABLE IF EXISTS `fankuicontent`;
CREATE TABLE `fankuicontent`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fankuicontent` char(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `order_number` bigint NULL DEFAULT NULL,
  `fankuitime` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fankuicontent
-- ----------------------------
INSERT INTO `fankuicontent` VALUES (3, '好啊', 1727423343078, '2024-09-27 15:52:15.715753');

SET FOREIGN_KEY_CHECKS = 1;
