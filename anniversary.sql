/*
 Navicat Premium Data Transfer

 Source Server         : anniversary
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : anniversary

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 23/04/2021 10:25:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add campus', 7, 'add_campus');
INSERT INTO `auth_permission` VALUES (26, 'Can change campus', 7, 'change_campus');
INSERT INTO `auth_permission` VALUES (27, 'Can delete campus', 7, 'delete_campus');
INSERT INTO `auth_permission` VALUES (28, 'Can view campus', 7, 'view_campus');
INSERT INTO `auth_permission` VALUES (29, 'Can add event', 8, 'add_event');
INSERT INTO `auth_permission` VALUES (30, 'Can change event', 8, 'change_event');
INSERT INTO `auth_permission` VALUES (31, 'Can delete event', 8, 'delete_event');
INSERT INTO `auth_permission` VALUES (32, 'Can view event', 8, 'view_event');
INSERT INTO `auth_permission` VALUES (33, 'Can add user', 9, 'add_user');
INSERT INTO `auth_permission` VALUES (34, 'Can change user', 9, 'change_user');
INSERT INTO `auth_permission` VALUES (35, 'Can delete user', 9, 'delete_user');
INSERT INTO `auth_permission` VALUES (36, 'Can view user', 9, 'view_user');
INSERT INTO `auth_permission` VALUES (37, 'Can add record', 10, 'add_record');
INSERT INTO `auth_permission` VALUES (38, 'Can change record', 10, 'change_record');
INSERT INTO `auth_permission` VALUES (39, 'Can delete record', 10, 'delete_record');
INSERT INTO `auth_permission` VALUES (40, 'Can view record', 10, 'view_record');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for campus
-- ----------------------------
DROP TABLE IF EXISTS `campus`;
CREATE TABLE `campus`  (
  `campusID` int(11) NOT NULL AUTO_INCREMENT,
  `campusName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `click` int(11) NOT NULL,
  PRIMARY KEY (`campusID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of campus
-- ----------------------------
INSERT INTO `campus` VALUES (1, '新校区', 0);
INSERT INTO `campus` VALUES (2, '南校区', 2);
INSERT INTO `campus` VALUES (3, '校本部', 0);
INSERT INTO `campus` VALUES (4, '铁道校区', 0);
INSERT INTO `campus` VALUES (5, '湘雅校区', 0);
INSERT INTO `campus` VALUES (6, '湘雅新校区', 0);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'api', 'campus');
INSERT INTO `django_content_type` VALUES (8, 'api', 'event');
INSERT INTO `django_content_type` VALUES (9, 'api', 'user');
INSERT INTO `django_content_type` VALUES (10, 'api', 'record');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2021-04-21 08:50:53.401066');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2021-04-21 08:50:53.488830');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2021-04-21 08:50:53.899733');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2021-04-21 08:50:53.997472');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-21 08:50:54.007444');
INSERT INTO `django_migrations` VALUES (6, 'api', '0001_initial', '2021-04-21 08:50:54.068324');
INSERT INTO `django_migrations` VALUES (7, 'api', '0002_auto_20210421_1650', '2021-04-21 08:50:54.122137');
INSERT INTO `django_migrations` VALUES (8, 'contenttypes', '0002_remove_content_type_name', '2021-04-21 08:50:54.186964');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0002_alter_permission_name_max_length', '2021-04-21 08:50:54.222869');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0003_alter_user_email_max_length', '2021-04-21 08:50:54.259769');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0004_alter_user_username_opts', '2021-04-21 08:50:54.270744');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0005_alter_user_last_login_null', '2021-04-21 08:50:54.301935');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0006_require_contenttypes_0002', '2021-04-21 08:50:54.304927');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0007_alter_validators_add_error_messages', '2021-04-21 08:50:54.314902');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0008_alter_user_username_max_length', '2021-04-21 08:50:54.350804');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0009_alter_user_last_name_max_length', '2021-04-21 08:50:54.383717');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0010_alter_group_name_max_length', '2021-04-21 08:50:54.417629');
INSERT INTO `django_migrations` VALUES (18, 'auth', '0011_update_proxy_permissions', '2021-04-21 08:50:54.428597');
INSERT INTO `django_migrations` VALUES (19, 'auth', '0012_alter_user_first_name_max_length', '2021-04-21 08:50:54.459515');
INSERT INTO `django_migrations` VALUES (20, 'sessions', '0001_initial', '2021-04-21 08:50:54.475472');
INSERT INTO `django_migrations` VALUES (21, 'api', '0002_auto_20210421_1658', '2021-04-21 08:58:57.577632');
INSERT INTO `django_migrations` VALUES (22, 'api', '0002_campus_event_record_user', '2021-04-21 08:59:58.105234');
INSERT INTO `django_migrations` VALUES (23, 'api', '0003_auto_20210422_0837', '2021-04-22 04:34:40.897478');
INSERT INTO `django_migrations` VALUES (24, 'api', '0004_auto_20210422_1232', '2021-04-22 04:34:40.903496');
INSERT INTO `django_migrations` VALUES (25, 'api', '0003_auto_20210422_1236', '2021-04-22 04:37:39.635184');
INSERT INTO `django_migrations` VALUES (26, 'api', '0004_auto_20210422_1237', '2021-04-22 04:37:39.647115');
INSERT INTO `django_migrations` VALUES (27, 'api', '0003_auto_20210422_1238', '2021-04-22 04:38:48.569238');
INSERT INTO `django_migrations` VALUES (28, 'api', '0002_auto_20210422_1239', '2021-04-22 04:39:39.175394');
INSERT INTO `django_migrations` VALUES (29, 'api', '0003_campus_event_record_user', '2021-04-22 04:39:39.418746');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `eventID` int(11) NOT NULL AUTO_INCREMENT,
  `eventName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `click` int(11) NOT NULL,
  PRIMARY KEY (`eventID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (1, '哈哈', 0);
INSERT INTO `event` VALUES (2, '哈哈', 0);
INSERT INTO `event` VALUES (3, '哈哈', 4);
INSERT INTO `event` VALUES (4, '哈哈', 0);
INSERT INTO `event` VALUES (5, '哈哈', 0);
INSERT INTO `event` VALUES (6, '哈哈', 0);
INSERT INTO `event` VALUES (7, '哈哈', 0);
INSERT INTO `event` VALUES (8, '哈哈', 0);
INSERT INTO `event` VALUES (9, '哈哈', 0);
INSERT INTO `event` VALUES (10, '哈哈', 0);
INSERT INTO `event` VALUES (11, '哈哈', 0);
INSERT INTO `event` VALUES (12, '哈哈', 0);
INSERT INTO `event` VALUES (13, '哈哈', 0);
INSERT INTO `event` VALUES (14, '哈哈', 0);
INSERT INTO `event` VALUES (15, '哈哈', 0);
INSERT INTO `event` VALUES (16, '哈哈', 0);
INSERT INTO `event` VALUES (17, '哈哈', 0);
INSERT INTO `event` VALUES (18, '哈哈', 0);
INSERT INTO `event` VALUES (19, '哈哈', 0);
INSERT INTO `event` VALUES (20, '哈哈', 0);
INSERT INTO `event` VALUES (21, '哈哈', 0);

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `Rid` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `campus` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data` date NOT NULL,
  `openID_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`Rid`) USING BTREE,
  INDEX `record_openID_id_91562923`(`openID_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (1, '“谌怀义', '南校区', '哈哈', '2001-10-25', '123456');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(11) NOT NULL,
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `openid`(`openid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '123456', NULL, 1, '湖南', '长沙', '中国');

SET FOREIGN_KEY_CHECKS = 1;
