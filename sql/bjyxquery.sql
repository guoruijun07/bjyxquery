/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost:3306
 Source Schema         : bjyxquery

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 06/07/2020 00:31:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bic_param_head
-- ----------------------------
DROP TABLE IF EXISTS `bic_param_head`;
CREATE TABLE `bic_param_head`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务参数头' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bic_param_values
-- ----------------------------
DROP TABLE IF EXISTS `bic_param_values`;
CREATE TABLE `bic_param_values`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `param_head_id` bigint(20) NOT NULL COMMENT '业务参数头id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_param_head_id`(`param_head_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '业务参数值' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bic_user_menu
-- ----------------------------
DROP TABLE IF EXISTS `bic_user_menu`;
CREATE TABLE `bic_user_menu`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `menucode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单代码',
  `menuname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `level` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '层级',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `source` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:web 2:app 3:客户web 4客户app',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bic_user_menu
-- ----------------------------
INSERT INTO `bic_user_menu` VALUES (1, '1', '分拣码批量查询', NULL, NULL, '1');
INSERT INTO `bic_user_menu` VALUES (2, '2', '地址批量查询', NULL, NULL, '1');
INSERT INTO `bic_user_menu` VALUES (3, '1', '分拣码查询', NULL, NULL, '2');
INSERT INTO `bic_user_menu` VALUES (4, '2', '地址查询', NULL, NULL, '2');
INSERT INTO `bic_user_menu` VALUES (5, '3', '号码呼转', NULL, NULL, '2');
INSERT INTO `bic_user_menu` VALUES (6, '1', '客户邮件轨迹查询', NULL, NULL, '4');

-- ----------------------------
-- Table structure for bic_user_role
-- ----------------------------
DROP TABLE IF EXISTS `bic_user_role`;
CREATE TABLE `bic_user_role`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `rolecode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色代码',
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bic_user_role
-- ----------------------------
INSERT INTO `bic_user_role` VALUES (1, 'APPJSCX', 'APP集散查询', '分拣码查询、地址查询');
INSERT INTO `bic_user_role` VALUES (2, 'WEBJSCX', 'WEB集散查询', '分拣码查询、地址查询');
INSERT INTO `bic_user_role` VALUES (3, 'APPHMHZ', 'APP号码呼转', '号码呼转');
INSERT INTO `bic_user_role` VALUES (4, 'KHYJGJCX', '客户邮件轨迹查询', '客户邮件轨迹查询');

-- ----------------------------
-- Table structure for bic_user_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `bic_user_role_menu`;
CREATE TABLE `bic_user_role_menu`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `menuid` bigint(11) NULL DEFAULT NULL COMMENT '菜单id',
  `roleid` bigint(11) NULL DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bic_user_role_menu
-- ----------------------------
INSERT INTO `bic_user_role_menu` VALUES (1, 3, 1);
INSERT INTO `bic_user_role_menu` VALUES (2, 4, 1);
INSERT INTO `bic_user_role_menu` VALUES (3, 1, 2);
INSERT INTO `bic_user_role_menu` VALUES (4, 2, 2);
INSERT INTO `bic_user_role_menu` VALUES (5, 5, 3);
INSERT INTO `bic_user_role_menu` VALUES (6, 6, 4);

-- ----------------------------
-- Table structure for sys_menu_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_permission_rel`;
CREATE TABLE `sys_menu_permission_rel`  (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NULL DEFAULT NULL,
  `permission_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `perms` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `father_id` int(11) NOT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES (1, '分拣码批量查询', 'sorting:getList', 0);
INSERT INTO `sys_menus` VALUES (2, '地址批量查询', 'address:getList', 0);
INSERT INTO `sys_menus` VALUES (3, '分拣码查询', NULL, 0);
INSERT INTO `sys_menus` VALUES (4, '地址查询', NULL, 0);
INSERT INTO `sys_menus` VALUES (5, '号码呼转', NULL, 0);
INSERT INTO `sys_menus` VALUES (6, '客户邮件轨迹查询', NULL, 0);
INSERT INTO `sys_menus` VALUES (9, '北京生鲜系统', NULL, 0);

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '功能主键',
  `menu_id` int(11) NULL DEFAULT NULL COMMENT '菜单id',
  `parent_id` int(20) NULL DEFAULT NULL COMMENT '父级主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'url地址',
  `perms` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '项目类型:1-菜单2-按钮3-链接4-表单',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '删除标记:0未删除，1删除',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `create_user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改用户',
  `ts` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统功能表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------
INSERT INTO `sys_permissions` VALUES (1, NULL, 0, '', '', NULL, '北京生鲜系统', NULL, 1, 0, '2020-04-14 19:07:31', 'SYSTEM', '2020-04-14 19:07:33', 'SYSTEM', '2020-06-30 07:09:24');
INSERT INTO `sys_permissions` VALUES (2, NULL, 1, 'sorting:getList', NULL, 'sorting:getList', '分拣码批量查询', NULL, 1, 0, NULL, NULL, NULL, NULL, '2020-07-05 22:03:07');
INSERT INTO `sys_permissions` VALUES (3, NULL, 1, 'sorting:upload', NULL, 'sorting:upload', '分拣码批量查询上传', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2020-07-05 22:03:09');
INSERT INTO `sys_permissions` VALUES (4, NULL, 1, 'sorting:download', NULL, 'sorting:download', '分拣码批量查询下载结果', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2020-07-05 22:03:12');
INSERT INTO `sys_permissions` VALUES (5, NULL, 1, 'address:getList', NULL, 'address:getList', '地址批量查询', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2020-07-05 22:03:29');
INSERT INTO `sys_permissions` VALUES (6, NULL, NULL, NULL, NULL, NULL, '分拣码查询', NULL, 1, NULL, NULL, NULL, NULL, NULL, '2020-07-04 02:34:20');
INSERT INTO `sys_permissions` VALUES (7, NULL, NULL, NULL, NULL, NULL, '地址查询', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-04 02:33:54');
INSERT INTO `sys_permissions` VALUES (8, NULL, NULL, NULL, NULL, NULL, '号码呼转', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-04 02:33:50');
INSERT INTO `sys_permissions` VALUES (9, NULL, NULL, NULL, NULL, NULL, '客户邮件轨迹查询', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-04 02:35:04');
INSERT INTO `sys_permissions` VALUES (10, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-04 02:34:36');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(20) NOT NULL COMMENT '角色主键',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色编码',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '删除标记:0未删除，1删除',
  `mark` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `create_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建用户',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `update_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '修改用户',
  `ts` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '000', '超级管理员', 0, '超级管理员', '2017-03-08 15:00:42', NULL, '2020-04-14 19:07:58', NULL, '2020-04-14 19:08:00');
INSERT INTO `sys_role` VALUES (2, '001', '测试角色', 0, '测试角色', '2018-12-09 17:48:13', NULL, '2018-12-09 17:48:26', NULL, '2020-04-13 22:36:17');

-- ----------------------------
-- Table structure for sys_role_menus_ref
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menus_ref`;
CREATE TABLE `sys_role_menus_ref`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户角色关联',
  `menu_id` int(20) NULL DEFAULT NULL COMMENT '用户主键',
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色功能关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menus_ref
-- ----------------------------
INSERT INTO `sys_role_menus_ref` VALUES (1, 1, 1);
INSERT INTO `sys_role_menus_ref` VALUES (2, 2, 1);

-- ----------------------------
-- Table structure for sys_role_permission_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission_rel`;
CREATE TABLE `sys_role_permission_rel`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增Id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `permission_id` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permission_rel
-- ----------------------------
INSERT INTO `sys_role_permission_rel` VALUES (1, 1, 1);
INSERT INTO `sys_role_permission_rel` VALUES (2, 1, 2);
INSERT INTO `sys_role_permission_rel` VALUES (3, 1, 3);
INSERT INTO `sys_role_permission_rel` VALUES (4, 1, 4);
INSERT INTO `sys_role_permission_rel` VALUES (5, 1, 5);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账户',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `secretkey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐值，密码秘钥',
  `locked` tinyint(1) NULL DEFAULT NULL,
  `real_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `is_delete` tinyint(1) NULL DEFAULT NULL COMMENT '删除标记:0未删除，1删除',
  `create_time` datetime(0) NULL DEFAULT '1970-01-01 00:00:00' COMMENT '创建日期',
  `create_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建用户',
  `update_user` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `update_time` datetime(0) NULL DEFAULT '1970-01-01 00:00:00' COMMENT '修改用户',
  `ts` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '时间戳',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'system', '7794d9e38e986f74751ed6fa6f6075a4', 'system', 0, '超级管理员', 1, NULL, 'SYSTEM', '2018-12-13 19:19:36', '2018-12-13 16:03:49', '2020-05-14 21:41:26');
INSERT INTO `sys_user` VALUES (2, 'admin', '578966146da8c139355b7bddee09dd70', 'pFtIkWuE7UcKQw0tX1Z5', 0, '管理员1', 0, '2018-12-07 15:04:03', 'SYSTEM', '2018-12-13 16:03:49', '2018-12-13 16:03:49', '2020-05-14 21:41:29');

-- ----------------------------
-- Table structure for sys_user_role_ref
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_ref`;
CREATE TABLE `sys_user_role_ref`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户角色关联',
  `user_id` int(20) NULL DEFAULT NULL COMMENT '用户主键',
  `role_id` int(20) NULL DEFAULT NULL COMMENT '角色主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role_ref
-- ----------------------------
INSERT INTO `sys_user_role_ref` VALUES (3, 1, 1);

-- ----------------------------
-- Table structure for tb_administrative_division
-- ----------------------------
DROP TABLE IF EXISTS `tb_administrative_division`;
CREATE TABLE `tb_administrative_division`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provicne_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省名称',
  `provicne_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '省代码',
  `city_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市名称',
  `city_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市代码',
  `county_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区名称',
  `county_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2938 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '行政区划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_administrative_division
-- ----------------------------
INSERT INTO `tb_administrative_division` VALUES (1, '上海市', '310000', '上海市', '310000', '崇明区', '310230');
INSERT INTO `tb_administrative_division` VALUES (2, '上海市', '310000', '上海市', '310000', '黄浦区', '310101');
INSERT INTO `tb_administrative_division` VALUES (3, '上海市', '310000', '上海市', '310000', '普陀区', '310107');
INSERT INTO `tb_administrative_division` VALUES (4, '上海市', '310000', '上海市', '310000', '虹口区', '310109');
INSERT INTO `tb_administrative_division` VALUES (5, '上海市', '310000', '上海市', '310000', '闵行区', '310112');
INSERT INTO `tb_administrative_division` VALUES (6, '上海市', '310000', '上海市', '310000', '徐汇区', '310104');
INSERT INTO `tb_administrative_division` VALUES (7, '上海市', '310000', '上海市', '310000', '宝山区', '310113');
INSERT INTO `tb_administrative_division` VALUES (8, '上海市', '310000', '上海市', '310000', '长宁区', '310105');
INSERT INTO `tb_administrative_division` VALUES (9, '上海市', '310000', '上海市', '310000', '金山区', '310116');
INSERT INTO `tb_administrative_division` VALUES (10, '上海市', '310000', '上海市', '310000', '青浦区', '310118');
INSERT INTO `tb_administrative_division` VALUES (11, '上海市', '310000', '上海市', '310000', '奉贤区', '310120');
INSERT INTO `tb_administrative_division` VALUES (12, '上海市', '310000', '上海市', '310000', '闸北区', '310108');
INSERT INTO `tb_administrative_division` VALUES (13, '上海市', '310000', '上海市', '310000', '杨浦区', '310110');
INSERT INTO `tb_administrative_division` VALUES (14, '上海市', '310000', '上海市', '310000', '松江区', '310117');
INSERT INTO `tb_administrative_division` VALUES (15, '上海市', '310000', '上海市', '310000', '静安区', '310106');
INSERT INTO `tb_administrative_division` VALUES (16, '上海市', '310000', '上海市', '310000', '嘉定区', '310114');
INSERT INTO `tb_administrative_division` VALUES (17, '上海市', '310000', '上海市', '310000', '浦东新区', '310115');
INSERT INTO `tb_administrative_division` VALUES (18, '湖北省', '420000', '湖北省', '420000', '天门市', '429006');
INSERT INTO `tb_administrative_division` VALUES (19, '湖北省', '420000', '湖北省', '420000', '仙桃市', '429004');
INSERT INTO `tb_administrative_division` VALUES (20, '湖北省', '420000', '湖北省', '420000', '潜江市', '429005');
INSERT INTO `tb_administrative_division` VALUES (21, '湖北省', '420000', '湖北省', '420000', '神农架林区', '429021');
INSERT INTO `tb_administrative_division` VALUES (22, '北京市', '110000', '北京市', '110000', '东城区', '110101');
INSERT INTO `tb_administrative_division` VALUES (23, '北京市', '110000', '北京市', '110000', '大兴区', '110115');
INSERT INTO `tb_administrative_division` VALUES (24, '北京市', '110000', '北京市', '110000', '朝阳区', '110105');
INSERT INTO `tb_administrative_division` VALUES (25, '北京市', '110000', '北京市', '110000', '石景山区', '110107');
INSERT INTO `tb_administrative_division` VALUES (26, '北京市', '110000', '北京市', '110000', '丰台区', '110106');
INSERT INTO `tb_administrative_division` VALUES (27, '北京市', '110000', '北京市', '110000', '西城区', '110102');
INSERT INTO `tb_administrative_division` VALUES (28, '北京市', '110000', '北京市', '110000', '平谷区', '110117');
INSERT INTO `tb_administrative_division` VALUES (29, '北京市', '110000', '北京市', '110000', '延庆县', '110229');
INSERT INTO `tb_administrative_division` VALUES (30, '北京市', '110000', '北京市', '110000', '门头沟区', '110109');
INSERT INTO `tb_administrative_division` VALUES (31, '北京市', '110000', '北京市', '110000', '昌平区', '110114');
INSERT INTO `tb_administrative_division` VALUES (32, '北京市', '110000', '北京市', '110000', '通州区', '110112');
INSERT INTO `tb_administrative_division` VALUES (33, '北京市', '110000', '北京市', '110000', '怀柔区', '110116');
INSERT INTO `tb_administrative_division` VALUES (34, '北京市', '110000', '北京市', '110000', '密云县', '110228');
INSERT INTO `tb_administrative_division` VALUES (35, '北京市', '110000', '北京市', '110000', '海淀区', '110108');
INSERT INTO `tb_administrative_division` VALUES (36, '北京市', '110000', '北京市', '110000', '顺义区', '110113');
INSERT INTO `tb_administrative_division` VALUES (37, '北京市', '110000', '北京市', '110000', '崇文区', '110103');
INSERT INTO `tb_administrative_division` VALUES (38, '北京市', '110000', '北京市', '110000', '宣武区', '110104');
INSERT INTO `tb_administrative_division` VALUES (39, '北京市', '110000', '北京市', '110000', '房山区', '110111');
INSERT INTO `tb_administrative_division` VALUES (40, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '图木舒克市', '659003');
INSERT INTO `tb_administrative_division` VALUES (41, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '石河子市', '659001');
INSERT INTO `tb_administrative_division` VALUES (42, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '阿拉尔市', '659002');
INSERT INTO `tb_administrative_division` VALUES (43, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '高昌区', '650402');
INSERT INTO `tb_administrative_division` VALUES (44, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '伊州区', '650502');
INSERT INTO `tb_administrative_division` VALUES (45, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '铁门关市', '659006');
INSERT INTO `tb_administrative_division` VALUES (46, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '可克达拉市', '659008');
INSERT INTO `tb_administrative_division` VALUES (47, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '双河市', '659007');
INSERT INTO `tb_administrative_division` VALUES (48, '新疆维吾尔自治区', '650000', '新疆维吾尔自治区', '650000', '昆玉市', '659009');
INSERT INTO `tb_administrative_division` VALUES (49, '海南省', '460000', '海南省', '460000', '白沙黎族自治县', '469025');
INSERT INTO `tb_administrative_division` VALUES (50, '海南省', '460000', '海南省', '460000', '昌江黎族自治县', '469026');
INSERT INTO `tb_administrative_division` VALUES (51, '海南省', '460000', '海南省', '460000', '西沙群岛', '469037');
INSERT INTO `tb_administrative_division` VALUES (52, '海南省', '460000', '海南省', '460000', '临高县', '469024');
INSERT INTO `tb_administrative_division` VALUES (53, '海南省', '460000', '海南省', '460000', '五指山市', '469001');
INSERT INTO `tb_administrative_division` VALUES (54, '海南省', '460000', '海南省', '460000', '文昌市', '469005');
INSERT INTO `tb_administrative_division` VALUES (55, '海南省', '460000', '海南省', '460000', '澄迈县', '469023');
INSERT INTO `tb_administrative_division` VALUES (56, '海南省', '460000', '海南省', '460000', '东方市', '469007');
INSERT INTO `tb_administrative_division` VALUES (57, '海南省', '460000', '海南省', '460000', '中沙群岛的岛礁及其海域', '469039');
INSERT INTO `tb_administrative_division` VALUES (58, '海南省', '460000', '海南省', '460000', '南沙群岛', '469038');
INSERT INTO `tb_administrative_division` VALUES (59, '海南省', '460000', '海南省', '460000', '琼海市', '469002');
INSERT INTO `tb_administrative_division` VALUES (60, '海南省', '460000', '海南省', '460000', '定安县', '469021');
INSERT INTO `tb_administrative_division` VALUES (61, '海南省', '460000', '海南省', '460000', '屯昌县', '469022');
INSERT INTO `tb_administrative_division` VALUES (62, '海南省', '460000', '海南省', '460000', '陵水黎族自治县', '469028');
INSERT INTO `tb_administrative_division` VALUES (63, '海南省', '460000', '海南省', '460000', '保亭黎族苗族自治县', '469029');
INSERT INTO `tb_administrative_division` VALUES (64, '海南省', '460000', '海南省', '460000', '琼中黎族苗族自治县', '469030');
INSERT INTO `tb_administrative_division` VALUES (65, '海南省', '460000', '海南省', '460000', '乐东黎族自治县', '469027');
INSERT INTO `tb_administrative_division` VALUES (66, '海南省', '460000', '海南省', '460000', '万宁市', '469006');
INSERT INTO `tb_administrative_division` VALUES (67, '重庆市', '500000', '重庆市', '500000', '奉节县', '500236');
INSERT INTO `tb_administrative_division` VALUES (68, '重庆市', '500000', '重庆市', '500000', '江津区', '500116');
INSERT INTO `tb_administrative_division` VALUES (69, '重庆市', '500000', '重庆市', '500000', '南川区', '500119');
INSERT INTO `tb_administrative_division` VALUES (70, '重庆市', '500000', '重庆市', '500000', '永川区', '500118');
INSERT INTO `tb_administrative_division` VALUES (71, '重庆市', '500000', '重庆市', '500000', '合川区', '500117');
INSERT INTO `tb_administrative_division` VALUES (72, '重庆市', '500000', '重庆市', '500000', '长寿区', '500115');
INSERT INTO `tb_administrative_division` VALUES (73, '重庆市', '500000', '重庆市', '500000', '綦江县', '500222');
INSERT INTO `tb_administrative_division` VALUES (74, '重庆市', '500000', '重庆市', '500000', '巫溪县', '500238');
INSERT INTO `tb_administrative_division` VALUES (75, '重庆市', '500000', '重庆市', '500000', '涪陵区', '500102');
INSERT INTO `tb_administrative_division` VALUES (76, '重庆市', '500000', '重庆市', '500000', '铜梁县', '500224');
INSERT INTO `tb_administrative_division` VALUES (77, '重庆市', '500000', '重庆市', '500000', '丰都县', '500230');
INSERT INTO `tb_administrative_division` VALUES (78, '重庆市', '500000', '重庆市', '500000', '大渡口区', '500104');
INSERT INTO `tb_administrative_division` VALUES (79, '重庆市', '500000', '重庆市', '500000', '云阳县', '500235');
INSERT INTO `tb_administrative_division` VALUES (80, '重庆市', '500000', '重庆市', '500000', '彭水苗族土家族自治县', '500243');
INSERT INTO `tb_administrative_division` VALUES (81, '重庆市', '500000', '重庆市', '500000', '巫山县', '500237');
INSERT INTO `tb_administrative_division` VALUES (82, '重庆市', '500000', '重庆市', '500000', '渝中区', '500103');
INSERT INTO `tb_administrative_division` VALUES (83, '重庆市', '500000', '重庆市', '500000', '江北区', '500105');
INSERT INTO `tb_administrative_division` VALUES (84, '重庆市', '500000', '重庆市', '500000', '石柱土家族自治县', '500240');
INSERT INTO `tb_administrative_division` VALUES (85, '重庆市', '500000', '重庆市', '500000', '巴南区', '500113');
INSERT INTO `tb_administrative_division` VALUES (86, '重庆市', '500000', '重庆市', '500000', '忠县', '500233');
INSERT INTO `tb_administrative_division` VALUES (87, '重庆市', '500000', '重庆市', '500000', '武隆县', '500232');
INSERT INTO `tb_administrative_division` VALUES (88, '重庆市', '500000', '重庆市', '500000', '秀山土家族苗族自治县', '500241');
INSERT INTO `tb_administrative_division` VALUES (89, '重庆市', '500000', '重庆市', '500000', '北碚区', '500109');
INSERT INTO `tb_administrative_division` VALUES (90, '重庆市', '500000', '重庆市', '500000', '城口县', '500229');
INSERT INTO `tb_administrative_division` VALUES (91, '重庆市', '500000', '重庆市', '500000', '万盛区', '500110');
INSERT INTO `tb_administrative_division` VALUES (92, '重庆市', '500000', '重庆市', '500000', '垫江县', '500231');
INSERT INTO `tb_administrative_division` VALUES (93, '重庆市', '500000', '重庆市', '500000', '九龙坡区', '500107');
INSERT INTO `tb_administrative_division` VALUES (94, '重庆市', '500000', '重庆市', '500000', '双桥区', '500111');
INSERT INTO `tb_administrative_division` VALUES (95, '重庆市', '500000', '重庆市', '500000', '荣昌县', '500226');
INSERT INTO `tb_administrative_division` VALUES (96, '重庆市', '500000', '重庆市', '500000', '梁平县', '500228');
INSERT INTO `tb_administrative_division` VALUES (97, '重庆市', '500000', '重庆市', '500000', '万州区', '500101');
INSERT INTO `tb_administrative_division` VALUES (98, '重庆市', '500000', '重庆市', '500000', '酉阳土家族苗族自治县', '500242');
INSERT INTO `tb_administrative_division` VALUES (99, '重庆市', '500000', '重庆市', '500000', '潼南县', '500223');
INSERT INTO `tb_administrative_division` VALUES (100, '重庆市', '500000', '重庆市', '500000', '璧山县', '500227');
INSERT INTO `tb_administrative_division` VALUES (101, '重庆市', '500000', '重庆市', '500000', '黔江区', '500114');
INSERT INTO `tb_administrative_division` VALUES (102, '重庆市', '500000', '重庆市', '500000', '南岸区', '500108');
INSERT INTO `tb_administrative_division` VALUES (103, '重庆市', '500000', '重庆市', '500000', '渝北区', '500112');
INSERT INTO `tb_administrative_division` VALUES (104, '重庆市', '500000', '重庆市', '500000', '开县', '500234');
INSERT INTO `tb_administrative_division` VALUES (105, '重庆市', '500000', '重庆市', '500000', '大足县', '500225');
INSERT INTO `tb_administrative_division` VALUES (106, '重庆市', '500000', '重庆市', '500000', '沙坪坝区', '500106');
INSERT INTO `tb_administrative_division` VALUES (107, '重庆市', '500000', '重庆市', '500000', '开州区', '500154');
INSERT INTO `tb_administrative_division` VALUES (108, '天津市', '120000', '天津市', '120000', '北辰区', '120113');
INSERT INTO `tb_administrative_division` VALUES (109, '天津市', '120000', '天津市', '120000', '西青区', '120111');
INSERT INTO `tb_administrative_division` VALUES (110, '天津市', '120000', '天津市', '120000', '河西区', '120103');
INSERT INTO `tb_administrative_division` VALUES (111, '天津市', '120000', '天津市', '120000', '和平区', '120101');
INSERT INTO `tb_administrative_division` VALUES (112, '天津市', '120000', '天津市', '120000', '东丽区', '120110');
INSERT INTO `tb_administrative_division` VALUES (113, '天津市', '120000', '天津市', '120000', '宁河区', '120117');
INSERT INTO `tb_administrative_division` VALUES (114, '天津市', '120000', '天津市', '120000', '大港区', '120109');
INSERT INTO `tb_administrative_division` VALUES (115, '天津市', '120000', '天津市', '120000', '武清区', '120114');
INSERT INTO `tb_administrative_division` VALUES (116, '天津市', '120000', '天津市', '120000', '红桥区', '120106');
INSERT INTO `tb_administrative_division` VALUES (117, '天津市', '120000', '天津市', '120000', '河东区', '120102');
INSERT INTO `tb_administrative_division` VALUES (118, '天津市', '120000', '天津市', '120000', '南开区', '120104');
INSERT INTO `tb_administrative_division` VALUES (119, '天津市', '120000', '天津市', '120000', '汉沽区', '120108');
INSERT INTO `tb_administrative_division` VALUES (120, '天津市', '120000', '天津市', '120000', '宝坻区', '120115');
INSERT INTO `tb_administrative_division` VALUES (121, '天津市', '120000', '天津市', '120000', '津南区', '120112');
INSERT INTO `tb_administrative_division` VALUES (122, '天津市', '120000', '天津市', '120000', '塘沽区', '120107');
INSERT INTO `tb_administrative_division` VALUES (123, '天津市', '120000', '天津市', '120000', '河北区', '120105');
INSERT INTO `tb_administrative_division` VALUES (124, '天津市', '120000', '天津市', '120000', '蓟州区', '120119');
INSERT INTO `tb_administrative_division` VALUES (125, '天津市', '120000', '天津市', '120000', '滨海新区', '120116');
INSERT INTO `tb_administrative_division` VALUES (126, '天津市', '120000', '天津市', '120000', '静海区', '120118');
INSERT INTO `tb_administrative_division` VALUES (127, '广东省', '440000', '广州市', '440100', '从化市', '440184');
INSERT INTO `tb_administrative_division` VALUES (128, '广东省', '440000', '广州市', '440100', '天河区', '440106');
INSERT INTO `tb_administrative_division` VALUES (129, '广东省', '440000', '广州市', '440100', '越秀区', '440104');
INSERT INTO `tb_administrative_division` VALUES (130, '广东省', '440000', '广州市', '440100', '荔湾区', '440103');
INSERT INTO `tb_administrative_division` VALUES (131, '广东省', '440000', '广州市', '440100', '黄埔区', '440112');
INSERT INTO `tb_administrative_division` VALUES (132, '广东省', '440000', '广州市', '440100', '番禺区', '440113');
INSERT INTO `tb_administrative_division` VALUES (133, '广东省', '440000', '广州市', '440100', '海珠区', '440105');
INSERT INTO `tb_administrative_division` VALUES (134, '广东省', '440000', '广州市', '440100', '白云区', '440111');
INSERT INTO `tb_administrative_division` VALUES (135, '广东省', '440000', '广州市', '440100', '南沙区', '440115');
INSERT INTO `tb_administrative_division` VALUES (136, '广东省', '440000', '广州市', '440100', '萝岗区', '440116');
INSERT INTO `tb_administrative_division` VALUES (137, '广东省', '440000', '广州市', '440100', '花都区', '440114');
INSERT INTO `tb_administrative_division` VALUES (138, '广东省', '440000', '广州市', '440100', '增城市', '440183');
INSERT INTO `tb_administrative_division` VALUES (139, '广东省', '440000', '肇庆市', '441200', '四会市', '441284');
INSERT INTO `tb_administrative_division` VALUES (140, '广东省', '440000', '肇庆市', '441200', '鼎湖区', '441203');
INSERT INTO `tb_administrative_division` VALUES (141, '广东省', '440000', '肇庆市', '441200', '高要市', '441283');
INSERT INTO `tb_administrative_division` VALUES (142, '广东省', '440000', '肇庆市', '441200', '广宁县', '441223');
INSERT INTO `tb_administrative_division` VALUES (143, '广东省', '440000', '肇庆市', '441200', '封开县', '441225');
INSERT INTO `tb_administrative_division` VALUES (144, '广东省', '440000', '肇庆市', '441200', '端州区', '441202');
INSERT INTO `tb_administrative_division` VALUES (145, '广东省', '440000', '肇庆市', '441200', '怀集县', '441224');
INSERT INTO `tb_administrative_division` VALUES (146, '广东省', '440000', '肇庆市', '441200', '德庆县', '441226');
INSERT INTO `tb_administrative_division` VALUES (147, '广东省', '440000', '深圳市', '440300', '南山区', '440305');
INSERT INTO `tb_administrative_division` VALUES (148, '广东省', '440000', '深圳市', '440300', '宝安区', '440306');
INSERT INTO `tb_administrative_division` VALUES (149, '广东省', '440000', '深圳市', '440300', '盐田区', '440308');
INSERT INTO `tb_administrative_division` VALUES (150, '广东省', '440000', '深圳市', '440300', '福田区', '440304');
INSERT INTO `tb_administrative_division` VALUES (151, '广东省', '440000', '深圳市', '440300', '龙岗区', '440307');
INSERT INTO `tb_administrative_division` VALUES (152, '广东省', '440000', '深圳市', '440300', '罗湖区', '440303');
INSERT INTO `tb_administrative_division` VALUES (153, '广东省', '440000', '深圳市', '440300', '龙华区', '440309');
INSERT INTO `tb_administrative_division` VALUES (154, '广东省', '440000', '深圳市', '440300', '坪山区', '440310');
INSERT INTO `tb_administrative_division` VALUES (155, '广东省', '440000', '深圳市', '440300', '光明区', '440311');
INSERT INTO `tb_administrative_division` VALUES (156, '广东省', '440000', '河源市', '441600', '连平县', '441623');
INSERT INTO `tb_administrative_division` VALUES (157, '广东省', '440000', '河源市', '441600', '东源县', '441625');
INSERT INTO `tb_administrative_division` VALUES (158, '广东省', '440000', '河源市', '441600', '源城区', '441602');
INSERT INTO `tb_administrative_division` VALUES (159, '广东省', '440000', '河源市', '441600', '紫金县', '441621');
INSERT INTO `tb_administrative_division` VALUES (160, '广东省', '440000', '河源市', '441600', '和平县', '441624');
INSERT INTO `tb_administrative_division` VALUES (161, '广东省', '440000', '河源市', '441600', '龙川县', '441622');
INSERT INTO `tb_administrative_division` VALUES (162, '广东省', '440000', '清远市', '441800', '英德市', '441881');
INSERT INTO `tb_administrative_division` VALUES (163, '广东省', '440000', '清远市', '441800', '清新县', '441827');
INSERT INTO `tb_administrative_division` VALUES (164, '广东省', '440000', '清远市', '441800', '连山壮族瑶族自治县', '441825');
INSERT INTO `tb_administrative_division` VALUES (165, '广东省', '440000', '清远市', '441800', '清城区', '441802');
INSERT INTO `tb_administrative_division` VALUES (166, '广东省', '440000', '清远市', '441800', '连州市', '441882');
INSERT INTO `tb_administrative_division` VALUES (167, '广东省', '440000', '清远市', '441800', '佛冈县', '441821');
INSERT INTO `tb_administrative_division` VALUES (168, '广东省', '440000', '清远市', '441800', '阳山县', '441823');
INSERT INTO `tb_administrative_division` VALUES (169, '广东省', '440000', '清远市', '441800', '连南瑶族自治县', '441826');
INSERT INTO `tb_administrative_division` VALUES (170, '广东省', '440000', '湛江市', '440800', '雷州市', '440882');
INSERT INTO `tb_administrative_division` VALUES (171, '广东省', '440000', '湛江市', '440800', '遂溪县', '440823');
INSERT INTO `tb_administrative_division` VALUES (172, '广东省', '440000', '湛江市', '440800', '徐闻县', '440825');
INSERT INTO `tb_administrative_division` VALUES (173, '广东省', '440000', '湛江市', '440800', '东海岛', '440884');
INSERT INTO `tb_administrative_division` VALUES (174, '广东省', '440000', '湛江市', '440800', '赤坎区', '440802');
INSERT INTO `tb_administrative_division` VALUES (175, '广东省', '440000', '湛江市', '440800', '坡头区', '440804');
INSERT INTO `tb_administrative_division` VALUES (176, '广东省', '440000', '湛江市', '440800', '麻章区', '440811');
INSERT INTO `tb_administrative_division` VALUES (177, '广东省', '440000', '湛江市', '440800', '吴川市', '440883');
INSERT INTO `tb_administrative_division` VALUES (178, '广东省', '440000', '湛江市', '440800', '廉江市', '440881');
INSERT INTO `tb_administrative_division` VALUES (179, '广东省', '440000', '湛江市', '440800', '开发区', '440805');
INSERT INTO `tb_administrative_division` VALUES (180, '广东省', '440000', '湛江市', '440800', '霞山区', '440803');
INSERT INTO `tb_administrative_division` VALUES (181, '广东省', '440000', '云浮市', '445300', '新兴县', '445321');
INSERT INTO `tb_administrative_division` VALUES (182, '广东省', '440000', '云浮市', '445300', '罗定市', '445381');
INSERT INTO `tb_administrative_division` VALUES (183, '广东省', '440000', '云浮市', '445300', '郁南县', '445322');
INSERT INTO `tb_administrative_division` VALUES (184, '广东省', '440000', '云浮市', '445300', '云安县', '445323');
INSERT INTO `tb_administrative_division` VALUES (185, '广东省', '440000', '云浮市', '445300', '云城区', '445302');
INSERT INTO `tb_administrative_division` VALUES (186, '广东省', '440000', '韶关市', '440200', '始兴县', '440222');
INSERT INTO `tb_administrative_division` VALUES (187, '广东省', '440000', '韶关市', '440200', '曲江区', '440205');
INSERT INTO `tb_administrative_division` VALUES (188, '广东省', '440000', '韶关市', '440200', '仁化县', '440224');
INSERT INTO `tb_administrative_division` VALUES (189, '广东省', '440000', '韶关市', '440200', '武江区', '440203');
INSERT INTO `tb_administrative_division` VALUES (190, '广东省', '440000', '韶关市', '440200', '浈江区', '440204');
INSERT INTO `tb_administrative_division` VALUES (191, '广东省', '440000', '韶关市', '440200', '乳源瑶族自治县', '440232');
INSERT INTO `tb_administrative_division` VALUES (192, '广东省', '440000', '韶关市', '440200', '乐昌市', '440281');
INSERT INTO `tb_administrative_division` VALUES (193, '广东省', '440000', '韶关市', '440200', '翁源县', '440229');
INSERT INTO `tb_administrative_division` VALUES (194, '广东省', '440000', '韶关市', '440200', '新丰县', '440233');
INSERT INTO `tb_administrative_division` VALUES (195, '广东省', '440000', '韶关市', '440200', '南雄市', '440282');
INSERT INTO `tb_administrative_division` VALUES (196, '广东省', '440000', '茂名市', '440900', '信宜市', '440983');
INSERT INTO `tb_administrative_division` VALUES (197, '广东省', '440000', '茂名市', '440900', '茂南区', '440902');
INSERT INTO `tb_administrative_division` VALUES (198, '广东省', '440000', '茂名市', '440900', '茂港区', '440903');
INSERT INTO `tb_administrative_division` VALUES (199, '广东省', '440000', '茂名市', '440900', '高州市', '440981');
INSERT INTO `tb_administrative_division` VALUES (200, '广东省', '440000', '茂名市', '440900', '化州市', '440982');
INSERT INTO `tb_administrative_division` VALUES (201, '广东省', '440000', '茂名市', '440900', '电白县', '440923');
INSERT INTO `tb_administrative_division` VALUES (202, '广东省', '440000', '江门市', '440700', '蓬江区', '440703');
INSERT INTO `tb_administrative_division` VALUES (203, '广东省', '440000', '江门市', '440700', '台山市', '440781');
INSERT INTO `tb_administrative_division` VALUES (204, '广东省', '440000', '江门市', '440700', '恩平市', '440785');
INSERT INTO `tb_administrative_division` VALUES (205, '广东省', '440000', '江门市', '440700', '开平市', '440783');
INSERT INTO `tb_administrative_division` VALUES (206, '广东省', '440000', '江门市', '440700', '江海区', '440704');
INSERT INTO `tb_administrative_division` VALUES (207, '广东省', '440000', '江门市', '440700', '鹤山市', '440784');
INSERT INTO `tb_administrative_division` VALUES (208, '广东省', '440000', '江门市', '440700', '新会区', '440705');
INSERT INTO `tb_administrative_division` VALUES (209, '广东省', '440000', '汕尾市', '441500', '陆河县', '441523');
INSERT INTO `tb_administrative_division` VALUES (210, '广东省', '440000', '汕尾市', '441500', '陆丰市', '441581');
INSERT INTO `tb_administrative_division` VALUES (211, '广东省', '440000', '汕尾市', '441500', '华侨管理区', '441503');
INSERT INTO `tb_administrative_division` VALUES (212, '广东省', '440000', '汕尾市', '441500', '城区', '441502');
INSERT INTO `tb_administrative_division` VALUES (213, '广东省', '440000', '汕尾市', '441500', '海丰县', '441521');
INSERT INTO `tb_administrative_division` VALUES (214, '广东省', '440000', '汕尾市', '441500', '红海湾经济开发试验区', '441582');
INSERT INTO `tb_administrative_division` VALUES (215, '广东省', '440000', '中山市', '442000', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (216, '广东省', '440000', '阳江市', '441700', '阳东县', '441723');
INSERT INTO `tb_administrative_division` VALUES (217, '广东省', '440000', '阳江市', '441700', '江城区', '441702');
INSERT INTO `tb_administrative_division` VALUES (218, '广东省', '440000', '阳江市', '441700', '阳西县', '441721');
INSERT INTO `tb_administrative_division` VALUES (219, '广东省', '440000', '阳江市', '441700', '阳春市', '441781');
INSERT INTO `tb_administrative_division` VALUES (220, '广东省', '440000', '汕头市', '440500', '潮南区', '440514');
INSERT INTO `tb_administrative_division` VALUES (221, '广东省', '440000', '汕头市', '440500', '金平区', '440511');
INSERT INTO `tb_administrative_division` VALUES (222, '广东省', '440000', '汕头市', '440500', '澄海区', '440515');
INSERT INTO `tb_administrative_division` VALUES (223, '广东省', '440000', '汕头市', '440500', '龙湖区', '440507');
INSERT INTO `tb_administrative_division` VALUES (224, '广东省', '440000', '汕头市', '440500', '濠江区', '440512');
INSERT INTO `tb_administrative_division` VALUES (225, '广东省', '440000', '汕头市', '440500', '南澳县', '440523');
INSERT INTO `tb_administrative_division` VALUES (226, '广东省', '440000', '汕头市', '440500', '潮阳区', '440513');
INSERT INTO `tb_administrative_division` VALUES (227, '广东省', '440000', '佛山市', '440600', '高明区', '440608');
INSERT INTO `tb_administrative_division` VALUES (228, '广东省', '440000', '佛山市', '440600', '南海区', '440605');
INSERT INTO `tb_administrative_division` VALUES (229, '广东省', '440000', '佛山市', '440600', '三水区', '440607');
INSERT INTO `tb_administrative_division` VALUES (230, '广东省', '440000', '佛山市', '440600', '顺德区', '440606');
INSERT INTO `tb_administrative_division` VALUES (231, '广东省', '440000', '佛山市', '440600', '禅城区', '440604');
INSERT INTO `tb_administrative_division` VALUES (232, '广东省', '440000', '潮州市', '445100', '饶平县', '445122');
INSERT INTO `tb_administrative_division` VALUES (233, '广东省', '440000', '潮州市', '445100', '枫溪区', '445103');
INSERT INTO `tb_administrative_division` VALUES (234, '广东省', '440000', '潮州市', '445100', '潮安县', '445121');
INSERT INTO `tb_administrative_division` VALUES (235, '广东省', '440000', '潮州市', '445100', '湘桥区', '445102');
INSERT INTO `tb_administrative_division` VALUES (236, '广东省', '440000', '梅州市', '441400', '丰顺县', '441423');
INSERT INTO `tb_administrative_division` VALUES (237, '广东省', '440000', '梅州市', '441400', '兴宁市', '441481');
INSERT INTO `tb_administrative_division` VALUES (238, '广东省', '440000', '梅州市', '441400', '蕉岭县', '441427');
INSERT INTO `tb_administrative_division` VALUES (239, '广东省', '440000', '梅州市', '441400', '梅江区', '441402');
INSERT INTO `tb_administrative_division` VALUES (240, '广东省', '440000', '梅州市', '441400', '梅县', '441421');
INSERT INTO `tb_administrative_division` VALUES (241, '广东省', '440000', '梅州市', '441400', '五华县', '441424');
INSERT INTO `tb_administrative_division` VALUES (242, '广东省', '440000', '梅州市', '441400', '平远县', '441426');
INSERT INTO `tb_administrative_division` VALUES (243, '广东省', '440000', '梅州市', '441400', '大埔县', '441422');
INSERT INTO `tb_administrative_division` VALUES (244, '广东省', '440000', '惠州市', '441300', '惠东县', '441323');
INSERT INTO `tb_administrative_division` VALUES (245, '广东省', '440000', '惠州市', '441300', '龙门县', '441324');
INSERT INTO `tb_administrative_division` VALUES (246, '广东省', '440000', '惠州市', '441300', '惠阳区', '441303');
INSERT INTO `tb_administrative_division` VALUES (247, '广东省', '440000', '惠州市', '441300', '惠城区', '441302');
INSERT INTO `tb_administrative_division` VALUES (248, '广东省', '440000', '惠州市', '441300', '博罗县', '441322');
INSERT INTO `tb_administrative_division` VALUES (249, '广东省', '440000', '珠海市', '440400', '斗门区', '440403');
INSERT INTO `tb_administrative_division` VALUES (250, '广东省', '440000', '珠海市', '440400', '金湾区', '440404');
INSERT INTO `tb_administrative_division` VALUES (251, '广东省', '440000', '珠海市', '440400', '香洲区', '440402');
INSERT INTO `tb_administrative_division` VALUES (252, '广东省', '440000', '揭阳市', '445200', '经济开发试验区', '445204');
INSERT INTO `tb_administrative_division` VALUES (253, '广东省', '440000', '揭阳市', '445200', '惠来县', '445224');
INSERT INTO `tb_administrative_division` VALUES (254, '广东省', '440000', '揭阳市', '445200', '揭东县', '445221');
INSERT INTO `tb_administrative_division` VALUES (255, '广东省', '440000', '揭阳市', '445200', '东山区', '445203');
INSERT INTO `tb_administrative_division` VALUES (256, '广东省', '440000', '揭阳市', '445200', '揭西县', '445222');
INSERT INTO `tb_administrative_division` VALUES (257, '广东省', '440000', '揭阳市', '445200', '榕城区', '445202');
INSERT INTO `tb_administrative_division` VALUES (258, '广东省', '440000', '揭阳市', '445200', '普宁市', '445281');
INSERT INTO `tb_administrative_division` VALUES (259, '广东省', '440000', '东莞市', '441900', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (260, '河北省', '130000', '廊坊市', '131000', '三河市', '131082');
INSERT INTO `tb_administrative_division` VALUES (261, '河北省', '130000', '廊坊市', '131000', '大城县', '131025');
INSERT INTO `tb_administrative_division` VALUES (262, '河北省', '130000', '廊坊市', '131000', '广阳区', '131003');
INSERT INTO `tb_administrative_division` VALUES (263, '河北省', '130000', '廊坊市', '131000', '安次区', '131002');
INSERT INTO `tb_administrative_division` VALUES (264, '河北省', '130000', '廊坊市', '131000', '霸州市', '131081');
INSERT INTO `tb_administrative_division` VALUES (265, '河北省', '130000', '廊坊市', '131000', '永清县', '131023');
INSERT INTO `tb_administrative_division` VALUES (266, '河北省', '130000', '廊坊市', '131000', '大厂回族自治县', '131028');
INSERT INTO `tb_administrative_division` VALUES (267, '河北省', '130000', '廊坊市', '131000', '香河县', '131024');
INSERT INTO `tb_administrative_division` VALUES (268, '河北省', '130000', '廊坊市', '131000', '固安县', '131022');
INSERT INTO `tb_administrative_division` VALUES (269, '河北省', '130000', '廊坊市', '131000', '文安县', '131026');
INSERT INTO `tb_administrative_division` VALUES (270, '河北省', '130000', '保定市', '130600', '博野县', '130637');
INSERT INTO `tb_administrative_division` VALUES (271, '河北省', '130000', '保定市', '130600', '易县', '130633');
INSERT INTO `tb_administrative_division` VALUES (272, '河北省', '130000', '保定市', '130600', '徐水县', '130625');
INSERT INTO `tb_administrative_division` VALUES (273, '河北省', '130000', '保定市', '130600', '满城县', '130621');
INSERT INTO `tb_administrative_division` VALUES (274, '河北省', '130000', '保定市', '130600', '新市区', '130602');
INSERT INTO `tb_administrative_division` VALUES (275, '河北省', '130000', '保定市', '130600', '南市区', '130604');
INSERT INTO `tb_administrative_division` VALUES (276, '河北省', '130000', '保定市', '130600', '北市区', '130603');
INSERT INTO `tb_administrative_division` VALUES (277, '河北省', '130000', '保定市', '130600', '曲阳县', '130634');
INSERT INTO `tb_administrative_division` VALUES (278, '河北省', '130000', '保定市', '130600', '定州市', '130682');
INSERT INTO `tb_administrative_division` VALUES (279, '河北省', '130000', '保定市', '130600', '高碑店市', '130684');
INSERT INTO `tb_administrative_division` VALUES (280, '河北省', '130000', '保定市', '130600', '涞水县', '130623');
INSERT INTO `tb_administrative_division` VALUES (281, '河北省', '130000', '保定市', '130600', '顺平县', '130636');
INSERT INTO `tb_administrative_division` VALUES (282, '河北省', '130000', '保定市', '130600', '高阳县', '130628');
INSERT INTO `tb_administrative_division` VALUES (283, '河北省', '130000', '保定市', '130600', '蠡县', '130635');
INSERT INTO `tb_administrative_division` VALUES (284, '河北省', '130000', '保定市', '130600', '涞源县', '130630');
INSERT INTO `tb_administrative_division` VALUES (285, '河北省', '130000', '保定市', '130600', '清苑县', '130622');
INSERT INTO `tb_administrative_division` VALUES (286, '河北省', '130000', '保定市', '130600', '涿州市', '130681');
INSERT INTO `tb_administrative_division` VALUES (287, '河北省', '130000', '保定市', '130600', '安国市', '130683');
INSERT INTO `tb_administrative_division` VALUES (288, '河北省', '130000', '保定市', '130600', '望都县', '130631');
INSERT INTO `tb_administrative_division` VALUES (289, '河北省', '130000', '保定市', '130600', '唐县', '130627');
INSERT INTO `tb_administrative_division` VALUES (290, '河北省', '130000', '保定市', '130600', '阜平县', '130624');
INSERT INTO `tb_administrative_division` VALUES (291, '河北省', '130000', '保定市', '130600', '定兴县', '130626');
INSERT INTO `tb_administrative_division` VALUES (292, '河北省', '130000', '保定市', '130600', '莲池区', '130606');
INSERT INTO `tb_administrative_division` VALUES (293, '河北省', '130000', '秦皇岛市', '130300', '经济技术开发区', '130305');
INSERT INTO `tb_administrative_division` VALUES (294, '河北省', '130000', '秦皇岛市', '130300', '山海关区', '130303');
INSERT INTO `tb_administrative_division` VALUES (295, '河北省', '130000', '秦皇岛市', '130300', '青龙满族自治县', '130321');
INSERT INTO `tb_administrative_division` VALUES (296, '河北省', '130000', '秦皇岛市', '130300', '北戴河区', '130304');
INSERT INTO `tb_administrative_division` VALUES (297, '河北省', '130000', '秦皇岛市', '130300', '海港区', '130302');
INSERT INTO `tb_administrative_division` VALUES (298, '河北省', '130000', '秦皇岛市', '130300', '抚宁区', '130323');
INSERT INTO `tb_administrative_division` VALUES (299, '河北省', '130000', '秦皇岛市', '130300', '昌黎县', '130322');
INSERT INTO `tb_administrative_division` VALUES (300, '河北省', '130000', '秦皇岛市', '130300', '卢龙县', '130324');
INSERT INTO `tb_administrative_division` VALUES (301, '河北省', '130000', '石家庄市', '130100', '新乐市', '130184');
INSERT INTO `tb_administrative_division` VALUES (302, '河北省', '130000', '石家庄市', '130100', '鹿泉市', '130185');
INSERT INTO `tb_administrative_division` VALUES (303, '河北省', '130000', '石家庄市', '130100', '桥东区', '130103');
INSERT INTO `tb_administrative_division` VALUES (304, '河北省', '130000', '石家庄市', '130100', '长安区', '130102');
INSERT INTO `tb_administrative_division` VALUES (305, '河北省', '130000', '石家庄市', '130100', '井陉县', '130121');
INSERT INTO `tb_administrative_division` VALUES (306, '河北省', '130000', '石家庄市', '130100', '桥西区', '130104');
INSERT INTO `tb_administrative_division` VALUES (307, '河北省', '130000', '石家庄市', '130100', '赵县', '130133');
INSERT INTO `tb_administrative_division` VALUES (308, '河北省', '130000', '石家庄市', '130100', '裕华区', '130108');
INSERT INTO `tb_administrative_division` VALUES (309, '河北省', '130000', '石家庄市', '130100', '高邑县', '130127');
INSERT INTO `tb_administrative_division` VALUES (310, '河北省', '130000', '石家庄市', '130100', '赞皇县', '130129');
INSERT INTO `tb_administrative_division` VALUES (311, '河北省', '130000', '石家庄市', '130100', '栾城县', '130124');
INSERT INTO `tb_administrative_division` VALUES (312, '河北省', '130000', '石家庄市', '130100', '晋州市', '130183');
INSERT INTO `tb_administrative_division` VALUES (313, '河北省', '130000', '石家庄市', '130100', '平山县', '130131');
INSERT INTO `tb_administrative_division` VALUES (314, '河北省', '130000', '石家庄市', '130100', '行唐县', '130125');
INSERT INTO `tb_administrative_division` VALUES (315, '河北省', '130000', '石家庄市', '130100', '藁城市', '130182');
INSERT INTO `tb_administrative_division` VALUES (316, '河北省', '130000', '石家庄市', '130100', '无极县', '130130');
INSERT INTO `tb_administrative_division` VALUES (317, '河北省', '130000', '石家庄市', '130100', '深泽县', '130128');
INSERT INTO `tb_administrative_division` VALUES (318, '河北省', '130000', '石家庄市', '130100', '井陉矿区', '130107');
INSERT INTO `tb_administrative_division` VALUES (319, '河北省', '130000', '石家庄市', '130100', '正定县', '130123');
INSERT INTO `tb_administrative_division` VALUES (320, '河北省', '130000', '石家庄市', '130100', '元氏县', '130132');
INSERT INTO `tb_administrative_division` VALUES (321, '河北省', '130000', '石家庄市', '130100', '辛集市', '130181');
INSERT INTO `tb_administrative_division` VALUES (322, '河北省', '130000', '石家庄市', '130100', '新华区', '130105');
INSERT INTO `tb_administrative_division` VALUES (323, '河北省', '130000', '石家庄市', '130100', '灵寿县', '130126');
INSERT INTO `tb_administrative_division` VALUES (324, '河北省', '130000', '邢台市', '130500', '巨鹿县', '130529');
INSERT INTO `tb_administrative_division` VALUES (325, '河北省', '130000', '邢台市', '130500', '新河县', '130530');
INSERT INTO `tb_administrative_division` VALUES (326, '河北省', '130000', '邢台市', '130500', '威县', '130533');
INSERT INTO `tb_administrative_division` VALUES (327, '河北省', '130000', '邢台市', '130500', '广宗县', '130531');
INSERT INTO `tb_administrative_division` VALUES (328, '河北省', '130000', '邢台市', '130500', '南宫市', '130581');
INSERT INTO `tb_administrative_division` VALUES (329, '河北省', '130000', '邢台市', '130500', '临西县', '130535');
INSERT INTO `tb_administrative_division` VALUES (330, '河北省', '130000', '邢台市', '130500', '清河县', '130534');
INSERT INTO `tb_administrative_division` VALUES (331, '河北省', '130000', '邢台市', '130500', '平乡县', '130532');
INSERT INTO `tb_administrative_division` VALUES (332, '河北省', '130000', '邢台市', '130500', '柏乡县', '130524');
INSERT INTO `tb_administrative_division` VALUES (333, '河北省', '130000', '邢台市', '130500', '桥西区', '130503');
INSERT INTO `tb_administrative_division` VALUES (334, '河北省', '130000', '邢台市', '130500', '隆尧县', '130525');
INSERT INTO `tb_administrative_division` VALUES (335, '河北省', '130000', '邢台市', '130500', '桥东区', '130502');
INSERT INTO `tb_administrative_division` VALUES (336, '河北省', '130000', '邢台市', '130500', '内丘县', '130523');
INSERT INTO `tb_administrative_division` VALUES (337, '河北省', '130000', '邢台市', '130500', '南和县', '130527');
INSERT INTO `tb_administrative_division` VALUES (338, '河北省', '130000', '邢台市', '130500', '临城县', '130522');
INSERT INTO `tb_administrative_division` VALUES (339, '河北省', '130000', '邢台市', '130500', '宁晋县', '130528');
INSERT INTO `tb_administrative_division` VALUES (340, '河北省', '130000', '邢台市', '130500', '邢台县', '130521');
INSERT INTO `tb_administrative_division` VALUES (341, '河北省', '130000', '邢台市', '130500', '沙河市', '130582');
INSERT INTO `tb_administrative_division` VALUES (342, '河北省', '130000', '邢台市', '130500', '任县', '130526');
INSERT INTO `tb_administrative_division` VALUES (343, '河北省', '130000', '唐山市', '130200', '丰南区', '130207');
INSERT INTO `tb_administrative_division` VALUES (344, '河北省', '130000', '唐山市', '130200', '开平区', '130205');
INSERT INTO `tb_administrative_division` VALUES (345, '河北省', '130000', '唐山市', '130200', '乐亭县', '130225');
INSERT INTO `tb_administrative_division` VALUES (346, '河北省', '130000', '唐山市', '130200', '丰润区', '130208');
INSERT INTO `tb_administrative_division` VALUES (347, '河北省', '130000', '唐山市', '130200', '路北区', '130203');
INSERT INTO `tb_administrative_division` VALUES (348, '河北省', '130000', '唐山市', '130200', '滦南县', '130224');
INSERT INTO `tb_administrative_division` VALUES (349, '河北省', '130000', '唐山市', '130200', '遵化市', '130281');
INSERT INTO `tb_administrative_division` VALUES (350, '河北省', '130000', '唐山市', '130200', '迁安市', '130283');
INSERT INTO `tb_administrative_division` VALUES (351, '河北省', '130000', '唐山市', '130200', '玉田县', '130229');
INSERT INTO `tb_administrative_division` VALUES (352, '河北省', '130000', '唐山市', '130200', '迁西县', '130227');
INSERT INTO `tb_administrative_division` VALUES (353, '河北省', '130000', '唐山市', '130200', '古冶区', '130204');
INSERT INTO `tb_administrative_division` VALUES (354, '河北省', '130000', '唐山市', '130200', '滦县', '130223');
INSERT INTO `tb_administrative_division` VALUES (355, '河北省', '130000', '唐山市', '130200', '路南区', '130202');
INSERT INTO `tb_administrative_division` VALUES (356, '河北省', '130000', '唐山市', '130200', '曹妃甸区', '130230');
INSERT INTO `tb_administrative_division` VALUES (357, '河北省', '130000', '沧州市', '130900', '沧县', '130921');
INSERT INTO `tb_administrative_division` VALUES (358, '河北省', '130000', '沧州市', '130900', '运河区', '130903');
INSERT INTO `tb_administrative_division` VALUES (359, '河北省', '130000', '沧州市', '130900', '海兴县', '130924');
INSERT INTO `tb_administrative_division` VALUES (360, '河北省', '130000', '沧州市', '130900', '泊头市', '130981');
INSERT INTO `tb_administrative_division` VALUES (361, '河北省', '130000', '沧州市', '130900', '青县', '130922');
INSERT INTO `tb_administrative_division` VALUES (362, '河北省', '130000', '沧州市', '130900', '黄骅市', '130983');
INSERT INTO `tb_administrative_division` VALUES (363, '河北省', '130000', '沧州市', '130900', '河间市', '130984');
INSERT INTO `tb_administrative_division` VALUES (364, '河北省', '130000', '沧州市', '130900', '盐山县', '130925');
INSERT INTO `tb_administrative_division` VALUES (365, '河北省', '130000', '沧州市', '130900', '东光县', '130923');
INSERT INTO `tb_administrative_division` VALUES (366, '河北省', '130000', '沧州市', '130900', '孟村回族自治县', '130930');
INSERT INTO `tb_administrative_division` VALUES (367, '河北省', '130000', '沧州市', '130900', '任丘市', '130982');
INSERT INTO `tb_administrative_division` VALUES (368, '河北省', '130000', '沧州市', '130900', '新华区', '130902');
INSERT INTO `tb_administrative_division` VALUES (369, '河北省', '130000', '沧州市', '130900', '吴桥县', '130928');
INSERT INTO `tb_administrative_division` VALUES (370, '河北省', '130000', '沧州市', '130900', '南皮县', '130927');
INSERT INTO `tb_administrative_division` VALUES (371, '河北省', '130000', '沧州市', '130900', '献县', '130929');
INSERT INTO `tb_administrative_division` VALUES (372, '河北省', '130000', '沧州市', '130900', '肃宁县', '130926');
INSERT INTO `tb_administrative_division` VALUES (373, '河北省', '130000', '雄安新区', '131200', '雄县', '131201');
INSERT INTO `tb_administrative_division` VALUES (374, '河北省', '130000', '雄安新区', '131200', '安新县', '131203');
INSERT INTO `tb_administrative_division` VALUES (375, '河北省', '130000', '雄安新区', '131200', '容城县', '131202');
INSERT INTO `tb_administrative_division` VALUES (376, '河北省', '130000', '衡水市', '131100', '饶阳县', '131124');
INSERT INTO `tb_administrative_division` VALUES (377, '河北省', '130000', '衡水市', '131100', '深州市', '131182');
INSERT INTO `tb_administrative_division` VALUES (378, '河北省', '130000', '衡水市', '131100', '武邑县', '131122');
INSERT INTO `tb_administrative_division` VALUES (379, '河北省', '130000', '衡水市', '131100', '安平县', '131125');
INSERT INTO `tb_administrative_division` VALUES (380, '河北省', '130000', '衡水市', '131100', '阜城县', '131128');
INSERT INTO `tb_administrative_division` VALUES (381, '河北省', '130000', '衡水市', '131100', '武强县', '131123');
INSERT INTO `tb_administrative_division` VALUES (382, '河北省', '130000', '衡水市', '131100', '桃城区', '131102');
INSERT INTO `tb_administrative_division` VALUES (383, '河北省', '130000', '衡水市', '131100', '景县', '131127');
INSERT INTO `tb_administrative_division` VALUES (384, '河北省', '130000', '衡水市', '131100', '冀州市', '131181');
INSERT INTO `tb_administrative_division` VALUES (385, '河北省', '130000', '衡水市', '131100', '枣强县', '131121');
INSERT INTO `tb_administrative_division` VALUES (386, '河北省', '130000', '衡水市', '131100', '故城县', '131126');
INSERT INTO `tb_administrative_division` VALUES (387, '河北省', '130000', '邯郸市', '130400', '馆陶县', '130433');
INSERT INTO `tb_administrative_division` VALUES (388, '河北省', '130000', '邯郸市', '130400', '永年县', '130429');
INSERT INTO `tb_administrative_division` VALUES (389, '河北省', '130000', '邯郸市', '130400', '魏县', '130434');
INSERT INTO `tb_administrative_division` VALUES (390, '河北省', '130000', '邯郸市', '130400', '肥乡县', '130428');
INSERT INTO `tb_administrative_division` VALUES (391, '河北省', '130000', '邯郸市', '130400', '邯郸县', '130421');
INSERT INTO `tb_administrative_division` VALUES (392, '河北省', '130000', '邯郸市', '130400', '广平县', '130432');
INSERT INTO `tb_administrative_division` VALUES (393, '河北省', '130000', '邯郸市', '130400', '峰峰矿区', '130406');
INSERT INTO `tb_administrative_division` VALUES (394, '河北省', '130000', '邯郸市', '130400', '复兴区', '130404');
INSERT INTO `tb_administrative_division` VALUES (395, '河北省', '130000', '邯郸市', '130400', '邱县', '130430');
INSERT INTO `tb_administrative_division` VALUES (396, '河北省', '130000', '邯郸市', '130400', '成安县', '130424');
INSERT INTO `tb_administrative_division` VALUES (397, '河北省', '130000', '邯郸市', '130400', '武安市', '130481');
INSERT INTO `tb_administrative_division` VALUES (398, '河北省', '130000', '邯郸市', '130400', '丛台区', '130403');
INSERT INTO `tb_administrative_division` VALUES (399, '河北省', '130000', '邯郸市', '130400', '曲周县', '130435');
INSERT INTO `tb_administrative_division` VALUES (400, '河北省', '130000', '邯郸市', '130400', '邯山区', '130402');
INSERT INTO `tb_administrative_division` VALUES (401, '河北省', '130000', '邯郸市', '130400', '临漳县', '130423');
INSERT INTO `tb_administrative_division` VALUES (402, '河北省', '130000', '邯郸市', '130400', '磁县', '130427');
INSERT INTO `tb_administrative_division` VALUES (403, '河北省', '130000', '邯郸市', '130400', '鸡泽县', '130431');
INSERT INTO `tb_administrative_division` VALUES (404, '河北省', '130000', '邯郸市', '130400', '大名县', '130425');
INSERT INTO `tb_administrative_division` VALUES (405, '河北省', '130000', '邯郸市', '130400', '涉县', '130426');
INSERT INTO `tb_administrative_division` VALUES (406, '河北省', '130000', '张家口市', '130700', '崇礼县', '130733');
INSERT INTO `tb_administrative_division` VALUES (407, '河北省', '130000', '张家口市', '130700', '桥西区', '130703');
INSERT INTO `tb_administrative_division` VALUES (408, '河北省', '130000', '张家口市', '130700', '沽源县', '130724');
INSERT INTO `tb_administrative_division` VALUES (409, '河北省', '130000', '张家口市', '130700', '怀安县', '130728');
INSERT INTO `tb_administrative_division` VALUES (410, '河北省', '130000', '张家口市', '130700', '张北县', '130722');
INSERT INTO `tb_administrative_division` VALUES (411, '河北省', '130000', '张家口市', '130700', '宣化县', '130721');
INSERT INTO `tb_administrative_division` VALUES (412, '河北省', '130000', '张家口市', '130700', '涿鹿县', '130731');
INSERT INTO `tb_administrative_division` VALUES (413, '河北省', '130000', '张家口市', '130700', '康保县', '130723');
INSERT INTO `tb_administrative_division` VALUES (414, '河北省', '130000', '张家口市', '130700', '阳原县', '130727');
INSERT INTO `tb_administrative_division` VALUES (415, '河北省', '130000', '张家口市', '130700', '万全县', '130729');
INSERT INTO `tb_administrative_division` VALUES (416, '河北省', '130000', '张家口市', '130700', '怀来县', '130730');
INSERT INTO `tb_administrative_division` VALUES (417, '河北省', '130000', '张家口市', '130700', '桥东区', '130702');
INSERT INTO `tb_administrative_division` VALUES (418, '河北省', '130000', '张家口市', '130700', '下花园区', '130706');
INSERT INTO `tb_administrative_division` VALUES (419, '河北省', '130000', '张家口市', '130700', '尚义县', '130725');
INSERT INTO `tb_administrative_division` VALUES (420, '河北省', '130000', '张家口市', '130700', '赤城县', '130732');
INSERT INTO `tb_administrative_division` VALUES (421, '河北省', '130000', '张家口市', '130700', '宣化区', '130705');
INSERT INTO `tb_administrative_division` VALUES (422, '河北省', '130000', '张家口市', '130700', '蔚县', '130726');
INSERT INTO `tb_administrative_division` VALUES (423, '河北省', '130000', '承德市', '130800', '双桥区', '130802');
INSERT INTO `tb_administrative_division` VALUES (424, '河北省', '130000', '承德市', '130800', '平泉县', '130823');
INSERT INTO `tb_administrative_division` VALUES (425, '河北省', '130000', '承德市', '130800', '鹰手营子矿区', '130804');
INSERT INTO `tb_administrative_division` VALUES (426, '河北省', '130000', '承德市', '130800', '承德县', '130821');
INSERT INTO `tb_administrative_division` VALUES (427, '河北省', '130000', '承德市', '130800', '兴隆县', '130822');
INSERT INTO `tb_administrative_division` VALUES (428, '河北省', '130000', '承德市', '130800', '隆化县', '130825');
INSERT INTO `tb_administrative_division` VALUES (429, '河北省', '130000', '承德市', '130800', '滦平县', '130824');
INSERT INTO `tb_administrative_division` VALUES (430, '河北省', '130000', '承德市', '130800', '双滦区', '130803');
INSERT INTO `tb_administrative_division` VALUES (431, '河北省', '130000', '承德市', '130800', '宽城满族自治县', '130827');
INSERT INTO `tb_administrative_division` VALUES (432, '河北省', '130000', '承德市', '130800', '围场满族蒙古族自治县', '130828');
INSERT INTO `tb_administrative_division` VALUES (433, '河北省', '130000', '承德市', '130800', '丰宁满族自治县', '130826');
INSERT INTO `tb_administrative_division` VALUES (434, '湖北省', '420000', '宜昌市', '420500', '点军区', '420504');
INSERT INTO `tb_administrative_division` VALUES (435, '湖北省', '420000', '宜昌市', '420500', '长阳土家族自治县', '420528');
INSERT INTO `tb_administrative_division` VALUES (436, '湖北省', '420000', '宜昌市', '420500', '伍家岗区', '420503');
INSERT INTO `tb_administrative_division` VALUES (437, '湖北省', '420000', '宜昌市', '420500', '夷陵区', '420506');
INSERT INTO `tb_administrative_division` VALUES (438, '湖北省', '420000', '宜昌市', '420500', '秭归县', '420527');
INSERT INTO `tb_administrative_division` VALUES (439, '湖北省', '420000', '宜昌市', '420500', '远安县', '420525');
INSERT INTO `tb_administrative_division` VALUES (440, '湖北省', '420000', '宜昌市', '420500', '宜都市', '420581');
INSERT INTO `tb_administrative_division` VALUES (441, '湖北省', '420000', '宜昌市', '420500', '枝江市', '420583');
INSERT INTO `tb_administrative_division` VALUES (442, '湖北省', '420000', '宜昌市', '420500', '五峰土家族自治县', '420529');
INSERT INTO `tb_administrative_division` VALUES (443, '湖北省', '420000', '宜昌市', '420500', '当阳市', '420582');
INSERT INTO `tb_administrative_division` VALUES (444, '湖北省', '420000', '宜昌市', '420500', '西陵区', '420502');
INSERT INTO `tb_administrative_division` VALUES (445, '湖北省', '420000', '宜昌市', '420500', '猇亭区', '420505');
INSERT INTO `tb_administrative_division` VALUES (446, '湖北省', '420000', '宜昌市', '420500', '兴山县', '420526');
INSERT INTO `tb_administrative_division` VALUES (447, '湖北省', '420000', '荆州市', '421000', '公安县', '421022');
INSERT INTO `tb_administrative_division` VALUES (448, '湖北省', '420000', '荆州市', '421000', '洪湖市', '421083');
INSERT INTO `tb_administrative_division` VALUES (449, '湖北省', '420000', '荆州市', '421000', '松滋市', '421087');
INSERT INTO `tb_administrative_division` VALUES (450, '湖北省', '420000', '荆州市', '421000', '江陵县', '421024');
INSERT INTO `tb_administrative_division` VALUES (451, '湖北省', '420000', '荆州市', '421000', '荆州区', '421003');
INSERT INTO `tb_administrative_division` VALUES (452, '湖北省', '420000', '荆州市', '421000', '石首市', '421081');
INSERT INTO `tb_administrative_division` VALUES (453, '湖北省', '420000', '荆州市', '421000', '监利县', '421023');
INSERT INTO `tb_administrative_division` VALUES (454, '湖北省', '420000', '荆州市', '421000', '沙市区', '421002');
INSERT INTO `tb_administrative_division` VALUES (455, '湖北省', '420000', '随州市', '421300', '广水市', '421381');
INSERT INTO `tb_administrative_division` VALUES (456, '湖北省', '420000', '随州市', '421300', '曾都区', '421302');
INSERT INTO `tb_administrative_division` VALUES (457, '湖北省', '420000', '随州市', '421300', '随县', '421321');
INSERT INTO `tb_administrative_division` VALUES (458, '湖北省', '420000', '鄂州市', '420700', '鄂城区', '420704');
INSERT INTO `tb_administrative_division` VALUES (459, '湖北省', '420000', '鄂州市', '420700', '华容区', '420703');
INSERT INTO `tb_administrative_division` VALUES (460, '湖北省', '420000', '鄂州市', '420700', '梁子湖区', '420702');
INSERT INTO `tb_administrative_division` VALUES (461, '湖北省', '420000', '十堰市', '420300', '郧县', '420321');
INSERT INTO `tb_administrative_division` VALUES (462, '湖北省', '420000', '十堰市', '420300', '茅箭区', '420302');
INSERT INTO `tb_administrative_division` VALUES (463, '湖北省', '420000', '十堰市', '420300', '张湾区', '420303');
INSERT INTO `tb_administrative_division` VALUES (464, '湖北省', '420000', '十堰市', '420300', '丹江口市', '420381');
INSERT INTO `tb_administrative_division` VALUES (465, '湖北省', '420000', '十堰市', '420300', '房县', '420325');
INSERT INTO `tb_administrative_division` VALUES (466, '湖北省', '420000', '十堰市', '420300', '郧西县', '420322');
INSERT INTO `tb_administrative_division` VALUES (467, '湖北省', '420000', '十堰市', '420300', '竹溪县', '420324');
INSERT INTO `tb_administrative_division` VALUES (468, '湖北省', '420000', '十堰市', '420300', '竹山县', '420323');
INSERT INTO `tb_administrative_division` VALUES (469, '湖北省', '420000', '十堰市', '420300', '郧阳区', '420304');
INSERT INTO `tb_administrative_division` VALUES (470, '湖北省', '420000', '孝感市', '420900', '云梦县', '420923');
INSERT INTO `tb_administrative_division` VALUES (471, '湖北省', '420000', '孝感市', '420900', '孝南区', '420902');
INSERT INTO `tb_administrative_division` VALUES (472, '湖北省', '420000', '孝感市', '420900', '安陆市', '420982');
INSERT INTO `tb_administrative_division` VALUES (473, '湖北省', '420000', '孝感市', '420900', '孝昌县', '420921');
INSERT INTO `tb_administrative_division` VALUES (474, '湖北省', '420000', '孝感市', '420900', '应城市', '420981');
INSERT INTO `tb_administrative_division` VALUES (475, '湖北省', '420000', '孝感市', '420900', '大悟县', '420922');
INSERT INTO `tb_administrative_division` VALUES (476, '湖北省', '420000', '孝感市', '420900', '汉川市', '420984');
INSERT INTO `tb_administrative_division` VALUES (477, '湖北省', '420000', '咸宁市', '421200', '嘉鱼县', '421221');
INSERT INTO `tb_administrative_division` VALUES (478, '湖北省', '420000', '咸宁市', '421200', '通山县', '421224');
INSERT INTO `tb_administrative_division` VALUES (479, '湖北省', '420000', '咸宁市', '421200', '通城县', '421222');
INSERT INTO `tb_administrative_division` VALUES (480, '湖北省', '420000', '咸宁市', '421200', '赤壁市', '421281');
INSERT INTO `tb_administrative_division` VALUES (481, '湖北省', '420000', '咸宁市', '421200', '崇阳县', '421223');
INSERT INTO `tb_administrative_division` VALUES (482, '湖北省', '420000', '咸宁市', '421200', '咸安区', '421202');
INSERT INTO `tb_administrative_division` VALUES (483, '湖北省', '420000', '荆门市', '420800', '沙洋县', '420822');
INSERT INTO `tb_administrative_division` VALUES (484, '湖北省', '420000', '荆门市', '420800', '钟祥市', '420881');
INSERT INTO `tb_administrative_division` VALUES (485, '湖北省', '420000', '荆门市', '420800', '掇刀区', '420804');
INSERT INTO `tb_administrative_division` VALUES (486, '湖北省', '420000', '荆门市', '420800', '京山县', '420821');
INSERT INTO `tb_administrative_division` VALUES (487, '湖北省', '420000', '荆门市', '420800', '东宝区', '420802');
INSERT INTO `tb_administrative_division` VALUES (488, '湖北省', '420000', '黄石市', '420200', '大冶市', '420281');
INSERT INTO `tb_administrative_division` VALUES (489, '湖北省', '420000', '黄石市', '420200', '下陆区', '420204');
INSERT INTO `tb_administrative_division` VALUES (490, '湖北省', '420000', '黄石市', '420200', '团城山开发区', '420206');
INSERT INTO `tb_administrative_division` VALUES (491, '湖北省', '420000', '黄石市', '420200', '黄石港区', '420202');
INSERT INTO `tb_administrative_division` VALUES (492, '湖北省', '420000', '黄石市', '420200', '西塞山区', '420203');
INSERT INTO `tb_administrative_division` VALUES (493, '湖北省', '420000', '黄石市', '420200', '铁山区', '420205');
INSERT INTO `tb_administrative_division` VALUES (494, '湖北省', '420000', '黄石市', '420200', '阳新县', '420222');
INSERT INTO `tb_administrative_division` VALUES (495, '湖北省', '420000', '恩施土家族苗族自治州', '422800', '恩施市', '422801');
INSERT INTO `tb_administrative_division` VALUES (496, '湖北省', '420000', '恩施土家族苗族自治州', '422800', '来凤县', '422827');
INSERT INTO `tb_administrative_division` VALUES (497, '湖北省', '420000', '恩施土家族苗族自治州', '422800', '建始县', '422822');
INSERT INTO `tb_administrative_division` VALUES (498, '湖北省', '420000', '恩施土家族苗族自治州', '422800', '巴东县', '422823');
INSERT INTO `tb_administrative_division` VALUES (499, '湖北省', '420000', '恩施土家族苗族自治州', '422800', '利川市', '422802');
INSERT INTO `tb_administrative_division` VALUES (500, '湖北省', '420000', '恩施土家族苗族自治州', '422800', '宣恩县', '422825');
INSERT INTO `tb_administrative_division` VALUES (501, '湖北省', '420000', '恩施土家族苗族自治州', '422800', '鹤峰县', '422828');
INSERT INTO `tb_administrative_division` VALUES (502, '湖北省', '420000', '恩施土家族苗族自治州', '422800', '咸丰县', '422826');
INSERT INTO `tb_administrative_division` VALUES (503, '湖北省', '420000', '武汉市', '420100', '新洲区', '420117');
INSERT INTO `tb_administrative_division` VALUES (504, '湖北省', '420000', '武汉市', '420100', '江夏区', '420115');
INSERT INTO `tb_administrative_division` VALUES (505, '湖北省', '420000', '武汉市', '420100', '江汉区', '420103');
INSERT INTO `tb_administrative_division` VALUES (506, '湖北省', '420000', '武汉市', '420100', '汉阳区', '420105');
INSERT INTO `tb_administrative_division` VALUES (507, '湖北省', '420000', '武汉市', '420100', '黄陂区', '420116');
INSERT INTO `tb_administrative_division` VALUES (508, '湖北省', '420000', '武汉市', '420100', '汉南区', '420113');
INSERT INTO `tb_administrative_division` VALUES (509, '湖北省', '420000', '武汉市', '420100', '青山区', '420107');
INSERT INTO `tb_administrative_division` VALUES (510, '湖北省', '420000', '武汉市', '420100', '东西湖区', '420112');
INSERT INTO `tb_administrative_division` VALUES (511, '湖北省', '420000', '武汉市', '420100', '蔡甸区', '420114');
INSERT INTO `tb_administrative_division` VALUES (512, '湖北省', '420000', '武汉市', '420100', '江岸区', '420102');
INSERT INTO `tb_administrative_division` VALUES (513, '湖北省', '420000', '武汉市', '420100', '洪山区', '420111');
INSERT INTO `tb_administrative_division` VALUES (514, '湖北省', '420000', '武汉市', '420100', '武昌区', '420106');
INSERT INTO `tb_administrative_division` VALUES (515, '湖北省', '420000', '武汉市', '420100', '硚口区', '420104');
INSERT INTO `tb_administrative_division` VALUES (516, '湖北省', '420000', '黄冈市', '421100', '红安县', '421122');
INSERT INTO `tb_administrative_division` VALUES (517, '湖北省', '420000', '黄冈市', '421100', '黄州区', '421102');
INSERT INTO `tb_administrative_division` VALUES (518, '湖北省', '420000', '黄冈市', '421100', '罗田县', '421123');
INSERT INTO `tb_administrative_division` VALUES (519, '湖北省', '420000', '黄冈市', '421100', '团风县', '421121');
INSERT INTO `tb_administrative_division` VALUES (520, '湖北省', '420000', '黄冈市', '421100', '武穴市', '421182');
INSERT INTO `tb_administrative_division` VALUES (521, '湖北省', '420000', '黄冈市', '421100', '浠水县', '421125');
INSERT INTO `tb_administrative_division` VALUES (522, '湖北省', '420000', '黄冈市', '421100', '麻城市', '421181');
INSERT INTO `tb_administrative_division` VALUES (523, '湖北省', '420000', '黄冈市', '421100', '英山县', '421124');
INSERT INTO `tb_administrative_division` VALUES (524, '湖北省', '420000', '黄冈市', '421100', '黄梅县', '421127');
INSERT INTO `tb_administrative_division` VALUES (525, '湖北省', '420000', '黄冈市', '421100', '蕲春县', '421126');
INSERT INTO `tb_administrative_division` VALUES (526, '湖北省', '420000', '襄阳市', '420600', '谷城县', '420625');
INSERT INTO `tb_administrative_division` VALUES (527, '湖北省', '420000', '襄阳市', '420600', '樊城区', '420606');
INSERT INTO `tb_administrative_division` VALUES (528, '湖北省', '420000', '襄阳市', '420600', '宜城市', '420684');
INSERT INTO `tb_administrative_division` VALUES (529, '湖北省', '420000', '襄阳市', '420600', '襄城区', '420602');
INSERT INTO `tb_administrative_division` VALUES (530, '湖北省', '420000', '襄阳市', '420600', '老河口市', '420682');
INSERT INTO `tb_administrative_division` VALUES (531, '湖北省', '420000', '襄阳市', '420600', '南漳县', '420624');
INSERT INTO `tb_administrative_division` VALUES (532, '湖北省', '420000', '襄阳市', '420600', '襄州区', '420607');
INSERT INTO `tb_administrative_division` VALUES (533, '湖北省', '420000', '襄阳市', '420600', '枣阳市', '420683');
INSERT INTO `tb_administrative_division` VALUES (534, '湖北省', '420000', '襄阳市', '420600', '保康县', '420626');
INSERT INTO `tb_administrative_division` VALUES (535, '辽宁省', '210000', '抚顺市', '210400', '东洲区', '210403');
INSERT INTO `tb_administrative_division` VALUES (536, '辽宁省', '210000', '抚顺市', '210400', '望花区', '210404');
INSERT INTO `tb_administrative_division` VALUES (537, '辽宁省', '210000', '抚顺市', '210400', '顺城区', '210411');
INSERT INTO `tb_administrative_division` VALUES (538, '辽宁省', '210000', '抚顺市', '210400', '新抚区', '210402');
INSERT INTO `tb_administrative_division` VALUES (539, '辽宁省', '210000', '抚顺市', '210400', '抚顺县', '210421');
INSERT INTO `tb_administrative_division` VALUES (540, '辽宁省', '210000', '抚顺市', '210400', '清原满族自治县', '210423');
INSERT INTO `tb_administrative_division` VALUES (541, '辽宁省', '210000', '抚顺市', '210400', '新宾满族自治县', '210422');
INSERT INTO `tb_administrative_division` VALUES (542, '辽宁省', '210000', '大连市', '210200', '中山区', '210202');
INSERT INTO `tb_administrative_division` VALUES (543, '辽宁省', '210000', '大连市', '210200', '西岗区', '210203');
INSERT INTO `tb_administrative_division` VALUES (544, '辽宁省', '210000', '大连市', '210200', '沙河口区', '210204');
INSERT INTO `tb_administrative_division` VALUES (545, '辽宁省', '210000', '大连市', '210200', '普兰店市', '210282');
INSERT INTO `tb_administrative_division` VALUES (546, '辽宁省', '210000', '大连市', '210200', '长海县', '210224');
INSERT INTO `tb_administrative_division` VALUES (547, '辽宁省', '210000', '大连市', '210200', '旅顺口区', '210212');
INSERT INTO `tb_administrative_division` VALUES (548, '辽宁省', '210000', '大连市', '210200', '甘井子区', '210211');
INSERT INTO `tb_administrative_division` VALUES (549, '辽宁省', '210000', '大连市', '210200', '庄河市', '210283');
INSERT INTO `tb_administrative_division` VALUES (550, '辽宁省', '210000', '大连市', '210200', '瓦房店市', '210281');
INSERT INTO `tb_administrative_division` VALUES (551, '辽宁省', '210000', '大连市', '210200', '金州区', '210213');
INSERT INTO `tb_administrative_division` VALUES (552, '辽宁省', '210000', '本溪市', '210500', '平山区', '210502');
INSERT INTO `tb_administrative_division` VALUES (553, '辽宁省', '210000', '本溪市', '210500', '溪湖区', '210503');
INSERT INTO `tb_administrative_division` VALUES (554, '辽宁省', '210000', '本溪市', '210500', '桓仁满族自治县', '210522');
INSERT INTO `tb_administrative_division` VALUES (555, '辽宁省', '210000', '本溪市', '210500', '南芬区', '210505');
INSERT INTO `tb_administrative_division` VALUES (556, '辽宁省', '210000', '本溪市', '210500', '明山区', '210504');
INSERT INTO `tb_administrative_division` VALUES (557, '辽宁省', '210000', '本溪市', '210500', '本溪满族自治县', '210521');
INSERT INTO `tb_administrative_division` VALUES (558, '辽宁省', '210000', '营口市', '210800', '西市区', '210803');
INSERT INTO `tb_administrative_division` VALUES (559, '辽宁省', '210000', '营口市', '210800', '盖州市', '210881');
INSERT INTO `tb_administrative_division` VALUES (560, '辽宁省', '210000', '营口市', '210800', '老边区', '210811');
INSERT INTO `tb_administrative_division` VALUES (561, '辽宁省', '210000', '营口市', '210800', '站前区', '210802');
INSERT INTO `tb_administrative_division` VALUES (562, '辽宁省', '210000', '营口市', '210800', '鲅鱼圈区', '210804');
INSERT INTO `tb_administrative_division` VALUES (563, '辽宁省', '210000', '营口市', '210800', '大石桥市', '210882');
INSERT INTO `tb_administrative_division` VALUES (564, '辽宁省', '210000', '鞍山市', '210300', '岫岩满族自治县', '210323');
INSERT INTO `tb_administrative_division` VALUES (565, '辽宁省', '210000', '鞍山市', '210300', '千山区', '210311');
INSERT INTO `tb_administrative_division` VALUES (566, '辽宁省', '210000', '鞍山市', '210300', '铁西区', '210303');
INSERT INTO `tb_administrative_division` VALUES (567, '辽宁省', '210000', '鞍山市', '210300', '海城市', '210381');
INSERT INTO `tb_administrative_division` VALUES (568, '辽宁省', '210000', '鞍山市', '210300', '立山区', '210304');
INSERT INTO `tb_administrative_division` VALUES (569, '辽宁省', '210000', '鞍山市', '210300', '铁东区', '210302');
INSERT INTO `tb_administrative_division` VALUES (570, '辽宁省', '210000', '鞍山市', '210300', '台安县', '210321');
INSERT INTO `tb_administrative_division` VALUES (571, '辽宁省', '210000', '阜新市', '210900', '太平区', '210904');
INSERT INTO `tb_administrative_division` VALUES (572, '辽宁省', '210000', '阜新市', '210900', '阜新蒙古族自治县', '210921');
INSERT INTO `tb_administrative_division` VALUES (573, '辽宁省', '210000', '阜新市', '210900', '海州区', '210902');
INSERT INTO `tb_administrative_division` VALUES (574, '辽宁省', '210000', '阜新市', '210900', '细河区', '210911');
INSERT INTO `tb_administrative_division` VALUES (575, '辽宁省', '210000', '阜新市', '210900', '新邱区', '210903');
INSERT INTO `tb_administrative_division` VALUES (576, '辽宁省', '210000', '阜新市', '210900', '彰武县', '210922');
INSERT INTO `tb_administrative_division` VALUES (577, '辽宁省', '210000', '阜新市', '210900', '清河门区', '210905');
INSERT INTO `tb_administrative_division` VALUES (578, '辽宁省', '210000', '辽阳市', '211000', '灯塔市', '211081');
INSERT INTO `tb_administrative_division` VALUES (579, '辽宁省', '210000', '辽阳市', '211000', '弓长岭区', '211005');
INSERT INTO `tb_administrative_division` VALUES (580, '辽宁省', '210000', '辽阳市', '211000', '文圣区', '211003');
INSERT INTO `tb_administrative_division` VALUES (581, '辽宁省', '210000', '辽阳市', '211000', '辽阳县', '211021');
INSERT INTO `tb_administrative_division` VALUES (582, '辽宁省', '210000', '辽阳市', '211000', '白塔区', '211002');
INSERT INTO `tb_administrative_division` VALUES (583, '辽宁省', '210000', '辽阳市', '211000', '宏伟区', '211004');
INSERT INTO `tb_administrative_division` VALUES (584, '辽宁省', '210000', '辽阳市', '211000', '太子河区', '211011');
INSERT INTO `tb_administrative_division` VALUES (585, '辽宁省', '210000', '盘锦市', '211100', '双台子区', '211102');
INSERT INTO `tb_administrative_division` VALUES (586, '辽宁省', '210000', '盘锦市', '211100', '盘山县', '211122');
INSERT INTO `tb_administrative_division` VALUES (587, '辽宁省', '210000', '盘锦市', '211100', '大洼县', '211121');
INSERT INTO `tb_administrative_division` VALUES (588, '辽宁省', '210000', '盘锦市', '211100', '兴隆台区', '211103');
INSERT INTO `tb_administrative_division` VALUES (589, '辽宁省', '210000', '铁岭市', '211200', '铁岭县', '211221');
INSERT INTO `tb_administrative_division` VALUES (590, '辽宁省', '210000', '铁岭市', '211200', '调兵山市', '211281');
INSERT INTO `tb_administrative_division` VALUES (591, '辽宁省', '210000', '铁岭市', '211200', '昌图县', '211224');
INSERT INTO `tb_administrative_division` VALUES (592, '辽宁省', '210000', '铁岭市', '211200', '清河区', '211204');
INSERT INTO `tb_administrative_division` VALUES (593, '辽宁省', '210000', '铁岭市', '211200', '开原市', '211282');
INSERT INTO `tb_administrative_division` VALUES (594, '辽宁省', '210000', '铁岭市', '211200', '西丰县', '211223');
INSERT INTO `tb_administrative_division` VALUES (595, '辽宁省', '210000', '铁岭市', '211200', '银州区', '211202');
INSERT INTO `tb_administrative_division` VALUES (596, '辽宁省', '210000', '锦州市', '210700', '义县', '210727');
INSERT INTO `tb_administrative_division` VALUES (597, '辽宁省', '210000', '锦州市', '210700', '太和区', '210711');
INSERT INTO `tb_administrative_division` VALUES (598, '辽宁省', '210000', '锦州市', '210700', '古塔区', '210702');
INSERT INTO `tb_administrative_division` VALUES (599, '辽宁省', '210000', '锦州市', '210700', '凌海市', '210781');
INSERT INTO `tb_administrative_division` VALUES (600, '辽宁省', '210000', '锦州市', '210700', '北镇市', '210782');
INSERT INTO `tb_administrative_division` VALUES (601, '辽宁省', '210000', '锦州市', '210700', '凌河区', '210703');
INSERT INTO `tb_administrative_division` VALUES (602, '辽宁省', '210000', '锦州市', '210700', '黑山县', '210726');
INSERT INTO `tb_administrative_division` VALUES (603, '辽宁省', '210000', '朝阳市', '211300', '双塔区', '211302');
INSERT INTO `tb_administrative_division` VALUES (604, '辽宁省', '210000', '朝阳市', '211300', '龙城区', '211303');
INSERT INTO `tb_administrative_division` VALUES (605, '辽宁省', '210000', '朝阳市', '211300', '建平县', '211322');
INSERT INTO `tb_administrative_division` VALUES (606, '辽宁省', '210000', '朝阳市', '211300', '凌源市', '211382');
INSERT INTO `tb_administrative_division` VALUES (607, '辽宁省', '210000', '朝阳市', '211300', '朝阳县', '211321');
INSERT INTO `tb_administrative_division` VALUES (608, '辽宁省', '210000', '朝阳市', '211300', '北票市', '211381');
INSERT INTO `tb_administrative_division` VALUES (609, '辽宁省', '210000', '朝阳市', '211300', '喀喇沁左翼蒙古族自治县', '211324');
INSERT INTO `tb_administrative_division` VALUES (610, '辽宁省', '210000', '葫芦岛市', '211400', '连山区', '211402');
INSERT INTO `tb_administrative_division` VALUES (611, '辽宁省', '210000', '葫芦岛市', '211400', '绥中县', '211421');
INSERT INTO `tb_administrative_division` VALUES (612, '辽宁省', '210000', '葫芦岛市', '211400', '兴城市', '211481');
INSERT INTO `tb_administrative_division` VALUES (613, '辽宁省', '210000', '葫芦岛市', '211400', '龙港区', '211403');
INSERT INTO `tb_administrative_division` VALUES (614, '辽宁省', '210000', '葫芦岛市', '211400', '建昌县', '211422');
INSERT INTO `tb_administrative_division` VALUES (615, '辽宁省', '210000', '葫芦岛市', '211400', '南票区', '211404');
INSERT INTO `tb_administrative_division` VALUES (616, '辽宁省', '210000', '丹东市', '210600', '宽甸满族自治县', '210624');
INSERT INTO `tb_administrative_division` VALUES (617, '辽宁省', '210000', '丹东市', '210600', '东港市', '210681');
INSERT INTO `tb_administrative_division` VALUES (618, '辽宁省', '210000', '丹东市', '210600', '凤城市', '210682');
INSERT INTO `tb_administrative_division` VALUES (619, '辽宁省', '210000', '丹东市', '210600', '振安区', '210604');
INSERT INTO `tb_administrative_division` VALUES (620, '辽宁省', '210000', '丹东市', '210600', '振兴区', '210603');
INSERT INTO `tb_administrative_division` VALUES (621, '辽宁省', '210000', '丹东市', '210600', '元宝区', '210602');
INSERT INTO `tb_administrative_division` VALUES (622, '辽宁省', '210000', '沈阳市', '210100', '和平区', '210102');
INSERT INTO `tb_administrative_division` VALUES (623, '辽宁省', '210000', '沈阳市', '210100', '法库县', '210124');
INSERT INTO `tb_administrative_division` VALUES (624, '辽宁省', '210000', '沈阳市', '210100', '苏家屯区', '210111');
INSERT INTO `tb_administrative_division` VALUES (625, '辽宁省', '210000', '沈阳市', '210100', '新民市', '210181');
INSERT INTO `tb_administrative_division` VALUES (626, '辽宁省', '210000', '沈阳市', '210100', '皇姑区', '210105');
INSERT INTO `tb_administrative_division` VALUES (627, '辽宁省', '210000', '沈阳市', '210100', '沈河区', '210103');
INSERT INTO `tb_administrative_division` VALUES (628, '辽宁省', '210000', '沈阳市', '210100', '康平县', '210123');
INSERT INTO `tb_administrative_division` VALUES (629, '辽宁省', '210000', '沈阳市', '210100', '铁西区', '210106');
INSERT INTO `tb_administrative_division` VALUES (630, '辽宁省', '210000', '沈阳市', '210100', '大东区', '210104');
INSERT INTO `tb_administrative_division` VALUES (631, '辽宁省', '210000', '沈阳市', '210100', '于洪区', '210114');
INSERT INTO `tb_administrative_division` VALUES (632, '辽宁省', '210000', '沈阳市', '210100', '沈北新区', '210113');
INSERT INTO `tb_administrative_division` VALUES (633, '辽宁省', '210000', '沈阳市', '210100', '浑南区', '210112');
INSERT INTO `tb_administrative_division` VALUES (634, '辽宁省', '210000', '沈阳市', '210100', '辽中区', '210122');
INSERT INTO `tb_administrative_division` VALUES (635, '江西省', '360000', '萍乡市', '360300', '湘东区', '360313');
INSERT INTO `tb_administrative_division` VALUES (636, '江西省', '360000', '萍乡市', '360300', '上栗县', '360322');
INSERT INTO `tb_administrative_division` VALUES (637, '江西省', '360000', '萍乡市', '360300', '芦溪县', '360323');
INSERT INTO `tb_administrative_division` VALUES (638, '江西省', '360000', '萍乡市', '360300', '莲花县', '360321');
INSERT INTO `tb_administrative_division` VALUES (639, '江西省', '360000', '萍乡市', '360300', '安源区', '360302');
INSERT INTO `tb_administrative_division` VALUES (640, '江西省', '360000', '鹰潭市', '360600', '余江县', '360622');
INSERT INTO `tb_administrative_division` VALUES (641, '江西省', '360000', '鹰潭市', '360600', '贵溪市', '360681');
INSERT INTO `tb_administrative_division` VALUES (642, '江西省', '360000', '鹰潭市', '360600', '月湖区', '360602');
INSERT INTO `tb_administrative_division` VALUES (643, '江西省', '360000', '九江市', '360400', '湖口县', '360429');
INSERT INTO `tb_administrative_division` VALUES (644, '江西省', '360000', '九江市', '360400', '共青城', '360499');
INSERT INTO `tb_administrative_division` VALUES (645, '江西省', '360000', '九江市', '360400', '瑞昌市', '360481');
INSERT INTO `tb_administrative_division` VALUES (646, '江西省', '360000', '九江市', '360400', '永修县', '360425');
INSERT INTO `tb_administrative_division` VALUES (647, '江西省', '360000', '九江市', '360400', '武宁县', '360423');
INSERT INTO `tb_administrative_division` VALUES (648, '江西省', '360000', '九江市', '360400', '庐山区', '360402');
INSERT INTO `tb_administrative_division` VALUES (649, '江西省', '360000', '九江市', '360400', '彭泽县', '360430');
INSERT INTO `tb_administrative_division` VALUES (650, '江西省', '360000', '九江市', '360400', '星子县', '360427');
INSERT INTO `tb_administrative_division` VALUES (651, '江西省', '360000', '九江市', '360400', '都昌县', '360428');
INSERT INTO `tb_administrative_division` VALUES (652, '江西省', '360000', '九江市', '360400', '修水县', '360424');
INSERT INTO `tb_administrative_division` VALUES (653, '江西省', '360000', '九江市', '360400', '浔阳区', '360403');
INSERT INTO `tb_administrative_division` VALUES (654, '江西省', '360000', '九江市', '360400', '九江县', '360421');
INSERT INTO `tb_administrative_division` VALUES (655, '江西省', '360000', '九江市', '360400', '德安县', '360426');
INSERT INTO `tb_administrative_division` VALUES (656, '江西省', '360000', '九江市', '360400', '柴桑区', '360404');
INSERT INTO `tb_administrative_division` VALUES (657, '江西省', '360000', '南昌市', '360100', '新建县', '360122');
INSERT INTO `tb_administrative_division` VALUES (658, '江西省', '360000', '南昌市', '360100', '湾里区', '360105');
INSERT INTO `tb_administrative_division` VALUES (659, '江西省', '360000', '南昌市', '360100', '安义县', '360123');
INSERT INTO `tb_administrative_division` VALUES (660, '江西省', '360000', '南昌市', '360100', '西湖区', '360103');
INSERT INTO `tb_administrative_division` VALUES (661, '江西省', '360000', '南昌市', '360100', '青山湖区', '360111');
INSERT INTO `tb_administrative_division` VALUES (662, '江西省', '360000', '南昌市', '360100', '进贤县', '360124');
INSERT INTO `tb_administrative_division` VALUES (663, '江西省', '360000', '南昌市', '360100', '青云谱区', '360104');
INSERT INTO `tb_administrative_division` VALUES (664, '江西省', '360000', '南昌市', '360100', '东湖区', '360102');
INSERT INTO `tb_administrative_division` VALUES (665, '江西省', '360000', '南昌市', '360100', '南昌县', '360121');
INSERT INTO `tb_administrative_division` VALUES (666, '江西省', '360000', '抚州市', '361000', '广昌县', '361030');
INSERT INTO `tb_administrative_division` VALUES (667, '江西省', '360000', '抚州市', '361000', '崇仁县', '361024');
INSERT INTO `tb_administrative_division` VALUES (668, '江西省', '360000', '抚州市', '361000', '临川区', '361002');
INSERT INTO `tb_administrative_division` VALUES (669, '江西省', '360000', '抚州市', '361000', '黎川县', '361022');
INSERT INTO `tb_administrative_division` VALUES (670, '江西省', '360000', '抚州市', '361000', '乐安县', '361025');
INSERT INTO `tb_administrative_division` VALUES (671, '江西省', '360000', '抚州市', '361000', '资溪县', '361028');
INSERT INTO `tb_administrative_division` VALUES (672, '江西省', '360000', '抚州市', '361000', '金溪县', '361027');
INSERT INTO `tb_administrative_division` VALUES (673, '江西省', '360000', '抚州市', '361000', '东乡县', '361029');
INSERT INTO `tb_administrative_division` VALUES (674, '江西省', '360000', '抚州市', '361000', '南城县', '361021');
INSERT INTO `tb_administrative_division` VALUES (675, '江西省', '360000', '抚州市', '361000', '南丰县', '361023');
INSERT INTO `tb_administrative_division` VALUES (676, '江西省', '360000', '抚州市', '361000', '宜黄县', '361026');
INSERT INTO `tb_administrative_division` VALUES (677, '江西省', '360000', '宜春市', '360900', '上高县', '360923');
INSERT INTO `tb_administrative_division` VALUES (678, '江西省', '360000', '宜春市', '360900', '万载县', '360922');
INSERT INTO `tb_administrative_division` VALUES (679, '江西省', '360000', '宜春市', '360900', '袁州区', '360902');
INSERT INTO `tb_administrative_division` VALUES (680, '江西省', '360000', '宜春市', '360900', '靖安县', '360925');
INSERT INTO `tb_administrative_division` VALUES (681, '江西省', '360000', '宜春市', '360900', '奉新县', '360921');
INSERT INTO `tb_administrative_division` VALUES (682, '江西省', '360000', '宜春市', '360900', '丰城市', '360981');
INSERT INTO `tb_administrative_division` VALUES (683, '江西省', '360000', '宜春市', '360900', '樟树市', '360982');
INSERT INTO `tb_administrative_division` VALUES (684, '江西省', '360000', '宜春市', '360900', '宜丰县', '360924');
INSERT INTO `tb_administrative_division` VALUES (685, '江西省', '360000', '宜春市', '360900', '高安市', '360983');
INSERT INTO `tb_administrative_division` VALUES (686, '江西省', '360000', '宜春市', '360900', '铜鼓县', '360926');
INSERT INTO `tb_administrative_division` VALUES (687, '江西省', '360000', '景德镇市', '360200', '昌江区', '360202');
INSERT INTO `tb_administrative_division` VALUES (688, '江西省', '360000', '景德镇市', '360200', '浮梁县', '360222');
INSERT INTO `tb_administrative_division` VALUES (689, '江西省', '360000', '景德镇市', '360200', '乐平市', '360281');
INSERT INTO `tb_administrative_division` VALUES (690, '江西省', '360000', '景德镇市', '360200', '珠山区', '360203');
INSERT INTO `tb_administrative_division` VALUES (691, '江西省', '360000', '新余市', '360500', '分宜县', '360521');
INSERT INTO `tb_administrative_division` VALUES (692, '江西省', '360000', '新余市', '360500', '渝水区', '360502');
INSERT INTO `tb_administrative_division` VALUES (693, '江西省', '360000', '上饶市', '361100', '信州区', '361102');
INSERT INTO `tb_administrative_division` VALUES (694, '江西省', '360000', '上饶市', '361100', '广丰县', '361122');
INSERT INTO `tb_administrative_division` VALUES (695, '江西省', '360000', '上饶市', '361100', '横峰县', '361125');
INSERT INTO `tb_administrative_division` VALUES (696, '江西省', '360000', '上饶市', '361100', '万年县', '361129');
INSERT INTO `tb_administrative_division` VALUES (697, '江西省', '360000', '上饶市', '361100', '余干县', '361127');
INSERT INTO `tb_administrative_division` VALUES (698, '江西省', '360000', '上饶市', '361100', '上饶县', '361121');
INSERT INTO `tb_administrative_division` VALUES (699, '江西省', '360000', '上饶市', '361100', '玉山县', '361123');
INSERT INTO `tb_administrative_division` VALUES (700, '江西省', '360000', '上饶市', '361100', '婺源县', '361130');
INSERT INTO `tb_administrative_division` VALUES (701, '江西省', '360000', '上饶市', '361100', '鄱阳县', '361128');
INSERT INTO `tb_administrative_division` VALUES (702, '江西省', '360000', '上饶市', '361100', '铅山县', '361124');
INSERT INTO `tb_administrative_division` VALUES (703, '江西省', '360000', '上饶市', '361100', '弋阳县', '361126');
INSERT INTO `tb_administrative_division` VALUES (704, '江西省', '360000', '上饶市', '361100', '德兴市', '361181');
INSERT INTO `tb_administrative_division` VALUES (705, '江西省', '360000', '赣州市', '360700', '寻乌县', '360734');
INSERT INTO `tb_administrative_division` VALUES (706, '江西省', '360000', '赣州市', '360700', '龙南县', '360727');
INSERT INTO `tb_administrative_division` VALUES (707, '江西省', '360000', '赣州市', '360700', '于都县', '360731');
INSERT INTO `tb_administrative_division` VALUES (708, '江西省', '360000', '赣州市', '360700', '大余县', '360723');
INSERT INTO `tb_administrative_division` VALUES (709, '江西省', '360000', '赣州市', '360700', '南康市', '360782');
INSERT INTO `tb_administrative_division` VALUES (710, '江西省', '360000', '赣州市', '360700', '赣县', '360721');
INSERT INTO `tb_administrative_division` VALUES (711, '江西省', '360000', '赣州市', '360700', '章贡区', '360702');
INSERT INTO `tb_administrative_division` VALUES (712, '江西省', '360000', '赣州市', '360700', '宁都县', '360730');
INSERT INTO `tb_administrative_division` VALUES (713, '江西省', '360000', '赣州市', '360700', '定南县', '360728');
INSERT INTO `tb_administrative_division` VALUES (714, '江西省', '360000', '赣州市', '360700', '兴国县', '360732');
INSERT INTO `tb_administrative_division` VALUES (715, '江西省', '360000', '赣州市', '360700', '瑞金市', '360781');
INSERT INTO `tb_administrative_division` VALUES (716, '江西省', '360000', '赣州市', '360700', '信丰县', '360722');
INSERT INTO `tb_administrative_division` VALUES (717, '江西省', '360000', '赣州市', '360700', '上犹县', '360724');
INSERT INTO `tb_administrative_division` VALUES (718, '江西省', '360000', '赣州市', '360700', '石城县', '360735');
INSERT INTO `tb_administrative_division` VALUES (719, '江西省', '360000', '赣州市', '360700', '全南县', '360729');
INSERT INTO `tb_administrative_division` VALUES (720, '江西省', '360000', '赣州市', '360700', '会昌县', '360733');
INSERT INTO `tb_administrative_division` VALUES (721, '江西省', '360000', '赣州市', '360700', '崇义县', '360725');
INSERT INTO `tb_administrative_division` VALUES (722, '江西省', '360000', '赣州市', '360700', '安远县', '360726');
INSERT INTO `tb_administrative_division` VALUES (723, '江西省', '360000', '赣州市', '360700', '赣县区', '360704');
INSERT INTO `tb_administrative_division` VALUES (724, '江西省', '360000', '吉安市', '360800', '新干县', '360824');
INSERT INTO `tb_administrative_division` VALUES (725, '江西省', '360000', '吉安市', '360800', '万安县', '360828');
INSERT INTO `tb_administrative_division` VALUES (726, '江西省', '360000', '吉安市', '360800', '青原区', '360803');
INSERT INTO `tb_administrative_division` VALUES (727, '江西省', '360000', '吉安市', '360800', '吉水县', '360822');
INSERT INTO `tb_administrative_division` VALUES (728, '江西省', '360000', '吉安市', '360800', '吉州区', '360802');
INSERT INTO `tb_administrative_division` VALUES (729, '江西省', '360000', '吉安市', '360800', '峡江县', '360823');
INSERT INTO `tb_administrative_division` VALUES (730, '江西省', '360000', '吉安市', '360800', '吉安县', '360821');
INSERT INTO `tb_administrative_division` VALUES (731, '江西省', '360000', '吉安市', '360800', '井冈山市', '360881');
INSERT INTO `tb_administrative_division` VALUES (732, '江西省', '360000', '吉安市', '360800', '永丰县', '360825');
INSERT INTO `tb_administrative_division` VALUES (733, '江西省', '360000', '吉安市', '360800', '安福县', '360829');
INSERT INTO `tb_administrative_division` VALUES (734, '江西省', '360000', '吉安市', '360800', '遂川县', '360827');
INSERT INTO `tb_administrative_division` VALUES (735, '江西省', '360000', '吉安市', '360800', '永新县', '360830');
INSERT INTO `tb_administrative_division` VALUES (736, '江西省', '360000', '吉安市', '360800', '泰和县', '360826');
INSERT INTO `tb_administrative_division` VALUES (737, '江苏省', '320000', '南京市', '320100', '溧水县', '320124');
INSERT INTO `tb_administrative_division` VALUES (738, '江苏省', '320000', '南京市', '320100', '六合区', '320116');
INSERT INTO `tb_administrative_division` VALUES (739, '江苏省', '320000', '南京市', '320100', '下关区', '320107');
INSERT INTO `tb_administrative_division` VALUES (740, '江苏省', '320000', '南京市', '320100', '建邺区', '320105');
INSERT INTO `tb_administrative_division` VALUES (741, '江苏省', '320000', '南京市', '320100', '江宁区', '320115');
INSERT INTO `tb_administrative_division` VALUES (742, '江苏省', '320000', '南京市', '320100', '雨花台区', '320114');
INSERT INTO `tb_administrative_division` VALUES (743, '江苏省', '320000', '南京市', '320100', '白下区', '320103');
INSERT INTO `tb_administrative_division` VALUES (744, '江苏省', '320000', '南京市', '320100', '玄武区', '320102');
INSERT INTO `tb_administrative_division` VALUES (745, '江苏省', '320000', '南京市', '320100', '浦口区', '320111');
INSERT INTO `tb_administrative_division` VALUES (746, '江苏省', '320000', '南京市', '320100', '秦淮区', '320104');
INSERT INTO `tb_administrative_division` VALUES (747, '江苏省', '320000', '南京市', '320100', '栖霞区', '320113');
INSERT INTO `tb_administrative_division` VALUES (748, '江苏省', '320000', '南京市', '320100', '高淳县', '320125');
INSERT INTO `tb_administrative_division` VALUES (749, '江苏省', '320000', '南京市', '320100', '鼓楼区', '320106');
INSERT INTO `tb_administrative_division` VALUES (750, '江苏省', '320000', '盐城市', '320900', '滨海县', '320922');
INSERT INTO `tb_administrative_division` VALUES (751, '江苏省', '320000', '盐城市', '320900', '阜宁县', '320923');
INSERT INTO `tb_administrative_division` VALUES (752, '江苏省', '320000', '盐城市', '320900', '大丰市', '320982');
INSERT INTO `tb_administrative_division` VALUES (753, '江苏省', '320000', '盐城市', '320900', '盐都区', '320903');
INSERT INTO `tb_administrative_division` VALUES (754, '江苏省', '320000', '盐城市', '320900', '射阳县', '320924');
INSERT INTO `tb_administrative_division` VALUES (755, '江苏省', '320000', '盐城市', '320900', '东台市', '320981');
INSERT INTO `tb_administrative_division` VALUES (756, '江苏省', '320000', '盐城市', '320900', '建湖县', '320925');
INSERT INTO `tb_administrative_division` VALUES (757, '江苏省', '320000', '盐城市', '320900', '亭湖区', '320902');
INSERT INTO `tb_administrative_division` VALUES (758, '江苏省', '320000', '盐城市', '320900', '响水县', '320921');
INSERT INTO `tb_administrative_division` VALUES (759, '江苏省', '320000', '扬州市', '321000', '仪征市', '321081');
INSERT INTO `tb_administrative_division` VALUES (760, '江苏省', '320000', '扬州市', '321000', '邗江区', '321003');
INSERT INTO `tb_administrative_division` VALUES (761, '江苏省', '320000', '扬州市', '321000', '高邮市', '321084');
INSERT INTO `tb_administrative_division` VALUES (762, '江苏省', '320000', '扬州市', '321000', '宝应县', '321023');
INSERT INTO `tb_administrative_division` VALUES (763, '江苏省', '320000', '扬州市', '321000', '广陵区', '321002');
INSERT INTO `tb_administrative_division` VALUES (764, '江苏省', '320000', '扬州市', '321000', '江都区', '321088');
INSERT INTO `tb_administrative_division` VALUES (765, '江苏省', '320000', '泰州市', '321200', '兴化市', '321281');
INSERT INTO `tb_administrative_division` VALUES (766, '江苏省', '320000', '泰州市', '321200', '高港区', '321203');
INSERT INTO `tb_administrative_division` VALUES (767, '江苏省', '320000', '泰州市', '321200', '泰兴市', '321283');
INSERT INTO `tb_administrative_division` VALUES (768, '江苏省', '320000', '泰州市', '321200', '靖江市', '321282');
INSERT INTO `tb_administrative_division` VALUES (769, '江苏省', '320000', '泰州市', '321200', '海陵区', '321202');
INSERT INTO `tb_administrative_division` VALUES (770, '江苏省', '320000', '泰州市', '321200', '姜堰市', '321284');
INSERT INTO `tb_administrative_division` VALUES (771, '江苏省', '320000', '无锡市', '320200', '宜兴市', '320282');
INSERT INTO `tb_administrative_division` VALUES (772, '江苏省', '320000', '无锡市', '320200', '北塘区', '320204');
INSERT INTO `tb_administrative_division` VALUES (773, '江苏省', '320000', '无锡市', '320200', '崇安区', '320202');
INSERT INTO `tb_administrative_division` VALUES (774, '江苏省', '320000', '无锡市', '320200', '江阴市', '320281');
INSERT INTO `tb_administrative_division` VALUES (775, '江苏省', '320000', '无锡市', '320200', '南长区', '320203');
INSERT INTO `tb_administrative_division` VALUES (776, '江苏省', '320000', '无锡市', '320200', '惠山区', '320206');
INSERT INTO `tb_administrative_division` VALUES (777, '江苏省', '320000', '无锡市', '320200', '滨湖区', '320211');
INSERT INTO `tb_administrative_division` VALUES (778, '江苏省', '320000', '无锡市', '320200', '锡山区', '320205');
INSERT INTO `tb_administrative_division` VALUES (779, '江苏省', '320000', '无锡市', '320200', '新吴区', '320214');
INSERT INTO `tb_administrative_division` VALUES (780, '江苏省', '320000', '无锡市', '320200', '梁溪区', '320213');
INSERT INTO `tb_administrative_division` VALUES (781, '江苏省', '320000', '常州市', '320400', '金坛市', '320482');
INSERT INTO `tb_administrative_division` VALUES (782, '江苏省', '320000', '常州市', '320400', '溧阳市', '320481');
INSERT INTO `tb_administrative_division` VALUES (783, '江苏省', '320000', '常州市', '320400', '戚墅堰区', '320405');
INSERT INTO `tb_administrative_division` VALUES (784, '江苏省', '320000', '常州市', '320400', '天宁区', '320402');
INSERT INTO `tb_administrative_division` VALUES (785, '江苏省', '320000', '常州市', '320400', '钟楼区', '320404');
INSERT INTO `tb_administrative_division` VALUES (786, '江苏省', '320000', '常州市', '320400', '新北区', '320411');
INSERT INTO `tb_administrative_division` VALUES (787, '江苏省', '320000', '常州市', '320400', '武进区', '320412');
INSERT INTO `tb_administrative_division` VALUES (788, '江苏省', '320000', '苏州市', '320500', '沧浪区', '320502');
INSERT INTO `tb_administrative_division` VALUES (789, '江苏省', '320000', '苏州市', '320500', '平江区', '320503');
INSERT INTO `tb_administrative_division` VALUES (790, '江苏省', '320000', '苏州市', '320500', '太仓市', '320585');
INSERT INTO `tb_administrative_division` VALUES (791, '江苏省', '320000', '苏州市', '320500', '相城区', '320507');
INSERT INTO `tb_administrative_division` VALUES (792, '江苏省', '320000', '苏州市', '320500', '昆山市', '320583');
INSERT INTO `tb_administrative_division` VALUES (793, '江苏省', '320000', '苏州市', '320500', '吴中区', '320506');
INSERT INTO `tb_administrative_division` VALUES (794, '江苏省', '320000', '苏州市', '320500', '虎丘区', '320505');
INSERT INTO `tb_administrative_division` VALUES (795, '江苏省', '320000', '苏州市', '320500', '常熟市', '320581');
INSERT INTO `tb_administrative_division` VALUES (796, '江苏省', '320000', '苏州市', '320500', '吴江市', '320584');
INSERT INTO `tb_administrative_division` VALUES (797, '江苏省', '320000', '苏州市', '320500', '金阊区', '320504');
INSERT INTO `tb_administrative_division` VALUES (798, '江苏省', '320000', '苏州市', '320500', '张家港市', '320582');
INSERT INTO `tb_administrative_division` VALUES (799, '江苏省', '320000', '苏州市', '320500', '姑苏区', '320508');
INSERT INTO `tb_administrative_division` VALUES (800, '江苏省', '320000', '徐州市', '320300', '云龙区', '320303');
INSERT INTO `tb_administrative_division` VALUES (801, '江苏省', '320000', '徐州市', '320300', '贾汪区', '320305');
INSERT INTO `tb_administrative_division` VALUES (802, '江苏省', '320000', '徐州市', '320300', '沛县', '320322');
INSERT INTO `tb_administrative_division` VALUES (803, '江苏省', '320000', '徐州市', '320300', '睢宁县', '320324');
INSERT INTO `tb_administrative_division` VALUES (804, '江苏省', '320000', '徐州市', '320300', '泉山区', '320311');
INSERT INTO `tb_administrative_division` VALUES (805, '江苏省', '320000', '徐州市', '320300', '丰县', '320321');
INSERT INTO `tb_administrative_division` VALUES (806, '江苏省', '320000', '徐州市', '320300', '新沂市', '320381');
INSERT INTO `tb_administrative_division` VALUES (807, '江苏省', '320000', '徐州市', '320300', '鼓楼区', '320302');
INSERT INTO `tb_administrative_division` VALUES (808, '江苏省', '320000', '徐州市', '320300', '邳州市', '320382');
INSERT INTO `tb_administrative_division` VALUES (809, '江苏省', '320000', '徐州市', '320300', '铜山区', '320323');
INSERT INTO `tb_administrative_division` VALUES (810, '江苏省', '320000', '宿迁市', '321300', '宿城区', '321302');
INSERT INTO `tb_administrative_division` VALUES (811, '江苏省', '320000', '宿迁市', '321300', '泗阳县', '321323');
INSERT INTO `tb_administrative_division` VALUES (812, '江苏省', '320000', '宿迁市', '321300', '宿豫区', '321311');
INSERT INTO `tb_administrative_division` VALUES (813, '江苏省', '320000', '宿迁市', '321300', '沭阳县', '321322');
INSERT INTO `tb_administrative_division` VALUES (814, '江苏省', '320000', '宿迁市', '321300', '泗洪县', '321324');
INSERT INTO `tb_administrative_division` VALUES (815, '江苏省', '320000', '南通市', '320600', '海门市', '320684');
INSERT INTO `tb_administrative_division` VALUES (816, '江苏省', '320000', '南通市', '320600', '崇川区', '320602');
INSERT INTO `tb_administrative_division` VALUES (817, '江苏省', '320000', '南通市', '320600', '如东县', '320623');
INSERT INTO `tb_administrative_division` VALUES (818, '江苏省', '320000', '南通市', '320600', '海安县', '320621');
INSERT INTO `tb_administrative_division` VALUES (819, '江苏省', '320000', '南通市', '320600', '如皋市', '320682');
INSERT INTO `tb_administrative_division` VALUES (820, '江苏省', '320000', '南通市', '320600', '港闸区', '320611');
INSERT INTO `tb_administrative_division` VALUES (821, '江苏省', '320000', '南通市', '320600', '启东市', '320681');
INSERT INTO `tb_administrative_division` VALUES (822, '江苏省', '320000', '南通市', '320600', '通州区', '320683');
INSERT INTO `tb_administrative_division` VALUES (823, '江苏省', '320000', '淮安市', '320800', '洪泽县', '320829');
INSERT INTO `tb_administrative_division` VALUES (824, '江苏省', '320000', '淮安市', '320800', '金湖县', '320831');
INSERT INTO `tb_administrative_division` VALUES (825, '江苏省', '320000', '淮安市', '320800', '淮阴区', '320804');
INSERT INTO `tb_administrative_division` VALUES (826, '江苏省', '320000', '淮安市', '320800', '清河区', '320802');
INSERT INTO `tb_administrative_division` VALUES (827, '江苏省', '320000', '淮安市', '320800', '盱眙县', '320830');
INSERT INTO `tb_administrative_division` VALUES (828, '江苏省', '320000', '淮安市', '320800', '清浦区', '320811');
INSERT INTO `tb_administrative_division` VALUES (829, '江苏省', '320000', '淮安市', '320800', '淮安区', '320803');
INSERT INTO `tb_administrative_division` VALUES (830, '江苏省', '320000', '淮安市', '320800', '涟水县', '320826');
INSERT INTO `tb_administrative_division` VALUES (831, '江苏省', '320000', '淮安市', '320800', '清江浦区', '320812');
INSERT INTO `tb_administrative_division` VALUES (832, '江苏省', '320000', '镇江市', '321100', '句容市', '321183');
INSERT INTO `tb_administrative_division` VALUES (833, '江苏省', '320000', '镇江市', '321100', '扬中市', '321182');
INSERT INTO `tb_administrative_division` VALUES (834, '江苏省', '320000', '镇江市', '321100', '丹阳市', '321181');
INSERT INTO `tb_administrative_division` VALUES (835, '江苏省', '320000', '镇江市', '321100', '丹徒区', '321112');
INSERT INTO `tb_administrative_division` VALUES (836, '江苏省', '320000', '镇江市', '321100', '京口区', '321102');
INSERT INTO `tb_administrative_division` VALUES (837, '江苏省', '320000', '镇江市', '321100', '润州区', '321111');
INSERT INTO `tb_administrative_division` VALUES (838, '江苏省', '320000', '连云港市', '320700', '海州区', '320706');
INSERT INTO `tb_administrative_division` VALUES (839, '江苏省', '320000', '连云港市', '320700', '赣榆县', '320721');
INSERT INTO `tb_administrative_division` VALUES (840, '江苏省', '320000', '连云港市', '320700', '新浦区', '320705');
INSERT INTO `tb_administrative_division` VALUES (841, '江苏省', '320000', '连云港市', '320700', '东海县', '320722');
INSERT INTO `tb_administrative_division` VALUES (842, '江苏省', '320000', '连云港市', '320700', '灌南县', '320724');
INSERT INTO `tb_administrative_division` VALUES (843, '江苏省', '320000', '连云港市', '320700', '连云区', '320703');
INSERT INTO `tb_administrative_division` VALUES (844, '江苏省', '320000', '连云港市', '320700', '灌云县', '320723');
INSERT INTO `tb_administrative_division` VALUES (845, '山东省', '370000', '济南市', '370100', '市中区', '370103');
INSERT INTO `tb_administrative_division` VALUES (846, '山东省', '370000', '济南市', '370100', '平阴县', '370124');
INSERT INTO `tb_administrative_division` VALUES (847, '山东省', '370000', '济南市', '370100', '天桥区', '370105');
INSERT INTO `tb_administrative_division` VALUES (848, '山东省', '370000', '济南市', '370100', '章丘市', '370181');
INSERT INTO `tb_administrative_division` VALUES (849, '山东省', '370000', '济南市', '370100', '历城区', '370112');
INSERT INTO `tb_administrative_division` VALUES (850, '山东省', '370000', '济南市', '370100', '槐荫区', '370104');
INSERT INTO `tb_administrative_division` VALUES (851, '山东省', '370000', '济南市', '370100', '历下区', '370102');
INSERT INTO `tb_administrative_division` VALUES (852, '山东省', '370000', '济南市', '370100', '长清区', '370113');
INSERT INTO `tb_administrative_division` VALUES (853, '山东省', '370000', '济南市', '370100', '商河县', '370126');
INSERT INTO `tb_administrative_division` VALUES (854, '山东省', '370000', '济南市', '370100', '济阳县', '370125');
INSERT INTO `tb_administrative_division` VALUES (855, '山东省', '370000', '烟台市', '370600', '牟平区', '370612');
INSERT INTO `tb_administrative_division` VALUES (856, '山东省', '370000', '烟台市', '370600', '龙口市', '370681');
INSERT INTO `tb_administrative_division` VALUES (857, '山东省', '370000', '烟台市', '370600', '栖霞市', '370686');
INSERT INTO `tb_administrative_division` VALUES (858, '山东省', '370000', '烟台市', '370600', '福山区', '370611');
INSERT INTO `tb_administrative_division` VALUES (859, '山东省', '370000', '烟台市', '370600', '海阳市', '370687');
INSERT INTO `tb_administrative_division` VALUES (860, '山东省', '370000', '烟台市', '370600', '长岛县', '370634');
INSERT INTO `tb_administrative_division` VALUES (861, '山东省', '370000', '烟台市', '370600', '开发区', '370614');
INSERT INTO `tb_administrative_division` VALUES (862, '山东省', '370000', '烟台市', '370600', '莱阳市', '370682');
INSERT INTO `tb_administrative_division` VALUES (863, '山东省', '370000', '烟台市', '370600', '芝罘区', '370602');
INSERT INTO `tb_administrative_division` VALUES (864, '山东省', '370000', '烟台市', '370600', '蓬莱市', '370684');
INSERT INTO `tb_administrative_division` VALUES (865, '山东省', '370000', '烟台市', '370600', '莱山区', '370613');
INSERT INTO `tb_administrative_division` VALUES (866, '山东省', '370000', '烟台市', '370600', '莱州市', '370683');
INSERT INTO `tb_administrative_division` VALUES (867, '山东省', '370000', '烟台市', '370600', '招远市', '370685');
INSERT INTO `tb_administrative_division` VALUES (868, '山东省', '370000', '东营市', '370500', '广饶县', '370523');
INSERT INTO `tb_administrative_division` VALUES (869, '山东省', '370000', '东营市', '370500', '利津县', '370522');
INSERT INTO `tb_administrative_division` VALUES (870, '山东省', '370000', '东营市', '370500', '河口区', '370503');
INSERT INTO `tb_administrative_division` VALUES (871, '山东省', '370000', '东营市', '370500', '东营区', '370502');
INSERT INTO `tb_administrative_division` VALUES (872, '山东省', '370000', '东营市', '370500', '垦利县', '370521');
INSERT INTO `tb_administrative_division` VALUES (873, '山东省', '370000', '济宁市', '370800', '嘉祥县', '370829');
INSERT INTO `tb_administrative_division` VALUES (874, '山东省', '370000', '济宁市', '370800', '泗水县', '370831');
INSERT INTO `tb_administrative_division` VALUES (875, '山东省', '370000', '济宁市', '370800', '任城区', '370811');
INSERT INTO `tb_administrative_division` VALUES (876, '山东省', '370000', '济宁市', '370800', '汶上县', '370830');
INSERT INTO `tb_administrative_division` VALUES (877, '山东省', '370000', '济宁市', '370800', '市中区', '370802');
INSERT INTO `tb_administrative_division` VALUES (878, '山东省', '370000', '济宁市', '370800', '兖州市', '370882');
INSERT INTO `tb_administrative_division` VALUES (879, '山东省', '370000', '济宁市', '370800', '鱼台县', '370827');
INSERT INTO `tb_administrative_division` VALUES (880, '山东省', '370000', '济宁市', '370800', '梁山县', '370832');
INSERT INTO `tb_administrative_division` VALUES (881, '山东省', '370000', '济宁市', '370800', '曲阜市', '370881');
INSERT INTO `tb_administrative_division` VALUES (882, '山东省', '370000', '济宁市', '370800', '邹城市', '370883');
INSERT INTO `tb_administrative_division` VALUES (883, '山东省', '370000', '济宁市', '370800', '金乡县', '370828');
INSERT INTO `tb_administrative_division` VALUES (884, '山东省', '370000', '济宁市', '370800', '微山县', '370826');
INSERT INTO `tb_administrative_division` VALUES (885, '山东省', '370000', '日照市', '371100', '五莲县', '371121');
INSERT INTO `tb_administrative_division` VALUES (886, '山东省', '370000', '日照市', '371100', '东港区', '371102');
INSERT INTO `tb_administrative_division` VALUES (887, '山东省', '370000', '日照市', '371100', '莒县', '371122');
INSERT INTO `tb_administrative_division` VALUES (888, '山东省', '370000', '日照市', '371100', '岚山区', '371103');
INSERT INTO `tb_administrative_division` VALUES (889, '山东省', '370000', '青岛市', '370200', '胶南市', '370284');
INSERT INTO `tb_administrative_division` VALUES (890, '山东省', '370000', '青岛市', '370200', '即墨市', '370282');
INSERT INTO `tb_administrative_division` VALUES (891, '山东省', '370000', '青岛市', '370200', '崂山区', '370212');
INSERT INTO `tb_administrative_division` VALUES (892, '山东省', '370000', '青岛市', '370200', '市南区', '370202');
INSERT INTO `tb_administrative_division` VALUES (893, '山东省', '370000', '青岛市', '370200', '市北区', '370203');
INSERT INTO `tb_administrative_division` VALUES (894, '山东省', '370000', '青岛市', '370200', '城阳区', '370214');
INSERT INTO `tb_administrative_division` VALUES (895, '山东省', '370000', '青岛市', '370200', '黄岛区', '370211');
INSERT INTO `tb_administrative_division` VALUES (896, '山东省', '370000', '青岛市', '370200', '李沧区', '370213');
INSERT INTO `tb_administrative_division` VALUES (897, '山东省', '370000', '青岛市', '370200', '莱西市', '370285');
INSERT INTO `tb_administrative_division` VALUES (898, '山东省', '370000', '青岛市', '370200', '平度市', '370283');
INSERT INTO `tb_administrative_division` VALUES (899, '山东省', '370000', '青岛市', '370200', '四方区', '370205');
INSERT INTO `tb_administrative_division` VALUES (900, '山东省', '370000', '青岛市', '370200', '胶州市', '370281');
INSERT INTO `tb_administrative_division` VALUES (901, '山东省', '370000', '临沂市', '371300', '莒南县', '371327');
INSERT INTO `tb_administrative_division` VALUES (902, '山东省', '370000', '临沂市', '371300', '河东区', '371312');
INSERT INTO `tb_administrative_division` VALUES (903, '山东省', '370000', '临沂市', '371300', '费县', '371325');
INSERT INTO `tb_administrative_division` VALUES (904, '山东省', '370000', '临沂市', '371300', '苍山县', '371324');
INSERT INTO `tb_administrative_division` VALUES (905, '山东省', '370000', '临沂市', '371300', '郯城县', '371322');
INSERT INTO `tb_administrative_division` VALUES (906, '山东省', '370000', '临沂市', '371300', '沂南县', '371321');
INSERT INTO `tb_administrative_division` VALUES (907, '山东省', '370000', '临沂市', '371300', '沂水县', '371323');
INSERT INTO `tb_administrative_division` VALUES (908, '山东省', '370000', '临沂市', '371300', '兰山区', '371302');
INSERT INTO `tb_administrative_division` VALUES (909, '山东省', '370000', '临沂市', '371300', '蒙阴县', '371328');
INSERT INTO `tb_administrative_division` VALUES (910, '山东省', '370000', '临沂市', '371300', '罗庄区', '371311');
INSERT INTO `tb_administrative_division` VALUES (911, '山东省', '370000', '临沂市', '371300', '临沭县', '371329');
INSERT INTO `tb_administrative_division` VALUES (912, '山东省', '370000', '临沂市', '371300', '平邑县', '371326');
INSERT INTO `tb_administrative_division` VALUES (913, '山东省', '370000', '莱芜市', '371200', '钢城区', '371203');
INSERT INTO `tb_administrative_division` VALUES (914, '山东省', '370000', '莱芜市', '371200', '莱城区', '371202');
INSERT INTO `tb_administrative_division` VALUES (915, '山东省', '370000', '淄博市', '370300', '桓台县', '370321');
INSERT INTO `tb_administrative_division` VALUES (916, '山东省', '370000', '淄博市', '370300', '淄川区', '370302');
INSERT INTO `tb_administrative_division` VALUES (917, '山东省', '370000', '淄博市', '370300', '张店区', '370303');
INSERT INTO `tb_administrative_division` VALUES (918, '山东省', '370000', '淄博市', '370300', '高青县', '370322');
INSERT INTO `tb_administrative_division` VALUES (919, '山东省', '370000', '淄博市', '370300', '临淄区', '370305');
INSERT INTO `tb_administrative_division` VALUES (920, '山东省', '370000', '淄博市', '370300', '沂源县', '370323');
INSERT INTO `tb_administrative_division` VALUES (921, '山东省', '370000', '淄博市', '370300', '博山区', '370304');
INSERT INTO `tb_administrative_division` VALUES (922, '山东省', '370000', '淄博市', '370300', '周村区', '370306');
INSERT INTO `tb_administrative_division` VALUES (923, '山东省', '370000', '泰安市', '370900', '宁阳县', '370921');
INSERT INTO `tb_administrative_division` VALUES (924, '山东省', '370000', '泰安市', '370900', '新泰市', '370982');
INSERT INTO `tb_administrative_division` VALUES (925, '山东省', '370000', '泰安市', '370900', '泰山区', '370902');
INSERT INTO `tb_administrative_division` VALUES (926, '山东省', '370000', '泰安市', '370900', '岱岳区', '370903');
INSERT INTO `tb_administrative_division` VALUES (927, '山东省', '370000', '泰安市', '370900', '肥城市', '370983');
INSERT INTO `tb_administrative_division` VALUES (928, '山东省', '370000', '泰安市', '370900', '东平县', '370923');
INSERT INTO `tb_administrative_division` VALUES (929, '山东省', '370000', '滨州市', '371600', '博兴县', '371625');
INSERT INTO `tb_administrative_division` VALUES (930, '山东省', '370000', '滨州市', '371600', '无棣县', '371623');
INSERT INTO `tb_administrative_division` VALUES (931, '山东省', '370000', '滨州市', '371600', '滨城区', '371602');
INSERT INTO `tb_administrative_division` VALUES (932, '山东省', '370000', '滨州市', '371600', '阳信县', '371622');
INSERT INTO `tb_administrative_division` VALUES (933, '山东省', '370000', '滨州市', '371600', '惠民县', '371621');
INSERT INTO `tb_administrative_division` VALUES (934, '山东省', '370000', '滨州市', '371600', '沾化区', '371624');
INSERT INTO `tb_administrative_division` VALUES (935, '山东省', '370000', '滨州市', '371600', '邹平县', '371626');
INSERT INTO `tb_administrative_division` VALUES (936, '山东省', '370000', '德州市', '371400', '陵县', '371421');
INSERT INTO `tb_administrative_division` VALUES (937, '山东省', '370000', '德州市', '371400', '乐陵市', '371481');
INSERT INTO `tb_administrative_division` VALUES (938, '山东省', '370000', '德州市', '371400', '宁津县', '371422');
INSERT INTO `tb_administrative_division` VALUES (939, '山东省', '370000', '德州市', '371400', '临邑县', '371424');
INSERT INTO `tb_administrative_division` VALUES (940, '山东省', '370000', '德州市', '371400', '夏津县', '371427');
INSERT INTO `tb_administrative_division` VALUES (941, '山东省', '370000', '德州市', '371400', '德城区', '371402');
INSERT INTO `tb_administrative_division` VALUES (942, '山东省', '370000', '德州市', '371400', '武城县', '371428');
INSERT INTO `tb_administrative_division` VALUES (943, '山东省', '370000', '德州市', '371400', '齐河县', '371425');
INSERT INTO `tb_administrative_division` VALUES (944, '山东省', '370000', '德州市', '371400', '禹城市', '371482');
INSERT INTO `tb_administrative_division` VALUES (945, '山东省', '370000', '德州市', '371400', '庆云县', '371423');
INSERT INTO `tb_administrative_division` VALUES (946, '山东省', '370000', '德州市', '371400', '平原县', '371426');
INSERT INTO `tb_administrative_division` VALUES (947, '山东省', '370000', '德州市', '371400', '陵城区', '371403');
INSERT INTO `tb_administrative_division` VALUES (948, '山东省', '370000', '菏泽市', '371700', '牡丹区', '371702');
INSERT INTO `tb_administrative_division` VALUES (949, '山东省', '370000', '菏泽市', '371700', '曹县', '371721');
INSERT INTO `tb_administrative_division` VALUES (950, '山东省', '370000', '菏泽市', '371700', '单县', '371722');
INSERT INTO `tb_administrative_division` VALUES (951, '山东省', '370000', '菏泽市', '371700', '东明县', '371728');
INSERT INTO `tb_administrative_division` VALUES (952, '山东省', '370000', '菏泽市', '371700', '成武县', '371723');
INSERT INTO `tb_administrative_division` VALUES (953, '山东省', '370000', '菏泽市', '371700', '定陶县', '371727');
INSERT INTO `tb_administrative_division` VALUES (954, '山东省', '370000', '菏泽市', '371700', '郓城县', '371725');
INSERT INTO `tb_administrative_division` VALUES (955, '山东省', '370000', '菏泽市', '371700', '巨野县', '371724');
INSERT INTO `tb_administrative_division` VALUES (956, '山东省', '370000', '菏泽市', '371700', '鄄城县', '371726');
INSERT INTO `tb_administrative_division` VALUES (957, '山东省', '370000', '聊城市', '371500', '阳谷县', '371521');
INSERT INTO `tb_administrative_division` VALUES (958, '山东省', '370000', '聊城市', '371500', '东阿县', '371524');
INSERT INTO `tb_administrative_division` VALUES (959, '山东省', '370000', '聊城市', '371500', '莘县', '371522');
INSERT INTO `tb_administrative_division` VALUES (960, '山东省', '370000', '聊城市', '371500', '茌平县', '371523');
INSERT INTO `tb_administrative_division` VALUES (961, '山东省', '370000', '聊城市', '371500', '冠县', '371525');
INSERT INTO `tb_administrative_division` VALUES (962, '山东省', '370000', '聊城市', '371500', '东昌府区', '371502');
INSERT INTO `tb_administrative_division` VALUES (963, '山东省', '370000', '聊城市', '371500', '临清市', '371581');
INSERT INTO `tb_administrative_division` VALUES (964, '山东省', '370000', '聊城市', '371500', '高唐县', '371526');
INSERT INTO `tb_administrative_division` VALUES (965, '山东省', '370000', '威海市', '371000', '文登市', '371081');
INSERT INTO `tb_administrative_division` VALUES (966, '山东省', '370000', '威海市', '371000', '乳山市', '371083');
INSERT INTO `tb_administrative_division` VALUES (967, '山东省', '370000', '威海市', '371000', '环翠区', '371002');
INSERT INTO `tb_administrative_division` VALUES (968, '山东省', '370000', '威海市', '371000', '荣成市', '371082');
INSERT INTO `tb_administrative_division` VALUES (969, '山东省', '370000', '潍坊市', '370700', '坊子区', '370704');
INSERT INTO `tb_administrative_division` VALUES (970, '山东省', '370000', '潍坊市', '370700', '奎文区', '370705');
INSERT INTO `tb_administrative_division` VALUES (971, '山东省', '370000', '潍坊市', '370700', '昌乐县', '370725');
INSERT INTO `tb_administrative_division` VALUES (972, '山东省', '370000', '潍坊市', '370700', '寿光市', '370783');
INSERT INTO `tb_administrative_division` VALUES (973, '山东省', '370000', '潍坊市', '370700', '安丘市', '370784');
INSERT INTO `tb_administrative_division` VALUES (974, '山东省', '370000', '潍坊市', '370700', '寒亭区', '370703');
INSERT INTO `tb_administrative_division` VALUES (975, '山东省', '370000', '潍坊市', '370700', '临朐县', '370724');
INSERT INTO `tb_administrative_division` VALUES (976, '山东省', '370000', '潍坊市', '370700', '高密市', '370785');
INSERT INTO `tb_administrative_division` VALUES (977, '山东省', '370000', '潍坊市', '370700', '昌邑市', '370786');
INSERT INTO `tb_administrative_division` VALUES (978, '山东省', '370000', '潍坊市', '370700', '诸城市', '370782');
INSERT INTO `tb_administrative_division` VALUES (979, '山东省', '370000', '潍坊市', '370700', '潍城区', '370702');
INSERT INTO `tb_administrative_division` VALUES (980, '山东省', '370000', '潍坊市', '370700', '青州市', '370781');
INSERT INTO `tb_administrative_division` VALUES (981, '山东省', '370000', '枣庄市', '370400', '市中区', '370402');
INSERT INTO `tb_administrative_division` VALUES (982, '山东省', '370000', '枣庄市', '370400', '台儿庄区', '370405');
INSERT INTO `tb_administrative_division` VALUES (983, '山东省', '370000', '枣庄市', '370400', '山亭区', '370406');
INSERT INTO `tb_administrative_division` VALUES (984, '山东省', '370000', '枣庄市', '370400', '峄城区', '370404');
INSERT INTO `tb_administrative_division` VALUES (985, '山东省', '370000', '枣庄市', '370400', '薛城区', '370403');
INSERT INTO `tb_administrative_division` VALUES (986, '山东省', '370000', '枣庄市', '370400', '滕州市', '370481');
INSERT INTO `tb_administrative_division` VALUES (987, '甘肃省', '620000', '白银市', '620400', '平川区', '620403');
INSERT INTO `tb_administrative_division` VALUES (988, '甘肃省', '620000', '白银市', '620400', '白银区', '620402');
INSERT INTO `tb_administrative_division` VALUES (989, '甘肃省', '620000', '白银市', '620400', '靖远县', '620421');
INSERT INTO `tb_administrative_division` VALUES (990, '甘肃省', '620000', '白银市', '620400', '景泰县', '620423');
INSERT INTO `tb_administrative_division` VALUES (991, '甘肃省', '620000', '白银市', '620400', '会宁县', '620422');
INSERT INTO `tb_administrative_division` VALUES (992, '甘肃省', '620000', '金昌市', '620300', '金川区', '620302');
INSERT INTO `tb_administrative_division` VALUES (993, '甘肃省', '620000', '金昌市', '620300', '永昌县', '620321');
INSERT INTO `tb_administrative_division` VALUES (994, '甘肃省', '620000', '定西市', '621100', '漳县', '621125');
INSERT INTO `tb_administrative_division` VALUES (995, '甘肃省', '620000', '定西市', '621100', '通渭县', '621121');
INSERT INTO `tb_administrative_division` VALUES (996, '甘肃省', '620000', '定西市', '621100', '临洮县', '621124');
INSERT INTO `tb_administrative_division` VALUES (997, '甘肃省', '620000', '定西市', '621100', '陇西县', '621122');
INSERT INTO `tb_administrative_division` VALUES (998, '甘肃省', '620000', '定西市', '621100', '渭源县', '621123');
INSERT INTO `tb_administrative_division` VALUES (999, '甘肃省', '620000', '定西市', '621100', '安定区', '621102');
INSERT INTO `tb_administrative_division` VALUES (1000, '甘肃省', '620000', '定西市', '621100', '岷县', '621126');
INSERT INTO `tb_administrative_division` VALUES (1001, '甘肃省', '620000', '庆阳市', '621000', '环县', '621022');
INSERT INTO `tb_administrative_division` VALUES (1002, '甘肃省', '620000', '庆阳市', '621000', '庆城县', '621021');
INSERT INTO `tb_administrative_division` VALUES (1003, '甘肃省', '620000', '庆阳市', '621000', '西峰区', '621002');
INSERT INTO `tb_administrative_division` VALUES (1004, '甘肃省', '620000', '庆阳市', '621000', '华池县', '621023');
INSERT INTO `tb_administrative_division` VALUES (1005, '甘肃省', '620000', '庆阳市', '621000', '合水县', '621024');
INSERT INTO `tb_administrative_division` VALUES (1006, '甘肃省', '620000', '庆阳市', '621000', '正宁县', '621025');
INSERT INTO `tb_administrative_division` VALUES (1007, '甘肃省', '620000', '庆阳市', '621000', '镇原县', '621027');
INSERT INTO `tb_administrative_division` VALUES (1008, '甘肃省', '620000', '庆阳市', '621000', '宁县', '621026');
INSERT INTO `tb_administrative_division` VALUES (1009, '甘肃省', '620000', '天水市', '620500', '清水县', '620521');
INSERT INTO `tb_administrative_division` VALUES (1010, '甘肃省', '620000', '天水市', '620500', '武山县', '620524');
INSERT INTO `tb_administrative_division` VALUES (1011, '甘肃省', '620000', '天水市', '620500', '秦安县', '620522');
INSERT INTO `tb_administrative_division` VALUES (1012, '甘肃省', '620000', '天水市', '620500', '甘谷县', '620523');
INSERT INTO `tb_administrative_division` VALUES (1013, '甘肃省', '620000', '天水市', '620500', '张家川回族自治县', '620525');
INSERT INTO `tb_administrative_division` VALUES (1014, '甘肃省', '620000', '天水市', '620500', '秦州区', '620502');
INSERT INTO `tb_administrative_division` VALUES (1015, '甘肃省', '620000', '天水市', '620500', '麦积区', '620503');
INSERT INTO `tb_administrative_division` VALUES (1016, '甘肃省', '620000', '酒泉市', '620900', '敦煌市', '620982');
INSERT INTO `tb_administrative_division` VALUES (1017, '甘肃省', '620000', '酒泉市', '620900', '肃北蒙古族自治县', '620923');
INSERT INTO `tb_administrative_division` VALUES (1018, '甘肃省', '620000', '酒泉市', '620900', '金塔县', '620921');
INSERT INTO `tb_administrative_division` VALUES (1019, '甘肃省', '620000', '酒泉市', '620900', '肃州区', '620902');
INSERT INTO `tb_administrative_division` VALUES (1020, '甘肃省', '620000', '酒泉市', '620900', '阿克塞哈萨克族自治县', '620924');
INSERT INTO `tb_administrative_division` VALUES (1021, '甘肃省', '620000', '酒泉市', '620900', '玉门市', '620981');
INSERT INTO `tb_administrative_division` VALUES (1022, '甘肃省', '620000', '酒泉市', '620900', '瓜州县', '620922');
INSERT INTO `tb_administrative_division` VALUES (1023, '甘肃省', '620000', '嘉峪关市', '620200', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (1024, '甘肃省', '620000', '平凉市', '620800', '灵台县', '620822');
INSERT INTO `tb_administrative_division` VALUES (1025, '甘肃省', '620000', '平凉市', '620800', '崇信县', '620823');
INSERT INTO `tb_administrative_division` VALUES (1026, '甘肃省', '620000', '平凉市', '620800', '华亭县', '620824');
INSERT INTO `tb_administrative_division` VALUES (1027, '甘肃省', '620000', '平凉市', '620800', '泾川县', '620821');
INSERT INTO `tb_administrative_division` VALUES (1028, '甘肃省', '620000', '平凉市', '620800', '静宁县', '620826');
INSERT INTO `tb_administrative_division` VALUES (1029, '甘肃省', '620000', '平凉市', '620800', '庄浪县', '620825');
INSERT INTO `tb_administrative_division` VALUES (1030, '甘肃省', '620000', '平凉市', '620800', '崆峒区', '620802');
INSERT INTO `tb_administrative_division` VALUES (1031, '甘肃省', '620000', '兰州市', '620100', '红古区', '620111');
INSERT INTO `tb_administrative_division` VALUES (1032, '甘肃省', '620000', '兰州市', '620100', '七里河区', '620103');
INSERT INTO `tb_administrative_division` VALUES (1033, '甘肃省', '620000', '兰州市', '620100', '皋兰县', '620122');
INSERT INTO `tb_administrative_division` VALUES (1034, '甘肃省', '620000', '兰州市', '620100', '安宁区', '620105');
INSERT INTO `tb_administrative_division` VALUES (1035, '甘肃省', '620000', '兰州市', '620100', '永登县', '620121');
INSERT INTO `tb_administrative_division` VALUES (1036, '甘肃省', '620000', '兰州市', '620100', '西固区', '620104');
INSERT INTO `tb_administrative_division` VALUES (1037, '甘肃省', '620000', '兰州市', '620100', '榆中县', '620123');
INSERT INTO `tb_administrative_division` VALUES (1038, '甘肃省', '620000', '兰州市', '620100', '城关区', '620102');
INSERT INTO `tb_administrative_division` VALUES (1039, '甘肃省', '620000', '张掖市', '620700', '肃南裕固族自治县', '620721');
INSERT INTO `tb_administrative_division` VALUES (1040, '甘肃省', '620000', '张掖市', '620700', '甘州区', '620702');
INSERT INTO `tb_administrative_division` VALUES (1041, '甘肃省', '620000', '张掖市', '620700', '山丹县', '620725');
INSERT INTO `tb_administrative_division` VALUES (1042, '甘肃省', '620000', '张掖市', '620700', '高台县', '620724');
INSERT INTO `tb_administrative_division` VALUES (1043, '甘肃省', '620000', '张掖市', '620700', '民乐县', '620722');
INSERT INTO `tb_administrative_division` VALUES (1044, '甘肃省', '620000', '张掖市', '620700', '临泽县', '620723');
INSERT INTO `tb_administrative_division` VALUES (1045, '甘肃省', '620000', '陇南市', '621200', '武都区', '621202');
INSERT INTO `tb_administrative_division` VALUES (1046, '甘肃省', '620000', '陇南市', '621200', '宕昌县', '621223');
INSERT INTO `tb_administrative_division` VALUES (1047, '甘肃省', '620000', '陇南市', '621200', '成县', '621221');
INSERT INTO `tb_administrative_division` VALUES (1048, '甘肃省', '620000', '陇南市', '621200', '康县', '621224');
INSERT INTO `tb_administrative_division` VALUES (1049, '甘肃省', '620000', '陇南市', '621200', '文县', '621222');
INSERT INTO `tb_administrative_division` VALUES (1050, '甘肃省', '620000', '陇南市', '621200', '西和县', '621225');
INSERT INTO `tb_administrative_division` VALUES (1051, '甘肃省', '620000', '陇南市', '621200', '两当县', '621228');
INSERT INTO `tb_administrative_division` VALUES (1052, '甘肃省', '620000', '陇南市', '621200', '徽县', '621227');
INSERT INTO `tb_administrative_division` VALUES (1053, '甘肃省', '620000', '陇南市', '621200', '礼县', '621226');
INSERT INTO `tb_administrative_division` VALUES (1054, '甘肃省', '620000', '临夏回族自治州', '622900', '临夏县', '622921');
INSERT INTO `tb_administrative_division` VALUES (1055, '甘肃省', '620000', '临夏回族自治州', '622900', '积石山保安族东乡族撒拉族自治县', '622927');
INSERT INTO `tb_administrative_division` VALUES (1056, '甘肃省', '620000', '临夏回族自治州', '622900', '和政县', '622925');
INSERT INTO `tb_administrative_division` VALUES (1057, '甘肃省', '620000', '临夏回族自治州', '622900', '永靖县', '622923');
INSERT INTO `tb_administrative_division` VALUES (1058, '甘肃省', '620000', '临夏回族自治州', '622900', '康乐县', '622922');
INSERT INTO `tb_administrative_division` VALUES (1059, '甘肃省', '620000', '临夏回族自治州', '622900', '临夏市', '622901');
INSERT INTO `tb_administrative_division` VALUES (1060, '甘肃省', '620000', '临夏回族自治州', '622900', '广河县', '622924');
INSERT INTO `tb_administrative_division` VALUES (1061, '甘肃省', '620000', '临夏回族自治州', '622900', '东乡族自治县', '622926');
INSERT INTO `tb_administrative_division` VALUES (1062, '甘肃省', '620000', '甘南藏族自治州', '623000', '迭部县', '623024');
INSERT INTO `tb_administrative_division` VALUES (1063, '甘肃省', '620000', '甘南藏族自治州', '623000', '合作市', '623001');
INSERT INTO `tb_administrative_division` VALUES (1064, '甘肃省', '620000', '甘南藏族自治州', '623000', '临潭县', '623021');
INSERT INTO `tb_administrative_division` VALUES (1065, '甘肃省', '620000', '甘南藏族自治州', '623000', '卓尼县', '623022');
INSERT INTO `tb_administrative_division` VALUES (1066, '甘肃省', '620000', '甘南藏族自治州', '623000', '舟曲县', '623023');
INSERT INTO `tb_administrative_division` VALUES (1067, '甘肃省', '620000', '甘南藏族自治州', '623000', '玛曲县', '623025');
INSERT INTO `tb_administrative_division` VALUES (1068, '甘肃省', '620000', '甘南藏族自治州', '623000', '夏河县', '623027');
INSERT INTO `tb_administrative_division` VALUES (1069, '甘肃省', '620000', '甘南藏族自治州', '623000', '碌曲县', '623026');
INSERT INTO `tb_administrative_division` VALUES (1070, '甘肃省', '620000', '武威市', '620600', '民勤县', '620621');
INSERT INTO `tb_administrative_division` VALUES (1071, '甘肃省', '620000', '武威市', '620600', '天祝藏族自治县', '620623');
INSERT INTO `tb_administrative_division` VALUES (1072, '甘肃省', '620000', '武威市', '620600', '凉州区', '620602');
INSERT INTO `tb_administrative_division` VALUES (1073, '甘肃省', '620000', '武威市', '620600', '古浪县', '620622');
INSERT INTO `tb_administrative_division` VALUES (1074, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '察布查尔锡伯自治县', '654022');
INSERT INTO `tb_administrative_division` VALUES (1075, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '新源县', '654025');
INSERT INTO `tb_administrative_division` VALUES (1076, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '巩留县', '654024');
INSERT INTO `tb_administrative_division` VALUES (1077, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '霍城县', '654023');
INSERT INTO `tb_administrative_division` VALUES (1078, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '特克斯县', '654027');
INSERT INTO `tb_administrative_division` VALUES (1079, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '伊宁县', '654021');
INSERT INTO `tb_administrative_division` VALUES (1080, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '伊宁市', '654002');
INSERT INTO `tb_administrative_division` VALUES (1081, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '尼勒克县', '654028');
INSERT INTO `tb_administrative_division` VALUES (1082, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '昭苏县', '654026');
INSERT INTO `tb_administrative_division` VALUES (1083, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '奎屯市', '654003');
INSERT INTO `tb_administrative_division` VALUES (1084, '新疆维吾尔自治区', '650000', '伊犁哈萨克自治州', '654000', '霍尔果斯市', '654004');
INSERT INTO `tb_administrative_division` VALUES (1085, '新疆维吾尔自治区', '650000', '博尔塔拉蒙古自治州', '652700', '温泉县', '652723');
INSERT INTO `tb_administrative_division` VALUES (1086, '新疆维吾尔自治区', '650000', '博尔塔拉蒙古自治州', '652700', '精河县', '652722');
INSERT INTO `tb_administrative_division` VALUES (1087, '新疆维吾尔自治区', '650000', '博尔塔拉蒙古自治州', '652700', '阿拉山口市', '652702');
INSERT INTO `tb_administrative_division` VALUES (1088, '新疆维吾尔自治区', '650000', '博尔塔拉蒙古自治州', '652700', '博乐市', '652701');
INSERT INTO `tb_administrative_division` VALUES (1089, '新疆维吾尔自治区', '650000', '克孜勒苏柯尔克孜自治州', '653000', '阿合奇县', '653023');
INSERT INTO `tb_administrative_division` VALUES (1090, '新疆维吾尔自治区', '650000', '克孜勒苏柯尔克孜自治州', '653000', '乌恰县', '653024');
INSERT INTO `tb_administrative_division` VALUES (1091, '新疆维吾尔自治区', '650000', '克孜勒苏柯尔克孜自治州', '653000', '阿图什市', '653001');
INSERT INTO `tb_administrative_division` VALUES (1092, '新疆维吾尔自治区', '650000', '克孜勒苏柯尔克孜自治州', '653000', '阿克陶县', '653022');
INSERT INTO `tb_administrative_division` VALUES (1093, '新疆维吾尔自治区', '650000', '和田地区', '653200', '和田县', '653221');
INSERT INTO `tb_administrative_division` VALUES (1094, '新疆维吾尔自治区', '650000', '和田地区', '653200', '策勒县', '653225');
INSERT INTO `tb_administrative_division` VALUES (1095, '新疆维吾尔自治区', '650000', '和田地区', '653200', '和田市', '653201');
INSERT INTO `tb_administrative_division` VALUES (1096, '新疆维吾尔自治区', '650000', '和田地区', '653200', '皮山县', '653223');
INSERT INTO `tb_administrative_division` VALUES (1097, '新疆维吾尔自治区', '650000', '和田地区', '653200', '民丰县', '653227');
INSERT INTO `tb_administrative_division` VALUES (1098, '新疆维吾尔自治区', '650000', '和田地区', '653200', '墨玉县', '653222');
INSERT INTO `tb_administrative_division` VALUES (1099, '新疆维吾尔自治区', '650000', '和田地区', '653200', '洛浦县', '653224');
INSERT INTO `tb_administrative_division` VALUES (1100, '新疆维吾尔自治区', '650000', '和田地区', '653200', '于田县', '653226');
INSERT INTO `tb_administrative_division` VALUES (1101, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '沙雅县', '652924');
INSERT INTO `tb_administrative_division` VALUES (1102, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '阿克苏市', '652901');
INSERT INTO `tb_administrative_division` VALUES (1103, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '温宿县', '652922');
INSERT INTO `tb_administrative_division` VALUES (1104, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '乌什县', '652927');
INSERT INTO `tb_administrative_division` VALUES (1105, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '新和县', '652925');
INSERT INTO `tb_administrative_division` VALUES (1106, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '库车县', '652923');
INSERT INTO `tb_administrative_division` VALUES (1107, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '柯坪县', '652929');
INSERT INTO `tb_administrative_division` VALUES (1108, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '阿瓦提县', '652928');
INSERT INTO `tb_administrative_division` VALUES (1109, '新疆维吾尔自治区', '650000', '阿克苏地区', '652900', '拜城县', '652926');
INSERT INTO `tb_administrative_division` VALUES (1110, '新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '阿勒泰市', '654301');
INSERT INTO `tb_administrative_division` VALUES (1111, '新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '青河县', '654325');
INSERT INTO `tb_administrative_division` VALUES (1112, '新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '福海县', '654323');
INSERT INTO `tb_administrative_division` VALUES (1113, '新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '富蕴县', '654322');
INSERT INTO `tb_administrative_division` VALUES (1114, '新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '北屯镇', '654327');
INSERT INTO `tb_administrative_division` VALUES (1115, '新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '布尔津县', '654321');
INSERT INTO `tb_administrative_division` VALUES (1116, '新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '哈巴河县', '654324');
INSERT INTO `tb_administrative_division` VALUES (1117, '新疆维吾尔自治区', '650000', '阿勒泰地区', '654300', '吉木乃县', '654326');
INSERT INTO `tb_administrative_division` VALUES (1118, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '和硕县', '652828');
INSERT INTO `tb_administrative_division` VALUES (1119, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '库尔勒市', '652801');
INSERT INTO `tb_administrative_division` VALUES (1120, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '博湖县', '652829');
INSERT INTO `tb_administrative_division` VALUES (1121, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '尉犁县', '652823');
INSERT INTO `tb_administrative_division` VALUES (1122, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '若羌县', '652824');
INSERT INTO `tb_administrative_division` VALUES (1123, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '轮台县', '652822');
INSERT INTO `tb_administrative_division` VALUES (1124, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '和静县', '652827');
INSERT INTO `tb_administrative_division` VALUES (1125, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '且末县', '652825');
INSERT INTO `tb_administrative_division` VALUES (1126, '新疆维吾尔自治区', '650000', '巴音郭楞蒙古自治州', '652800', '焉耆回族自治县', '652826');
INSERT INTO `tb_administrative_division` VALUES (1127, '新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '木垒哈萨克自治县', '652328');
INSERT INTO `tb_administrative_division` VALUES (1128, '新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '奇台县', '652325');
INSERT INTO `tb_administrative_division` VALUES (1129, '新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '吉木萨尔县', '652327');
INSERT INTO `tb_administrative_division` VALUES (1130, '新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '阜康市', '652302');
INSERT INTO `tb_administrative_division` VALUES (1131, '新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '昌吉市', '652301');
INSERT INTO `tb_administrative_division` VALUES (1132, '新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '玛纳斯县', '652324');
INSERT INTO `tb_administrative_division` VALUES (1133, '新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '五家渠市', '652329');
INSERT INTO `tb_administrative_division` VALUES (1134, '新疆维吾尔自治区', '650000', '昌吉回族自治州', '652300', '呼图壁县', '652323');
INSERT INTO `tb_administrative_division` VALUES (1135, '新疆维吾尔自治区', '650000', '塔城地区', '654200', '额敏县', '654221');
INSERT INTO `tb_administrative_division` VALUES (1136, '新疆维吾尔自治区', '650000', '塔城地区', '654200', '托里县', '654224');
INSERT INTO `tb_administrative_division` VALUES (1137, '新疆维吾尔自治区', '650000', '塔城地区', '654200', '塔城市', '654201');
INSERT INTO `tb_administrative_division` VALUES (1138, '新疆维吾尔自治区', '650000', '塔城地区', '654200', '沙湾县', '654223');
INSERT INTO `tb_administrative_division` VALUES (1139, '新疆维吾尔自治区', '650000', '塔城地区', '654200', '乌苏市', '654202');
INSERT INTO `tb_administrative_division` VALUES (1140, '新疆维吾尔自治区', '650000', '塔城地区', '654200', '裕民县', '654225');
INSERT INTO `tb_administrative_division` VALUES (1141, '新疆维吾尔自治区', '650000', '塔城地区', '654200', '和布克赛尔蒙古自治县', '654226');
INSERT INTO `tb_administrative_division` VALUES (1142, '新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '新市区', '650104');
INSERT INTO `tb_administrative_division` VALUES (1143, '新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '头屯河区', '650106');
INSERT INTO `tb_administrative_division` VALUES (1144, '新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '乌鲁木齐县', '650121');
INSERT INTO `tb_administrative_division` VALUES (1145, '新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '天山区', '650102');
INSERT INTO `tb_administrative_division` VALUES (1146, '新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '米东区', '650109');
INSERT INTO `tb_administrative_division` VALUES (1147, '新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '沙依巴克区', '650103');
INSERT INTO `tb_administrative_division` VALUES (1148, '新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '达坂城区', '650107');
INSERT INTO `tb_administrative_division` VALUES (1149, '新疆维吾尔自治区', '650000', '乌鲁木齐市', '650100', '水磨沟区', '650105');
INSERT INTO `tb_administrative_division` VALUES (1150, '新疆维吾尔自治区', '650000', '哈密地区', '652200', '巴里坤哈萨克自治县', '652222');
INSERT INTO `tb_administrative_division` VALUES (1151, '新疆维吾尔自治区', '650000', '哈密地区', '652200', '哈密市', '652201');
INSERT INTO `tb_administrative_division` VALUES (1152, '新疆维吾尔自治区', '650000', '哈密地区', '652200', '伊吾县', '652223');
INSERT INTO `tb_administrative_division` VALUES (1153, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '疏附县', '653121');
INSERT INTO `tb_administrative_division` VALUES (1154, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '泽普县', '653124');
INSERT INTO `tb_administrative_division` VALUES (1155, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '喀什市', '653101');
INSERT INTO `tb_administrative_division` VALUES (1156, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '疏勒县', '653122');
INSERT INTO `tb_administrative_division` VALUES (1157, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '塔什库尔干塔吉克自治县', '653131');
INSERT INTO `tb_administrative_division` VALUES (1158, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '伽师县', '653129');
INSERT INTO `tb_administrative_division` VALUES (1159, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '英吉沙县', '653123');
INSERT INTO `tb_administrative_division` VALUES (1160, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '巴楚县', '653130');
INSERT INTO `tb_administrative_division` VALUES (1161, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '岳普湖县', '653128');
INSERT INTO `tb_administrative_division` VALUES (1162, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '麦盖提县', '653127');
INSERT INTO `tb_administrative_division` VALUES (1163, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '莎车县', '653125');
INSERT INTO `tb_administrative_division` VALUES (1164, '新疆维吾尔自治区', '650000', '喀什地区', '653100', '叶城县', '653126');
INSERT INTO `tb_administrative_division` VALUES (1165, '新疆维吾尔自治区', '650000', '吐鲁番地区', '652100', '鄯善县', '652122');
INSERT INTO `tb_administrative_division` VALUES (1166, '新疆维吾尔自治区', '650000', '吐鲁番地区', '652100', '托克逊县', '652123');
INSERT INTO `tb_administrative_division` VALUES (1167, '新疆维吾尔自治区', '650000', '吐鲁番地区', '652100', '吐鲁番市', '652101');
INSERT INTO `tb_administrative_division` VALUES (1168, '新疆维吾尔自治区', '650000', '克拉玛依市', '650200', '白碱滩区', '650204');
INSERT INTO `tb_administrative_division` VALUES (1169, '新疆维吾尔自治区', '650000', '克拉玛依市', '650200', '独山子区', '650202');
INSERT INTO `tb_administrative_division` VALUES (1170, '新疆维吾尔自治区', '650000', '克拉玛依市', '650200', '乌尔禾区', '650205');
INSERT INTO `tb_administrative_division` VALUES (1171, '新疆维吾尔自治区', '650000', '克拉玛依市', '650200', '克拉玛依区', '650203');
INSERT INTO `tb_administrative_division` VALUES (1172, '山西省', '140000', '大同市', '140200', '矿区', '140203');
INSERT INTO `tb_administrative_division` VALUES (1173, '山西省', '140000', '大同市', '140200', '天镇县', '140222');
INSERT INTO `tb_administrative_division` VALUES (1174, '山西省', '140000', '大同市', '140200', '阳高县', '140221');
INSERT INTO `tb_administrative_division` VALUES (1175, '山西省', '140000', '大同市', '140200', '南郊区', '140211');
INSERT INTO `tb_administrative_division` VALUES (1176, '山西省', '140000', '大同市', '140200', '灵丘县', '140224');
INSERT INTO `tb_administrative_division` VALUES (1177, '山西省', '140000', '大同市', '140200', '新荣区', '140212');
INSERT INTO `tb_administrative_division` VALUES (1178, '山西省', '140000', '大同市', '140200', '大同县', '140227');
INSERT INTO `tb_administrative_division` VALUES (1179, '山西省', '140000', '大同市', '140200', '广灵县', '140223');
INSERT INTO `tb_administrative_division` VALUES (1180, '山西省', '140000', '大同市', '140200', '城区', '140202');
INSERT INTO `tb_administrative_division` VALUES (1181, '山西省', '140000', '大同市', '140200', '浑源县', '140225');
INSERT INTO `tb_administrative_division` VALUES (1182, '山西省', '140000', '大同市', '140200', '左云县', '140226');
INSERT INTO `tb_administrative_division` VALUES (1183, '山西省', '140000', '大同市', '140200', '平城区', '140213');
INSERT INTO `tb_administrative_division` VALUES (1184, '山西省', '140000', '大同市', '140200', '云州区', '140215');
INSERT INTO `tb_administrative_division` VALUES (1185, '山西省', '140000', '大同市', '140200', '云冈区', '140214');
INSERT INTO `tb_administrative_division` VALUES (1186, '山西省', '140000', '阳泉市', '140300', '盂县', '140322');
INSERT INTO `tb_administrative_division` VALUES (1187, '山西省', '140000', '阳泉市', '140300', '城区', '140302');
INSERT INTO `tb_administrative_division` VALUES (1188, '山西省', '140000', '阳泉市', '140300', '郊区', '140311');
INSERT INTO `tb_administrative_division` VALUES (1189, '山西省', '140000', '阳泉市', '140300', '平定县', '140321');
INSERT INTO `tb_administrative_division` VALUES (1190, '山西省', '140000', '阳泉市', '140300', '矿区', '140303');
INSERT INTO `tb_administrative_division` VALUES (1191, '山西省', '140000', '朔州市', '140600', '怀仁县', '140624');
INSERT INTO `tb_administrative_division` VALUES (1192, '山西省', '140000', '朔州市', '140600', '平鲁区', '140603');
INSERT INTO `tb_administrative_division` VALUES (1193, '山西省', '140000', '朔州市', '140600', '应县', '140622');
INSERT INTO `tb_administrative_division` VALUES (1194, '山西省', '140000', '朔州市', '140600', '朔城区', '140602');
INSERT INTO `tb_administrative_division` VALUES (1195, '山西省', '140000', '朔州市', '140600', '右玉县', '140623');
INSERT INTO `tb_administrative_division` VALUES (1196, '山西省', '140000', '朔州市', '140600', '山阴县', '140621');
INSERT INTO `tb_administrative_division` VALUES (1197, '山西省', '140000', '长治市', '140400', '长治县', '140421');
INSERT INTO `tb_administrative_division` VALUES (1198, '山西省', '140000', '长治市', '140400', '沁县', '140430');
INSERT INTO `tb_administrative_division` VALUES (1199, '山西省', '140000', '长治市', '140400', '屯留县', '140424');
INSERT INTO `tb_administrative_division` VALUES (1200, '山西省', '140000', '长治市', '140400', '长子县', '140428');
INSERT INTO `tb_administrative_division` VALUES (1201, '山西省', '140000', '长治市', '140400', '潞城市', '140481');
INSERT INTO `tb_administrative_division` VALUES (1202, '山西省', '140000', '长治市', '140400', '郊区', '140411');
INSERT INTO `tb_administrative_division` VALUES (1203, '山西省', '140000', '长治市', '140400', '平顺县', '140425');
INSERT INTO `tb_administrative_division` VALUES (1204, '山西省', '140000', '长治市', '140400', '襄垣县', '140423');
INSERT INTO `tb_administrative_division` VALUES (1205, '山西省', '140000', '长治市', '140400', '壶关县', '140427');
INSERT INTO `tb_administrative_division` VALUES (1206, '山西省', '140000', '长治市', '140400', '武乡县', '140429');
INSERT INTO `tb_administrative_division` VALUES (1207, '山西省', '140000', '长治市', '140400', '城区', '140402');
INSERT INTO `tb_administrative_division` VALUES (1208, '山西省', '140000', '长治市', '140400', '黎城县', '140426');
INSERT INTO `tb_administrative_division` VALUES (1209, '山西省', '140000', '长治市', '140400', '沁源县', '140431');
INSERT INTO `tb_administrative_division` VALUES (1210, '山西省', '140000', '临汾市', '141000', '蒲县', '141033');
INSERT INTO `tb_administrative_division` VALUES (1211, '山西省', '140000', '临汾市', '141000', '曲沃县', '141021');
INSERT INTO `tb_administrative_division` VALUES (1212, '山西省', '140000', '临汾市', '141000', '霍州市', '141082');
INSERT INTO `tb_administrative_division` VALUES (1213, '山西省', '140000', '临汾市', '141000', '永和县', '141032');
INSERT INTO `tb_administrative_division` VALUES (1214, '山西省', '140000', '临汾市', '141000', '侯马市', '141081');
INSERT INTO `tb_administrative_division` VALUES (1215, '山西省', '140000', '临汾市', '141000', '隰县', '141031');
INSERT INTO `tb_administrative_division` VALUES (1216, '山西省', '140000', '临汾市', '141000', '古县', '141025');
INSERT INTO `tb_administrative_division` VALUES (1217, '山西省', '140000', '临汾市', '141000', '汾西县', '141034');
INSERT INTO `tb_administrative_division` VALUES (1218, '山西省', '140000', '临汾市', '141000', '尧都区', '141002');
INSERT INTO `tb_administrative_division` VALUES (1219, '山西省', '140000', '临汾市', '141000', '吉县', '141028');
INSERT INTO `tb_administrative_division` VALUES (1220, '山西省', '140000', '临汾市', '141000', '洪洞县', '141024');
INSERT INTO `tb_administrative_division` VALUES (1221, '山西省', '140000', '临汾市', '141000', '大宁县', '141030');
INSERT INTO `tb_administrative_division` VALUES (1222, '山西省', '140000', '临汾市', '141000', '翼城县', '141022');
INSERT INTO `tb_administrative_division` VALUES (1223, '山西省', '140000', '临汾市', '141000', '襄汾县', '141023');
INSERT INTO `tb_administrative_division` VALUES (1224, '山西省', '140000', '临汾市', '141000', '乡宁县', '141029');
INSERT INTO `tb_administrative_division` VALUES (1225, '山西省', '140000', '临汾市', '141000', '浮山县', '141027');
INSERT INTO `tb_administrative_division` VALUES (1226, '山西省', '140000', '临汾市', '141000', '安泽县', '141026');
INSERT INTO `tb_administrative_division` VALUES (1227, '山西省', '140000', '吕梁市', '141100', '孝义市', '141181');
INSERT INTO `tb_administrative_division` VALUES (1228, '山西省', '140000', '吕梁市', '141100', '柳林县', '141125');
INSERT INTO `tb_administrative_division` VALUES (1229, '山西省', '140000', '吕梁市', '141100', '汾阳市', '141182');
INSERT INTO `tb_administrative_division` VALUES (1230, '山西省', '140000', '吕梁市', '141100', '临县', '141124');
INSERT INTO `tb_administrative_division` VALUES (1231, '山西省', '140000', '吕梁市', '141100', '交城县', '141122');
INSERT INTO `tb_administrative_division` VALUES (1232, '山西省', '140000', '吕梁市', '141100', '岚县', '141127');
INSERT INTO `tb_administrative_division` VALUES (1233, '山西省', '140000', '吕梁市', '141100', '中阳县', '141129');
INSERT INTO `tb_administrative_division` VALUES (1234, '山西省', '140000', '吕梁市', '141100', '文水县', '141121');
INSERT INTO `tb_administrative_division` VALUES (1235, '山西省', '140000', '吕梁市', '141100', '兴县', '141123');
INSERT INTO `tb_administrative_division` VALUES (1236, '山西省', '140000', '吕梁市', '141100', '离石区', '141102');
INSERT INTO `tb_administrative_division` VALUES (1237, '山西省', '140000', '吕梁市', '141100', '交口县', '141130');
INSERT INTO `tb_administrative_division` VALUES (1238, '山西省', '140000', '吕梁市', '141100', '方山县', '141128');
INSERT INTO `tb_administrative_division` VALUES (1239, '山西省', '140000', '吕梁市', '141100', '石楼县', '141126');
INSERT INTO `tb_administrative_division` VALUES (1240, '山西省', '140000', '晋中市', '140700', '祁县', '140727');
INSERT INTO `tb_administrative_division` VALUES (1241, '山西省', '140000', '晋中市', '140700', '寿阳县', '140725');
INSERT INTO `tb_administrative_division` VALUES (1242, '山西省', '140000', '晋中市', '140700', '平遥县', '140728');
INSERT INTO `tb_administrative_division` VALUES (1243, '山西省', '140000', '晋中市', '140700', '灵石县', '140729');
INSERT INTO `tb_administrative_division` VALUES (1244, '山西省', '140000', '晋中市', '140700', '和顺县', '140723');
INSERT INTO `tb_administrative_division` VALUES (1245, '山西省', '140000', '晋中市', '140700', '榆次区', '140702');
INSERT INTO `tb_administrative_division` VALUES (1246, '山西省', '140000', '晋中市', '140700', '左权县', '140722');
INSERT INTO `tb_administrative_division` VALUES (1247, '山西省', '140000', '晋中市', '140700', '榆社县', '140721');
INSERT INTO `tb_administrative_division` VALUES (1248, '山西省', '140000', '晋中市', '140700', '介休市', '140781');
INSERT INTO `tb_administrative_division` VALUES (1249, '山西省', '140000', '晋中市', '140700', '昔阳县', '140724');
INSERT INTO `tb_administrative_division` VALUES (1250, '山西省', '140000', '晋中市', '140700', '太谷县', '140726');
INSERT INTO `tb_administrative_division` VALUES (1251, '山西省', '140000', '太原市', '140100', '娄烦县', '140123');
INSERT INTO `tb_administrative_division` VALUES (1252, '山西省', '140000', '太原市', '140100', '晋源区', '140110');
INSERT INTO `tb_administrative_division` VALUES (1253, '山西省', '140000', '太原市', '140100', '清徐县', '140121');
INSERT INTO `tb_administrative_division` VALUES (1254, '山西省', '140000', '太原市', '140100', '尖草坪区', '140108');
INSERT INTO `tb_administrative_division` VALUES (1255, '山西省', '140000', '太原市', '140100', '古交市', '140181');
INSERT INTO `tb_administrative_division` VALUES (1256, '山西省', '140000', '太原市', '140100', '迎泽区', '140106');
INSERT INTO `tb_administrative_division` VALUES (1257, '山西省', '140000', '太原市', '140100', '杏花岭区', '140107');
INSERT INTO `tb_administrative_division` VALUES (1258, '山西省', '140000', '太原市', '140100', '万柏林区', '140109');
INSERT INTO `tb_administrative_division` VALUES (1259, '山西省', '140000', '太原市', '140100', '阳曲县', '140122');
INSERT INTO `tb_administrative_division` VALUES (1260, '山西省', '140000', '太原市', '140100', '小店区', '140105');
INSERT INTO `tb_administrative_division` VALUES (1261, '山西省', '140000', '晋城市', '140500', '高平市', '140581');
INSERT INTO `tb_administrative_division` VALUES (1262, '山西省', '140000', '晋城市', '140500', '沁水县', '140521');
INSERT INTO `tb_administrative_division` VALUES (1263, '山西省', '140000', '晋城市', '140500', '陵川县', '140524');
INSERT INTO `tb_administrative_division` VALUES (1264, '山西省', '140000', '晋城市', '140500', '城区', '140502');
INSERT INTO `tb_administrative_division` VALUES (1265, '山西省', '140000', '晋城市', '140500', '阳城县', '140522');
INSERT INTO `tb_administrative_division` VALUES (1266, '山西省', '140000', '晋城市', '140500', '泽州县', '140525');
INSERT INTO `tb_administrative_division` VALUES (1267, '山西省', '140000', '忻州市', '140900', '岢岚县', '140929');
INSERT INTO `tb_administrative_division` VALUES (1268, '山西省', '140000', '忻州市', '140900', '河曲县', '140930');
INSERT INTO `tb_administrative_division` VALUES (1269, '山西省', '140000', '忻州市', '140900', '原平市', '140981');
INSERT INTO `tb_administrative_division` VALUES (1270, '山西省', '140000', '忻州市', '140900', '保德县', '140931');
INSERT INTO `tb_administrative_division` VALUES (1271, '山西省', '140000', '忻州市', '140900', '宁武县', '140925');
INSERT INTO `tb_administrative_division` VALUES (1272, '山西省', '140000', '忻州市', '140900', '神池县', '140927');
INSERT INTO `tb_administrative_division` VALUES (1273, '山西省', '140000', '忻州市', '140900', '偏关县', '140932');
INSERT INTO `tb_administrative_division` VALUES (1274, '山西省', '140000', '忻州市', '140900', '定襄县', '140921');
INSERT INTO `tb_administrative_division` VALUES (1275, '山西省', '140000', '忻州市', '140900', '代县', '140923');
INSERT INTO `tb_administrative_division` VALUES (1276, '山西省', '140000', '忻州市', '140900', '忻府区', '140902');
INSERT INTO `tb_administrative_division` VALUES (1277, '山西省', '140000', '忻州市', '140900', '五寨县', '140928');
INSERT INTO `tb_administrative_division` VALUES (1278, '山西省', '140000', '忻州市', '140900', '繁峙县', '140924');
INSERT INTO `tb_administrative_division` VALUES (1279, '山西省', '140000', '忻州市', '140900', '五台县', '140922');
INSERT INTO `tb_administrative_division` VALUES (1280, '山西省', '140000', '忻州市', '140900', '静乐县', '140926');
INSERT INTO `tb_administrative_division` VALUES (1281, '山西省', '140000', '运城市', '140800', '夏县', '140828');
INSERT INTO `tb_administrative_division` VALUES (1282, '山西省', '140000', '运城市', '140800', '垣曲县', '140827');
INSERT INTO `tb_administrative_division` VALUES (1283, '山西省', '140000', '运城市', '140800', '新绛县', '140825');
INSERT INTO `tb_administrative_division` VALUES (1284, '山西省', '140000', '运城市', '140800', '芮城县', '140830');
INSERT INTO `tb_administrative_division` VALUES (1285, '山西省', '140000', '运城市', '140800', '平陆县', '140829');
INSERT INTO `tb_administrative_division` VALUES (1286, '山西省', '140000', '运城市', '140800', '万荣县', '140822');
INSERT INTO `tb_administrative_division` VALUES (1287, '山西省', '140000', '运城市', '140800', '永济市', '140881');
INSERT INTO `tb_administrative_division` VALUES (1288, '山西省', '140000', '运城市', '140800', '稷山县', '140824');
INSERT INTO `tb_administrative_division` VALUES (1289, '山西省', '140000', '运城市', '140800', '盐湖区', '140802');
INSERT INTO `tb_administrative_division` VALUES (1290, '山西省', '140000', '运城市', '140800', '闻喜县', '140823');
INSERT INTO `tb_administrative_division` VALUES (1291, '山西省', '140000', '运城市', '140800', '河津市', '140882');
INSERT INTO `tb_administrative_division` VALUES (1292, '山西省', '140000', '运城市', '140800', '临猗县', '140821');
INSERT INTO `tb_administrative_division` VALUES (1293, '山西省', '140000', '运城市', '140800', '绛县', '140826');
INSERT INTO `tb_administrative_division` VALUES (1294, '安徽省', '340000', '宿州市', '341300', '砀山县', '341321');
INSERT INTO `tb_administrative_division` VALUES (1295, '安徽省', '340000', '宿州市', '341300', '萧县', '341322');
INSERT INTO `tb_administrative_division` VALUES (1296, '安徽省', '340000', '宿州市', '341300', '泗县', '341324');
INSERT INTO `tb_administrative_division` VALUES (1297, '安徽省', '340000', '宿州市', '341300', '灵璧县', '341323');
INSERT INTO `tb_administrative_division` VALUES (1298, '安徽省', '340000', '宿州市', '341300', '埇桥区', '341302');
INSERT INTO `tb_administrative_division` VALUES (1299, '安徽省', '340000', '淮北市', '340600', '相山区', '340603');
INSERT INTO `tb_administrative_division` VALUES (1300, '安徽省', '340000', '淮北市', '340600', '杜集区', '340602');
INSERT INTO `tb_administrative_division` VALUES (1301, '安徽省', '340000', '淮北市', '340600', '濉溪县', '340621');
INSERT INTO `tb_administrative_division` VALUES (1302, '安徽省', '340000', '淮北市', '340600', '烈山区', '340604');
INSERT INTO `tb_administrative_division` VALUES (1303, '安徽省', '340000', '淮南市', '340400', '潘集区', '340406');
INSERT INTO `tb_administrative_division` VALUES (1304, '安徽省', '340000', '淮南市', '340400', '谢家集区', '340404');
INSERT INTO `tb_administrative_division` VALUES (1305, '安徽省', '340000', '淮南市', '340400', '寿县', '340422');
INSERT INTO `tb_administrative_division` VALUES (1306, '安徽省', '340000', '淮南市', '340400', '田家庵区', '340403');
INSERT INTO `tb_administrative_division` VALUES (1307, '安徽省', '340000', '淮南市', '340400', '八公山区', '340405');
INSERT INTO `tb_administrative_division` VALUES (1308, '安徽省', '340000', '淮南市', '340400', '凤台县', '340421');
INSERT INTO `tb_administrative_division` VALUES (1309, '安徽省', '340000', '淮南市', '340400', '大通区', '340402');
INSERT INTO `tb_administrative_division` VALUES (1310, '安徽省', '340000', '合肥市', '340100', '长丰县', '340121');
INSERT INTO `tb_administrative_division` VALUES (1311, '安徽省', '340000', '合肥市', '340100', '蜀山区', '340104');
INSERT INTO `tb_administrative_division` VALUES (1312, '安徽省', '340000', '合肥市', '340100', '瑶海区', '340102');
INSERT INTO `tb_administrative_division` VALUES (1313, '安徽省', '340000', '合肥市', '340100', '肥西县', '340123');
INSERT INTO `tb_administrative_division` VALUES (1314, '安徽省', '340000', '合肥市', '340100', '庐阳区', '340103');
INSERT INTO `tb_administrative_division` VALUES (1315, '安徽省', '340000', '合肥市', '340100', '肥东县', '340122');
INSERT INTO `tb_administrative_division` VALUES (1316, '安徽省', '340000', '合肥市', '340100', '包河区', '340111');
INSERT INTO `tb_administrative_division` VALUES (1317, '安徽省', '340000', '合肥市', '340100', '巢湖市', '340181');
INSERT INTO `tb_administrative_division` VALUES (1318, '安徽省', '340000', '合肥市', '340100', '庐江县', '340124');
INSERT INTO `tb_administrative_division` VALUES (1319, '安徽省', '340000', '蚌埠市', '340300', '怀远县', '340321');
INSERT INTO `tb_administrative_division` VALUES (1320, '安徽省', '340000', '蚌埠市', '340300', '固镇县', '340323');
INSERT INTO `tb_administrative_division` VALUES (1321, '安徽省', '340000', '蚌埠市', '340300', '禹会区', '340304');
INSERT INTO `tb_administrative_division` VALUES (1322, '安徽省', '340000', '蚌埠市', '340300', '五河县', '340322');
INSERT INTO `tb_administrative_division` VALUES (1323, '安徽省', '340000', '蚌埠市', '340300', '龙子湖区', '340302');
INSERT INTO `tb_administrative_division` VALUES (1324, '安徽省', '340000', '蚌埠市', '340300', '蚌山区', '340303');
INSERT INTO `tb_administrative_division` VALUES (1325, '安徽省', '340000', '蚌埠市', '340300', '淮上区', '340311');
INSERT INTO `tb_administrative_division` VALUES (1326, '安徽省', '340000', '铜陵市', '340700', '枞阳县', '340722');
INSERT INTO `tb_administrative_division` VALUES (1327, '安徽省', '340000', '铜陵市', '340700', '义安区', '340706');
INSERT INTO `tb_administrative_division` VALUES (1328, '安徽省', '340000', '铜陵市', '340700', '郊区', '340711');
INSERT INTO `tb_administrative_division` VALUES (1329, '安徽省', '340000', '铜陵市', '340700', '铜官区', '340705');
INSERT INTO `tb_administrative_division` VALUES (1330, '安徽省', '340000', '安庆市', '340800', '宜秀区', '340811');
INSERT INTO `tb_administrative_division` VALUES (1331, '安徽省', '340000', '安庆市', '340800', '怀宁县', '340822');
INSERT INTO `tb_administrative_division` VALUES (1332, '安徽省', '340000', '安庆市', '340800', '桐城市', '340881');
INSERT INTO `tb_administrative_division` VALUES (1333, '安徽省', '340000', '安庆市', '340800', '太湖县', '340825');
INSERT INTO `tb_administrative_division` VALUES (1334, '安徽省', '340000', '安庆市', '340800', '迎江区', '340802');
INSERT INTO `tb_administrative_division` VALUES (1335, '安徽省', '340000', '安庆市', '340800', '岳西县', '340828');
INSERT INTO `tb_administrative_division` VALUES (1336, '安徽省', '340000', '安庆市', '340800', '大观区', '340803');
INSERT INTO `tb_administrative_division` VALUES (1337, '安徽省', '340000', '安庆市', '340800', '潜山县', '340824');
INSERT INTO `tb_administrative_division` VALUES (1338, '安徽省', '340000', '安庆市', '340800', '望江县', '340827');
INSERT INTO `tb_administrative_division` VALUES (1339, '安徽省', '340000', '安庆市', '340800', '宿松县', '340826');
INSERT INTO `tb_administrative_division` VALUES (1340, '安徽省', '340000', '马鞍山市', '340500', '金家庄区', '340502');
INSERT INTO `tb_administrative_division` VALUES (1341, '安徽省', '340000', '马鞍山市', '340500', '当涂县', '340521');
INSERT INTO `tb_administrative_division` VALUES (1342, '安徽省', '340000', '马鞍山市', '340500', '雨山区', '340504');
INSERT INTO `tb_administrative_division` VALUES (1343, '安徽省', '340000', '马鞍山市', '340500', '花山区', '340503');
INSERT INTO `tb_administrative_division` VALUES (1344, '安徽省', '340000', '马鞍山市', '340500', '博望区', '340506');
INSERT INTO `tb_administrative_division` VALUES (1345, '安徽省', '340000', '马鞍山市', '340500', '含山县', '340522');
INSERT INTO `tb_administrative_division` VALUES (1346, '安徽省', '340000', '马鞍山市', '340500', '和县', '340523');
INSERT INTO `tb_administrative_division` VALUES (1347, '安徽省', '340000', '黄山市', '341000', '黟县', '341023');
INSERT INTO `tb_administrative_division` VALUES (1348, '安徽省', '340000', '黄山市', '341000', '歙县', '341021');
INSERT INTO `tb_administrative_division` VALUES (1349, '安徽省', '340000', '黄山市', '341000', '徽州区', '341004');
INSERT INTO `tb_administrative_division` VALUES (1350, '安徽省', '340000', '黄山市', '341000', '屯溪区', '341002');
INSERT INTO `tb_administrative_division` VALUES (1351, '安徽省', '340000', '黄山市', '341000', '黄山区', '341003');
INSERT INTO `tb_administrative_division` VALUES (1352, '安徽省', '340000', '黄山市', '341000', '休宁县', '341022');
INSERT INTO `tb_administrative_division` VALUES (1353, '安徽省', '340000', '黄山市', '341000', '祁门县', '341024');
INSERT INTO `tb_administrative_division` VALUES (1354, '安徽省', '340000', '池州市', '341700', '东至县', '341721');
INSERT INTO `tb_administrative_division` VALUES (1355, '安徽省', '340000', '池州市', '341700', '贵池区', '341702');
INSERT INTO `tb_administrative_division` VALUES (1356, '安徽省', '340000', '池州市', '341700', '青阳县', '341723');
INSERT INTO `tb_administrative_division` VALUES (1357, '安徽省', '340000', '池州市', '341700', '石台县', '341722');
INSERT INTO `tb_administrative_division` VALUES (1358, '安徽省', '340000', '亳州市', '341600', '谯城区', '341602');
INSERT INTO `tb_administrative_division` VALUES (1359, '安徽省', '340000', '亳州市', '341600', '利辛县', '341623');
INSERT INTO `tb_administrative_division` VALUES (1360, '安徽省', '340000', '亳州市', '341600', '蒙城县', '341622');
INSERT INTO `tb_administrative_division` VALUES (1361, '安徽省', '340000', '亳州市', '341600', '涡阳县', '341621');
INSERT INTO `tb_administrative_division` VALUES (1362, '安徽省', '340000', '六安市', '341500', '霍邱县', '341522');
INSERT INTO `tb_administrative_division` VALUES (1363, '安徽省', '340000', '六安市', '341500', '裕安区', '341503');
INSERT INTO `tb_administrative_division` VALUES (1364, '安徽省', '340000', '六安市', '341500', '霍山县', '341525');
INSERT INTO `tb_administrative_division` VALUES (1365, '安徽省', '340000', '六安市', '341500', '金寨县', '341524');
INSERT INTO `tb_administrative_division` VALUES (1366, '安徽省', '340000', '六安市', '341500', '金安区', '341502');
INSERT INTO `tb_administrative_division` VALUES (1367, '安徽省', '340000', '六安市', '341500', '舒城县', '341523');
INSERT INTO `tb_administrative_division` VALUES (1368, '安徽省', '340000', '六安市', '341500', '叶集区', '341504');
INSERT INTO `tb_administrative_division` VALUES (1369, '安徽省', '340000', '芜湖市', '340200', '繁昌县', '340222');
INSERT INTO `tb_administrative_division` VALUES (1370, '安徽省', '340000', '芜湖市', '340200', '镜湖区', '340202');
INSERT INTO `tb_administrative_division` VALUES (1371, '安徽省', '340000', '芜湖市', '340200', '鸠江区', '340207');
INSERT INTO `tb_administrative_division` VALUES (1372, '安徽省', '340000', '芜湖市', '340200', '弋江区', '340203');
INSERT INTO `tb_administrative_division` VALUES (1373, '安徽省', '340000', '芜湖市', '340200', '南陵县', '340223');
INSERT INTO `tb_administrative_division` VALUES (1374, '安徽省', '340000', '芜湖市', '340200', '芜湖县', '340221');
INSERT INTO `tb_administrative_division` VALUES (1375, '安徽省', '340000', '芜湖市', '340200', '三山区', '340208');
INSERT INTO `tb_administrative_division` VALUES (1376, '安徽省', '340000', '芜湖市', '340200', '无为县', '340225');
INSERT INTO `tb_administrative_division` VALUES (1377, '安徽省', '340000', '阜阳市', '341200', '界首市', '341282');
INSERT INTO `tb_administrative_division` VALUES (1378, '安徽省', '340000', '阜阳市', '341200', '临泉县', '341221');
INSERT INTO `tb_administrative_division` VALUES (1379, '安徽省', '340000', '阜阳市', '341200', '颍泉区', '341204');
INSERT INTO `tb_administrative_division` VALUES (1380, '安徽省', '340000', '阜阳市', '341200', '颍东区', '341203');
INSERT INTO `tb_administrative_division` VALUES (1381, '安徽省', '340000', '阜阳市', '341200', '颍州区', '341202');
INSERT INTO `tb_administrative_division` VALUES (1382, '安徽省', '340000', '阜阳市', '341200', '阜南县', '341225');
INSERT INTO `tb_administrative_division` VALUES (1383, '安徽省', '340000', '阜阳市', '341200', '太和县', '341222');
INSERT INTO `tb_administrative_division` VALUES (1384, '安徽省', '340000', '阜阳市', '341200', '颍上县', '341226');
INSERT INTO `tb_administrative_division` VALUES (1385, '安徽省', '340000', '滁州市', '341100', '琅琊区', '341102');
INSERT INTO `tb_administrative_division` VALUES (1386, '安徽省', '340000', '滁州市', '341100', '天长市', '341181');
INSERT INTO `tb_administrative_division` VALUES (1387, '安徽省', '340000', '滁州市', '341100', '南谯区', '341103');
INSERT INTO `tb_administrative_division` VALUES (1388, '安徽省', '340000', '滁州市', '341100', '全椒县', '341124');
INSERT INTO `tb_administrative_division` VALUES (1389, '安徽省', '340000', '滁州市', '341100', '来安县', '341122');
INSERT INTO `tb_administrative_division` VALUES (1390, '安徽省', '340000', '滁州市', '341100', '明光市', '341182');
INSERT INTO `tb_administrative_division` VALUES (1391, '安徽省', '340000', '滁州市', '341100', '定远县', '341125');
INSERT INTO `tb_administrative_division` VALUES (1392, '安徽省', '340000', '滁州市', '341100', '凤阳县', '341126');
INSERT INTO `tb_administrative_division` VALUES (1393, '安徽省', '340000', '宣城市', '341800', '宁国市', '341881');
INSERT INTO `tb_administrative_division` VALUES (1394, '安徽省', '340000', '宣城市', '341800', '广德县', '341822');
INSERT INTO `tb_administrative_division` VALUES (1395, '安徽省', '340000', '宣城市', '341800', '旌德县', '341825');
INSERT INTO `tb_administrative_division` VALUES (1396, '安徽省', '340000', '宣城市', '341800', '泾县', '341823');
INSERT INTO `tb_administrative_division` VALUES (1397, '安徽省', '340000', '宣城市', '341800', '宣州区', '341802');
INSERT INTO `tb_administrative_division` VALUES (1398, '安徽省', '340000', '宣城市', '341800', '郎溪县', '341821');
INSERT INTO `tb_administrative_division` VALUES (1399, '安徽省', '340000', '宣城市', '341800', '绩溪县', '341824');
INSERT INTO `tb_administrative_division` VALUES (1400, '西藏自治区', '540000', '拉萨市', '540100', '曲水县', '540124');
INSERT INTO `tb_administrative_division` VALUES (1401, '西藏自治区', '540000', '拉萨市', '540100', '堆龙德庆县', '540125');
INSERT INTO `tb_administrative_division` VALUES (1402, '西藏自治区', '540000', '拉萨市', '540100', '墨竹工卡县', '540127');
INSERT INTO `tb_administrative_division` VALUES (1403, '西藏自治区', '540000', '拉萨市', '540100', '城关区', '540102');
INSERT INTO `tb_administrative_division` VALUES (1404, '西藏自治区', '540000', '拉萨市', '540100', '林周县', '540121');
INSERT INTO `tb_administrative_division` VALUES (1405, '西藏自治区', '540000', '拉萨市', '540100', '尼木县', '540123');
INSERT INTO `tb_administrative_division` VALUES (1406, '西藏自治区', '540000', '拉萨市', '540100', '当雄县', '540122');
INSERT INTO `tb_administrative_division` VALUES (1407, '西藏自治区', '540000', '拉萨市', '540100', '达孜县', '540126');
INSERT INTO `tb_administrative_division` VALUES (1408, '西藏自治区', '540000', '那曲地区', '542400', '尼玛县', '542430');
INSERT INTO `tb_administrative_division` VALUES (1409, '西藏自治区', '540000', '那曲地区', '542400', '索县', '542427');
INSERT INTO `tb_administrative_division` VALUES (1410, '西藏自治区', '540000', '那曲地区', '542400', '安多县', '542425');
INSERT INTO `tb_administrative_division` VALUES (1411, '西藏自治区', '540000', '那曲地区', '542400', '那曲县', '542421');
INSERT INTO `tb_administrative_division` VALUES (1412, '西藏自治区', '540000', '那曲地区', '542400', '班戈县', '542428');
INSERT INTO `tb_administrative_division` VALUES (1413, '西藏自治区', '540000', '那曲地区', '542400', '嘉黎县', '542422');
INSERT INTO `tb_administrative_division` VALUES (1414, '西藏自治区', '540000', '那曲地区', '542400', '聂荣县', '542424');
INSERT INTO `tb_administrative_division` VALUES (1415, '西藏自治区', '540000', '那曲地区', '542400', '比如县', '542423');
INSERT INTO `tb_administrative_division` VALUES (1416, '西藏自治区', '540000', '那曲地区', '542400', '巴青县', '542429');
INSERT INTO `tb_administrative_division` VALUES (1417, '西藏自治区', '540000', '那曲地区', '542400', '双湖县', '542431');
INSERT INTO `tb_administrative_division` VALUES (1418, '西藏自治区', '540000', '那曲地区', '542400', '申扎县', '542426');
INSERT INTO `tb_administrative_division` VALUES (1419, '西藏自治区', '540000', '山南地区', '542200', '桑日县', '542224');
INSERT INTO `tb_administrative_division` VALUES (1420, '西藏自治区', '540000', '山南地区', '542200', '洛扎县', '542228');
INSERT INTO `tb_administrative_division` VALUES (1421, '西藏自治区', '540000', '山南地区', '542200', '扎囊县', '542222');
INSERT INTO `tb_administrative_division` VALUES (1422, '西藏自治区', '540000', '山南地区', '542200', '加查县', '542229');
INSERT INTO `tb_administrative_division` VALUES (1423, '西藏自治区', '540000', '山南地区', '542200', '错那县', '542232');
INSERT INTO `tb_administrative_division` VALUES (1424, '西藏自治区', '540000', '山南地区', '542200', '琼结县', '542225');
INSERT INTO `tb_administrative_division` VALUES (1425, '西藏自治区', '540000', '山南地区', '542200', '措美县', '542227');
INSERT INTO `tb_administrative_division` VALUES (1426, '西藏自治区', '540000', '山南地区', '542200', '隆子县', '542231');
INSERT INTO `tb_administrative_division` VALUES (1427, '西藏自治区', '540000', '山南地区', '542200', '贡嘎县', '542223');
INSERT INTO `tb_administrative_division` VALUES (1428, '西藏自治区', '540000', '山南地区', '542200', '乃东县', '542221');
INSERT INTO `tb_administrative_division` VALUES (1429, '西藏自治区', '540000', '山南地区', '542200', '浪卡子县', '542233');
INSERT INTO `tb_administrative_division` VALUES (1430, '西藏自治区', '540000', '山南地区', '542200', '曲松县', '542226');
INSERT INTO `tb_administrative_division` VALUES (1431, '西藏自治区', '540000', '昌都地区', '542100', '类乌齐县', '542124');
INSERT INTO `tb_administrative_division` VALUES (1432, '西藏自治区', '540000', '昌都地区', '542100', '贡觉县', '542123');
INSERT INTO `tb_administrative_division` VALUES (1433, '西藏自治区', '540000', '昌都地区', '542100', '芒康县', '542129');
INSERT INTO `tb_administrative_division` VALUES (1434, '西藏自治区', '540000', '昌都地区', '542100', '八宿县', '542127');
INSERT INTO `tb_administrative_division` VALUES (1435, '西藏自治区', '540000', '昌都地区', '542100', '边坝县', '542133');
INSERT INTO `tb_administrative_division` VALUES (1436, '西藏自治区', '540000', '昌都地区', '542100', '丁青县', '542125');
INSERT INTO `tb_administrative_division` VALUES (1437, '西藏自治区', '540000', '昌都地区', '542100', '昌都县', '542121');
INSERT INTO `tb_administrative_division` VALUES (1438, '西藏自治区', '540000', '昌都地区', '542100', '察雅县', '542126');
INSERT INTO `tb_administrative_division` VALUES (1439, '西藏自治区', '540000', '昌都地区', '542100', '左贡县', '542128');
INSERT INTO `tb_administrative_division` VALUES (1440, '西藏自治区', '540000', '昌都地区', '542100', '洛隆县', '542132');
INSERT INTO `tb_administrative_division` VALUES (1441, '西藏自治区', '540000', '昌都地区', '542100', '江达县', '542122');
INSERT INTO `tb_administrative_division` VALUES (1442, '西藏自治区', '540000', '阿里地区', '542500', '噶尔县', '542523');
INSERT INTO `tb_administrative_division` VALUES (1443, '西藏自治区', '540000', '阿里地区', '542500', '普兰县', '542521');
INSERT INTO `tb_administrative_division` VALUES (1444, '西藏自治区', '540000', '阿里地区', '542500', '革吉县', '542525');
INSERT INTO `tb_administrative_division` VALUES (1445, '西藏自治区', '540000', '阿里地区', '542500', '措勤县', '542527');
INSERT INTO `tb_administrative_division` VALUES (1446, '西藏自治区', '540000', '阿里地区', '542500', '札达县', '542522');
INSERT INTO `tb_administrative_division` VALUES (1447, '西藏自治区', '540000', '阿里地区', '542500', '日土县', '542524');
INSERT INTO `tb_administrative_division` VALUES (1448, '西藏自治区', '540000', '阿里地区', '542500', '改则县', '542526');
INSERT INTO `tb_administrative_division` VALUES (1449, '西藏自治区', '540000', '日喀则地区', '542300', '仁布县', '542330');
INSERT INTO `tb_administrative_division` VALUES (1450, '西藏自治区', '540000', '日喀则地区', '542300', '白朗县', '542329');
INSERT INTO `tb_administrative_division` VALUES (1451, '西藏自治区', '540000', '日喀则地区', '542300', '昂仁县', '542327');
INSERT INTO `tb_administrative_division` VALUES (1452, '西藏自治区', '540000', '日喀则地区', '542300', '仲巴县', '542333');
INSERT INTO `tb_administrative_division` VALUES (1453, '西藏自治区', '540000', '日喀则地区', '542300', '萨迦县', '542325');
INSERT INTO `tb_administrative_division` VALUES (1454, '西藏自治区', '540000', '日喀则地区', '542300', '谢通门县', '542328');
INSERT INTO `tb_administrative_division` VALUES (1455, '西藏自治区', '540000', '日喀则地区', '542300', '康马县', '542331');
INSERT INTO `tb_administrative_division` VALUES (1456, '西藏自治区', '540000', '日喀则地区', '542300', '萨嘎县', '542337');
INSERT INTO `tb_administrative_division` VALUES (1457, '西藏自治区', '540000', '日喀则地区', '542300', '日喀则市', '542301');
INSERT INTO `tb_administrative_division` VALUES (1458, '西藏自治区', '540000', '日喀则地区', '542300', '吉隆县', '542335');
INSERT INTO `tb_administrative_division` VALUES (1459, '西藏自治区', '540000', '日喀则地区', '542300', '岗巴县', '542338');
INSERT INTO `tb_administrative_division` VALUES (1460, '西藏自治区', '540000', '日喀则地区', '542300', '定日县', '542324');
INSERT INTO `tb_administrative_division` VALUES (1461, '西藏自治区', '540000', '日喀则地区', '542300', '江孜县', '542323');
INSERT INTO `tb_administrative_division` VALUES (1462, '西藏自治区', '540000', '日喀则地区', '542300', '定结县', '542332');
INSERT INTO `tb_administrative_division` VALUES (1463, '西藏自治区', '540000', '日喀则地区', '542300', '亚东县', '542334');
INSERT INTO `tb_administrative_division` VALUES (1464, '西藏自治区', '540000', '日喀则地区', '542300', '南木林县', '542322');
INSERT INTO `tb_administrative_division` VALUES (1465, '西藏自治区', '540000', '日喀则地区', '542300', '拉孜县', '542326');
INSERT INTO `tb_administrative_division` VALUES (1466, '西藏自治区', '540000', '日喀则地区', '542300', '聂拉木县', '542336');
INSERT INTO `tb_administrative_division` VALUES (1467, '西藏自治区', '540000', '林芝地区', '542600', '朗县', '542627');
INSERT INTO `tb_administrative_division` VALUES (1468, '西藏自治区', '540000', '林芝地区', '542600', '林芝县', '542621');
INSERT INTO `tb_administrative_division` VALUES (1469, '西藏自治区', '540000', '林芝地区', '542600', '察隅县', '542626');
INSERT INTO `tb_administrative_division` VALUES (1470, '西藏自治区', '540000', '林芝地区', '542600', '墨脱县', '542624');
INSERT INTO `tb_administrative_division` VALUES (1471, '西藏自治区', '540000', '林芝地区', '542600', '米林县', '542623');
INSERT INTO `tb_administrative_division` VALUES (1472, '西藏自治区', '540000', '林芝地区', '542600', '波密县', '542625');
INSERT INTO `tb_administrative_division` VALUES (1473, '西藏自治区', '540000', '林芝地区', '542600', '工布江达县', '542622');
INSERT INTO `tb_administrative_division` VALUES (1474, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '个旧市', '532501');
INSERT INTO `tb_administrative_division` VALUES (1475, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '开远市', '532502');
INSERT INTO `tb_administrative_division` VALUES (1476, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '屏边苗族自治县', '532523');
INSERT INTO `tb_administrative_division` VALUES (1477, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '建水县', '532524');
INSERT INTO `tb_administrative_division` VALUES (1478, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '石屏县', '532525');
INSERT INTO `tb_administrative_division` VALUES (1479, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '泸西县', '532527');
INSERT INTO `tb_administrative_division` VALUES (1480, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '金平苗族瑶族傣族自治县', '532530');
INSERT INTO `tb_administrative_division` VALUES (1481, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '绿春县', '532531');
INSERT INTO `tb_administrative_division` VALUES (1482, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '河口瑶族自治县', '532532');
INSERT INTO `tb_administrative_division` VALUES (1483, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '元阳县', '532528');
INSERT INTO `tb_administrative_division` VALUES (1484, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '蒙自县', '532522');
INSERT INTO `tb_administrative_division` VALUES (1485, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '红河县', '532529');
INSERT INTO `tb_administrative_division` VALUES (1486, '云南省', '530000', '红河哈尼族彝族自治州', '532500', '弥勒县', '532526');
INSERT INTO `tb_administrative_division` VALUES (1487, '云南省', '530000', '怒江傈僳族自治州', '533300', '泸水县', '533321');
INSERT INTO `tb_administrative_division` VALUES (1488, '云南省', '530000', '怒江傈僳族自治州', '533300', '福贡县', '533323');
INSERT INTO `tb_administrative_division` VALUES (1489, '云南省', '530000', '怒江傈僳族自治州', '533300', '贡山独龙族怒族自治县', '533324');
INSERT INTO `tb_administrative_division` VALUES (1490, '云南省', '530000', '怒江傈僳族自治州', '533300', '兰坪白族普米族自治县', '533325');
INSERT INTO `tb_administrative_division` VALUES (1491, '云南省', '530000', '玉溪市', '530400', '红塔区', '530402');
INSERT INTO `tb_administrative_division` VALUES (1492, '云南省', '530000', '玉溪市', '530400', '江川县', '530421');
INSERT INTO `tb_administrative_division` VALUES (1493, '云南省', '530000', '玉溪市', '530400', '易门县', '530425');
INSERT INTO `tb_administrative_division` VALUES (1494, '云南省', '530000', '玉溪市', '530400', '澄江县', '530422');
INSERT INTO `tb_administrative_division` VALUES (1495, '云南省', '530000', '玉溪市', '530400', '华宁县', '530424');
INSERT INTO `tb_administrative_division` VALUES (1496, '云南省', '530000', '玉溪市', '530400', '通海县', '530423');
INSERT INTO `tb_administrative_division` VALUES (1497, '云南省', '530000', '玉溪市', '530400', '新平彝族傣族自治县', '530427');
INSERT INTO `tb_administrative_division` VALUES (1498, '云南省', '530000', '玉溪市', '530400', '元江哈尼族彝族傣族自治县', '530428');
INSERT INTO `tb_administrative_division` VALUES (1499, '云南省', '530000', '玉溪市', '530400', '峨山彝族自治县', '530426');
INSERT INTO `tb_administrative_division` VALUES (1500, '云南省', '530000', '昆明市', '530100', '西山区', '530112');
INSERT INTO `tb_administrative_division` VALUES (1501, '云南省', '530000', '昆明市', '530100', '官渡区', '530111');
INSERT INTO `tb_administrative_division` VALUES (1502, '云南省', '530000', '昆明市', '530100', '盘龙区', '530103');
INSERT INTO `tb_administrative_division` VALUES (1503, '云南省', '530000', '昆明市', '530100', '寻甸回族彝族自治县', '530129');
INSERT INTO `tb_administrative_division` VALUES (1504, '云南省', '530000', '昆明市', '530100', '富民县', '530124');
INSERT INTO `tb_administrative_division` VALUES (1505, '云南省', '530000', '昆明市', '530100', '宜良县', '530125');
INSERT INTO `tb_administrative_division` VALUES (1506, '云南省', '530000', '昆明市', '530100', '东川区', '530113');
INSERT INTO `tb_administrative_division` VALUES (1507, '云南省', '530000', '昆明市', '530100', '呈贡县', '530121');
INSERT INTO `tb_administrative_division` VALUES (1508, '云南省', '530000', '昆明市', '530100', '晋宁县', '530122');
INSERT INTO `tb_administrative_division` VALUES (1509, '云南省', '530000', '昆明市', '530100', '嵩明县', '530127');
INSERT INTO `tb_administrative_division` VALUES (1510, '云南省', '530000', '昆明市', '530100', '禄劝彝族苗族自治县', '530128');
INSERT INTO `tb_administrative_division` VALUES (1511, '云南省', '530000', '昆明市', '530100', '安宁市', '530181');
INSERT INTO `tb_administrative_division` VALUES (1512, '云南省', '530000', '昆明市', '530100', '五华区', '530102');
INSERT INTO `tb_administrative_division` VALUES (1513, '云南省', '530000', '昆明市', '530100', '石林彝族自治县', '530126');
INSERT INTO `tb_administrative_division` VALUES (1514, '云南省', '530000', '普洱市', '530800', '墨江哈尼族自治县', '530822');
INSERT INTO `tb_administrative_division` VALUES (1515, '云南省', '530000', '普洱市', '530800', '思茅区', '530802');
INSERT INTO `tb_administrative_division` VALUES (1516, '云南省', '530000', '普洱市', '530800', '宁洱哈尼族彝族自治县', '530821');
INSERT INTO `tb_administrative_division` VALUES (1517, '云南省', '530000', '普洱市', '530800', '镇沅彝族哈尼族拉祜族自治县', '530825');
INSERT INTO `tb_administrative_division` VALUES (1518, '云南省', '530000', '普洱市', '530800', '景谷傣族彝族自治县', '530824');
INSERT INTO `tb_administrative_division` VALUES (1519, '云南省', '530000', '普洱市', '530800', '景东彝族自治县', '530823');
INSERT INTO `tb_administrative_division` VALUES (1520, '云南省', '530000', '普洱市', '530800', '孟连傣族拉祜族佤族自治县', '530827');
INSERT INTO `tb_administrative_division` VALUES (1521, '云南省', '530000', '普洱市', '530800', '澜沧拉祜族自治县', '530828');
INSERT INTO `tb_administrative_division` VALUES (1522, '云南省', '530000', '普洱市', '530800', '西盟佤族自治县', '530829');
INSERT INTO `tb_administrative_division` VALUES (1523, '云南省', '530000', '普洱市', '530800', '江城哈尼族彝族自治县', '530826');
INSERT INTO `tb_administrative_division` VALUES (1524, '云南省', '530000', '迪庆藏族自治州', '533400', '德钦县', '533422');
INSERT INTO `tb_administrative_division` VALUES (1525, '云南省', '530000', '迪庆藏族自治州', '533400', '香格里拉县', '533421');
INSERT INTO `tb_administrative_division` VALUES (1526, '云南省', '530000', '迪庆藏族自治州', '533400', '维西傈僳族自治县', '533423');
INSERT INTO `tb_administrative_division` VALUES (1527, '云南省', '530000', '丽江市', '530700', '古城区', '530702');
INSERT INTO `tb_administrative_division` VALUES (1528, '云南省', '530000', '丽江市', '530700', '玉龙纳西族自治县', '530721');
INSERT INTO `tb_administrative_division` VALUES (1529, '云南省', '530000', '丽江市', '530700', '永胜县', '530722');
INSERT INTO `tb_administrative_division` VALUES (1530, '云南省', '530000', '丽江市', '530700', '宁蒗彝族自治县', '530724');
INSERT INTO `tb_administrative_division` VALUES (1531, '云南省', '530000', '丽江市', '530700', '华坪县', '530723');
INSERT INTO `tb_administrative_division` VALUES (1532, '云南省', '530000', '大理白族自治州', '532900', '祥云县', '532923');
INSERT INTO `tb_administrative_division` VALUES (1533, '云南省', '530000', '大理白族自治州', '532900', '宾川县', '532924');
INSERT INTO `tb_administrative_division` VALUES (1534, '云南省', '530000', '大理白族自治州', '532900', '剑川县', '532931');
INSERT INTO `tb_administrative_division` VALUES (1535, '云南省', '530000', '大理白族自治州', '532900', '鹤庆县', '532932');
INSERT INTO `tb_administrative_division` VALUES (1536, '云南省', '530000', '大理白族自治州', '532900', '大理市', '532901');
INSERT INTO `tb_administrative_division` VALUES (1537, '云南省', '530000', '大理白族自治州', '532900', '漾濞彝族自治县', '532922');
INSERT INTO `tb_administrative_division` VALUES (1538, '云南省', '530000', '大理白族自治州', '532900', '永平县', '532928');
INSERT INTO `tb_administrative_division` VALUES (1539, '云南省', '530000', '大理白族自治州', '532900', '弥渡县', '532925');
INSERT INTO `tb_administrative_division` VALUES (1540, '云南省', '530000', '大理白族自治州', '532900', '云龙县', '532929');
INSERT INTO `tb_administrative_division` VALUES (1541, '云南省', '530000', '大理白族自治州', '532900', '洱源县', '532930');
INSERT INTO `tb_administrative_division` VALUES (1542, '云南省', '530000', '大理白族自治州', '532900', '巍山彝族回族自治县', '532927');
INSERT INTO `tb_administrative_division` VALUES (1543, '云南省', '530000', '大理白族自治州', '532900', '南涧彝族自治县', '532926');
INSERT INTO `tb_administrative_division` VALUES (1544, '云南省', '530000', '昭通市', '530600', '昭阳区', '530602');
INSERT INTO `tb_administrative_division` VALUES (1545, '云南省', '530000', '昭通市', '530600', '大关县', '530624');
INSERT INTO `tb_administrative_division` VALUES (1546, '云南省', '530000', '昭通市', '530600', '水富县', '530630');
INSERT INTO `tb_administrative_division` VALUES (1547, '云南省', '530000', '昭通市', '530600', '镇雄县', '530627');
INSERT INTO `tb_administrative_division` VALUES (1548, '云南省', '530000', '昭通市', '530600', '鲁甸县', '530621');
INSERT INTO `tb_administrative_division` VALUES (1549, '云南省', '530000', '昭通市', '530600', '盐津县', '530623');
INSERT INTO `tb_administrative_division` VALUES (1550, '云南省', '530000', '昭通市', '530600', '彝良县', '530628');
INSERT INTO `tb_administrative_division` VALUES (1551, '云南省', '530000', '昭通市', '530600', '威信县', '530629');
INSERT INTO `tb_administrative_division` VALUES (1552, '云南省', '530000', '昭通市', '530600', '巧家县', '530622');
INSERT INTO `tb_administrative_division` VALUES (1553, '云南省', '530000', '昭通市', '530600', '永善县', '530625');
INSERT INTO `tb_administrative_division` VALUES (1554, '云南省', '530000', '昭通市', '530600', '绥江县', '530626');
INSERT INTO `tb_administrative_division` VALUES (1555, '云南省', '530000', '楚雄彝族自治州', '532300', '双柏县', '532322');
INSERT INTO `tb_administrative_division` VALUES (1556, '云南省', '530000', '楚雄彝族自治州', '532300', '禄丰县', '532331');
INSERT INTO `tb_administrative_division` VALUES (1557, '云南省', '530000', '楚雄彝族自治州', '532300', '武定县', '532329');
INSERT INTO `tb_administrative_division` VALUES (1558, '云南省', '530000', '楚雄彝族自治州', '532300', '楚雄市', '532301');
INSERT INTO `tb_administrative_division` VALUES (1559, '云南省', '530000', '楚雄彝族自治州', '532300', '姚安县', '532325');
INSERT INTO `tb_administrative_division` VALUES (1560, '云南省', '530000', '楚雄彝族自治州', '532300', '永仁县', '532327');
INSERT INTO `tb_administrative_division` VALUES (1561, '云南省', '530000', '楚雄彝族自治州', '532300', '牟定县', '532323');
INSERT INTO `tb_administrative_division` VALUES (1562, '云南省', '530000', '楚雄彝族自治州', '532300', '南华县', '532324');
INSERT INTO `tb_administrative_division` VALUES (1563, '云南省', '530000', '楚雄彝族自治州', '532300', '元谋县', '532328');
INSERT INTO `tb_administrative_division` VALUES (1564, '云南省', '530000', '楚雄彝族自治州', '532300', '大姚县', '532326');
INSERT INTO `tb_administrative_division` VALUES (1565, '云南省', '530000', '临沧市', '530900', '临翔区', '530902');
INSERT INTO `tb_administrative_division` VALUES (1566, '云南省', '530000', '临沧市', '530900', '云县', '530922');
INSERT INTO `tb_administrative_division` VALUES (1567, '云南省', '530000', '临沧市', '530900', '镇康县', '530924');
INSERT INTO `tb_administrative_division` VALUES (1568, '云南省', '530000', '临沧市', '530900', '凤庆县', '530921');
INSERT INTO `tb_administrative_division` VALUES (1569, '云南省', '530000', '临沧市', '530900', '永德县', '530923');
INSERT INTO `tb_administrative_division` VALUES (1570, '云南省', '530000', '临沧市', '530900', '双江拉祜族佤族布朗族傣族自治县', '530925');
INSERT INTO `tb_administrative_division` VALUES (1571, '云南省', '530000', '临沧市', '530900', '沧源佤族自治县', '530927');
INSERT INTO `tb_administrative_division` VALUES (1572, '云南省', '530000', '临沧市', '530900', '耿马傣族佤族自治县', '530926');
INSERT INTO `tb_administrative_division` VALUES (1573, '云南省', '530000', '文山壮族苗族自治州', '532600', '麻栗坡县', '532624');
INSERT INTO `tb_administrative_division` VALUES (1574, '云南省', '530000', '文山壮族苗族自治州', '532600', '广南县', '532627');
INSERT INTO `tb_administrative_division` VALUES (1575, '云南省', '530000', '文山壮族苗族自治州', '532600', '西畴县', '532623');
INSERT INTO `tb_administrative_division` VALUES (1576, '云南省', '530000', '文山壮族苗族自治州', '532600', '富宁县', '532628');
INSERT INTO `tb_administrative_division` VALUES (1577, '云南省', '530000', '文山壮族苗族自治州', '532600', '砚山县', '532622');
INSERT INTO `tb_administrative_division` VALUES (1578, '云南省', '530000', '文山壮族苗族自治州', '532600', '马关县', '532625');
INSERT INTO `tb_administrative_division` VALUES (1579, '云南省', '530000', '文山壮族苗族自治州', '532600', '文山县', '532621');
INSERT INTO `tb_administrative_division` VALUES (1580, '云南省', '530000', '文山壮族苗族自治州', '532600', '丘北县', '532626');
INSERT INTO `tb_administrative_division` VALUES (1581, '云南省', '530000', '德宏傣族景颇族自治州', '533100', '瑞丽市', '533102');
INSERT INTO `tb_administrative_division` VALUES (1582, '云南省', '530000', '德宏傣族景颇族自治州', '533100', '梁河县', '533122');
INSERT INTO `tb_administrative_division` VALUES (1583, '云南省', '530000', '德宏傣族景颇族自治州', '533100', '盈江县', '533123');
INSERT INTO `tb_administrative_division` VALUES (1584, '云南省', '530000', '德宏傣族景颇族自治州', '533100', '陇川县', '533124');
INSERT INTO `tb_administrative_division` VALUES (1585, '云南省', '530000', '德宏傣族景颇族自治州', '533100', '芒市', '533103');
INSERT INTO `tb_administrative_division` VALUES (1586, '云南省', '530000', '保山市', '530500', '隆阳区', '530502');
INSERT INTO `tb_administrative_division` VALUES (1587, '云南省', '530000', '保山市', '530500', '腾冲县', '530522');
INSERT INTO `tb_administrative_division` VALUES (1588, '云南省', '530000', '保山市', '530500', '龙陵县', '530523');
INSERT INTO `tb_administrative_division` VALUES (1589, '云南省', '530000', '保山市', '530500', '施甸县', '530521');
INSERT INTO `tb_administrative_division` VALUES (1590, '云南省', '530000', '保山市', '530500', '昌宁县', '530524');
INSERT INTO `tb_administrative_division` VALUES (1591, '云南省', '530000', '西双版纳傣族自治州', '532800', '勐海县', '532822');
INSERT INTO `tb_administrative_division` VALUES (1592, '云南省', '530000', '西双版纳傣族自治州', '532800', '景洪市', '532801');
INSERT INTO `tb_administrative_division` VALUES (1593, '云南省', '530000', '西双版纳傣族自治州', '532800', '勐腊县', '532823');
INSERT INTO `tb_administrative_division` VALUES (1594, '云南省', '530000', '曲靖市', '530300', '麒麟区', '530302');
INSERT INTO `tb_administrative_division` VALUES (1595, '云南省', '530000', '曲靖市', '530300', '陆良县', '530322');
INSERT INTO `tb_administrative_division` VALUES (1596, '云南省', '530000', '曲靖市', '530300', '沾益县', '530328');
INSERT INTO `tb_administrative_division` VALUES (1597, '云南省', '530000', '曲靖市', '530300', '宣威市', '530381');
INSERT INTO `tb_administrative_division` VALUES (1598, '云南省', '530000', '曲靖市', '530300', '马龙县', '530321');
INSERT INTO `tb_administrative_division` VALUES (1599, '云南省', '530000', '曲靖市', '530300', '师宗县', '530323');
INSERT INTO `tb_administrative_division` VALUES (1600, '云南省', '530000', '曲靖市', '530300', '罗平县', '530324');
INSERT INTO `tb_administrative_division` VALUES (1601, '云南省', '530000', '曲靖市', '530300', '富源县', '530325');
INSERT INTO `tb_administrative_division` VALUES (1602, '云南省', '530000', '曲靖市', '530300', '会泽县', '530326');
INSERT INTO `tb_administrative_division` VALUES (1603, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '台江县', '522630');
INSERT INTO `tb_administrative_division` VALUES (1604, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '榕江县', '522632');
INSERT INTO `tb_administrative_division` VALUES (1605, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '锦屏县', '522628');
INSERT INTO `tb_administrative_division` VALUES (1606, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '三穗县', '522624');
INSERT INTO `tb_administrative_division` VALUES (1607, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '镇远县', '522625');
INSERT INTO `tb_administrative_division` VALUES (1608, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '从江县', '522633');
INSERT INTO `tb_administrative_division` VALUES (1609, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '天柱县', '522627');
INSERT INTO `tb_administrative_division` VALUES (1610, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '黎平县', '522631');
INSERT INTO `tb_administrative_division` VALUES (1611, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '麻江县', '522635');
INSERT INTO `tb_administrative_division` VALUES (1612, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '黄平县', '522622');
INSERT INTO `tb_administrative_division` VALUES (1613, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '剑河县', '522629');
INSERT INTO `tb_administrative_division` VALUES (1614, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '施秉县', '522623');
INSERT INTO `tb_administrative_division` VALUES (1615, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '雷山县', '522634');
INSERT INTO `tb_administrative_division` VALUES (1616, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '丹寨县', '522636');
INSERT INTO `tb_administrative_division` VALUES (1617, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '凯里市', '522601');
INSERT INTO `tb_administrative_division` VALUES (1618, '贵州省', '520000', '黔东南苗族侗族自治州', '522600', '岑巩县', '522626');
INSERT INTO `tb_administrative_division` VALUES (1619, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '龙里县', '522730');
INSERT INTO `tb_administrative_division` VALUES (1620, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '罗甸县', '522728');
INSERT INTO `tb_administrative_division` VALUES (1621, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '荔波县', '522722');
INSERT INTO `tb_administrative_division` VALUES (1622, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '惠水县', '522731');
INSERT INTO `tb_administrative_division` VALUES (1623, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '平塘县', '522727');
INSERT INTO `tb_administrative_division` VALUES (1624, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '贵定县', '522723');
INSERT INTO `tb_administrative_division` VALUES (1625, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '三都水族自治县', '522732');
INSERT INTO `tb_administrative_division` VALUES (1626, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '都匀市', '522701');
INSERT INTO `tb_administrative_division` VALUES (1627, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '长顺县', '522729');
INSERT INTO `tb_administrative_division` VALUES (1628, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '瓮安县', '522725');
INSERT INTO `tb_administrative_division` VALUES (1629, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '福泉市', '522702');
INSERT INTO `tb_administrative_division` VALUES (1630, '贵州省', '520000', '黔南布依族苗族自治州', '522700', '独山县', '522726');
INSERT INTO `tb_administrative_division` VALUES (1631, '贵州省', '520000', '毕节市', '522400', '赫章县', '522428');
INSERT INTO `tb_administrative_division` VALUES (1632, '贵州省', '520000', '毕节市', '522400', '威宁彝族回族苗族自治县', '522427');
INSERT INTO `tb_administrative_division` VALUES (1633, '贵州省', '520000', '毕节市', '522400', '织金县', '522425');
INSERT INTO `tb_administrative_division` VALUES (1634, '贵州省', '520000', '毕节市', '522400', '毕节市', '522401');
INSERT INTO `tb_administrative_division` VALUES (1635, '贵州省', '520000', '毕节市', '522400', '黔西县', '522423');
INSERT INTO `tb_administrative_division` VALUES (1636, '贵州省', '520000', '毕节市', '522400', '纳雍县', '522426');
INSERT INTO `tb_administrative_division` VALUES (1637, '贵州省', '520000', '毕节市', '522400', '金沙县', '522424');
INSERT INTO `tb_administrative_division` VALUES (1638, '贵州省', '520000', '毕节市', '522400', '大方县', '522422');
INSERT INTO `tb_administrative_division` VALUES (1639, '贵州省', '520000', '毕节市', '522400', '七星关区', '520502');
INSERT INTO `tb_administrative_division` VALUES (1640, '贵州省', '520000', '贵阳市', '520100', '息烽县', '520122');
INSERT INTO `tb_administrative_division` VALUES (1641, '贵州省', '520000', '贵阳市', '520100', '清镇市', '520181');
INSERT INTO `tb_administrative_division` VALUES (1642, '贵州省', '520000', '贵阳市', '520100', '南明区', '520102');
INSERT INTO `tb_administrative_division` VALUES (1643, '贵州省', '520000', '贵阳市', '520100', '云岩区', '520103');
INSERT INTO `tb_administrative_division` VALUES (1644, '贵州省', '520000', '贵阳市', '520100', '白云区', '520113');
INSERT INTO `tb_administrative_division` VALUES (1645, '贵州省', '520000', '贵阳市', '520100', '小河区', '520114');
INSERT INTO `tb_administrative_division` VALUES (1646, '贵州省', '520000', '贵阳市', '520100', '乌当区', '520112');
INSERT INTO `tb_administrative_division` VALUES (1647, '贵州省', '520000', '贵阳市', '520100', '修文县', '520123');
INSERT INTO `tb_administrative_division` VALUES (1648, '贵州省', '520000', '贵阳市', '520100', '开阳县', '520121');
INSERT INTO `tb_administrative_division` VALUES (1649, '贵州省', '520000', '贵阳市', '520100', '观山湖区', '520115');
INSERT INTO `tb_administrative_division` VALUES (1650, '贵州省', '520000', '贵阳市', '520100', '花溪区', '520111');
INSERT INTO `tb_administrative_division` VALUES (1651, '贵州省', '520000', '黔西南布依族苗族自治州', '522300', '安龙县', '522328');
INSERT INTO `tb_administrative_division` VALUES (1652, '贵州省', '520000', '黔西南布依族苗族自治州', '522300', '兴义市', '522301');
INSERT INTO `tb_administrative_division` VALUES (1653, '贵州省', '520000', '黔西南布依族苗族自治州', '522300', '贞丰县', '522325');
INSERT INTO `tb_administrative_division` VALUES (1654, '贵州省', '520000', '黔西南布依族苗族自治州', '522300', '晴隆县', '522324');
INSERT INTO `tb_administrative_division` VALUES (1655, '贵州省', '520000', '黔西南布依族苗族自治州', '522300', '兴仁县', '522322');
INSERT INTO `tb_administrative_division` VALUES (1656, '贵州省', '520000', '黔西南布依族苗族自治州', '522300', '册亨县', '522327');
INSERT INTO `tb_administrative_division` VALUES (1657, '贵州省', '520000', '黔西南布依族苗族自治州', '522300', '普安县', '522323');
INSERT INTO `tb_administrative_division` VALUES (1658, '贵州省', '520000', '黔西南布依族苗族自治州', '522300', '望谟县', '522326');
INSERT INTO `tb_administrative_division` VALUES (1659, '贵州省', '520000', '铜仁市', '522200', '思南县', '522225');
INSERT INTO `tb_administrative_division` VALUES (1660, '贵州省', '520000', '铜仁市', '522200', '松桃苗族自治县', '522229');
INSERT INTO `tb_administrative_division` VALUES (1661, '贵州省', '520000', '铜仁市', '522200', '德江县', '522227');
INSERT INTO `tb_administrative_division` VALUES (1662, '贵州省', '520000', '铜仁市', '522200', '玉屏侗族自治县', '522223');
INSERT INTO `tb_administrative_division` VALUES (1663, '贵州省', '520000', '铜仁市', '522200', '铜仁市', '522201');
INSERT INTO `tb_administrative_division` VALUES (1664, '贵州省', '520000', '铜仁市', '522200', '万山区', '522230');
INSERT INTO `tb_administrative_division` VALUES (1665, '贵州省', '520000', '铜仁市', '522200', '石阡县', '522224');
INSERT INTO `tb_administrative_division` VALUES (1666, '贵州省', '520000', '铜仁市', '522200', '沿河土家族自治县', '522228');
INSERT INTO `tb_administrative_division` VALUES (1667, '贵州省', '520000', '铜仁市', '522200', '江口县', '522222');
INSERT INTO `tb_administrative_division` VALUES (1668, '贵州省', '520000', '铜仁市', '522200', '碧江区', '520602');
INSERT INTO `tb_administrative_division` VALUES (1669, '贵州省', '520000', '铜仁市', '522200', '印江土家族苗族自治县', '522226');
INSERT INTO `tb_administrative_division` VALUES (1670, '贵州省', '520000', '安顺市', '520400', '镇宁布依族苗族自治县', '520423');
INSERT INTO `tb_administrative_division` VALUES (1671, '贵州省', '520000', '安顺市', '520400', '紫云苗族布依族自治县', '520425');
INSERT INTO `tb_administrative_division` VALUES (1672, '贵州省', '520000', '安顺市', '520400', '平坝县', '520421');
INSERT INTO `tb_administrative_division` VALUES (1673, '贵州省', '520000', '安顺市', '520400', '关岭布依族苗族自治县', '520424');
INSERT INTO `tb_administrative_division` VALUES (1674, '贵州省', '520000', '安顺市', '520400', '西秀区', '520402');
INSERT INTO `tb_administrative_division` VALUES (1675, '贵州省', '520000', '安顺市', '520400', '普定县', '520422');
INSERT INTO `tb_administrative_division` VALUES (1676, '贵州省', '520000', '六盘水市', '520200', '水城县', '520221');
INSERT INTO `tb_administrative_division` VALUES (1677, '贵州省', '520000', '六盘水市', '520200', '钟山区', '520201');
INSERT INTO `tb_administrative_division` VALUES (1678, '贵州省', '520000', '六盘水市', '520200', '六枝特区', '520203');
INSERT INTO `tb_administrative_division` VALUES (1679, '贵州省', '520000', '六盘水市', '520200', '盘县', '520222');
INSERT INTO `tb_administrative_division` VALUES (1680, '贵州省', '520000', '六盘水市', '520200', '盘州市', '520281');
INSERT INTO `tb_administrative_division` VALUES (1681, '贵州省', '520000', '遵义市', '520300', '习水县', '520330');
INSERT INTO `tb_administrative_division` VALUES (1682, '贵州省', '520000', '遵义市', '520300', '汇川区', '520303');
INSERT INTO `tb_administrative_division` VALUES (1683, '贵州省', '520000', '遵义市', '520300', '正安县', '520324');
INSERT INTO `tb_administrative_division` VALUES (1684, '贵州省', '520000', '遵义市', '520300', '绥阳县', '520323');
INSERT INTO `tb_administrative_division` VALUES (1685, '贵州省', '520000', '遵义市', '520300', '桐梓县', '520322');
INSERT INTO `tb_administrative_division` VALUES (1686, '贵州省', '520000', '遵义市', '520300', '湄潭县', '520328');
INSERT INTO `tb_administrative_division` VALUES (1687, '贵州省', '520000', '遵义市', '520300', '仁怀市', '520382');
INSERT INTO `tb_administrative_division` VALUES (1688, '贵州省', '520000', '遵义市', '520300', '余庆县', '520329');
INSERT INTO `tb_administrative_division` VALUES (1689, '贵州省', '520000', '遵义市', '520300', '红花岗区', '520302');
INSERT INTO `tb_administrative_division` VALUES (1690, '贵州省', '520000', '遵义市', '520300', '道真仡佬族苗族自治县', '520325');
INSERT INTO `tb_administrative_division` VALUES (1691, '贵州省', '520000', '遵义市', '520300', '赤水市', '520381');
INSERT INTO `tb_administrative_division` VALUES (1692, '贵州省', '520000', '遵义市', '520300', '凤冈县', '520327');
INSERT INTO `tb_administrative_division` VALUES (1693, '贵州省', '520000', '遵义市', '520300', '务川仡佬族苗族自治县', '520326');
INSERT INTO `tb_administrative_division` VALUES (1694, '贵州省', '520000', '遵义市', '520300', '播州区', '520321');
INSERT INTO `tb_administrative_division` VALUES (1695, '青海省', '630000', '海西蒙古族藏族自治州', '632800', '冷湖', '632825');
INSERT INTO `tb_administrative_division` VALUES (1696, '青海省', '630000', '海西蒙古族藏族自治州', '632800', '大柴旦', '632824');
INSERT INTO `tb_administrative_division` VALUES (1697, '青海省', '630000', '海西蒙古族藏族自治州', '632800', '都兰县', '632822');
INSERT INTO `tb_administrative_division` VALUES (1698, '青海省', '630000', '海西蒙古族藏族自治州', '632800', '天峻县', '632823');
INSERT INTO `tb_administrative_division` VALUES (1699, '青海省', '630000', '海西蒙古族藏族自治州', '632800', '乌兰县', '632821');
INSERT INTO `tb_administrative_division` VALUES (1700, '青海省', '630000', '海西蒙古族藏族自治州', '632800', '德令哈市', '632802');
INSERT INTO `tb_administrative_division` VALUES (1701, '青海省', '630000', '海西蒙古族藏族自治州', '632800', '格尔木市', '632801');
INSERT INTO `tb_administrative_division` VALUES (1702, '青海省', '630000', '海西蒙古族藏族自治州', '632800', '茫崖', '632826');
INSERT INTO `tb_administrative_division` VALUES (1703, '青海省', '630000', '玉树藏族自治州', '632700', '治多县', '632724');
INSERT INTO `tb_administrative_division` VALUES (1704, '青海省', '630000', '玉树藏族自治州', '632700', '称多县', '632723');
INSERT INTO `tb_administrative_division` VALUES (1705, '青海省', '630000', '玉树藏族自治州', '632700', '囊谦县', '632725');
INSERT INTO `tb_administrative_division` VALUES (1706, '青海省', '630000', '玉树藏族自治州', '632700', '杂多县', '632722');
INSERT INTO `tb_administrative_division` VALUES (1707, '青海省', '630000', '玉树藏族自治州', '632700', '玉树县', '632721');
INSERT INTO `tb_administrative_division` VALUES (1708, '青海省', '630000', '玉树藏族自治州', '632700', '曲麻莱县', '632726');
INSERT INTO `tb_administrative_division` VALUES (1709, '青海省', '630000', '黄南藏族自治州', '632300', '河南蒙古族自治县', '632324');
INSERT INTO `tb_administrative_division` VALUES (1710, '青海省', '630000', '黄南藏族自治州', '632300', '尖扎县', '632322');
INSERT INTO `tb_administrative_division` VALUES (1711, '青海省', '630000', '黄南藏族自治州', '632300', '同仁县', '632321');
INSERT INTO `tb_administrative_division` VALUES (1712, '青海省', '630000', '黄南藏族自治州', '632300', '泽库县', '632323');
INSERT INTO `tb_administrative_division` VALUES (1713, '青海省', '630000', '海南藏族自治州', '632500', '兴海县', '632524');
INSERT INTO `tb_administrative_division` VALUES (1714, '青海省', '630000', '海南藏族自治州', '632500', '贵德县', '632523');
INSERT INTO `tb_administrative_division` VALUES (1715, '青海省', '630000', '海南藏族自治州', '632500', '共和县', '632521');
INSERT INTO `tb_administrative_division` VALUES (1716, '青海省', '630000', '海南藏族自治州', '632500', '同德县', '632522');
INSERT INTO `tb_administrative_division` VALUES (1717, '青海省', '630000', '海南藏族自治州', '632500', '贵南县', '632525');
INSERT INTO `tb_administrative_division` VALUES (1718, '青海省', '630000', '海东地区', '632100', '民和回族土族自治县', '632122');
INSERT INTO `tb_administrative_division` VALUES (1719, '青海省', '630000', '海东地区', '632100', '化隆回族自治县', '632127');
INSERT INTO `tb_administrative_division` VALUES (1720, '青海省', '630000', '海东地区', '632100', '乐都县', '632123');
INSERT INTO `tb_administrative_division` VALUES (1721, '青海省', '630000', '海东地区', '632100', '平安县', '632121');
INSERT INTO `tb_administrative_division` VALUES (1722, '青海省', '630000', '海东地区', '632100', '循化撒拉族自治县', '632128');
INSERT INTO `tb_administrative_division` VALUES (1723, '青海省', '630000', '海东地区', '632100', '互助土族自治县', '632126');
INSERT INTO `tb_administrative_division` VALUES (1724, '青海省', '630000', '果洛藏族自治州', '632600', '玛多县', '632626');
INSERT INTO `tb_administrative_division` VALUES (1725, '青海省', '630000', '果洛藏族自治州', '632600', '达日县', '632624');
INSERT INTO `tb_administrative_division` VALUES (1726, '青海省', '630000', '果洛藏族自治州', '632600', '班玛县', '632622');
INSERT INTO `tb_administrative_division` VALUES (1727, '青海省', '630000', '果洛藏族自治州', '632600', '久治县', '632625');
INSERT INTO `tb_administrative_division` VALUES (1728, '青海省', '630000', '果洛藏族自治州', '632600', '甘德县', '632623');
INSERT INTO `tb_administrative_division` VALUES (1729, '青海省', '630000', '果洛藏族自治州', '632600', '玛沁县', '632621');
INSERT INTO `tb_administrative_division` VALUES (1730, '青海省', '630000', '西宁市', '630100', '湟中县', '630122');
INSERT INTO `tb_administrative_division` VALUES (1731, '青海省', '630000', '西宁市', '630100', '城中区', '630103');
INSERT INTO `tb_administrative_division` VALUES (1732, '青海省', '630000', '西宁市', '630100', '城西区', '630104');
INSERT INTO `tb_administrative_division` VALUES (1733, '青海省', '630000', '西宁市', '630100', '大通回族土族自治县', '630121');
INSERT INTO `tb_administrative_division` VALUES (1734, '青海省', '630000', '西宁市', '630100', '城北区', '630105');
INSERT INTO `tb_administrative_division` VALUES (1735, '青海省', '630000', '西宁市', '630100', '湟源县', '630123');
INSERT INTO `tb_administrative_division` VALUES (1736, '青海省', '630000', '西宁市', '630100', '城东区', '630102');
INSERT INTO `tb_administrative_division` VALUES (1737, '青海省', '630000', '海北藏族自治州', '632200', '门源回族自治县', '632221');
INSERT INTO `tb_administrative_division` VALUES (1738, '青海省', '630000', '海北藏族自治州', '632200', '海晏县', '632223');
INSERT INTO `tb_administrative_division` VALUES (1739, '青海省', '630000', '海北藏族自治州', '632200', '刚察县', '632224');
INSERT INTO `tb_administrative_division` VALUES (1740, '青海省', '630000', '海北藏族自治州', '632200', '祁连县', '632222');
INSERT INTO `tb_administrative_division` VALUES (1741, '四川省', '510000', '资阳市', '512000', '雁江区', '512002');
INSERT INTO `tb_administrative_division` VALUES (1742, '四川省', '510000', '资阳市', '512000', '安岳县', '512021');
INSERT INTO `tb_administrative_division` VALUES (1743, '四川省', '510000', '资阳市', '512000', '乐至县', '512022');
INSERT INTO `tb_administrative_division` VALUES (1744, '四川省', '510000', '广元市', '510800', '旺苍县', '510821');
INSERT INTO `tb_administrative_division` VALUES (1745, '四川省', '510000', '广元市', '510800', '苍溪县', '510824');
INSERT INTO `tb_administrative_division` VALUES (1746, '四川省', '510000', '广元市', '510800', '剑阁县', '510823');
INSERT INTO `tb_administrative_division` VALUES (1747, '四川省', '510000', '广元市', '510800', '青川县', '510822');
INSERT INTO `tb_administrative_division` VALUES (1748, '四川省', '510000', '广元市', '510800', '利州区', '510802');
INSERT INTO `tb_administrative_division` VALUES (1749, '四川省', '510000', '广元市', '510800', '昭化区', '510811');
INSERT INTO `tb_administrative_division` VALUES (1750, '四川省', '510000', '广元市', '510800', '朝天区', '510812');
INSERT INTO `tb_administrative_division` VALUES (1751, '四川省', '510000', '甘孜藏族自治州', '513300', '德格县', '513330');
INSERT INTO `tb_administrative_division` VALUES (1752, '四川省', '510000', '甘孜藏族自治州', '513300', '石渠县', '513332');
INSERT INTO `tb_administrative_division` VALUES (1753, '四川省', '510000', '甘孜藏族自治州', '513300', '甘孜县', '513328');
INSERT INTO `tb_administrative_division` VALUES (1754, '四川省', '510000', '甘孜藏族自治州', '513300', '九龙县', '513324');
INSERT INTO `tb_administrative_division` VALUES (1755, '四川省', '510000', '甘孜藏族自治州', '513300', '新龙县', '513329');
INSERT INTO `tb_administrative_division` VALUES (1756, '四川省', '510000', '甘孜藏族自治州', '513300', '炉霍县', '513327');
INSERT INTO `tb_administrative_division` VALUES (1757, '四川省', '510000', '甘孜藏族自治州', '513300', '白玉县', '513331');
INSERT INTO `tb_administrative_division` VALUES (1758, '四川省', '510000', '甘孜藏族自治州', '513300', '色达县', '513333');
INSERT INTO `tb_administrative_division` VALUES (1759, '四川省', '510000', '甘孜藏族自治州', '513300', '理塘县', '513334');
INSERT INTO `tb_administrative_division` VALUES (1760, '四川省', '510000', '甘孜藏族自治州', '513300', '稻城县', '513337');
INSERT INTO `tb_administrative_division` VALUES (1761, '四川省', '510000', '甘孜藏族自治州', '513300', '巴塘县', '513335');
INSERT INTO `tb_administrative_division` VALUES (1762, '四川省', '510000', '甘孜藏族自治州', '513300', '雅江县', '513325');
INSERT INTO `tb_administrative_division` VALUES (1763, '四川省', '510000', '甘孜藏族自治州', '513300', '丹巴县', '513323');
INSERT INTO `tb_administrative_division` VALUES (1764, '四川省', '510000', '甘孜藏族自治州', '513300', '康定县', '513321');
INSERT INTO `tb_administrative_division` VALUES (1765, '四川省', '510000', '甘孜藏族自治州', '513300', '乡城县', '513336');
INSERT INTO `tb_administrative_division` VALUES (1766, '四川省', '510000', '甘孜藏族自治州', '513300', '泸定县', '513322');
INSERT INTO `tb_administrative_division` VALUES (1767, '四川省', '510000', '甘孜藏族自治州', '513300', '得荣县', '513338');
INSERT INTO `tb_administrative_division` VALUES (1768, '四川省', '510000', '甘孜藏族自治州', '513300', '道孚县', '513326');
INSERT INTO `tb_administrative_division` VALUES (1769, '四川省', '510000', '泸州市', '510500', '龙马潭区', '510504');
INSERT INTO `tb_administrative_division` VALUES (1770, '四川省', '510000', '泸州市', '510500', '泸县', '510521');
INSERT INTO `tb_administrative_division` VALUES (1771, '四川省', '510000', '泸州市', '510500', '江阳区', '510502');
INSERT INTO `tb_administrative_division` VALUES (1772, '四川省', '510000', '泸州市', '510500', '古蔺县', '510525');
INSERT INTO `tb_administrative_division` VALUES (1773, '四川省', '510000', '泸州市', '510500', '合江县', '510522');
INSERT INTO `tb_administrative_division` VALUES (1774, '四川省', '510000', '泸州市', '510500', '叙永县', '510524');
INSERT INTO `tb_administrative_division` VALUES (1775, '四川省', '510000', '泸州市', '510500', '纳溪区', '510503');
INSERT INTO `tb_administrative_division` VALUES (1776, '四川省', '510000', '眉山市', '511400', '仁寿县', '511421');
INSERT INTO `tb_administrative_division` VALUES (1777, '四川省', '510000', '眉山市', '511400', '东坡区', '511402');
INSERT INTO `tb_administrative_division` VALUES (1778, '四川省', '510000', '眉山市', '511400', '丹棱县', '511424');
INSERT INTO `tb_administrative_division` VALUES (1779, '四川省', '510000', '眉山市', '511400', '彭山县', '511422');
INSERT INTO `tb_administrative_division` VALUES (1780, '四川省', '510000', '眉山市', '511400', '青神县', '511425');
INSERT INTO `tb_administrative_division` VALUES (1781, '四川省', '510000', '眉山市', '511400', '洪雅县', '511423');
INSERT INTO `tb_administrative_division` VALUES (1782, '四川省', '510000', '达州市', '511700', '宣汉县', '511722');
INSERT INTO `tb_administrative_division` VALUES (1783, '四川省', '510000', '达州市', '511700', '大竹县', '511724');
INSERT INTO `tb_administrative_division` VALUES (1784, '四川省', '510000', '达州市', '511700', '通川区', '511702');
INSERT INTO `tb_administrative_division` VALUES (1785, '四川省', '510000', '达州市', '511700', '万源市', '511781');
INSERT INTO `tb_administrative_division` VALUES (1786, '四川省', '510000', '达州市', '511700', '开江县', '511723');
INSERT INTO `tb_administrative_division` VALUES (1787, '四川省', '510000', '达州市', '511700', '渠县', '511725');
INSERT INTO `tb_administrative_division` VALUES (1788, '四川省', '510000', '达州市', '511700', '达川区', '511721');
INSERT INTO `tb_administrative_division` VALUES (1789, '四川省', '510000', '宜宾市', '511500', '兴文县', '511528');
INSERT INTO `tb_administrative_division` VALUES (1790, '四川省', '510000', '宜宾市', '511500', '南溪县', '511522');
INSERT INTO `tb_administrative_division` VALUES (1791, '四川省', '510000', '宜宾市', '511500', '高县', '511525');
INSERT INTO `tb_administrative_division` VALUES (1792, '四川省', '510000', '宜宾市', '511500', '长宁县', '511524');
INSERT INTO `tb_administrative_division` VALUES (1793, '四川省', '510000', '宜宾市', '511500', '屏山县', '511529');
INSERT INTO `tb_administrative_division` VALUES (1794, '四川省', '510000', '宜宾市', '511500', '筠连县', '511527');
INSERT INTO `tb_administrative_division` VALUES (1795, '四川省', '510000', '宜宾市', '511500', '叙州区', '511521');
INSERT INTO `tb_administrative_division` VALUES (1796, '四川省', '510000', '宜宾市', '511500', '江安县', '511523');
INSERT INTO `tb_administrative_division` VALUES (1797, '四川省', '510000', '宜宾市', '511500', '翠屏区', '511502');
INSERT INTO `tb_administrative_division` VALUES (1798, '四川省', '510000', '宜宾市', '511500', '珙县', '511526');
INSERT INTO `tb_administrative_division` VALUES (1799, '四川省', '510000', '乐山市', '511100', '峨边彝族自治县', '511132');
INSERT INTO `tb_administrative_division` VALUES (1800, '四川省', '510000', '乐山市', '511100', '马边彝族自治县', '511133');
INSERT INTO `tb_administrative_division` VALUES (1801, '四川省', '510000', '乐山市', '511100', '五通桥区', '511112');
INSERT INTO `tb_administrative_division` VALUES (1802, '四川省', '510000', '乐山市', '511100', '峨眉山市', '511181');
INSERT INTO `tb_administrative_division` VALUES (1803, '四川省', '510000', '乐山市', '511100', '金口河区', '511113');
INSERT INTO `tb_administrative_division` VALUES (1804, '四川省', '510000', '乐山市', '511100', '市中区', '511102');
INSERT INTO `tb_administrative_division` VALUES (1805, '四川省', '510000', '乐山市', '511100', '沐川县', '511129');
INSERT INTO `tb_administrative_division` VALUES (1806, '四川省', '510000', '乐山市', '511100', '犍为县', '511123');
INSERT INTO `tb_administrative_division` VALUES (1807, '四川省', '510000', '乐山市', '511100', '夹江县', '511126');
INSERT INTO `tb_administrative_division` VALUES (1808, '四川省', '510000', '乐山市', '511100', '沙湾区', '511111');
INSERT INTO `tb_administrative_division` VALUES (1809, '四川省', '510000', '乐山市', '511100', '井研县', '511124');
INSERT INTO `tb_administrative_division` VALUES (1810, '四川省', '510000', '巴中市', '511900', '平昌县', '511923');
INSERT INTO `tb_administrative_division` VALUES (1811, '四川省', '510000', '巴中市', '511900', '通江县', '511921');
INSERT INTO `tb_administrative_division` VALUES (1812, '四川省', '510000', '巴中市', '511900', '南江县', '511922');
INSERT INTO `tb_administrative_division` VALUES (1813, '四川省', '510000', '巴中市', '511900', '巴州区', '511902');
INSERT INTO `tb_administrative_division` VALUES (1814, '四川省', '510000', '巴中市', '511900', '恩阳区', '511903');
INSERT INTO `tb_administrative_division` VALUES (1815, '四川省', '510000', '绵阳市', '510700', '盐亭县', '510723');
INSERT INTO `tb_administrative_division` VALUES (1816, '四川省', '510000', '绵阳市', '510700', '涪城区', '510703');
INSERT INTO `tb_administrative_division` VALUES (1817, '四川省', '510000', '绵阳市', '510700', '三台县', '510722');
INSERT INTO `tb_administrative_division` VALUES (1818, '四川省', '510000', '绵阳市', '510700', '游仙区', '510704');
INSERT INTO `tb_administrative_division` VALUES (1819, '四川省', '510000', '绵阳市', '510700', '梓潼县', '510725');
INSERT INTO `tb_administrative_division` VALUES (1820, '四川省', '510000', '绵阳市', '510700', '平武县', '510727');
INSERT INTO `tb_administrative_division` VALUES (1821, '四川省', '510000', '绵阳市', '510700', '安州区', '510724');
INSERT INTO `tb_administrative_division` VALUES (1822, '四川省', '510000', '绵阳市', '510700', '江油市', '510781');
INSERT INTO `tb_administrative_division` VALUES (1823, '四川省', '510000', '绵阳市', '510700', '北川羌族自治县', '510726');
INSERT INTO `tb_administrative_division` VALUES (1824, '四川省', '510000', '攀枝花市', '510400', '盐边县', '510422');
INSERT INTO `tb_administrative_division` VALUES (1825, '四川省', '510000', '攀枝花市', '510400', '仁和区', '510411');
INSERT INTO `tb_administrative_division` VALUES (1826, '四川省', '510000', '攀枝花市', '510400', '西区', '510403');
INSERT INTO `tb_administrative_division` VALUES (1827, '四川省', '510000', '攀枝花市', '510400', '东区', '510402');
INSERT INTO `tb_administrative_division` VALUES (1828, '四川省', '510000', '攀枝花市', '510400', '米易县', '510421');
INSERT INTO `tb_administrative_division` VALUES (1829, '四川省', '510000', '自贡市', '510300', '沿滩区', '510311');
INSERT INTO `tb_administrative_division` VALUES (1830, '四川省', '510000', '自贡市', '510300', '自流井区', '510302');
INSERT INTO `tb_administrative_division` VALUES (1831, '四川省', '510000', '自贡市', '510300', '富顺县', '510322');
INSERT INTO `tb_administrative_division` VALUES (1832, '四川省', '510000', '自贡市', '510300', '贡井区', '510303');
INSERT INTO `tb_administrative_division` VALUES (1833, '四川省', '510000', '自贡市', '510300', '荣县', '510321');
INSERT INTO `tb_administrative_division` VALUES (1834, '四川省', '510000', '自贡市', '510300', '大安区', '510304');
INSERT INTO `tb_administrative_division` VALUES (1835, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '小金县', '513227');
INSERT INTO `tb_administrative_division` VALUES (1836, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '红原县', '513233');
INSERT INTO `tb_administrative_division` VALUES (1837, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '壤塘县', '513230');
INSERT INTO `tb_administrative_division` VALUES (1838, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '黑水县', '513228');
INSERT INTO `tb_administrative_division` VALUES (1839, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '若尔盖县', '513232');
INSERT INTO `tb_administrative_division` VALUES (1840, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '马尔康县', '513229');
INSERT INTO `tb_administrative_division` VALUES (1841, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '理县', '513222');
INSERT INTO `tb_administrative_division` VALUES (1842, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '松潘县', '513224');
INSERT INTO `tb_administrative_division` VALUES (1843, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '阿坝县', '513231');
INSERT INTO `tb_administrative_division` VALUES (1844, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '茂县', '513223');
INSERT INTO `tb_administrative_division` VALUES (1845, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '九寨沟县', '513225');
INSERT INTO `tb_administrative_division` VALUES (1846, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '汶川县', '513221');
INSERT INTO `tb_administrative_division` VALUES (1847, '四川省', '510000', '阿坝藏族羌族自治州', '513200', '金川县', '513226');
INSERT INTO `tb_administrative_division` VALUES (1848, '四川省', '510000', '遂宁市', '510900', '射洪县', '510922');
INSERT INTO `tb_administrative_division` VALUES (1849, '四川省', '510000', '遂宁市', '510900', '蓬溪县', '510921');
INSERT INTO `tb_administrative_division` VALUES (1850, '四川省', '510000', '遂宁市', '510900', '安居区', '510904');
INSERT INTO `tb_administrative_division` VALUES (1851, '四川省', '510000', '遂宁市', '510900', '船山区', '510903');
INSERT INTO `tb_administrative_division` VALUES (1852, '四川省', '510000', '遂宁市', '510900', '大英县', '510923');
INSERT INTO `tb_administrative_division` VALUES (1853, '四川省', '510000', '雅安市', '511800', '天全县', '511825');
INSERT INTO `tb_administrative_division` VALUES (1854, '四川省', '510000', '雅安市', '511800', '宝兴县', '511827');
INSERT INTO `tb_administrative_division` VALUES (1855, '四川省', '510000', '雅安市', '511800', '名山县', '511821');
INSERT INTO `tb_administrative_division` VALUES (1856, '四川省', '510000', '雅安市', '511800', '汉源县', '511823');
INSERT INTO `tb_administrative_division` VALUES (1857, '四川省', '510000', '雅安市', '511800', '雨城区', '511802');
INSERT INTO `tb_administrative_division` VALUES (1858, '四川省', '510000', '雅安市', '511800', '石棉县', '511824');
INSERT INTO `tb_administrative_division` VALUES (1859, '四川省', '510000', '雅安市', '511800', '芦山县', '511826');
INSERT INTO `tb_administrative_division` VALUES (1860, '四川省', '510000', '雅安市', '511800', '荥经县', '511822');
INSERT INTO `tb_administrative_division` VALUES (1861, '四川省', '510000', '南充市', '511300', '高坪区', '511303');
INSERT INTO `tb_administrative_division` VALUES (1862, '四川省', '510000', '南充市', '511300', '营山县', '511322');
INSERT INTO `tb_administrative_division` VALUES (1863, '四川省', '510000', '南充市', '511300', '阆中市', '511381');
INSERT INTO `tb_administrative_division` VALUES (1864, '四川省', '510000', '南充市', '511300', '西充县', '511325');
INSERT INTO `tb_administrative_division` VALUES (1865, '四川省', '510000', '南充市', '511300', '顺庆区', '511302');
INSERT INTO `tb_administrative_division` VALUES (1866, '四川省', '510000', '南充市', '511300', '南部县', '511321');
INSERT INTO `tb_administrative_division` VALUES (1867, '四川省', '510000', '南充市', '511300', '蓬安县', '511323');
INSERT INTO `tb_administrative_division` VALUES (1868, '四川省', '510000', '南充市', '511300', '嘉陵区', '511304');
INSERT INTO `tb_administrative_division` VALUES (1869, '四川省', '510000', '南充市', '511300', '仪陇县', '511324');
INSERT INTO `tb_administrative_division` VALUES (1870, '四川省', '510000', '德阳市', '510600', '旌阳区', '510603');
INSERT INTO `tb_administrative_division` VALUES (1871, '四川省', '510000', '德阳市', '510600', '广汉市', '510681');
INSERT INTO `tb_administrative_division` VALUES (1872, '四川省', '510000', '德阳市', '510600', '绵竹市', '510683');
INSERT INTO `tb_administrative_division` VALUES (1873, '四川省', '510000', '德阳市', '510600', '什邡市', '510682');
INSERT INTO `tb_administrative_division` VALUES (1874, '四川省', '510000', '德阳市', '510600', '中江县', '510623');
INSERT INTO `tb_administrative_division` VALUES (1875, '四川省', '510000', '德阳市', '510600', '罗江县', '510626');
INSERT INTO `tb_administrative_division` VALUES (1876, '四川省', '510000', '内江市', '511000', '东兴区', '511011');
INSERT INTO `tb_administrative_division` VALUES (1877, '四川省', '510000', '内江市', '511000', '隆昌县', '511028');
INSERT INTO `tb_administrative_division` VALUES (1878, '四川省', '510000', '内江市', '511000', '资中县', '511025');
INSERT INTO `tb_administrative_division` VALUES (1879, '四川省', '510000', '内江市', '511000', '威远县', '511024');
INSERT INTO `tb_administrative_division` VALUES (1880, '四川省', '510000', '内江市', '511000', '市中区', '511002');
INSERT INTO `tb_administrative_division` VALUES (1881, '四川省', '510000', '成都市', '510100', '武侯区', '510107');
INSERT INTO `tb_administrative_division` VALUES (1882, '四川省', '510000', '成都市', '510100', '蒲江县', '510131');
INSERT INTO `tb_administrative_division` VALUES (1883, '四川省', '510000', '成都市', '510100', '温江区', '510115');
INSERT INTO `tb_administrative_division` VALUES (1884, '四川省', '510000', '成都市', '510100', '青白江区', '510113');
INSERT INTO `tb_administrative_division` VALUES (1885, '四川省', '510000', '成都市', '510100', '新津县', '510132');
INSERT INTO `tb_administrative_division` VALUES (1886, '四川省', '510000', '成都市', '510100', '大邑县', '510129');
INSERT INTO `tb_administrative_division` VALUES (1887, '四川省', '510000', '成都市', '510100', '金牛区', '510106');
INSERT INTO `tb_administrative_division` VALUES (1888, '四川省', '510000', '成都市', '510100', '青羊区', '510105');
INSERT INTO `tb_administrative_division` VALUES (1889, '四川省', '510000', '成都市', '510100', '邛崃市', '510183');
INSERT INTO `tb_administrative_division` VALUES (1890, '四川省', '510000', '成都市', '510100', '双流县', '510122');
INSERT INTO `tb_administrative_division` VALUES (1891, '四川省', '510000', '成都市', '510100', '都江堰市', '510181');
INSERT INTO `tb_administrative_division` VALUES (1892, '四川省', '510000', '成都市', '510100', '郫都区', '510124');
INSERT INTO `tb_administrative_division` VALUES (1893, '四川省', '510000', '成都市', '510100', '新都区', '510114');
INSERT INTO `tb_administrative_division` VALUES (1894, '四川省', '510000', '成都市', '510100', '龙泉驿区', '510112');
INSERT INTO `tb_administrative_division` VALUES (1895, '四川省', '510000', '成都市', '510100', '崇州市', '510184');
INSERT INTO `tb_administrative_division` VALUES (1896, '四川省', '510000', '成都市', '510100', '彭州市', '510182');
INSERT INTO `tb_administrative_division` VALUES (1897, '四川省', '510000', '成都市', '510100', '金堂县', '510121');
INSERT INTO `tb_administrative_division` VALUES (1898, '四川省', '510000', '成都市', '510100', '成华区', '510108');
INSERT INTO `tb_administrative_division` VALUES (1899, '四川省', '510000', '成都市', '510100', '锦江区', '510104');
INSERT INTO `tb_administrative_division` VALUES (1900, '四川省', '510000', '成都市', '510100', '简阳市', '510185');
INSERT INTO `tb_administrative_division` VALUES (1901, '四川省', '510000', '凉山彝族自治州', '513400', '冕宁县', '513433');
INSERT INTO `tb_administrative_division` VALUES (1902, '四川省', '510000', '凉山彝族自治州', '513400', '金阳县', '513430');
INSERT INTO `tb_administrative_division` VALUES (1903, '四川省', '510000', '凉山彝族自治州', '513400', '美姑县', '513436');
INSERT INTO `tb_administrative_division` VALUES (1904, '四川省', '510000', '凉山彝族自治州', '513400', '昭觉县', '513431');
INSERT INTO `tb_administrative_division` VALUES (1905, '四川省', '510000', '凉山彝族自治州', '513400', '布拖县', '513429');
INSERT INTO `tb_administrative_division` VALUES (1906, '四川省', '510000', '凉山彝族自治州', '513400', '越西县', '513434');
INSERT INTO `tb_administrative_division` VALUES (1907, '四川省', '510000', '凉山彝族自治州', '513400', '喜德县', '513432');
INSERT INTO `tb_administrative_division` VALUES (1908, '四川省', '510000', '凉山彝族自治州', '513400', '宁南县', '513427');
INSERT INTO `tb_administrative_division` VALUES (1909, '四川省', '510000', '凉山彝族自治州', '513400', '木里藏族自治县', '513422');
INSERT INTO `tb_administrative_division` VALUES (1910, '四川省', '510000', '凉山彝族自治州', '513400', '普格县', '513428');
INSERT INTO `tb_administrative_division` VALUES (1911, '四川省', '510000', '凉山彝族自治州', '513400', '雷波县', '513437');
INSERT INTO `tb_administrative_division` VALUES (1912, '四川省', '510000', '凉山彝族自治州', '513400', '甘洛县', '513435');
INSERT INTO `tb_administrative_division` VALUES (1913, '四川省', '510000', '凉山彝族自治州', '513400', '西昌市', '513401');
INSERT INTO `tb_administrative_division` VALUES (1914, '四川省', '510000', '凉山彝族自治州', '513400', '会理县', '513425');
INSERT INTO `tb_administrative_division` VALUES (1915, '四川省', '510000', '凉山彝族自治州', '513400', '德昌县', '513424');
INSERT INTO `tb_administrative_division` VALUES (1916, '四川省', '510000', '凉山彝族自治州', '513400', '盐源县', '513423');
INSERT INTO `tb_administrative_division` VALUES (1917, '四川省', '510000', '凉山彝族自治州', '513400', '会东县', '513426');
INSERT INTO `tb_administrative_division` VALUES (1918, '四川省', '510000', '广安市', '511600', '华蓥市', '511681');
INSERT INTO `tb_administrative_division` VALUES (1919, '四川省', '510000', '广安市', '511600', '岳池县', '511621');
INSERT INTO `tb_administrative_division` VALUES (1920, '四川省', '510000', '广安市', '511600', '邻水县', '511623');
INSERT INTO `tb_administrative_division` VALUES (1921, '四川省', '510000', '广安市', '511600', '广安区', '511602');
INSERT INTO `tb_administrative_division` VALUES (1922, '四川省', '510000', '广安市', '511600', '武胜县', '511622');
INSERT INTO `tb_administrative_division` VALUES (1923, '四川省', '510000', '广安市', '511600', '前锋区', '511603');
INSERT INTO `tb_administrative_division` VALUES (1924, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '太仆寺旗', '152527');
INSERT INTO `tb_administrative_division` VALUES (1925, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '锡林浩特市', '152502');
INSERT INTO `tb_administrative_division` VALUES (1926, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '正镶白旗', '152529');
INSERT INTO `tb_administrative_division` VALUES (1927, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '东乌珠穆沁旗', '152525');
INSERT INTO `tb_administrative_division` VALUES (1928, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '多伦县', '152531');
INSERT INTO `tb_administrative_division` VALUES (1929, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '苏尼特左旗', '152523');
INSERT INTO `tb_administrative_division` VALUES (1930, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '镶黄旗', '152528');
INSERT INTO `tb_administrative_division` VALUES (1931, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '二连浩特市', '152501');
INSERT INTO `tb_administrative_division` VALUES (1932, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '正蓝旗', '152530');
INSERT INTO `tb_administrative_division` VALUES (1933, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '阿巴嘎旗', '152522');
INSERT INTO `tb_administrative_division` VALUES (1934, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '西乌珠穆沁旗', '152526');
INSERT INTO `tb_administrative_division` VALUES (1935, '内蒙古自治区', '150000', '锡林郭勒盟', '152500', '苏尼特右旗', '152524');
INSERT INTO `tb_administrative_division` VALUES (1936, '内蒙古自治区', '150000', '包头市', '150200', '东河区', '150202');
INSERT INTO `tb_administrative_division` VALUES (1937, '内蒙古自治区', '150000', '包头市', '150200', '固阳县', '150222');
INSERT INTO `tb_administrative_division` VALUES (1938, '内蒙古自治区', '150000', '包头市', '150200', '白云鄂博矿区', '150206');
INSERT INTO `tb_administrative_division` VALUES (1939, '内蒙古自治区', '150000', '包头市', '150200', '青山区', '150204');
INSERT INTO `tb_administrative_division` VALUES (1940, '内蒙古自治区', '150000', '包头市', '150200', '达尔罕茂明安联合旗', '150223');
INSERT INTO `tb_administrative_division` VALUES (1941, '内蒙古自治区', '150000', '包头市', '150200', '土默特右旗', '150221');
INSERT INTO `tb_administrative_division` VALUES (1942, '内蒙古自治区', '150000', '包头市', '150200', '昆都仑区', '150203');
INSERT INTO `tb_administrative_division` VALUES (1943, '内蒙古自治区', '150000', '包头市', '150200', '石拐区', '150205');
INSERT INTO `tb_administrative_division` VALUES (1944, '内蒙古自治区', '150000', '包头市', '150200', '九原区', '150207');
INSERT INTO `tb_administrative_division` VALUES (1945, '内蒙古自治区', '150000', '巴彦淖尔市', '150800', '五原县', '150821');
INSERT INTO `tb_administrative_division` VALUES (1946, '内蒙古自治区', '150000', '巴彦淖尔市', '150800', '乌拉特前旗', '150823');
INSERT INTO `tb_administrative_division` VALUES (1947, '内蒙古自治区', '150000', '巴彦淖尔市', '150800', '乌拉特中旗', '150824');
INSERT INTO `tb_administrative_division` VALUES (1948, '内蒙古自治区', '150000', '巴彦淖尔市', '150800', '磴口县', '150822');
INSERT INTO `tb_administrative_division` VALUES (1949, '内蒙古自治区', '150000', '巴彦淖尔市', '150800', '乌拉特后旗', '150825');
INSERT INTO `tb_administrative_division` VALUES (1950, '内蒙古自治区', '150000', '巴彦淖尔市', '150800', '临河区', '150802');
INSERT INTO `tb_administrative_division` VALUES (1951, '内蒙古自治区', '150000', '巴彦淖尔市', '150800', '杭锦后旗', '150826');
INSERT INTO `tb_administrative_division` VALUES (1952, '内蒙古自治区', '150000', '阿拉善盟', '152900', '阿拉善左旗', '152921');
INSERT INTO `tb_administrative_division` VALUES (1953, '内蒙古自治区', '150000', '阿拉善盟', '152900', '阿拉善右旗', '152922');
INSERT INTO `tb_administrative_division` VALUES (1954, '内蒙古自治区', '150000', '阿拉善盟', '152900', '额济纳旗', '152923');
INSERT INTO `tb_administrative_division` VALUES (1955, '内蒙古自治区', '150000', '乌兰察布盟', '152600', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (1956, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '根河市', '150785');
INSERT INTO `tb_administrative_division` VALUES (1957, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '陈巴尔虎旗', '150725');
INSERT INTO `tb_administrative_division` VALUES (1958, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '牙克石市', '150782');
INSERT INTO `tb_administrative_division` VALUES (1959, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '海拉尔区', '150702');
INSERT INTO `tb_administrative_division` VALUES (1960, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '额尔古纳市', '150784');
INSERT INTO `tb_administrative_division` VALUES (1961, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '新巴尔虎右旗', '150727');
INSERT INTO `tb_administrative_division` VALUES (1962, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '莫力达瓦达斡尔族自治旗', '150722');
INSERT INTO `tb_administrative_division` VALUES (1963, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '满洲里市', '150781');
INSERT INTO `tb_administrative_division` VALUES (1964, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '扎兰屯市', '150783');
INSERT INTO `tb_administrative_division` VALUES (1965, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '阿荣旗', '150721');
INSERT INTO `tb_administrative_division` VALUES (1966, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '鄂伦春自治旗', '150723');
INSERT INTO `tb_administrative_division` VALUES (1967, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '鄂温克族自治旗', '150724');
INSERT INTO `tb_administrative_division` VALUES (1968, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '扎赉诺尔区', '150703');
INSERT INTO `tb_administrative_division` VALUES (1969, '内蒙古自治区', '150000', '呼伦贝尔市', '150700', '新巴尔虎左旗', '150726');
INSERT INTO `tb_administrative_division` VALUES (1970, '内蒙古自治区', '150000', '通辽市', '150500', '科尔沁左翼中旗', '150521');
INSERT INTO `tb_administrative_division` VALUES (1971, '内蒙古自治区', '150000', '通辽市', '150500', '奈曼旗', '150525');
INSERT INTO `tb_administrative_division` VALUES (1972, '内蒙古自治区', '150000', '通辽市', '150500', '开鲁县', '150523');
INSERT INTO `tb_administrative_division` VALUES (1973, '内蒙古自治区', '150000', '通辽市', '150500', '科尔沁区', '150502');
INSERT INTO `tb_administrative_division` VALUES (1974, '内蒙古自治区', '150000', '通辽市', '150500', '霍林郭勒市', '150581');
INSERT INTO `tb_administrative_division` VALUES (1975, '内蒙古自治区', '150000', '通辽市', '150500', '库伦旗', '150524');
INSERT INTO `tb_administrative_division` VALUES (1976, '内蒙古自治区', '150000', '通辽市', '150500', '科尔沁左翼后旗', '150522');
INSERT INTO `tb_administrative_division` VALUES (1977, '内蒙古自治区', '150000', '通辽市', '150500', '扎鲁特旗', '150526');
INSERT INTO `tb_administrative_division` VALUES (1978, '内蒙古自治区', '150000', '赤峰市', '150400', '林西县', '150424');
INSERT INTO `tb_administrative_division` VALUES (1979, '内蒙古自治区', '150000', '赤峰市', '150400', '元宝山区', '150403');
INSERT INTO `tb_administrative_division` VALUES (1980, '内蒙古自治区', '150000', '赤峰市', '150400', '巴林左旗', '150422');
INSERT INTO `tb_administrative_division` VALUES (1981, '内蒙古自治区', '150000', '赤峰市', '150400', '宁城县', '150429');
INSERT INTO `tb_administrative_division` VALUES (1982, '内蒙古自治区', '150000', '赤峰市', '150400', '巴林右旗', '150423');
INSERT INTO `tb_administrative_division` VALUES (1983, '内蒙古自治区', '150000', '赤峰市', '150400', '阿鲁科尔沁旗', '150421');
INSERT INTO `tb_administrative_division` VALUES (1984, '内蒙古自治区', '150000', '赤峰市', '150400', '松山区', '150404');
INSERT INTO `tb_administrative_division` VALUES (1985, '内蒙古自治区', '150000', '赤峰市', '150400', '红山区', '150402');
INSERT INTO `tb_administrative_division` VALUES (1986, '内蒙古自治区', '150000', '赤峰市', '150400', '敖汉旗', '150430');
INSERT INTO `tb_administrative_division` VALUES (1987, '内蒙古自治区', '150000', '赤峰市', '150400', '喀喇沁旗', '150428');
INSERT INTO `tb_administrative_division` VALUES (1988, '内蒙古自治区', '150000', '赤峰市', '150400', '克什克腾旗', '150425');
INSERT INTO `tb_administrative_division` VALUES (1989, '内蒙古自治区', '150000', '赤峰市', '150400', '翁牛特旗', '150426');
INSERT INTO `tb_administrative_division` VALUES (1990, '内蒙古自治区', '150000', '兴安盟', '152200', '乌兰浩特市', '152201');
INSERT INTO `tb_administrative_division` VALUES (1991, '内蒙古自治区', '150000', '兴安盟', '152200', '突泉县', '152224');
INSERT INTO `tb_administrative_division` VALUES (1992, '内蒙古自治区', '150000', '兴安盟', '152200', '科尔沁右翼前旗', '152221');
INSERT INTO `tb_administrative_division` VALUES (1993, '内蒙古自治区', '150000', '兴安盟', '152200', '阿尔山市', '152202');
INSERT INTO `tb_administrative_division` VALUES (1994, '内蒙古自治区', '150000', '兴安盟', '152200', '扎赉特旗', '152223');
INSERT INTO `tb_administrative_division` VALUES (1995, '内蒙古自治区', '150000', '兴安盟', '152200', '科尔沁右翼中旗', '152222');
INSERT INTO `tb_administrative_division` VALUES (1996, '内蒙古自治区', '150000', '乌海市', '150300', '乌达区', '150304');
INSERT INTO `tb_administrative_division` VALUES (1997, '内蒙古自治区', '150000', '乌海市', '150300', '海勃湾区', '150302');
INSERT INTO `tb_administrative_division` VALUES (1998, '内蒙古自治区', '150000', '乌海市', '150300', '海南区', '150303');
INSERT INTO `tb_administrative_division` VALUES (1999, '内蒙古自治区', '150000', '乌兰察布市', '150900', '四子王旗', '150929');
INSERT INTO `tb_administrative_division` VALUES (2000, '内蒙古自治区', '150000', '乌兰察布市', '150900', '集宁区', '150902');
INSERT INTO `tb_administrative_division` VALUES (2001, '内蒙古自治区', '150000', '乌兰察布市', '150900', '察哈尔右翼中旗', '150927');
INSERT INTO `tb_administrative_division` VALUES (2002, '内蒙古自治区', '150000', '乌兰察布市', '150900', '卓资县', '150921');
INSERT INTO `tb_administrative_division` VALUES (2003, '内蒙古自治区', '150000', '乌兰察布市', '150900', '商都县', '150923');
INSERT INTO `tb_administrative_division` VALUES (2004, '内蒙古自治区', '150000', '乌兰察布市', '150900', '凉城县', '150925');
INSERT INTO `tb_administrative_division` VALUES (2005, '内蒙古自治区', '150000', '乌兰察布市', '150900', '察哈尔右翼后旗', '150928');
INSERT INTO `tb_administrative_division` VALUES (2006, '内蒙古自治区', '150000', '乌兰察布市', '150900', '化德县', '150922');
INSERT INTO `tb_administrative_division` VALUES (2007, '内蒙古自治区', '150000', '乌兰察布市', '150900', '丰镇市', '150981');
INSERT INTO `tb_administrative_division` VALUES (2008, '内蒙古自治区', '150000', '乌兰察布市', '150900', '兴和县', '150924');
INSERT INTO `tb_administrative_division` VALUES (2009, '内蒙古自治区', '150000', '乌兰察布市', '150900', '察哈尔右翼前旗', '150926');
INSERT INTO `tb_administrative_division` VALUES (2010, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克旗', '150624');
INSERT INTO `tb_administrative_division` VALUES (2011, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '达拉特旗', '150621');
INSERT INTO `tb_administrative_division` VALUES (2012, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '鄂托克前旗', '150623');
INSERT INTO `tb_administrative_division` VALUES (2013, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '准格尔旗', '150622');
INSERT INTO `tb_administrative_division` VALUES (2014, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '杭锦旗', '150625');
INSERT INTO `tb_administrative_division` VALUES (2015, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '东胜区', '150602');
INSERT INTO `tb_administrative_division` VALUES (2016, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '伊金霍洛旗', '150627');
INSERT INTO `tb_administrative_division` VALUES (2017, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '乌审旗', '150626');
INSERT INTO `tb_administrative_division` VALUES (2018, '内蒙古自治区', '150000', '鄂尔多斯市', '150600', '康巴什区', '150603');
INSERT INTO `tb_administrative_division` VALUES (2019, '内蒙古自治区', '150000', '呼和浩特市', '150100', '玉泉区', '150104');
INSERT INTO `tb_administrative_division` VALUES (2020, '内蒙古自治区', '150000', '呼和浩特市', '150100', '托克托县', '150122');
INSERT INTO `tb_administrative_division` VALUES (2021, '内蒙古自治区', '150000', '呼和浩特市', '150100', '回民区', '150103');
INSERT INTO `tb_administrative_division` VALUES (2022, '内蒙古自治区', '150000', '呼和浩特市', '150100', '赛罕区', '150105');
INSERT INTO `tb_administrative_division` VALUES (2023, '内蒙古自治区', '150000', '呼和浩特市', '150100', '清水河县', '150124');
INSERT INTO `tb_administrative_division` VALUES (2024, '内蒙古自治区', '150000', '呼和浩特市', '150100', '和林格尔县', '150123');
INSERT INTO `tb_administrative_division` VALUES (2025, '内蒙古自治区', '150000', '呼和浩特市', '150100', '土默特左旗', '150121');
INSERT INTO `tb_administrative_division` VALUES (2026, '内蒙古自治区', '150000', '呼和浩特市', '150100', '新城区', '150102');
INSERT INTO `tb_administrative_division` VALUES (2027, '内蒙古自治区', '150000', '呼和浩特市', '150100', '武川县', '150125');
INSERT INTO `tb_administrative_division` VALUES (2028, '陕西省', '610000', '咸阳市', '610400', '兴平市', '610481');
INSERT INTO `tb_administrative_division` VALUES (2029, '陕西省', '610000', '咸阳市', '610400', '三原县', '610422');
INSERT INTO `tb_administrative_division` VALUES (2030, '陕西省', '610000', '咸阳市', '610400', '长武县', '610428');
INSERT INTO `tb_administrative_division` VALUES (2031, '陕西省', '610000', '咸阳市', '610400', '乾县', '610424');
INSERT INTO `tb_administrative_division` VALUES (2032, '陕西省', '610000', '咸阳市', '610400', '旬邑县', '610429');
INSERT INTO `tb_administrative_division` VALUES (2033, '陕西省', '610000', '咸阳市', '610400', '礼泉县', '610425');
INSERT INTO `tb_administrative_division` VALUES (2034, '陕西省', '610000', '咸阳市', '610400', '彬县', '610427');
INSERT INTO `tb_administrative_division` VALUES (2035, '陕西省', '610000', '咸阳市', '610400', '武功县', '610431');
INSERT INTO `tb_administrative_division` VALUES (2036, '陕西省', '610000', '咸阳市', '610400', '秦都区', '610402');
INSERT INTO `tb_administrative_division` VALUES (2037, '陕西省', '610000', '咸阳市', '610400', '渭城区', '610404');
INSERT INTO `tb_administrative_division` VALUES (2038, '陕西省', '610000', '咸阳市', '610400', '淳化县', '610430');
INSERT INTO `tb_administrative_division` VALUES (2039, '陕西省', '610000', '咸阳市', '610400', '杨陵区', '610403');
INSERT INTO `tb_administrative_division` VALUES (2040, '陕西省', '610000', '咸阳市', '610400', '永寿县', '610426');
INSERT INTO `tb_administrative_division` VALUES (2041, '陕西省', '610000', '咸阳市', '610400', '泾阳县', '610423');
INSERT INTO `tb_administrative_division` VALUES (2042, '陕西省', '610000', '咸阳市', '610400', '彬州市', '610482');
INSERT INTO `tb_administrative_division` VALUES (2043, '陕西省', '610000', '延安市', '610600', '安塞县', '610624');
INSERT INTO `tb_administrative_division` VALUES (2044, '陕西省', '610000', '延安市', '610600', '宜川县', '610630');
INSERT INTO `tb_administrative_division` VALUES (2045, '陕西省', '610000', '延安市', '610600', '延川县', '610622');
INSERT INTO `tb_administrative_division` VALUES (2046, '陕西省', '610000', '延安市', '610600', '延长县', '610621');
INSERT INTO `tb_administrative_division` VALUES (2047, '陕西省', '610000', '延安市', '610600', '富县', '610628');
INSERT INTO `tb_administrative_division` VALUES (2048, '陕西省', '610000', '延安市', '610600', '黄龙县', '610631');
INSERT INTO `tb_administrative_division` VALUES (2049, '陕西省', '610000', '延安市', '610600', '甘泉县', '610627');
INSERT INTO `tb_administrative_division` VALUES (2050, '陕西省', '610000', '延安市', '610600', '宝塔区', '610602');
INSERT INTO `tb_administrative_division` VALUES (2051, '陕西省', '610000', '延安市', '610600', '子长县', '610623');
INSERT INTO `tb_administrative_division` VALUES (2052, '陕西省', '610000', '延安市', '610600', '洛川县', '610629');
INSERT INTO `tb_administrative_division` VALUES (2053, '陕西省', '610000', '延安市', '610600', '志丹县', '610625');
INSERT INTO `tb_administrative_division` VALUES (2054, '陕西省', '610000', '延安市', '610600', '黄陵县', '610632');
INSERT INTO `tb_administrative_division` VALUES (2055, '陕西省', '610000', '延安市', '610600', '吴起县', '610626');
INSERT INTO `tb_administrative_division` VALUES (2056, '陕西省', '610000', '渭南市', '610500', '华阴市', '610582');
INSERT INTO `tb_administrative_division` VALUES (2057, '陕西省', '610000', '渭南市', '610500', '大荔县', '610523');
INSERT INTO `tb_administrative_division` VALUES (2058, '陕西省', '610000', '渭南市', '610500', '临渭区', '610502');
INSERT INTO `tb_administrative_division` VALUES (2059, '陕西省', '610000', '渭南市', '610500', '白水县', '610527');
INSERT INTO `tb_administrative_division` VALUES (2060, '陕西省', '610000', '渭南市', '610500', '富平县', '610528');
INSERT INTO `tb_administrative_division` VALUES (2061, '陕西省', '610000', '渭南市', '610500', '华县', '610521');
INSERT INTO `tb_administrative_division` VALUES (2062, '陕西省', '610000', '渭南市', '610500', '韩城市', '610581');
INSERT INTO `tb_administrative_division` VALUES (2063, '陕西省', '610000', '渭南市', '610500', '澄城县', '610525');
INSERT INTO `tb_administrative_division` VALUES (2064, '陕西省', '610000', '渭南市', '610500', '合阳县', '610524');
INSERT INTO `tb_administrative_division` VALUES (2065, '陕西省', '610000', '渭南市', '610500', '潼关县', '610522');
INSERT INTO `tb_administrative_division` VALUES (2066, '陕西省', '610000', '渭南市', '610500', '蒲城县', '610526');
INSERT INTO `tb_administrative_division` VALUES (2067, '陕西省', '610000', '渭南市', '610500', '华州区', '610503');
INSERT INTO `tb_administrative_division` VALUES (2068, '陕西省', '610000', '榆林市', '610800', '榆阳区', '610802');
INSERT INTO `tb_administrative_division` VALUES (2069, '陕西省', '610000', '榆林市', '610800', '定边县', '610825');
INSERT INTO `tb_administrative_division` VALUES (2070, '陕西省', '610000', '榆林市', '610800', '府谷县', '610822');
INSERT INTO `tb_administrative_division` VALUES (2071, '陕西省', '610000', '榆林市', '610800', '清涧县', '610830');
INSERT INTO `tb_administrative_division` VALUES (2072, '陕西省', '610000', '榆林市', '610800', '靖边县', '610824');
INSERT INTO `tb_administrative_division` VALUES (2073, '陕西省', '610000', '榆林市', '610800', '佳县', '610828');
INSERT INTO `tb_administrative_division` VALUES (2074, '陕西省', '610000', '榆林市', '610800', '米脂县', '610827');
INSERT INTO `tb_administrative_division` VALUES (2075, '陕西省', '610000', '榆林市', '610800', '吴堡县', '610829');
INSERT INTO `tb_administrative_division` VALUES (2076, '陕西省', '610000', '榆林市', '610800', '横山县', '610823');
INSERT INTO `tb_administrative_division` VALUES (2077, '陕西省', '610000', '榆林市', '610800', '神木县', '610821');
INSERT INTO `tb_administrative_division` VALUES (2078, '陕西省', '610000', '榆林市', '610800', '绥德县', '610826');
INSERT INTO `tb_administrative_division` VALUES (2079, '陕西省', '610000', '榆林市', '610800', '子洲县', '610831');
INSERT INTO `tb_administrative_division` VALUES (2080, '陕西省', '610000', '安康市', '610900', '紫阳县', '610924');
INSERT INTO `tb_administrative_division` VALUES (2081, '陕西省', '610000', '安康市', '610900', '石泉县', '610922');
INSERT INTO `tb_administrative_division` VALUES (2082, '陕西省', '610000', '安康市', '610900', '宁陕县', '610923');
INSERT INTO `tb_administrative_division` VALUES (2083, '陕西省', '610000', '安康市', '610900', '岚皋县', '610925');
INSERT INTO `tb_administrative_division` VALUES (2084, '陕西省', '610000', '安康市', '610900', '汉滨区', '610902');
INSERT INTO `tb_administrative_division` VALUES (2085, '陕西省', '610000', '安康市', '610900', '白河县', '610929');
INSERT INTO `tb_administrative_division` VALUES (2086, '陕西省', '610000', '安康市', '610900', '旬阳县', '610928');
INSERT INTO `tb_administrative_division` VALUES (2087, '陕西省', '610000', '安康市', '610900', '镇坪县', '610927');
INSERT INTO `tb_administrative_division` VALUES (2088, '陕西省', '610000', '安康市', '610900', '平利县', '610926');
INSERT INTO `tb_administrative_division` VALUES (2089, '陕西省', '610000', '安康市', '610900', '汉阴县', '610921');
INSERT INTO `tb_administrative_division` VALUES (2090, '陕西省', '610000', '铜川市', '610200', '耀州区', '610204');
INSERT INTO `tb_administrative_division` VALUES (2091, '陕西省', '610000', '铜川市', '610200', '印台区', '610203');
INSERT INTO `tb_administrative_division` VALUES (2092, '陕西省', '610000', '铜川市', '610200', '王益区', '610202');
INSERT INTO `tb_administrative_division` VALUES (2093, '陕西省', '610000', '铜川市', '610200', '宜君县', '610222');
INSERT INTO `tb_administrative_division` VALUES (2094, '陕西省', '610000', '商洛市', '611000', '山阳县', '611024');
INSERT INTO `tb_administrative_division` VALUES (2095, '陕西省', '610000', '商洛市', '611000', '洛南县', '611021');
INSERT INTO `tb_administrative_division` VALUES (2096, '陕西省', '610000', '商洛市', '611000', '镇安县', '611025');
INSERT INTO `tb_administrative_division` VALUES (2097, '陕西省', '610000', '商洛市', '611000', '丹凤县', '611022');
INSERT INTO `tb_administrative_division` VALUES (2098, '陕西省', '610000', '商洛市', '611000', '柞水县', '611026');
INSERT INTO `tb_administrative_division` VALUES (2099, '陕西省', '610000', '商洛市', '611000', '商南县', '611023');
INSERT INTO `tb_administrative_division` VALUES (2100, '陕西省', '610000', '商洛市', '611000', '商州区', '611002');
INSERT INTO `tb_administrative_division` VALUES (2101, '陕西省', '610000', '西安市', '610100', '雁塔区', '610113');
INSERT INTO `tb_administrative_division` VALUES (2102, '陕西省', '610000', '西安市', '610100', '灞桥区', '610111');
INSERT INTO `tb_administrative_division` VALUES (2103, '陕西省', '610000', '西安市', '610100', '临潼区', '610115');
INSERT INTO `tb_administrative_division` VALUES (2104, '陕西省', '610000', '西安市', '610100', '户县', '610125');
INSERT INTO `tb_administrative_division` VALUES (2105, '陕西省', '610000', '西安市', '610100', '新城区', '610102');
INSERT INTO `tb_administrative_division` VALUES (2106, '陕西省', '610000', '西安市', '610100', '高新区', '610117');
INSERT INTO `tb_administrative_division` VALUES (2107, '陕西省', '610000', '西安市', '610100', '周至县', '610124');
INSERT INTO `tb_administrative_division` VALUES (2108, '陕西省', '610000', '西安市', '610100', '碑林区', '610103');
INSERT INTO `tb_administrative_division` VALUES (2109, '陕西省', '610000', '西安市', '610100', '蓝田县', '610122');
INSERT INTO `tb_administrative_division` VALUES (2110, '陕西省', '610000', '西安市', '610100', '阎良区', '610114');
INSERT INTO `tb_administrative_division` VALUES (2111, '陕西省', '610000', '西安市', '610100', '未央区', '610112');
INSERT INTO `tb_administrative_division` VALUES (2112, '陕西省', '610000', '西安市', '610100', '长安区', '610116');
INSERT INTO `tb_administrative_division` VALUES (2113, '陕西省', '610000', '西安市', '610100', '莲湖区', '610104');
INSERT INTO `tb_administrative_division` VALUES (2114, '陕西省', '610000', '西安市', '610100', '高陵县', '610126');
INSERT INTO `tb_administrative_division` VALUES (2115, '陕西省', '610000', '西安市', '610100', '鄠邑区', '610118');
INSERT INTO `tb_administrative_division` VALUES (2116, '陕西省', '610000', '汉中市', '610700', '略阳县', '610727');
INSERT INTO `tb_administrative_division` VALUES (2117, '陕西省', '610000', '汉中市', '610700', '汉台区', '610702');
INSERT INTO `tb_administrative_division` VALUES (2118, '陕西省', '610000', '汉中市', '610700', '留坝县', '610729');
INSERT INTO `tb_administrative_division` VALUES (2119, '陕西省', '610000', '汉中市', '610700', '勉县', '610725');
INSERT INTO `tb_administrative_division` VALUES (2120, '陕西省', '610000', '汉中市', '610700', '西乡县', '610724');
INSERT INTO `tb_administrative_division` VALUES (2121, '陕西省', '610000', '汉中市', '610700', '城固县', '610722');
INSERT INTO `tb_administrative_division` VALUES (2122, '陕西省', '610000', '汉中市', '610700', '镇巴县', '610728');
INSERT INTO `tb_administrative_division` VALUES (2123, '陕西省', '610000', '汉中市', '610700', '南郑县', '610721');
INSERT INTO `tb_administrative_division` VALUES (2124, '陕西省', '610000', '汉中市', '610700', '洋县', '610723');
INSERT INTO `tb_administrative_division` VALUES (2125, '陕西省', '610000', '汉中市', '610700', '佛坪县', '610730');
INSERT INTO `tb_administrative_division` VALUES (2126, '陕西省', '610000', '汉中市', '610700', '宁强县', '610726');
INSERT INTO `tb_administrative_division` VALUES (2127, '陕西省', '610000', '宝鸡市', '610300', '渭滨区', '610302');
INSERT INTO `tb_administrative_division` VALUES (2128, '陕西省', '610000', '宝鸡市', '610300', '太白县', '610331');
INSERT INTO `tb_administrative_division` VALUES (2129, '陕西省', '610000', '宝鸡市', '610300', '麟游县', '610329');
INSERT INTO `tb_administrative_division` VALUES (2130, '陕西省', '610000', '宝鸡市', '610300', '陈仓区', '610304');
INSERT INTO `tb_administrative_division` VALUES (2131, '陕西省', '610000', '宝鸡市', '610300', '千阳县', '610328');
INSERT INTO `tb_administrative_division` VALUES (2132, '陕西省', '610000', '宝鸡市', '610300', '凤县', '610330');
INSERT INTO `tb_administrative_division` VALUES (2133, '陕西省', '610000', '宝鸡市', '610300', '金台区', '610303');
INSERT INTO `tb_administrative_division` VALUES (2134, '陕西省', '610000', '宝鸡市', '610300', '凤翔县', '610322');
INSERT INTO `tb_administrative_division` VALUES (2135, '陕西省', '610000', '宝鸡市', '610300', '陇县', '610327');
INSERT INTO `tb_administrative_division` VALUES (2136, '陕西省', '610000', '宝鸡市', '610300', '扶风县', '610324');
INSERT INTO `tb_administrative_division` VALUES (2137, '陕西省', '610000', '宝鸡市', '610300', '岐山县', '610323');
INSERT INTO `tb_administrative_division` VALUES (2138, '陕西省', '610000', '宝鸡市', '610300', '眉县', '610326');
INSERT INTO `tb_administrative_division` VALUES (2139, '河南省', '410000', '平顶山市', '410400', '湛河区', '410411');
INSERT INTO `tb_administrative_division` VALUES (2140, '河南省', '410000', '平顶山市', '410400', '叶县', '410422');
INSERT INTO `tb_administrative_division` VALUES (2141, '河南省', '410000', '平顶山市', '410400', '舞钢市', '410481');
INSERT INTO `tb_administrative_division` VALUES (2142, '河南省', '410000', '平顶山市', '410400', '宝丰县', '410421');
INSERT INTO `tb_administrative_division` VALUES (2143, '河南省', '410000', '平顶山市', '410400', '新华区', '410402');
INSERT INTO `tb_administrative_division` VALUES (2144, '河南省', '410000', '平顶山市', '410400', '郏县', '410425');
INSERT INTO `tb_administrative_division` VALUES (2145, '河南省', '410000', '平顶山市', '410400', '鲁山县', '410423');
INSERT INTO `tb_administrative_division` VALUES (2146, '河南省', '410000', '平顶山市', '410400', '石龙区', '410404');
INSERT INTO `tb_administrative_division` VALUES (2147, '河南省', '410000', '平顶山市', '410400', '卫东区', '410403');
INSERT INTO `tb_administrative_division` VALUES (2148, '河南省', '410000', '平顶山市', '410400', '汝州市', '410482');
INSERT INTO `tb_administrative_division` VALUES (2149, '河南省', '410000', '郑州市', '410100', '登封市', '410185');
INSERT INTO `tb_administrative_division` VALUES (2150, '河南省', '410000', '郑州市', '410100', '二七区', '410103');
INSERT INTO `tb_administrative_division` VALUES (2151, '河南省', '410000', '郑州市', '410100', '上街区', '410106');
INSERT INTO `tb_administrative_division` VALUES (2152, '河南省', '410000', '郑州市', '410100', '金水区', '410105');
INSERT INTO `tb_administrative_division` VALUES (2153, '河南省', '410000', '郑州市', '410100', '荥阳市', '410182');
INSERT INTO `tb_administrative_division` VALUES (2154, '河南省', '410000', '郑州市', '410100', '巩义市', '410181');
INSERT INTO `tb_administrative_division` VALUES (2155, '河南省', '410000', '郑州市', '410100', '中牟县', '410122');
INSERT INTO `tb_administrative_division` VALUES (2156, '河南省', '410000', '郑州市', '410100', '新密市', '410183');
INSERT INTO `tb_administrative_division` VALUES (2157, '河南省', '410000', '郑州市', '410100', '中原区', '410102');
INSERT INTO `tb_administrative_division` VALUES (2158, '河南省', '410000', '郑州市', '410100', '新郑市', '410184');
INSERT INTO `tb_administrative_division` VALUES (2159, '河南省', '410000', '郑州市', '410100', '惠济区', '410108');
INSERT INTO `tb_administrative_division` VALUES (2160, '河南省', '410000', '郑州市', '410100', '管城回族区', '410104');
INSERT INTO `tb_administrative_division` VALUES (2161, '河南省', '410000', '许昌市', '411000', '鄢陵县', '411024');
INSERT INTO `tb_administrative_division` VALUES (2162, '河南省', '410000', '许昌市', '411000', '襄城县', '411025');
INSERT INTO `tb_administrative_division` VALUES (2163, '河南省', '410000', '许昌市', '411000', '魏都区', '411002');
INSERT INTO `tb_administrative_division` VALUES (2164, '河南省', '410000', '许昌市', '411000', '许昌县', '411023');
INSERT INTO `tb_administrative_division` VALUES (2165, '河南省', '410000', '许昌市', '411000', '禹州市', '411081');
INSERT INTO `tb_administrative_division` VALUES (2166, '河南省', '410000', '许昌市', '411000', '长葛市', '411082');
INSERT INTO `tb_administrative_division` VALUES (2167, '河南省', '410000', '许昌市', '411000', '建安区', '411003');
INSERT INTO `tb_administrative_division` VALUES (2168, '河南省', '410000', '商丘市', '411400', '民权县', '411421');
INSERT INTO `tb_administrative_division` VALUES (2169, '河南省', '410000', '商丘市', '411400', '梁园区', '411402');
INSERT INTO `tb_administrative_division` VALUES (2170, '河南省', '410000', '商丘市', '411400', '宁陵县', '411423');
INSERT INTO `tb_administrative_division` VALUES (2171, '河南省', '410000', '商丘市', '411400', '虞城县', '411425');
INSERT INTO `tb_administrative_division` VALUES (2172, '河南省', '410000', '商丘市', '411400', '柘城县', '411424');
INSERT INTO `tb_administrative_division` VALUES (2173, '河南省', '410000', '商丘市', '411400', '永城市', '411481');
INSERT INTO `tb_administrative_division` VALUES (2174, '河南省', '410000', '商丘市', '411400', '睢阳区', '411403');
INSERT INTO `tb_administrative_division` VALUES (2175, '河南省', '410000', '商丘市', '411400', '睢县', '411422');
INSERT INTO `tb_administrative_division` VALUES (2176, '河南省', '410000', '商丘市', '411400', '夏邑县', '411426');
INSERT INTO `tb_administrative_division` VALUES (2177, '河南省', '410000', '开封市', '410200', '禹王台区', '410205');
INSERT INTO `tb_administrative_division` VALUES (2178, '河南省', '410000', '开封市', '410200', '金明区', '410211');
INSERT INTO `tb_administrative_division` VALUES (2179, '河南省', '410000', '开封市', '410200', '开封县', '410224');
INSERT INTO `tb_administrative_division` VALUES (2180, '河南省', '410000', '开封市', '410200', '兰考县', '410225');
INSERT INTO `tb_administrative_division` VALUES (2181, '河南省', '410000', '开封市', '410200', '杞县', '410221');
INSERT INTO `tb_administrative_division` VALUES (2182, '河南省', '410000', '开封市', '410200', '鼓楼区', '410204');
INSERT INTO `tb_administrative_division` VALUES (2183, '河南省', '410000', '开封市', '410200', '尉氏县', '410223');
INSERT INTO `tb_administrative_division` VALUES (2184, '河南省', '410000', '开封市', '410200', '龙亭区', '410202');
INSERT INTO `tb_administrative_division` VALUES (2185, '河南省', '410000', '开封市', '410200', '通许县', '410222');
INSERT INTO `tb_administrative_division` VALUES (2186, '河南省', '410000', '开封市', '410200', '顺河回族区', '410203');
INSERT INTO `tb_administrative_division` VALUES (2187, '河南省', '410000', '开封市', '410200', '祥符区', '410212');
INSERT INTO `tb_administrative_division` VALUES (2188, '河南省', '410000', '漯河市', '411100', '源汇区', '411102');
INSERT INTO `tb_administrative_division` VALUES (2189, '河南省', '410000', '漯河市', '411100', '舞阳县', '411121');
INSERT INTO `tb_administrative_division` VALUES (2190, '河南省', '410000', '漯河市', '411100', '临颍县', '411122');
INSERT INTO `tb_administrative_division` VALUES (2191, '河南省', '410000', '漯河市', '411100', '召陵区', '411104');
INSERT INTO `tb_administrative_division` VALUES (2192, '河南省', '410000', '漯河市', '411100', '郾城区', '411123');
INSERT INTO `tb_administrative_division` VALUES (2193, '河南省', '410000', '焦作市', '410800', '中站区', '410803');
INSERT INTO `tb_administrative_division` VALUES (2194, '河南省', '410000', '焦作市', '410800', '武陟县', '410823');
INSERT INTO `tb_administrative_division` VALUES (2195, '河南省', '410000', '焦作市', '410800', '孟州市', '410883');
INSERT INTO `tb_administrative_division` VALUES (2196, '河南省', '410000', '焦作市', '410800', '解放区', '410802');
INSERT INTO `tb_administrative_division` VALUES (2197, '河南省', '410000', '焦作市', '410800', '博爱县', '410822');
INSERT INTO `tb_administrative_division` VALUES (2198, '河南省', '410000', '焦作市', '410800', '沁阳市', '410882');
INSERT INTO `tb_administrative_division` VALUES (2199, '河南省', '410000', '焦作市', '410800', '修武县', '410821');
INSERT INTO `tb_administrative_division` VALUES (2200, '河南省', '410000', '焦作市', '410800', '马村区', '410804');
INSERT INTO `tb_administrative_division` VALUES (2201, '河南省', '410000', '焦作市', '410800', '温县', '410825');
INSERT INTO `tb_administrative_division` VALUES (2202, '河南省', '410000', '焦作市', '410800', '山阳区', '410811');
INSERT INTO `tb_administrative_division` VALUES (2203, '河南省', '410000', '安阳市', '410500', '文峰区', '410502');
INSERT INTO `tb_administrative_division` VALUES (2204, '河南省', '410000', '安阳市', '410500', '汤阴县', '410523');
INSERT INTO `tb_administrative_division` VALUES (2205, '河南省', '410000', '安阳市', '410500', '殷都区', '410505');
INSERT INTO `tb_administrative_division` VALUES (2206, '河南省', '410000', '安阳市', '410500', '北关区', '410503');
INSERT INTO `tb_administrative_division` VALUES (2207, '河南省', '410000', '安阳市', '410500', '安阳县', '410522');
INSERT INTO `tb_administrative_division` VALUES (2208, '河南省', '410000', '安阳市', '410500', '林州市', '410581');
INSERT INTO `tb_administrative_division` VALUES (2209, '河南省', '410000', '安阳市', '410500', '龙安区', '410506');
INSERT INTO `tb_administrative_division` VALUES (2210, '河南省', '410000', '安阳市', '410500', '内黄县', '410527');
INSERT INTO `tb_administrative_division` VALUES (2211, '河南省', '410000', '安阳市', '410500', '滑县', '410526');
INSERT INTO `tb_administrative_division` VALUES (2212, '河南省', '410000', '濮阳市', '410900', '台前县', '410927');
INSERT INTO `tb_administrative_division` VALUES (2213, '河南省', '410000', '濮阳市', '410900', '南乐县', '410923');
INSERT INTO `tb_administrative_division` VALUES (2214, '河南省', '410000', '濮阳市', '410900', '清丰县', '410922');
INSERT INTO `tb_administrative_division` VALUES (2215, '河南省', '410000', '濮阳市', '410900', '华龙区', '410902');
INSERT INTO `tb_administrative_division` VALUES (2216, '河南省', '410000', '濮阳市', '410900', '濮阳县', '410928');
INSERT INTO `tb_administrative_division` VALUES (2217, '河南省', '410000', '濮阳市', '410900', '范县', '410926');
INSERT INTO `tb_administrative_division` VALUES (2218, '河南省', '410000', '新乡市', '410700', '红旗区', '410702');
INSERT INTO `tb_administrative_division` VALUES (2219, '河南省', '410000', '新乡市', '410700', '辉县市', '410782');
INSERT INTO `tb_administrative_division` VALUES (2220, '河南省', '410000', '新乡市', '410700', '封丘县', '410727');
INSERT INTO `tb_administrative_division` VALUES (2221, '河南省', '410000', '新乡市', '410700', '凤泉区', '410704');
INSERT INTO `tb_administrative_division` VALUES (2222, '河南省', '410000', '新乡市', '410700', '原阳县', '410725');
INSERT INTO `tb_administrative_division` VALUES (2223, '河南省', '410000', '新乡市', '410700', '新乡县', '410721');
INSERT INTO `tb_administrative_division` VALUES (2224, '河南省', '410000', '新乡市', '410700', '卫辉市', '410781');
INSERT INTO `tb_administrative_division` VALUES (2225, '河南省', '410000', '新乡市', '410700', '长垣县', '410728');
INSERT INTO `tb_administrative_division` VALUES (2226, '河南省', '410000', '新乡市', '410700', '牧野区', '410711');
INSERT INTO `tb_administrative_division` VALUES (2227, '河南省', '410000', '新乡市', '410700', '卫滨区', '410703');
INSERT INTO `tb_administrative_division` VALUES (2228, '河南省', '410000', '新乡市', '410700', '获嘉县', '410724');
INSERT INTO `tb_administrative_division` VALUES (2229, '河南省', '410000', '新乡市', '410700', '延津县', '410726');
INSERT INTO `tb_administrative_division` VALUES (2230, '河南省', '410000', '信阳市', '411500', '光山县', '411522');
INSERT INTO `tb_administrative_division` VALUES (2231, '河南省', '410000', '信阳市', '411500', '息县', '411528');
INSERT INTO `tb_administrative_division` VALUES (2232, '河南省', '410000', '信阳市', '411500', '平桥区', '411503');
INSERT INTO `tb_administrative_division` VALUES (2233, '河南省', '410000', '信阳市', '411500', '淮滨县', '411527');
INSERT INTO `tb_administrative_division` VALUES (2234, '河南省', '410000', '信阳市', '411500', '固始县', '411525');
INSERT INTO `tb_administrative_division` VALUES (2235, '河南省', '410000', '信阳市', '411500', '罗山县', '411521');
INSERT INTO `tb_administrative_division` VALUES (2236, '河南省', '410000', '信阳市', '411500', '新县', '411523');
INSERT INTO `tb_administrative_division` VALUES (2237, '河南省', '410000', '信阳市', '411500', '浉河区', '411502');
INSERT INTO `tb_administrative_division` VALUES (2238, '河南省', '410000', '信阳市', '411500', '商城县', '411524');
INSERT INTO `tb_administrative_division` VALUES (2239, '河南省', '410000', '信阳市', '411500', '潢川县', '411526');
INSERT INTO `tb_administrative_division` VALUES (2240, '河南省', '410000', '鹤壁市', '410600', '淇县', '410622');
INSERT INTO `tb_administrative_division` VALUES (2241, '河南省', '410000', '鹤壁市', '410600', '山城区', '410603');
INSERT INTO `tb_administrative_division` VALUES (2242, '河南省', '410000', '鹤壁市', '410600', '鹤山区', '410602');
INSERT INTO `tb_administrative_division` VALUES (2243, '河南省', '410000', '鹤壁市', '410600', '浚县', '410621');
INSERT INTO `tb_administrative_division` VALUES (2244, '河南省', '410000', '鹤壁市', '410600', '淇滨区', '410611');
INSERT INTO `tb_administrative_division` VALUES (2245, '河南省', '410000', '三门峡市', '411200', '卢氏县', '411224');
INSERT INTO `tb_administrative_division` VALUES (2246, '河南省', '410000', '三门峡市', '411200', '义马市', '411281');
INSERT INTO `tb_administrative_division` VALUES (2247, '河南省', '410000', '三门峡市', '411200', '渑池县', '411221');
INSERT INTO `tb_administrative_division` VALUES (2248, '河南省', '410000', '三门峡市', '411200', '湖滨区', '411202');
INSERT INTO `tb_administrative_division` VALUES (2249, '河南省', '410000', '三门峡市', '411200', '灵宝市', '411282');
INSERT INTO `tb_administrative_division` VALUES (2250, '河南省', '410000', '三门峡市', '411200', '陕州区', '411222');
INSERT INTO `tb_administrative_division` VALUES (2251, '河南省', '410000', '三门峡市', '411200', '陕州区', '411203');
INSERT INTO `tb_administrative_division` VALUES (2252, '河南省', '410000', '驻马店市', '411700', '上蔡县', '411722');
INSERT INTO `tb_administrative_division` VALUES (2253, '河南省', '410000', '驻马店市', '411700', '遂平县', '411728');
INSERT INTO `tb_administrative_division` VALUES (2254, '河南省', '410000', '驻马店市', '411700', '正阳县', '411724');
INSERT INTO `tb_administrative_division` VALUES (2255, '河南省', '410000', '驻马店市', '411700', '新蔡县', '411729');
INSERT INTO `tb_administrative_division` VALUES (2256, '河南省', '410000', '驻马店市', '411700', '驿城区', '411702');
INSERT INTO `tb_administrative_division` VALUES (2257, '河南省', '410000', '驻马店市', '411700', '平舆县', '411723');
INSERT INTO `tb_administrative_division` VALUES (2258, '河南省', '410000', '驻马店市', '411700', '汝南县', '411727');
INSERT INTO `tb_administrative_division` VALUES (2259, '河南省', '410000', '驻马店市', '411700', '确山县', '411725');
INSERT INTO `tb_administrative_division` VALUES (2260, '河南省', '410000', '驻马店市', '411700', '西平县', '411721');
INSERT INTO `tb_administrative_division` VALUES (2261, '河南省', '410000', '驻马店市', '411700', '泌阳县', '411726');
INSERT INTO `tb_administrative_division` VALUES (2262, '河南省', '410000', '周口市', '411600', '扶沟县', '411621');
INSERT INTO `tb_administrative_division` VALUES (2263, '河南省', '410000', '周口市', '411600', '郸城县', '411625');
INSERT INTO `tb_administrative_division` VALUES (2264, '河南省', '410000', '周口市', '411600', '商水县', '411623');
INSERT INTO `tb_administrative_division` VALUES (2265, '河南省', '410000', '周口市', '411600', '沈丘县', '411624');
INSERT INTO `tb_administrative_division` VALUES (2266, '河南省', '410000', '周口市', '411600', '太康县', '411627');
INSERT INTO `tb_administrative_division` VALUES (2267, '河南省', '410000', '周口市', '411600', '川汇区', '411602');
INSERT INTO `tb_administrative_division` VALUES (2268, '河南省', '410000', '周口市', '411600', '鹿邑县', '411628');
INSERT INTO `tb_administrative_division` VALUES (2269, '河南省', '410000', '周口市', '411600', '项城市', '411681');
INSERT INTO `tb_administrative_division` VALUES (2270, '河南省', '410000', '周口市', '411600', '西华县', '411622');
INSERT INTO `tb_administrative_division` VALUES (2271, '河南省', '410000', '周口市', '411600', '淮阳县', '411626');
INSERT INTO `tb_administrative_division` VALUES (2272, '河南省', '410000', '南阳市', '411300', '社旗县', '411327');
INSERT INTO `tb_administrative_division` VALUES (2273, '河南省', '410000', '南阳市', '411300', '桐柏县', '411330');
INSERT INTO `tb_administrative_division` VALUES (2274, '河南省', '410000', '南阳市', '411300', '唐河县', '411328');
INSERT INTO `tb_administrative_division` VALUES (2275, '河南省', '410000', '南阳市', '411300', '卧龙区', '411303');
INSERT INTO `tb_administrative_division` VALUES (2276, '河南省', '410000', '南阳市', '411300', '新野县', '411329');
INSERT INTO `tb_administrative_division` VALUES (2277, '河南省', '410000', '南阳市', '411300', '南召县', '411321');
INSERT INTO `tb_administrative_division` VALUES (2278, '河南省', '410000', '南阳市', '411300', '西峡县', '411323');
INSERT INTO `tb_administrative_division` VALUES (2279, '河南省', '410000', '南阳市', '411300', '宛城区', '411302');
INSERT INTO `tb_administrative_division` VALUES (2280, '河南省', '410000', '南阳市', '411300', '内乡县', '411325');
INSERT INTO `tb_administrative_division` VALUES (2281, '河南省', '410000', '南阳市', '411300', '方城县', '411322');
INSERT INTO `tb_administrative_division` VALUES (2282, '河南省', '410000', '南阳市', '411300', '邓州市', '411381');
INSERT INTO `tb_administrative_division` VALUES (2283, '河南省', '410000', '南阳市', '411300', '镇平县', '411324');
INSERT INTO `tb_administrative_division` VALUES (2284, '河南省', '410000', '南阳市', '411300', '淅川县', '411326');
INSERT INTO `tb_administrative_division` VALUES (2285, '河南省', '410000', '济源市', '419001', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (2286, '河南省', '410000', '洛阳市', '410300', '新安县', '410323');
INSERT INTO `tb_administrative_division` VALUES (2287, '河南省', '410000', '洛阳市', '410300', '洛宁县', '410328');
INSERT INTO `tb_administrative_division` VALUES (2288, '河南省', '410000', '洛阳市', '410300', '洛龙区', '410307');
INSERT INTO `tb_administrative_division` VALUES (2289, '河南省', '410000', '洛阳市', '410300', '偃师市', '410381');
INSERT INTO `tb_administrative_division` VALUES (2290, '河南省', '410000', '洛阳市', '410300', '伊川县', '410329');
INSERT INTO `tb_administrative_division` VALUES (2291, '河南省', '410000', '洛阳市', '410300', '宜阳县', '410327');
INSERT INTO `tb_administrative_division` VALUES (2292, '河南省', '410000', '洛阳市', '410300', '老城区', '410302');
INSERT INTO `tb_administrative_division` VALUES (2293, '河南省', '410000', '洛阳市', '410300', '涧西区', '410305');
INSERT INTO `tb_administrative_division` VALUES (2294, '河南省', '410000', '洛阳市', '410300', '栾川县', '410324');
INSERT INTO `tb_administrative_division` VALUES (2295, '河南省', '410000', '洛阳市', '410300', '西工区', '410303');
INSERT INTO `tb_administrative_division` VALUES (2296, '河南省', '410000', '洛阳市', '410300', '孟津县', '410322');
INSERT INTO `tb_administrative_division` VALUES (2297, '河南省', '410000', '洛阳市', '410300', '嵩县', '410325');
INSERT INTO `tb_administrative_division` VALUES (2298, '河南省', '410000', '洛阳市', '410300', '吉利区', '410306');
INSERT INTO `tb_administrative_division` VALUES (2299, '河南省', '410000', '洛阳市', '410300', '瀍河回族区', '410304');
INSERT INTO `tb_administrative_division` VALUES (2300, '河南省', '410000', '洛阳市', '410300', '汝阳县', '410326');
INSERT INTO `tb_administrative_division` VALUES (2301, '澳门特别行政区', '820000', 'NULL', 'NULL', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (2302, '海南省', '460000', '儋州市', '460400', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (2303, '海南省', '460000', '海口市', '460100', '龙华区', '460106');
INSERT INTO `tb_administrative_division` VALUES (2304, '海南省', '460000', '海口市', '460100', '琼山区', '460107');
INSERT INTO `tb_administrative_division` VALUES (2305, '海南省', '460000', '海口市', '460100', '美兰区', '460108');
INSERT INTO `tb_administrative_division` VALUES (2306, '海南省', '460000', '海口市', '460100', '秀英区', '460105');
INSERT INTO `tb_administrative_division` VALUES (2307, '海南省', '460000', '三亚市', '460200', '吉阳区', '460203');
INSERT INTO `tb_administrative_division` VALUES (2308, '海南省', '460000', '三亚市', '460200', '天涯区', '460204');
INSERT INTO `tb_administrative_division` VALUES (2309, '海南省', '460000', '三亚市', '460200', '崖州区', '460205');
INSERT INTO `tb_administrative_division` VALUES (2310, '海南省', '460000', '三亚市', '460200', '海棠区', '460202');
INSERT INTO `tb_administrative_division` VALUES (2311, '海南省', '460000', '三沙市', '460300', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (2312, '广西壮族自治区', '450000', '梧州市', '450400', '长洲区', '450405');
INSERT INTO `tb_administrative_division` VALUES (2313, '广西壮族自治区', '450000', '梧州市', '450400', '万秀区', '450403');
INSERT INTO `tb_administrative_division` VALUES (2314, '广西壮族自治区', '450000', '梧州市', '450400', '苍梧县', '450421');
INSERT INTO `tb_administrative_division` VALUES (2315, '广西壮族自治区', '450000', '梧州市', '450400', '藤县', '450422');
INSERT INTO `tb_administrative_division` VALUES (2316, '广西壮族自治区', '450000', '梧州市', '450400', '岑溪市', '450481');
INSERT INTO `tb_administrative_division` VALUES (2317, '广西壮族自治区', '450000', '梧州市', '450400', '蒙山县', '450423');
INSERT INTO `tb_administrative_division` VALUES (2318, '广西壮族自治区', '450000', '梧州市', '450400', '蝶山区', '450404');
INSERT INTO `tb_administrative_division` VALUES (2319, '广西壮族自治区', '450000', '梧州市', '450400', '龙圩区', '450406');
INSERT INTO `tb_administrative_division` VALUES (2320, '广西壮族自治区', '450000', '河池市', '451200', '金城江区', '451202');
INSERT INTO `tb_administrative_division` VALUES (2321, '广西壮族自治区', '450000', '河池市', '451200', '凤山县', '451223');
INSERT INTO `tb_administrative_division` VALUES (2322, '广西壮族自治区', '450000', '河池市', '451200', '南丹县', '451221');
INSERT INTO `tb_administrative_division` VALUES (2323, '广西壮族自治区', '450000', '河池市', '451200', '都安瑶族自治县', '451228');
INSERT INTO `tb_administrative_division` VALUES (2324, '广西壮族自治区', '450000', '河池市', '451200', '宜州市', '451281');
INSERT INTO `tb_administrative_division` VALUES (2325, '广西壮族自治区', '450000', '河池市', '451200', '罗城仫佬族自治县', '451225');
INSERT INTO `tb_administrative_division` VALUES (2326, '广西壮族自治区', '450000', '河池市', '451200', '东兰县', '451224');
INSERT INTO `tb_administrative_division` VALUES (2327, '广西壮族自治区', '450000', '河池市', '451200', '天峨县', '451222');
INSERT INTO `tb_administrative_division` VALUES (2328, '广西壮族自治区', '450000', '河池市', '451200', '大化瑶族自治县', '451229');
INSERT INTO `tb_administrative_division` VALUES (2329, '广西壮族自治区', '450000', '河池市', '451200', '环江毛南族自治县', '451226');
INSERT INTO `tb_administrative_division` VALUES (2330, '广西壮族自治区', '450000', '河池市', '451200', '巴马瑶族自治县', '451227');
INSERT INTO `tb_administrative_division` VALUES (2331, '广西壮族自治区', '450000', '贺州市', '451100', '富川瑶族自治县', '451123');
INSERT INTO `tb_administrative_division` VALUES (2332, '广西壮族自治区', '450000', '贺州市', '451100', '钟山县', '451122');
INSERT INTO `tb_administrative_division` VALUES (2333, '广西壮族自治区', '450000', '贺州市', '451100', '昭平县', '451121');
INSERT INTO `tb_administrative_division` VALUES (2334, '广西壮族自治区', '450000', '贺州市', '451100', '八步区', '451102');
INSERT INTO `tb_administrative_division` VALUES (2335, '广西壮族自治区', '450000', '贺州市', '451100', '平桂区', '451103');
INSERT INTO `tb_administrative_division` VALUES (2336, '广西壮族自治区', '450000', '南宁市', '450100', '兴宁区', '450102');
INSERT INTO `tb_administrative_division` VALUES (2337, '广西壮族自治区', '450000', '南宁市', '450100', '江南区', '450105');
INSERT INTO `tb_administrative_division` VALUES (2338, '广西壮族自治区', '450000', '南宁市', '450100', '西乡塘区', '450107');
INSERT INTO `tb_administrative_division` VALUES (2339, '广西壮族自治区', '450000', '南宁市', '450100', '良庆区', '450108');
INSERT INTO `tb_administrative_division` VALUES (2340, '广西壮族自治区', '450000', '南宁市', '450100', '邕宁区', '450109');
INSERT INTO `tb_administrative_division` VALUES (2341, '广西壮族自治区', '450000', '南宁市', '450100', '隆安县', '450123');
INSERT INTO `tb_administrative_division` VALUES (2342, '广西壮族自治区', '450000', '南宁市', '450100', '横县', '450127');
INSERT INTO `tb_administrative_division` VALUES (2343, '广西壮族自治区', '450000', '南宁市', '450100', '宾阳县', '450126');
INSERT INTO `tb_administrative_division` VALUES (2344, '广西壮族自治区', '450000', '南宁市', '450100', '武鸣县', '450122');
INSERT INTO `tb_administrative_division` VALUES (2345, '广西壮族自治区', '450000', '南宁市', '450100', '青秀区', '450103');
INSERT INTO `tb_administrative_division` VALUES (2346, '广西壮族自治区', '450000', '南宁市', '450100', '马山县', '450124');
INSERT INTO `tb_administrative_division` VALUES (2347, '广西壮族自治区', '450000', '南宁市', '450100', '上林县', '450125');
INSERT INTO `tb_administrative_division` VALUES (2348, '广西壮族自治区', '450000', '来宾市', '451300', '合山市', '451381');
INSERT INTO `tb_administrative_division` VALUES (2349, '广西壮族自治区', '450000', '来宾市', '451300', '金秀瑶族自治县', '451324');
INSERT INTO `tb_administrative_division` VALUES (2350, '广西壮族自治区', '450000', '来宾市', '451300', '象州县', '451322');
INSERT INTO `tb_administrative_division` VALUES (2351, '广西壮族自治区', '450000', '来宾市', '451300', '武宣县', '451323');
INSERT INTO `tb_administrative_division` VALUES (2352, '广西壮族自治区', '450000', '来宾市', '451300', '忻城县', '451321');
INSERT INTO `tb_administrative_division` VALUES (2353, '广西壮族自治区', '450000', '来宾市', '451300', '兴宾区', '451302');
INSERT INTO `tb_administrative_division` VALUES (2354, '广西壮族自治区', '450000', '防城港市', '450600', '防城区', '450603');
INSERT INTO `tb_administrative_division` VALUES (2355, '广西壮族自治区', '450000', '防城港市', '450600', '港口区', '450602');
INSERT INTO `tb_administrative_division` VALUES (2356, '广西壮族自治区', '450000', '防城港市', '450600', '东兴市', '450681');
INSERT INTO `tb_administrative_division` VALUES (2357, '广西壮族自治区', '450000', '防城港市', '450600', '上思县', '450621');
INSERT INTO `tb_administrative_division` VALUES (2358, '广西壮族自治区', '450000', '钦州市', '450700', '浦北县', '450722');
INSERT INTO `tb_administrative_division` VALUES (2359, '广西壮族自治区', '450000', '钦州市', '450700', '钦北区', '450703');
INSERT INTO `tb_administrative_division` VALUES (2360, '广西壮族自治区', '450000', '钦州市', '450700', '灵山县', '450721');
INSERT INTO `tb_administrative_division` VALUES (2361, '广西壮族自治区', '450000', '钦州市', '450700', '钦南区', '450702');
INSERT INTO `tb_administrative_division` VALUES (2362, '广西壮族自治区', '450000', '柳州市', '450200', '柳江县', '450221');
INSERT INTO `tb_administrative_division` VALUES (2363, '广西壮族自治区', '450000', '柳州市', '450200', '鱼峰区', '450203');
INSERT INTO `tb_administrative_division` VALUES (2364, '广西壮族自治区', '450000', '柳州市', '450200', '融安县', '450224');
INSERT INTO `tb_administrative_division` VALUES (2365, '广西壮族自治区', '450000', '柳州市', '450200', '柳城县', '450222');
INSERT INTO `tb_administrative_division` VALUES (2366, '广西壮族自治区', '450000', '柳州市', '450200', '融水苗族自治县', '450225');
INSERT INTO `tb_administrative_division` VALUES (2367, '广西壮族自治区', '450000', '柳州市', '450200', '鹿寨县', '450223');
INSERT INTO `tb_administrative_division` VALUES (2368, '广西壮族自治区', '450000', '柳州市', '450200', '城中区', '450202');
INSERT INTO `tb_administrative_division` VALUES (2369, '广西壮族自治区', '450000', '柳州市', '450200', '柳北区', '450205');
INSERT INTO `tb_administrative_division` VALUES (2370, '广西壮族自治区', '450000', '柳州市', '450200', '三江侗族自治县', '450226');
INSERT INTO `tb_administrative_division` VALUES (2371, '广西壮族自治区', '450000', '柳州市', '450200', '柳南区', '450204');
INSERT INTO `tb_administrative_division` VALUES (2372, '广西壮族自治区', '450000', '贵港市', '450800', '覃塘区', '450804');
INSERT INTO `tb_administrative_division` VALUES (2373, '广西壮族自治区', '450000', '贵港市', '450800', '港北区', '450802');
INSERT INTO `tb_administrative_division` VALUES (2374, '广西壮族自治区', '450000', '贵港市', '450800', '平南县', '450821');
INSERT INTO `tb_administrative_division` VALUES (2375, '广西壮族自治区', '450000', '贵港市', '450800', '港南区', '450803');
INSERT INTO `tb_administrative_division` VALUES (2376, '广西壮族自治区', '450000', '贵港市', '450800', '桂平市', '450881');
INSERT INTO `tb_administrative_division` VALUES (2377, '广西壮族自治区', '450000', '桂林市', '450300', '灵川县', '450323');
INSERT INTO `tb_administrative_division` VALUES (2378, '广西壮族自治区', '450000', '桂林市', '450300', '资源县', '450329');
INSERT INTO `tb_administrative_division` VALUES (2379, '广西壮族自治区', '450000', '桂林市', '450300', '阳朔县', '450321');
INSERT INTO `tb_administrative_division` VALUES (2380, '广西壮族自治区', '450000', '桂林市', '450300', '秀峰区', '450302');
INSERT INTO `tb_administrative_division` VALUES (2381, '广西壮族自治区', '450000', '桂林市', '450300', '全州县', '450324');
INSERT INTO `tb_administrative_division` VALUES (2382, '广西壮族自治区', '450000', '桂林市', '450300', '灌阳县', '450327');
INSERT INTO `tb_administrative_division` VALUES (2383, '广西壮族自治区', '450000', '桂林市', '450300', '象山区', '450304');
INSERT INTO `tb_administrative_division` VALUES (2384, '广西壮族自治区', '450000', '桂林市', '450300', '兴安县', '450325');
INSERT INTO `tb_administrative_division` VALUES (2385, '广西壮族自治区', '450000', '桂林市', '450300', '雁山区', '450311');
INSERT INTO `tb_administrative_division` VALUES (2386, '广西壮族自治区', '450000', '桂林市', '450300', '恭城瑶族自治县', '450332');
INSERT INTO `tb_administrative_division` VALUES (2387, '广西壮族自治区', '450000', '桂林市', '450300', '叠彩区', '450303');
INSERT INTO `tb_administrative_division` VALUES (2388, '广西壮族自治区', '450000', '桂林市', '450300', '临桂县', '450322');
INSERT INTO `tb_administrative_division` VALUES (2389, '广西壮族自治区', '450000', '桂林市', '450300', '七星区', '450305');
INSERT INTO `tb_administrative_division` VALUES (2390, '广西壮族自治区', '450000', '桂林市', '450300', '荔浦县', '450331');
INSERT INTO `tb_administrative_division` VALUES (2391, '广西壮族自治区', '450000', '桂林市', '450300', '龙胜各族自治县', '450328');
INSERT INTO `tb_administrative_division` VALUES (2392, '广西壮族自治区', '450000', '桂林市', '450300', '平乐县', '450330');
INSERT INTO `tb_administrative_division` VALUES (2393, '广西壮族自治区', '450000', '桂林市', '450300', '永福县', '450326');
INSERT INTO `tb_administrative_division` VALUES (2394, '广西壮族自治区', '450000', '北海市', '450500', '海城区', '450502');
INSERT INTO `tb_administrative_division` VALUES (2395, '广西壮族自治区', '450000', '北海市', '450500', '合浦县', '450521');
INSERT INTO `tb_administrative_division` VALUES (2396, '广西壮族自治区', '450000', '北海市', '450500', '铁山港区', '450512');
INSERT INTO `tb_administrative_division` VALUES (2397, '广西壮族自治区', '450000', '北海市', '450500', '银海区', '450503');
INSERT INTO `tb_administrative_division` VALUES (2398, '广西壮族自治区', '450000', '百色市', '451000', '隆林各族自治县', '451031');
INSERT INTO `tb_administrative_division` VALUES (2399, '广西壮族自治区', '450000', '百色市', '451000', '平果县', '451023');
INSERT INTO `tb_administrative_division` VALUES (2400, '广西壮族自治区', '450000', '百色市', '451000', '西林县', '451030');
INSERT INTO `tb_administrative_division` VALUES (2401, '广西壮族自治区', '450000', '百色市', '451000', '右江区', '451002');
INSERT INTO `tb_administrative_division` VALUES (2402, '广西壮族自治区', '450000', '百色市', '451000', '田林县', '451029');
INSERT INTO `tb_administrative_division` VALUES (2403, '广西壮族自治区', '450000', '百色市', '451000', '田阳县', '451021');
INSERT INTO `tb_administrative_division` VALUES (2404, '广西壮族自治区', '450000', '百色市', '451000', '德保县', '451024');
INSERT INTO `tb_administrative_division` VALUES (2405, '广西壮族自治区', '450000', '百色市', '451000', '乐业县', '451028');
INSERT INTO `tb_administrative_division` VALUES (2406, '广西壮族自治区', '450000', '百色市', '451000', '田东县', '451022');
INSERT INTO `tb_administrative_division` VALUES (2407, '广西壮族自治区', '450000', '百色市', '451000', '凌云县', '451027');
INSERT INTO `tb_administrative_division` VALUES (2408, '广西壮族自治区', '450000', '百色市', '451000', '靖西县', '451025');
INSERT INTO `tb_administrative_division` VALUES (2409, '广西壮族自治区', '450000', '百色市', '451000', '那坡县', '451026');
INSERT INTO `tb_administrative_division` VALUES (2410, '广西壮族自治区', '450000', '百色市', '451000', '靖西市', '451081');
INSERT INTO `tb_administrative_division` VALUES (2411, '广西壮族自治区', '450000', '玉林市', '450900', '北流市', '450981');
INSERT INTO `tb_administrative_division` VALUES (2412, '广西壮族自治区', '450000', '玉林市', '450900', '博白县', '450923');
INSERT INTO `tb_administrative_division` VALUES (2413, '广西壮族自治区', '450000', '玉林市', '450900', '容县', '450921');
INSERT INTO `tb_administrative_division` VALUES (2414, '广西壮族自治区', '450000', '玉林市', '450900', '玉州区', '450902');
INSERT INTO `tb_administrative_division` VALUES (2415, '广西壮族自治区', '450000', '玉林市', '450900', '陆川县', '450922');
INSERT INTO `tb_administrative_division` VALUES (2416, '广西壮族自治区', '450000', '玉林市', '450900', '兴业县', '450924');
INSERT INTO `tb_administrative_division` VALUES (2417, '广西壮族自治区', '450000', '玉林市', '450900', '福绵区', '450903');
INSERT INTO `tb_administrative_division` VALUES (2418, '广西壮族自治区', '450000', '崇左市', '451400', '天等县', '451425');
INSERT INTO `tb_administrative_division` VALUES (2419, '广西壮族自治区', '450000', '崇左市', '451400', '龙州县', '451423');
INSERT INTO `tb_administrative_division` VALUES (2420, '广西壮族自治区', '450000', '崇左市', '451400', '大新县', '451424');
INSERT INTO `tb_administrative_division` VALUES (2421, '广西壮族自治区', '450000', '崇左市', '451400', '宁明县', '451422');
INSERT INTO `tb_administrative_division` VALUES (2422, '广西壮族自治区', '450000', '崇左市', '451400', '扶绥县', '451421');
INSERT INTO `tb_administrative_division` VALUES (2423, '广西壮族自治区', '450000', '崇左市', '451400', '凭祥市', '451481');
INSERT INTO `tb_administrative_division` VALUES (2424, '广西壮族自治区', '450000', '崇左市', '451400', '江州区', '451402');
INSERT INTO `tb_administrative_division` VALUES (2425, '香港特别行政区', '810000', 'NULL', 'NULL', 'NULL', 'NULL');
INSERT INTO `tb_administrative_division` VALUES (2426, '湖南省', '430000', '郴州市', '431000', '安仁县', '431028');
INSERT INTO `tb_administrative_division` VALUES (2427, '湖南省', '430000', '郴州市', '431000', '桂东县', '431027');
INSERT INTO `tb_administrative_division` VALUES (2428, '湖南省', '430000', '郴州市', '431000', '宜章县', '431022');
INSERT INTO `tb_administrative_division` VALUES (2429, '湖南省', '430000', '郴州市', '431000', '临武县', '431025');
INSERT INTO `tb_administrative_division` VALUES (2430, '湖南省', '430000', '郴州市', '431000', '资兴市', '431081');
INSERT INTO `tb_administrative_division` VALUES (2431, '湖南省', '430000', '郴州市', '431000', '北湖区', '431002');
INSERT INTO `tb_administrative_division` VALUES (2432, '湖南省', '430000', '郴州市', '431000', '桂阳县', '431021');
INSERT INTO `tb_administrative_division` VALUES (2433, '湖南省', '430000', '郴州市', '431000', '永兴县', '431023');
INSERT INTO `tb_administrative_division` VALUES (2434, '湖南省', '430000', '郴州市', '431000', '苏仙区', '431003');
INSERT INTO `tb_administrative_division` VALUES (2435, '湖南省', '430000', '郴州市', '431000', '嘉禾县', '431024');
INSERT INTO `tb_administrative_division` VALUES (2436, '湖南省', '430000', '郴州市', '431000', '汝城县', '431026');
INSERT INTO `tb_administrative_division` VALUES (2437, '湖南省', '430000', '长沙市', '430100', '雨花区', '430111');
INSERT INTO `tb_administrative_division` VALUES (2438, '湖南省', '430000', '长沙市', '430100', '浏阳市', '430181');
INSERT INTO `tb_administrative_division` VALUES (2439, '湖南省', '430000', '长沙市', '430100', '岳麓区', '430104');
INSERT INTO `tb_administrative_division` VALUES (2440, '湖南省', '430000', '长沙市', '430100', '芙蓉区', '430102');
INSERT INTO `tb_administrative_division` VALUES (2441, '湖南省', '430000', '长沙市', '430100', '天心区', '430103');
INSERT INTO `tb_administrative_division` VALUES (2442, '湖南省', '430000', '长沙市', '430100', '开福区', '430105');
INSERT INTO `tb_administrative_division` VALUES (2443, '湖南省', '430000', '长沙市', '430100', '宁乡县', '430124');
INSERT INTO `tb_administrative_division` VALUES (2444, '湖南省', '430000', '长沙市', '430100', '望城区', '430122');
INSERT INTO `tb_administrative_division` VALUES (2445, '湖南省', '430000', '长沙市', '430100', '长沙县', '430121');
INSERT INTO `tb_administrative_division` VALUES (2446, '湖南省', '430000', '永州市', '431100', '零陵区', '431102');
INSERT INTO `tb_administrative_division` VALUES (2447, '湖南省', '430000', '永州市', '431100', '新田县', '431128');
INSERT INTO `tb_administrative_division` VALUES (2448, '湖南省', '430000', '永州市', '431100', '蓝山县', '431127');
INSERT INTO `tb_administrative_division` VALUES (2449, '湖南省', '430000', '永州市', '431100', '东安县', '431122');
INSERT INTO `tb_administrative_division` VALUES (2450, '湖南省', '430000', '永州市', '431100', '冷水滩区', '431103');
INSERT INTO `tb_administrative_division` VALUES (2451, '湖南省', '430000', '永州市', '431100', '道县', '431124');
INSERT INTO `tb_administrative_division` VALUES (2452, '湖南省', '430000', '永州市', '431100', '江华瑶族自治县', '431129');
INSERT INTO `tb_administrative_division` VALUES (2453, '湖南省', '430000', '永州市', '431100', '双牌县', '431123');
INSERT INTO `tb_administrative_division` VALUES (2454, '湖南省', '430000', '永州市', '431100', '江永县', '431125');
INSERT INTO `tb_administrative_division` VALUES (2455, '湖南省', '430000', '永州市', '431100', '祁阳县', '431121');
INSERT INTO `tb_administrative_division` VALUES (2456, '湖南省', '430000', '永州市', '431100', '宁远县', '431126');
INSERT INTO `tb_administrative_division` VALUES (2457, '湖南省', '430000', '岳阳市', '430600', '汨罗市', '430681');
INSERT INTO `tb_administrative_division` VALUES (2458, '湖南省', '430000', '岳阳市', '430600', '岳阳县', '430621');
INSERT INTO `tb_administrative_division` VALUES (2459, '湖南省', '430000', '岳阳市', '430600', '华容县', '430623');
INSERT INTO `tb_administrative_division` VALUES (2460, '湖南省', '430000', '岳阳市', '430600', '岳阳楼区', '430602');
INSERT INTO `tb_administrative_division` VALUES (2461, '湖南省', '430000', '岳阳市', '430600', '临湘市', '430682');
INSERT INTO `tb_administrative_division` VALUES (2462, '湖南省', '430000', '岳阳市', '430600', '湘阴县', '430624');
INSERT INTO `tb_administrative_division` VALUES (2463, '湖南省', '430000', '岳阳市', '430600', '云溪区', '430603');
INSERT INTO `tb_administrative_division` VALUES (2464, '湖南省', '430000', '岳阳市', '430600', '君山区', '430611');
INSERT INTO `tb_administrative_division` VALUES (2465, '湖南省', '430000', '岳阳市', '430600', '平江县', '430626');
INSERT INTO `tb_administrative_division` VALUES (2466, '湖南省', '430000', '张家界市', '430800', '永定区', '430802');
INSERT INTO `tb_administrative_division` VALUES (2467, '湖南省', '430000', '张家界市', '430800', '慈利县', '430821');
INSERT INTO `tb_administrative_division` VALUES (2468, '湖南省', '430000', '张家界市', '430800', '武陵源区', '430811');
INSERT INTO `tb_administrative_division` VALUES (2469, '湖南省', '430000', '张家界市', '430800', '桑植县', '430822');
INSERT INTO `tb_administrative_division` VALUES (2470, '湖南省', '430000', '益阳市', '430900', '赫山区', '430903');
INSERT INTO `tb_administrative_division` VALUES (2471, '湖南省', '430000', '益阳市', '430900', '安化县', '430923');
INSERT INTO `tb_administrative_division` VALUES (2472, '湖南省', '430000', '益阳市', '430900', '资阳区', '430902');
INSERT INTO `tb_administrative_division` VALUES (2473, '湖南省', '430000', '益阳市', '430900', '南县', '430921');
INSERT INTO `tb_administrative_division` VALUES (2474, '湖南省', '430000', '益阳市', '430900', '沅江市', '430981');
INSERT INTO `tb_administrative_division` VALUES (2475, '湖南省', '430000', '益阳市', '430900', '桃江县', '430922');
INSERT INTO `tb_administrative_division` VALUES (2476, '湖南省', '430000', '邵阳市', '430500', '新邵县', '430522');
INSERT INTO `tb_administrative_division` VALUES (2477, '湖南省', '430000', '邵阳市', '430500', '大祥区', '430503');
INSERT INTO `tb_administrative_division` VALUES (2478, '湖南省', '430000', '邵阳市', '430500', '武冈市', '430581');
INSERT INTO `tb_administrative_division` VALUES (2479, '湖南省', '430000', '邵阳市', '430500', '邵东县', '430521');
INSERT INTO `tb_administrative_division` VALUES (2480, '湖南省', '430000', '邵阳市', '430500', '新宁县', '430528');
INSERT INTO `tb_administrative_division` VALUES (2481, '湖南省', '430000', '邵阳市', '430500', '城步苗族自治县', '430529');
INSERT INTO `tb_administrative_division` VALUES (2482, '湖南省', '430000', '邵阳市', '430500', '邵阳县', '430523');
INSERT INTO `tb_administrative_division` VALUES (2483, '湖南省', '430000', '邵阳市', '430500', '隆回县', '430524');
INSERT INTO `tb_administrative_division` VALUES (2484, '湖南省', '430000', '邵阳市', '430500', '洞口县', '430525');
INSERT INTO `tb_administrative_division` VALUES (2485, '湖南省', '430000', '邵阳市', '430500', '双清区', '430502');
INSERT INTO `tb_administrative_division` VALUES (2486, '湖南省', '430000', '邵阳市', '430500', '北塔区', '430511');
INSERT INTO `tb_administrative_division` VALUES (2487, '湖南省', '430000', '邵阳市', '430500', '绥宁县', '430527');
INSERT INTO `tb_administrative_division` VALUES (2488, '湖南省', '430000', '株洲市', '430200', '天元区', '430211');
INSERT INTO `tb_administrative_division` VALUES (2489, '湖南省', '430000', '株洲市', '430200', '石峰区', '430204');
INSERT INTO `tb_administrative_division` VALUES (2490, '湖南省', '430000', '株洲市', '430200', '株洲县', '430221');
INSERT INTO `tb_administrative_division` VALUES (2491, '湖南省', '430000', '株洲市', '430200', '荷塘区', '430202');
INSERT INTO `tb_administrative_division` VALUES (2492, '湖南省', '430000', '株洲市', '430200', '芦淞区', '430203');
INSERT INTO `tb_administrative_division` VALUES (2493, '湖南省', '430000', '株洲市', '430200', '茶陵县', '430224');
INSERT INTO `tb_administrative_division` VALUES (2494, '湖南省', '430000', '株洲市', '430200', '醴陵市', '430281');
INSERT INTO `tb_administrative_division` VALUES (2495, '湖南省', '430000', '株洲市', '430200', '攸县', '430223');
INSERT INTO `tb_administrative_division` VALUES (2496, '湖南省', '430000', '株洲市', '430200', '炎陵县', '430225');
INSERT INTO `tb_administrative_division` VALUES (2497, '湖南省', '430000', '湘潭市', '430300', '湘乡市', '430381');
INSERT INTO `tb_administrative_division` VALUES (2498, '湖南省', '430000', '湘潭市', '430300', '岳塘区', '430304');
INSERT INTO `tb_administrative_division` VALUES (2499, '湖南省', '430000', '湘潭市', '430300', '湘潭县', '430321');
INSERT INTO `tb_administrative_division` VALUES (2500, '湖南省', '430000', '湘潭市', '430300', '雨湖区', '430302');
INSERT INTO `tb_administrative_division` VALUES (2501, '湖南省', '430000', '湘潭市', '430300', '韶山市', '430382');
INSERT INTO `tb_administrative_division` VALUES (2502, '湖南省', '430000', '娄底市', '431300', '涟源市', '431382');
INSERT INTO `tb_administrative_division` VALUES (2503, '湖南省', '430000', '娄底市', '431300', '双峰县', '431321');
INSERT INTO `tb_administrative_division` VALUES (2504, '湖南省', '430000', '娄底市', '431300', '娄星区', '431302');
INSERT INTO `tb_administrative_division` VALUES (2505, '湖南省', '430000', '娄底市', '431300', '新化县', '431322');
INSERT INTO `tb_administrative_division` VALUES (2506, '湖南省', '430000', '娄底市', '431300', '冷水江市', '431381');
INSERT INTO `tb_administrative_division` VALUES (2507, '湖南省', '430000', '湘西土家族苗族自治州', '433100', '龙山县', '433130');
INSERT INTO `tb_administrative_division` VALUES (2508, '湖南省', '430000', '湘西土家族苗族自治州', '433100', '永顺县', '433127');
INSERT INTO `tb_administrative_division` VALUES (2509, '湖南省', '430000', '湘西土家族苗族自治州', '433100', '花垣县', '433124');
INSERT INTO `tb_administrative_division` VALUES (2510, '湖南省', '430000', '湘西土家族苗族自治州', '433100', '泸溪县', '433122');
INSERT INTO `tb_administrative_division` VALUES (2511, '湖南省', '430000', '湘西土家族苗族自治州', '433100', '吉首市', '433101');
INSERT INTO `tb_administrative_division` VALUES (2512, '湖南省', '430000', '湘西土家族苗族自治州', '433100', '凤凰县', '433123');
INSERT INTO `tb_administrative_division` VALUES (2513, '湖南省', '430000', '湘西土家族苗族自治州', '433100', '保靖县', '433125');
INSERT INTO `tb_administrative_division` VALUES (2514, '湖南省', '430000', '湘西土家族苗族自治州', '433100', '古丈县', '433126');
INSERT INTO `tb_administrative_division` VALUES (2515, '湖南省', '430000', '怀化市', '431200', '靖州苗族侗族自治县', '431229');
INSERT INTO `tb_administrative_division` VALUES (2516, '湖南省', '430000', '怀化市', '431200', '芷江侗族自治县', '431228');
INSERT INTO `tb_administrative_division` VALUES (2517, '湖南省', '430000', '怀化市', '431200', '溆浦县', '431224');
INSERT INTO `tb_administrative_division` VALUES (2518, '湖南省', '430000', '怀化市', '431200', '洪江市', '431281');
INSERT INTO `tb_administrative_division` VALUES (2519, '湖南省', '430000', '怀化市', '431200', '会同县', '431225');
INSERT INTO `tb_administrative_division` VALUES (2520, '湖南省', '430000', '怀化市', '431200', '辰溪县', '431223');
INSERT INTO `tb_administrative_division` VALUES (2521, '湖南省', '430000', '怀化市', '431200', '新晃侗族自治县', '431227');
INSERT INTO `tb_administrative_division` VALUES (2522, '湖南省', '430000', '怀化市', '431200', '中方县', '431221');
INSERT INTO `tb_administrative_division` VALUES (2523, '湖南省', '430000', '怀化市', '431200', '沅陵县', '431222');
INSERT INTO `tb_administrative_division` VALUES (2524, '湖南省', '430000', '怀化市', '431200', '通道侗族自治县', '431230');
INSERT INTO `tb_administrative_division` VALUES (2525, '湖南省', '430000', '怀化市', '431200', '鹤城区', '431202');
INSERT INTO `tb_administrative_division` VALUES (2526, '湖南省', '430000', '怀化市', '431200', '麻阳苗族自治县', '431226');
INSERT INTO `tb_administrative_division` VALUES (2527, '湖南省', '430000', '衡阳市', '430400', '蒸湘区', '430408');
INSERT INTO `tb_administrative_division` VALUES (2528, '湖南省', '430000', '衡阳市', '430400', '石鼓区', '430407');
INSERT INTO `tb_administrative_division` VALUES (2529, '湖南省', '430000', '衡阳市', '430400', '衡阳县', '430421');
INSERT INTO `tb_administrative_division` VALUES (2530, '湖南省', '430000', '衡阳市', '430400', '耒阳市', '430481');
INSERT INTO `tb_administrative_division` VALUES (2531, '湖南省', '430000', '衡阳市', '430400', '衡南县', '430422');
INSERT INTO `tb_administrative_division` VALUES (2532, '湖南省', '430000', '衡阳市', '430400', '南岳区', '430412');
INSERT INTO `tb_administrative_division` VALUES (2533, '湖南省', '430000', '衡阳市', '430400', '雁峰区', '430406');
INSERT INTO `tb_administrative_division` VALUES (2534, '湖南省', '430000', '衡阳市', '430400', '衡山县', '430423');
INSERT INTO `tb_administrative_division` VALUES (2535, '湖南省', '430000', '衡阳市', '430400', '常宁市', '430482');
INSERT INTO `tb_administrative_division` VALUES (2536, '湖南省', '430000', '衡阳市', '430400', '衡东县', '430424');
INSERT INTO `tb_administrative_division` VALUES (2537, '湖南省', '430000', '衡阳市', '430400', '珠晖区', '430405');
INSERT INTO `tb_administrative_division` VALUES (2538, '湖南省', '430000', '衡阳市', '430400', '祁东县', '430426');
INSERT INTO `tb_administrative_division` VALUES (2539, '湖南省', '430000', '常德市', '430700', '安乡县', '430721');
INSERT INTO `tb_administrative_division` VALUES (2540, '湖南省', '430000', '常德市', '430700', '汉寿县', '430722');
INSERT INTO `tb_administrative_division` VALUES (2541, '湖南省', '430000', '常德市', '430700', '临澧县', '430724');
INSERT INTO `tb_administrative_division` VALUES (2542, '湖南省', '430000', '常德市', '430700', '津市市', '430781');
INSERT INTO `tb_administrative_division` VALUES (2543, '湖南省', '430000', '常德市', '430700', '鼎城区', '430703');
INSERT INTO `tb_administrative_division` VALUES (2544, '湖南省', '430000', '常德市', '430700', '澧县', '430723');
INSERT INTO `tb_administrative_division` VALUES (2545, '湖南省', '430000', '常德市', '430700', '桃源县', '430725');
INSERT INTO `tb_administrative_division` VALUES (2546, '湖南省', '430000', '常德市', '430700', '武陵区', '430702');
INSERT INTO `tb_administrative_division` VALUES (2547, '湖南省', '430000', '常德市', '430700', '石门县', '430726');
INSERT INTO `tb_administrative_division` VALUES (2548, '宁夏回族自治区', '640000', '吴忠市', '640300', '青铜峡市', '640381');
INSERT INTO `tb_administrative_division` VALUES (2549, '宁夏回族自治区', '640000', '吴忠市', '640300', '盐池县', '640323');
INSERT INTO `tb_administrative_division` VALUES (2550, '宁夏回族自治区', '640000', '吴忠市', '640300', '同心县', '640324');
INSERT INTO `tb_administrative_division` VALUES (2551, '宁夏回族自治区', '640000', '吴忠市', '640300', '红寺堡区', '640303');
INSERT INTO `tb_administrative_division` VALUES (2552, '宁夏回族自治区', '640000', '吴忠市', '640300', '利通区', '640302');
INSERT INTO `tb_administrative_division` VALUES (2553, '宁夏回族自治区', '640000', '固原市', '640400', '泾源县', '640424');
INSERT INTO `tb_administrative_division` VALUES (2554, '宁夏回族自治区', '640000', '固原市', '640400', '西吉县', '640422');
INSERT INTO `tb_administrative_division` VALUES (2555, '宁夏回族自治区', '640000', '固原市', '640400', '彭阳县', '640425');
INSERT INTO `tb_administrative_division` VALUES (2556, '宁夏回族自治区', '640000', '固原市', '640400', '原州区', '640402');
INSERT INTO `tb_administrative_division` VALUES (2557, '宁夏回族自治区', '640000', '固原市', '640400', '隆德县', '640423');
INSERT INTO `tb_administrative_division` VALUES (2558, '宁夏回族自治区', '640000', '银川市', '640100', '灵武市', '640181');
INSERT INTO `tb_administrative_division` VALUES (2559, '宁夏回族自治区', '640000', '银川市', '640100', '西夏区', '640105');
INSERT INTO `tb_administrative_division` VALUES (2560, '宁夏回族自治区', '640000', '银川市', '640100', '金凤区', '640106');
INSERT INTO `tb_administrative_division` VALUES (2561, '宁夏回族自治区', '640000', '银川市', '640100', '永宁县', '640121');
INSERT INTO `tb_administrative_division` VALUES (2562, '宁夏回族自治区', '640000', '银川市', '640100', '兴庆区', '640104');
INSERT INTO `tb_administrative_division` VALUES (2563, '宁夏回族自治区', '640000', '银川市', '640100', '贺兰县', '640122');
INSERT INTO `tb_administrative_division` VALUES (2564, '宁夏回族自治区', '640000', '石嘴山市', '640200', '惠农区', '640205');
INSERT INTO `tb_administrative_division` VALUES (2565, '宁夏回族自治区', '640000', '石嘴山市', '640200', '大武口区', '640202');
INSERT INTO `tb_administrative_division` VALUES (2566, '宁夏回族自治区', '640000', '石嘴山市', '640200', '平罗县', '640221');
INSERT INTO `tb_administrative_division` VALUES (2567, '宁夏回族自治区', '640000', '中卫市', '640500', '海原县', '640522');
INSERT INTO `tb_administrative_division` VALUES (2568, '宁夏回族自治区', '640000', '中卫市', '640500', '中宁县', '640521');
INSERT INTO `tb_administrative_division` VALUES (2569, '宁夏回族自治区', '640000', '中卫市', '640500', '沙坡头区', '640502');
INSERT INTO `tb_administrative_division` VALUES (2570, '浙江省', '330000', '台州市', '331000', '黄岩区', '331003');
INSERT INTO `tb_administrative_division` VALUES (2571, '浙江省', '330000', '台州市', '331000', '天台县', '331023');
INSERT INTO `tb_administrative_division` VALUES (2572, '浙江省', '330000', '台州市', '331000', '椒江区', '331002');
INSERT INTO `tb_administrative_division` VALUES (2573, '浙江省', '330000', '台州市', '331000', '仙居县', '331024');
INSERT INTO `tb_administrative_division` VALUES (2574, '浙江省', '330000', '台州市', '331000', '三门县', '331022');
INSERT INTO `tb_administrative_division` VALUES (2575, '浙江省', '330000', '台州市', '331000', '路桥区', '331004');
INSERT INTO `tb_administrative_division` VALUES (2576, '浙江省', '330000', '台州市', '331000', '玉环县', '331021');
INSERT INTO `tb_administrative_division` VALUES (2577, '浙江省', '330000', '台州市', '331000', '临海市', '331082');
INSERT INTO `tb_administrative_division` VALUES (2578, '浙江省', '330000', '台州市', '331000', '温岭市', '331081');
INSERT INTO `tb_administrative_division` VALUES (2579, '浙江省', '330000', '舟山市', '330900', '普陀区', '330903');
INSERT INTO `tb_administrative_division` VALUES (2580, '浙江省', '330000', '舟山市', '330900', '岱山县', '330921');
INSERT INTO `tb_administrative_division` VALUES (2581, '浙江省', '330000', '舟山市', '330900', '嵊泗县', '330922');
INSERT INTO `tb_administrative_division` VALUES (2582, '浙江省', '330000', '舟山市', '330900', '定海区', '330902');
INSERT INTO `tb_administrative_division` VALUES (2583, '浙江省', '330000', '温州市', '330300', '洞头县', '330322');
INSERT INTO `tb_administrative_division` VALUES (2584, '浙江省', '330000', '温州市', '330300', '瑞安市', '330381');
INSERT INTO `tb_administrative_division` VALUES (2585, '浙江省', '330000', '温州市', '330300', '泰顺县', '330329');
INSERT INTO `tb_administrative_division` VALUES (2586, '浙江省', '330000', '温州市', '330300', '苍南县', '330327');
INSERT INTO `tb_administrative_division` VALUES (2587, '浙江省', '330000', '温州市', '330300', '瓯海区', '330304');
INSERT INTO `tb_administrative_division` VALUES (2588, '浙江省', '330000', '温州市', '330300', '乐清市', '330382');
INSERT INTO `tb_administrative_division` VALUES (2589, '浙江省', '330000', '温州市', '330300', '鹿城区', '330302');
INSERT INTO `tb_administrative_division` VALUES (2590, '浙江省', '330000', '温州市', '330300', '永嘉县', '330324');
INSERT INTO `tb_administrative_division` VALUES (2591, '浙江省', '330000', '温州市', '330300', '龙湾区', '330303');
INSERT INTO `tb_administrative_division` VALUES (2592, '浙江省', '330000', '温州市', '330300', '文成县', '330328');
INSERT INTO `tb_administrative_division` VALUES (2593, '浙江省', '330000', '温州市', '330300', '平阳县', '330326');
INSERT INTO `tb_administrative_division` VALUES (2594, '浙江省', '330000', '嘉兴市', '330400', '平湖市', '330482');
INSERT INTO `tb_administrative_division` VALUES (2595, '浙江省', '330000', '嘉兴市', '330400', '秀洲区', '330411');
INSERT INTO `tb_administrative_division` VALUES (2596, '浙江省', '330000', '嘉兴市', '330400', '嘉善县', '330421');
INSERT INTO `tb_administrative_division` VALUES (2597, '浙江省', '330000', '嘉兴市', '330400', '海宁市', '330481');
INSERT INTO `tb_administrative_division` VALUES (2598, '浙江省', '330000', '嘉兴市', '330400', '桐乡市', '330483');
INSERT INTO `tb_administrative_division` VALUES (2599, '浙江省', '330000', '嘉兴市', '330400', '南湖区', '330402');
INSERT INTO `tb_administrative_division` VALUES (2600, '浙江省', '330000', '嘉兴市', '330400', '海盐县', '330424');
INSERT INTO `tb_administrative_division` VALUES (2601, '浙江省', '330000', '绍兴市', '330600', '诸暨市', '330681');
INSERT INTO `tb_administrative_division` VALUES (2602, '浙江省', '330000', '绍兴市', '330600', '越城区', '330602');
INSERT INTO `tb_administrative_division` VALUES (2603, '浙江省', '330000', '绍兴市', '330600', '新昌县', '330624');
INSERT INTO `tb_administrative_division` VALUES (2604, '浙江省', '330000', '绍兴市', '330600', '上虞市', '330682');
INSERT INTO `tb_administrative_division` VALUES (2605, '浙江省', '330000', '绍兴市', '330600', '嵊州市', '330683');
INSERT INTO `tb_administrative_division` VALUES (2606, '浙江省', '330000', '绍兴市', '330600', '绍兴县', '330621');
INSERT INTO `tb_administrative_division` VALUES (2607, '浙江省', '330000', '绍兴市', '330600', '柯桥区', '330603');
INSERT INTO `tb_administrative_division` VALUES (2608, '浙江省', '330000', '宁波市', '330200', '余姚市', '330281');
INSERT INTO `tb_administrative_division` VALUES (2609, '浙江省', '330000', '宁波市', '330200', '鄞州区', '330212');
INSERT INTO `tb_administrative_division` VALUES (2610, '浙江省', '330000', '宁波市', '330200', '镇海区', '330211');
INSERT INTO `tb_administrative_division` VALUES (2611, '浙江省', '330000', '宁波市', '330200', '江北区', '330205');
INSERT INTO `tb_administrative_division` VALUES (2612, '浙江省', '330000', '宁波市', '330200', '海曙区', '330203');
INSERT INTO `tb_administrative_division` VALUES (2613, '浙江省', '330000', '宁波市', '330200', '奉化市', '330283');
INSERT INTO `tb_administrative_division` VALUES (2614, '浙江省', '330000', '宁波市', '330200', '象山县', '330225');
INSERT INTO `tb_administrative_division` VALUES (2615, '浙江省', '330000', '宁波市', '330200', '江东区', '330204');
INSERT INTO `tb_administrative_division` VALUES (2616, '浙江省', '330000', '宁波市', '330200', '慈溪市', '330282');
INSERT INTO `tb_administrative_division` VALUES (2617, '浙江省', '330000', '宁波市', '330200', '北仑区', '330206');
INSERT INTO `tb_administrative_division` VALUES (2618, '浙江省', '330000', '宁波市', '330200', '宁海县', '330226');
INSERT INTO `tb_administrative_division` VALUES (2619, '浙江省', '330000', '衢州市', '330800', '开化县', '330824');
INSERT INTO `tb_administrative_division` VALUES (2620, '浙江省', '330000', '衢州市', '330800', '江山市', '330881');
INSERT INTO `tb_administrative_division` VALUES (2621, '浙江省', '330000', '衢州市', '330800', '柯城区', '330802');
INSERT INTO `tb_administrative_division` VALUES (2622, '浙江省', '330000', '衢州市', '330800', '龙游县', '330825');
INSERT INTO `tb_administrative_division` VALUES (2623, '浙江省', '330000', '衢州市', '330800', '常山县', '330822');
INSERT INTO `tb_administrative_division` VALUES (2624, '浙江省', '330000', '衢州市', '330800', '衢江区', '330803');
INSERT INTO `tb_administrative_division` VALUES (2625, '浙江省', '330000', '湖州市', '330500', '南浔区', '330503');
INSERT INTO `tb_administrative_division` VALUES (2626, '浙江省', '330000', '湖州市', '330500', '长兴县', '330522');
INSERT INTO `tb_administrative_division` VALUES (2627, '浙江省', '330000', '湖州市', '330500', '德清县', '330521');
INSERT INTO `tb_administrative_division` VALUES (2628, '浙江省', '330000', '湖州市', '330500', '安吉县', '330523');
INSERT INTO `tb_administrative_division` VALUES (2629, '浙江省', '330000', '湖州市', '330500', '吴兴区', '330502');
INSERT INTO `tb_administrative_division` VALUES (2630, '浙江省', '330000', '丽水市', '331100', '景宁畲族自治县', '331127');
INSERT INTO `tb_administrative_division` VALUES (2631, '浙江省', '330000', '丽水市', '331100', '缙云县', '331122');
INSERT INTO `tb_administrative_division` VALUES (2632, '浙江省', '330000', '丽水市', '331100', '龙泉市', '331181');
INSERT INTO `tb_administrative_division` VALUES (2633, '浙江省', '330000', '丽水市', '331100', '云和县', '331125');
INSERT INTO `tb_administrative_division` VALUES (2634, '浙江省', '330000', '丽水市', '331100', '松阳县', '331124');
INSERT INTO `tb_administrative_division` VALUES (2635, '浙江省', '330000', '丽水市', '331100', '莲都区', '331102');
INSERT INTO `tb_administrative_division` VALUES (2636, '浙江省', '330000', '丽水市', '331100', '青田县', '331121');
INSERT INTO `tb_administrative_division` VALUES (2637, '浙江省', '330000', '丽水市', '331100', '庆元县', '331126');
INSERT INTO `tb_administrative_division` VALUES (2638, '浙江省', '330000', '丽水市', '331100', '遂昌县', '331123');
INSERT INTO `tb_administrative_division` VALUES (2639, '浙江省', '330000', '金华市', '330700', '永康市', '330784');
INSERT INTO `tb_administrative_division` VALUES (2640, '浙江省', '330000', '金华市', '330700', '兰溪市', '330781');
INSERT INTO `tb_administrative_division` VALUES (2641, '浙江省', '330000', '金华市', '330700', '金东区', '330703');
INSERT INTO `tb_administrative_division` VALUES (2642, '浙江省', '330000', '金华市', '330700', '武义县', '330723');
INSERT INTO `tb_administrative_division` VALUES (2643, '浙江省', '330000', '金华市', '330700', '义乌市', '330782');
INSERT INTO `tb_administrative_division` VALUES (2644, '浙江省', '330000', '金华市', '330700', '东阳市', '330783');
INSERT INTO `tb_administrative_division` VALUES (2645, '浙江省', '330000', '金华市', '330700', '磐安县', '330727');
INSERT INTO `tb_administrative_division` VALUES (2646, '浙江省', '330000', '金华市', '330700', '婺城区', '330702');
INSERT INTO `tb_administrative_division` VALUES (2647, '浙江省', '330000', '金华市', '330700', '浦江县', '330726');
INSERT INTO `tb_administrative_division` VALUES (2648, '浙江省', '330000', '杭州市', '330100', '西湖区', '330106');
INSERT INTO `tb_administrative_division` VALUES (2649, '浙江省', '330000', '杭州市', '330100', '滨江区', '330108');
INSERT INTO `tb_administrative_division` VALUES (2650, '浙江省', '330000', '杭州市', '330100', '余杭区', '330110');
INSERT INTO `tb_administrative_division` VALUES (2651, '浙江省', '330000', '杭州市', '330100', '萧山区', '330109');
INSERT INTO `tb_administrative_division` VALUES (2652, '浙江省', '330000', '杭州市', '330100', '拱墅区', '330105');
INSERT INTO `tb_administrative_division` VALUES (2653, '浙江省', '330000', '杭州市', '330100', '淳安县', '330127');
INSERT INTO `tb_administrative_division` VALUES (2654, '浙江省', '330000', '杭州市', '330100', '上城区', '330102');
INSERT INTO `tb_administrative_division` VALUES (2655, '浙江省', '330000', '杭州市', '330100', '桐庐县', '330122');
INSERT INTO `tb_administrative_division` VALUES (2656, '浙江省', '330000', '杭州市', '330100', '建德市', '330182');
INSERT INTO `tb_administrative_division` VALUES (2657, '浙江省', '330000', '杭州市', '330100', '江干区', '330104');
INSERT INTO `tb_administrative_division` VALUES (2658, '浙江省', '330000', '杭州市', '330100', '下城区', '330103');
INSERT INTO `tb_administrative_division` VALUES (2659, '浙江省', '330000', '杭州市', '330100', '富阳市', '330183');
INSERT INTO `tb_administrative_division` VALUES (2660, '浙江省', '330000', '杭州市', '330100', '临安市', '330185');
INSERT INTO `tb_administrative_division` VALUES (2661, '福建省', '350000', '莆田市', '350300', '仙游县', '350322');
INSERT INTO `tb_administrative_division` VALUES (2662, '福建省', '350000', '莆田市', '350300', '城厢区', '350302');
INSERT INTO `tb_administrative_division` VALUES (2663, '福建省', '350000', '莆田市', '350300', '荔城区', '350304');
INSERT INTO `tb_administrative_division` VALUES (2664, '福建省', '350000', '莆田市', '350300', '涵江区', '350303');
INSERT INTO `tb_administrative_division` VALUES (2665, '福建省', '350000', '莆田市', '350300', '秀屿区', '350305');
INSERT INTO `tb_administrative_division` VALUES (2666, '福建省', '350000', '漳州市', '350600', '长泰县', '350625');
INSERT INTO `tb_administrative_division` VALUES (2667, '福建省', '350000', '漳州市', '350600', '龙海市', '350681');
INSERT INTO `tb_administrative_division` VALUES (2668, '福建省', '350000', '漳州市', '350600', '云霄县', '350622');
INSERT INTO `tb_administrative_division` VALUES (2669, '福建省', '350000', '漳州市', '350600', '平和县', '350628');
INSERT INTO `tb_administrative_division` VALUES (2670, '福建省', '350000', '漳州市', '350600', '龙文区', '350603');
INSERT INTO `tb_administrative_division` VALUES (2671, '福建省', '350000', '漳州市', '350600', '漳浦县', '350623');
INSERT INTO `tb_administrative_division` VALUES (2672, '福建省', '350000', '漳州市', '350600', '诏安县', '350624');
INSERT INTO `tb_administrative_division` VALUES (2673, '福建省', '350000', '漳州市', '350600', '南靖县', '350627');
INSERT INTO `tb_administrative_division` VALUES (2674, '福建省', '350000', '漳州市', '350600', '芗城区', '350602');
INSERT INTO `tb_administrative_division` VALUES (2675, '福建省', '350000', '漳州市', '350600', '华安县', '350629');
INSERT INTO `tb_administrative_division` VALUES (2676, '福建省', '350000', '漳州市', '350600', '东山县', '350626');
INSERT INTO `tb_administrative_division` VALUES (2677, '福建省', '350000', '龙岩市', '350800', '武平县', '350824');
INSERT INTO `tb_administrative_division` VALUES (2678, '福建省', '350000', '龙岩市', '350800', '连城县', '350825');
INSERT INTO `tb_administrative_division` VALUES (2679, '福建省', '350000', '龙岩市', '350800', '漳平市', '350881');
INSERT INTO `tb_administrative_division` VALUES (2680, '福建省', '350000', '龙岩市', '350800', '上杭县', '350823');
INSERT INTO `tb_administrative_division` VALUES (2681, '福建省', '350000', '龙岩市', '350800', '永定县', '350822');
INSERT INTO `tb_administrative_division` VALUES (2682, '福建省', '350000', '龙岩市', '350800', '长汀县', '350821');
INSERT INTO `tb_administrative_division` VALUES (2683, '福建省', '350000', '龙岩市', '350800', '新罗区', '350802');
INSERT INTO `tb_administrative_division` VALUES (2684, '福建省', '350000', '三明市', '350400', '明溪县', '350421');
INSERT INTO `tb_administrative_division` VALUES (2685, '福建省', '350000', '三明市', '350400', '清流县', '350423');
INSERT INTO `tb_administrative_division` VALUES (2686, '福建省', '350000', '三明市', '350400', '三元区', '350403');
INSERT INTO `tb_administrative_division` VALUES (2687, '福建省', '350000', '三明市', '350400', '永安市', '350481');
INSERT INTO `tb_administrative_division` VALUES (2688, '福建省', '350000', '三明市', '350400', '宁化县', '350424');
INSERT INTO `tb_administrative_division` VALUES (2689, '福建省', '350000', '三明市', '350400', '泰宁县', '350429');
INSERT INTO `tb_administrative_division` VALUES (2690, '福建省', '350000', '三明市', '350400', '梅列区', '350402');
INSERT INTO `tb_administrative_division` VALUES (2691, '福建省', '350000', '三明市', '350400', '将乐县', '350428');
INSERT INTO `tb_administrative_division` VALUES (2692, '福建省', '350000', '三明市', '350400', '沙县', '350427');
INSERT INTO `tb_administrative_division` VALUES (2693, '福建省', '350000', '三明市', '350400', '大田县', '350425');
INSERT INTO `tb_administrative_division` VALUES (2694, '福建省', '350000', '三明市', '350400', '建宁县', '350430');
INSERT INTO `tb_administrative_division` VALUES (2695, '福建省', '350000', '三明市', '350400', '尤溪县', '350426');
INSERT INTO `tb_administrative_division` VALUES (2696, '福建省', '350000', '福州市', '350100', '闽侯县', '350121');
INSERT INTO `tb_administrative_division` VALUES (2697, '福建省', '350000', '福州市', '350100', '永泰县', '350125');
INSERT INTO `tb_administrative_division` VALUES (2698, '福建省', '350000', '福州市', '350100', '鼓楼区', '350102');
INSERT INTO `tb_administrative_division` VALUES (2699, '福建省', '350000', '福州市', '350100', '晋安区', '350111');
INSERT INTO `tb_administrative_division` VALUES (2700, '福建省', '350000', '福州市', '350100', '长乐市', '350182');
INSERT INTO `tb_administrative_division` VALUES (2701, '福建省', '350000', '福州市', '350100', '台江区', '350103');
INSERT INTO `tb_administrative_division` VALUES (2702, '福建省', '350000', '福州市', '350100', '马尾区', '350105');
INSERT INTO `tb_administrative_division` VALUES (2703, '福建省', '350000', '福州市', '350100', '平潭县', '350128');
INSERT INTO `tb_administrative_division` VALUES (2704, '福建省', '350000', '福州市', '350100', '罗源县', '350123');
INSERT INTO `tb_administrative_division` VALUES (2705, '福建省', '350000', '福州市', '350100', '福清市', '350181');
INSERT INTO `tb_administrative_division` VALUES (2706, '福建省', '350000', '福州市', '350100', '连江县', '350122');
INSERT INTO `tb_administrative_division` VALUES (2707, '福建省', '350000', '福州市', '350100', '闽清县', '350124');
INSERT INTO `tb_administrative_division` VALUES (2708, '福建省', '350000', '福州市', '350100', '仓山区', '350104');
INSERT INTO `tb_administrative_division` VALUES (2709, '福建省', '350000', '泉州市', '350500', '洛江区', '350504');
INSERT INTO `tb_administrative_division` VALUES (2710, '福建省', '350000', '泉州市', '350500', '石狮市', '350581');
INSERT INTO `tb_administrative_division` VALUES (2711, '福建省', '350000', '泉州市', '350500', '鲤城区', '350502');
INSERT INTO `tb_administrative_division` VALUES (2712, '福建省', '350000', '泉州市', '350500', '惠安县', '350521');
INSERT INTO `tb_administrative_division` VALUES (2713, '福建省', '350000', '泉州市', '350500', '金门县', '350527');
INSERT INTO `tb_administrative_division` VALUES (2714, '福建省', '350000', '泉州市', '350500', '永春县', '350525');
INSERT INTO `tb_administrative_division` VALUES (2715, '福建省', '350000', '泉州市', '350500', '晋江市', '350582');
INSERT INTO `tb_administrative_division` VALUES (2716, '福建省', '350000', '泉州市', '350500', '南安市', '350583');
INSERT INTO `tb_administrative_division` VALUES (2717, '福建省', '350000', '泉州市', '350500', '安溪县', '350524');
INSERT INTO `tb_administrative_division` VALUES (2718, '福建省', '350000', '泉州市', '350500', '德化县', '350526');
INSERT INTO `tb_administrative_division` VALUES (2719, '福建省', '350000', '泉州市', '350500', '泉港区', '350505');
INSERT INTO `tb_administrative_division` VALUES (2720, '福建省', '350000', '泉州市', '350500', '丰泽区', '350503');
INSERT INTO `tb_administrative_division` VALUES (2721, '福建省', '350000', '南平市', '350700', '光泽县', '350723');
INSERT INTO `tb_administrative_division` VALUES (2722, '福建省', '350000', '南平市', '350700', '顺昌县', '350721');
INSERT INTO `tb_administrative_division` VALUES (2723, '福建省', '350000', '南平市', '350700', '延平区', '350702');
INSERT INTO `tb_administrative_division` VALUES (2724, '福建省', '350000', '南平市', '350700', '建瓯市', '350783');
INSERT INTO `tb_administrative_division` VALUES (2725, '福建省', '350000', '南平市', '350700', '松溪县', '350724');
INSERT INTO `tb_administrative_division` VALUES (2726, '福建省', '350000', '南平市', '350700', '政和县', '350725');
INSERT INTO `tb_administrative_division` VALUES (2727, '福建省', '350000', '南平市', '350700', '浦城县', '350722');
INSERT INTO `tb_administrative_division` VALUES (2728, '福建省', '350000', '南平市', '350700', '建阳市', '350784');
INSERT INTO `tb_administrative_division` VALUES (2729, '福建省', '350000', '南平市', '350700', '武夷山市', '350782');
INSERT INTO `tb_administrative_division` VALUES (2730, '福建省', '350000', '南平市', '350700', '邵武市', '350781');
INSERT INTO `tb_administrative_division` VALUES (2731, '福建省', '350000', '宁德市', '350900', '寿宁县', '350924');
INSERT INTO `tb_administrative_division` VALUES (2732, '福建省', '350000', '宁德市', '350900', '福安市', '350981');
INSERT INTO `tb_administrative_division` VALUES (2733, '福建省', '350000', '宁德市', '350900', '周宁县', '350925');
INSERT INTO `tb_administrative_division` VALUES (2734, '福建省', '350000', '宁德市', '350900', '蕉城区', '350902');
INSERT INTO `tb_administrative_division` VALUES (2735, '福建省', '350000', '宁德市', '350900', '霞浦县', '350921');
INSERT INTO `tb_administrative_division` VALUES (2736, '福建省', '350000', '宁德市', '350900', '福鼎市', '350982');
INSERT INTO `tb_administrative_division` VALUES (2737, '福建省', '350000', '宁德市', '350900', '屏南县', '350923');
INSERT INTO `tb_administrative_division` VALUES (2738, '福建省', '350000', '宁德市', '350900', '古田县', '350922');
INSERT INTO `tb_administrative_division` VALUES (2739, '福建省', '350000', '宁德市', '350900', '柘荣县', '350926');
INSERT INTO `tb_administrative_division` VALUES (2740, '福建省', '350000', '厦门市', '350200', '同安区', '350212');
INSERT INTO `tb_administrative_division` VALUES (2741, '福建省', '350000', '厦门市', '350200', '湖里区', '350206');
INSERT INTO `tb_administrative_division` VALUES (2742, '福建省', '350000', '厦门市', '350200', '集美区', '350211');
INSERT INTO `tb_administrative_division` VALUES (2743, '福建省', '350000', '厦门市', '350200', '翔安区', '350213');
INSERT INTO `tb_administrative_division` VALUES (2744, '福建省', '350000', '厦门市', '350200', '思明区', '350203');
INSERT INTO `tb_administrative_division` VALUES (2745, '福建省', '350000', '厦门市', '350200', '海沧区', '350205');
INSERT INTO `tb_administrative_division` VALUES (2746, '黑龙江省', '230000', '佳木斯市', '230800', '同江市', '230881');
INSERT INTO `tb_administrative_division` VALUES (2747, '黑龙江省', '230000', '佳木斯市', '230800', '富锦市', '230882');
INSERT INTO `tb_administrative_division` VALUES (2748, '黑龙江省', '230000', '佳木斯市', '230800', '前进区', '230804');
INSERT INTO `tb_administrative_division` VALUES (2749, '黑龙江省', '230000', '佳木斯市', '230800', '郊区', '230811');
INSERT INTO `tb_administrative_division` VALUES (2750, '黑龙江省', '230000', '佳木斯市', '230800', '向阳区', '230803');
INSERT INTO `tb_administrative_division` VALUES (2751, '黑龙江省', '230000', '佳木斯市', '230800', '东风区', '230805');
INSERT INTO `tb_administrative_division` VALUES (2752, '黑龙江省', '230000', '佳木斯市', '230800', '汤原县', '230828');
INSERT INTO `tb_administrative_division` VALUES (2753, '黑龙江省', '230000', '佳木斯市', '230800', '抚远县', '230833');
INSERT INTO `tb_administrative_division` VALUES (2754, '黑龙江省', '230000', '佳木斯市', '230800', '桦南县', '230822');
INSERT INTO `tb_administrative_division` VALUES (2755, '黑龙江省', '230000', '佳木斯市', '230800', '桦川县', '230826');
INSERT INTO `tb_administrative_division` VALUES (2756, '黑龙江省', '230000', '牡丹江市', '231000', '西安区', '231005');
INSERT INTO `tb_administrative_division` VALUES (2757, '黑龙江省', '230000', '牡丹江市', '231000', '海林市', '231083');
INSERT INTO `tb_administrative_division` VALUES (2758, '黑龙江省', '230000', '牡丹江市', '231000', '东宁县', '231024');
INSERT INTO `tb_administrative_division` VALUES (2759, '黑龙江省', '230000', '牡丹江市', '231000', '宁安市', '231084');
INSERT INTO `tb_administrative_division` VALUES (2760, '黑龙江省', '230000', '牡丹江市', '231000', '林口县', '231025');
INSERT INTO `tb_administrative_division` VALUES (2761, '黑龙江省', '230000', '牡丹江市', '231000', '东安区', '231002');
INSERT INTO `tb_administrative_division` VALUES (2762, '黑龙江省', '230000', '牡丹江市', '231000', '爱民区', '231004');
INSERT INTO `tb_administrative_division` VALUES (2763, '黑龙江省', '230000', '牡丹江市', '231000', '阳明区', '231003');
INSERT INTO `tb_administrative_division` VALUES (2764, '黑龙江省', '230000', '牡丹江市', '231000', '穆棱市', '231085');
INSERT INTO `tb_administrative_division` VALUES (2765, '黑龙江省', '230000', '牡丹江市', '231000', '绥芬河市', '231081');
INSERT INTO `tb_administrative_division` VALUES (2766, '黑龙江省', '230000', '大庆市', '230600', '肇州县', '230621');
INSERT INTO `tb_administrative_division` VALUES (2767, '黑龙江省', '230000', '大庆市', '230600', '萨尔图区', '230602');
INSERT INTO `tb_administrative_division` VALUES (2768, '黑龙江省', '230000', '大庆市', '230600', '林甸县', '230623');
INSERT INTO `tb_administrative_division` VALUES (2769, '黑龙江省', '230000', '大庆市', '230600', '肇源县', '230622');
INSERT INTO `tb_administrative_division` VALUES (2770, '黑龙江省', '230000', '大庆市', '230600', '让胡路区', '230604');
INSERT INTO `tb_administrative_division` VALUES (2771, '黑龙江省', '230000', '大庆市', '230600', '大同区', '230606');
INSERT INTO `tb_administrative_division` VALUES (2772, '黑龙江省', '230000', '大庆市', '230600', '杜尔伯特蒙古族自治县', '230624');
INSERT INTO `tb_administrative_division` VALUES (2773, '黑龙江省', '230000', '大庆市', '230600', '红岗区', '230605');
INSERT INTO `tb_administrative_division` VALUES (2774, '黑龙江省', '230000', '大庆市', '230600', '龙凤区', '230603');
INSERT INTO `tb_administrative_division` VALUES (2775, '黑龙江省', '230000', '大兴安岭地区', '232700', '塔河县', '232722');
INSERT INTO `tb_administrative_division` VALUES (2776, '黑龙江省', '230000', '大兴安岭地区', '232700', '新林区', '232703');
INSERT INTO `tb_administrative_division` VALUES (2777, '黑龙江省', '230000', '大兴安岭地区', '232700', '呼中区', '232704');
INSERT INTO `tb_administrative_division` VALUES (2778, '黑龙江省', '230000', '大兴安岭地区', '232700', '呼玛县', '232721');
INSERT INTO `tb_administrative_division` VALUES (2779, '黑龙江省', '230000', '大兴安岭地区', '232700', '松岭区', '232702');
INSERT INTO `tb_administrative_division` VALUES (2780, '黑龙江省', '230000', '大兴安岭地区', '232700', '漠河县', '232723');
INSERT INTO `tb_administrative_division` VALUES (2781, '黑龙江省', '230000', '大兴安岭地区', '232700', '加格达奇区', '232701');
INSERT INTO `tb_administrative_division` VALUES (2782, '黑龙江省', '230000', '哈尔滨市', '230100', '香坊区', '230110');
INSERT INTO `tb_administrative_division` VALUES (2783, '黑龙江省', '230000', '哈尔滨市', '230100', '南岗区', '230103');
INSERT INTO `tb_administrative_division` VALUES (2784, '黑龙江省', '230000', '哈尔滨市', '230100', '阿城区', '230112');
INSERT INTO `tb_administrative_division` VALUES (2785, '黑龙江省', '230000', '哈尔滨市', '230100', '呼兰区', '230111');
INSERT INTO `tb_administrative_division` VALUES (2786, '黑龙江省', '230000', '哈尔滨市', '230100', '松北区', '230109');
INSERT INTO `tb_administrative_division` VALUES (2787, '黑龙江省', '230000', '哈尔滨市', '230100', '木兰县', '230127');
INSERT INTO `tb_administrative_division` VALUES (2788, '黑龙江省', '230000', '哈尔滨市', '230100', '依兰县', '230123');
INSERT INTO `tb_administrative_division` VALUES (2789, '黑龙江省', '230000', '哈尔滨市', '230100', '道外区', '230104');
INSERT INTO `tb_administrative_division` VALUES (2790, '黑龙江省', '230000', '哈尔滨市', '230100', '宾县', '230125');
INSERT INTO `tb_administrative_division` VALUES (2791, '黑龙江省', '230000', '哈尔滨市', '230100', '通河县', '230128');
INSERT INTO `tb_administrative_division` VALUES (2792, '黑龙江省', '230000', '哈尔滨市', '230100', '方正县', '230124');
INSERT INTO `tb_administrative_division` VALUES (2793, '黑龙江省', '230000', '哈尔滨市', '230100', '五常市', '230184');
INSERT INTO `tb_administrative_division` VALUES (2794, '黑龙江省', '230000', '哈尔滨市', '230100', '道里区', '230102');
INSERT INTO `tb_administrative_division` VALUES (2795, '黑龙江省', '230000', '哈尔滨市', '230100', '双城市', '230182');
INSERT INTO `tb_administrative_division` VALUES (2796, '黑龙江省', '230000', '哈尔滨市', '230100', '平房区', '230108');
INSERT INTO `tb_administrative_division` VALUES (2797, '黑龙江省', '230000', '哈尔滨市', '230100', '延寿县', '230129');
INSERT INTO `tb_administrative_division` VALUES (2798, '黑龙江省', '230000', '哈尔滨市', '230100', '尚志市', '230183');
INSERT INTO `tb_administrative_division` VALUES (2799, '黑龙江省', '230000', '哈尔滨市', '230100', '巴彦县', '230126');
INSERT INTO `tb_administrative_division` VALUES (2800, '黑龙江省', '230000', '黑河市', '231100', '爱辉区', '231102');
INSERT INTO `tb_administrative_division` VALUES (2801, '黑龙江省', '230000', '黑河市', '231100', '五大连池市', '231182');
INSERT INTO `tb_administrative_division` VALUES (2802, '黑龙江省', '230000', '黑河市', '231100', '孙吴县', '231124');
INSERT INTO `tb_administrative_division` VALUES (2803, '黑龙江省', '230000', '黑河市', '231100', '逊克县', '231123');
INSERT INTO `tb_administrative_division` VALUES (2804, '黑龙江省', '230000', '黑河市', '231100', '北安市', '231181');
INSERT INTO `tb_administrative_division` VALUES (2805, '黑龙江省', '230000', '黑河市', '231100', '嫩江县', '231121');
INSERT INTO `tb_administrative_division` VALUES (2806, '黑龙江省', '230000', '鸡西市', '230300', '虎林市', '230381');
INSERT INTO `tb_administrative_division` VALUES (2807, '黑龙江省', '230000', '鸡西市', '230300', '鸡东县', '230321');
INSERT INTO `tb_administrative_division` VALUES (2808, '黑龙江省', '230000', '鸡西市', '230300', '鸡冠区', '230302');
INSERT INTO `tb_administrative_division` VALUES (2809, '黑龙江省', '230000', '鸡西市', '230300', '城子河区', '230306');
INSERT INTO `tb_administrative_division` VALUES (2810, '黑龙江省', '230000', '鸡西市', '230300', '滴道区', '230304');
INSERT INTO `tb_administrative_division` VALUES (2811, '黑龙江省', '230000', '鸡西市', '230300', '恒山区', '230303');
INSERT INTO `tb_administrative_division` VALUES (2812, '黑龙江省', '230000', '鸡西市', '230300', '麻山区', '230307');
INSERT INTO `tb_administrative_division` VALUES (2813, '黑龙江省', '230000', '鸡西市', '230300', '密山市', '230382');
INSERT INTO `tb_administrative_division` VALUES (2814, '黑龙江省', '230000', '鸡西市', '230300', '梨树区', '230305');
INSERT INTO `tb_administrative_division` VALUES (2815, '黑龙江省', '230000', '齐齐哈尔市', '230200', '富拉尔基区', '230206');
INSERT INTO `tb_administrative_division` VALUES (2816, '黑龙江省', '230000', '齐齐哈尔市', '230200', '克山县', '230229');
INSERT INTO `tb_administrative_division` VALUES (2817, '黑龙江省', '230000', '齐齐哈尔市', '230200', '富裕县', '230227');
INSERT INTO `tb_administrative_division` VALUES (2818, '黑龙江省', '230000', '齐齐哈尔市', '230200', '拜泉县', '230231');
INSERT INTO `tb_administrative_division` VALUES (2819, '黑龙江省', '230000', '齐齐哈尔市', '230200', '昂昂溪区', '230205');
INSERT INTO `tb_administrative_division` VALUES (2820, '黑龙江省', '230000', '齐齐哈尔市', '230200', '碾子山区', '230207');
INSERT INTO `tb_administrative_division` VALUES (2821, '黑龙江省', '230000', '齐齐哈尔市', '230200', '梅里斯达斡尔族区', '230208');
INSERT INTO `tb_administrative_division` VALUES (2822, '黑龙江省', '230000', '齐齐哈尔市', '230200', '铁锋区', '230204');
INSERT INTO `tb_administrative_division` VALUES (2823, '黑龙江省', '230000', '齐齐哈尔市', '230200', '龙沙区', '230202');
INSERT INTO `tb_administrative_division` VALUES (2824, '黑龙江省', '230000', '齐齐哈尔市', '230200', '克东县', '230230');
INSERT INTO `tb_administrative_division` VALUES (2825, '黑龙江省', '230000', '齐齐哈尔市', '230200', '建华区', '230203');
INSERT INTO `tb_administrative_division` VALUES (2826, '黑龙江省', '230000', '齐齐哈尔市', '230200', '讷河市', '230281');
INSERT INTO `tb_administrative_division` VALUES (2827, '黑龙江省', '230000', '齐齐哈尔市', '230200', '泰来县', '230224');
INSERT INTO `tb_administrative_division` VALUES (2828, '黑龙江省', '230000', '齐齐哈尔市', '230200', '依安县', '230223');
INSERT INTO `tb_administrative_division` VALUES (2829, '黑龙江省', '230000', '齐齐哈尔市', '230200', '甘南县', '230225');
INSERT INTO `tb_administrative_division` VALUES (2830, '黑龙江省', '230000', '齐齐哈尔市', '230200', '龙江县', '230221');
INSERT INTO `tb_administrative_division` VALUES (2831, '黑龙江省', '230000', '七台河市', '230900', '勃利县', '230921');
INSERT INTO `tb_administrative_division` VALUES (2832, '黑龙江省', '230000', '七台河市', '230900', '新兴区', '230902');
INSERT INTO `tb_administrative_division` VALUES (2833, '黑龙江省', '230000', '七台河市', '230900', '茄子河区', '230904');
INSERT INTO `tb_administrative_division` VALUES (2834, '黑龙江省', '230000', '七台河市', '230900', '桃山区', '230903');
INSERT INTO `tb_administrative_division` VALUES (2835, '黑龙江省', '230000', '双鸭山市', '230500', '友谊县', '230522');
INSERT INTO `tb_administrative_division` VALUES (2836, '黑龙江省', '230000', '双鸭山市', '230500', '集贤县', '230521');
INSERT INTO `tb_administrative_division` VALUES (2837, '黑龙江省', '230000', '双鸭山市', '230500', '宝山区', '230506');
INSERT INTO `tb_administrative_division` VALUES (2838, '黑龙江省', '230000', '双鸭山市', '230500', '饶河县', '230524');
INSERT INTO `tb_administrative_division` VALUES (2839, '黑龙江省', '230000', '双鸭山市', '230500', '尖山区', '230502');
INSERT INTO `tb_administrative_division` VALUES (2840, '黑龙江省', '230000', '双鸭山市', '230500', '宝清县', '230523');
INSERT INTO `tb_administrative_division` VALUES (2841, '黑龙江省', '230000', '双鸭山市', '230500', '四方台区', '230505');
INSERT INTO `tb_administrative_division` VALUES (2842, '黑龙江省', '230000', '双鸭山市', '230500', '岭东区', '230503');
INSERT INTO `tb_administrative_division` VALUES (2843, '黑龙江省', '230000', '绥化市', '231200', '海伦市', '231283');
INSERT INTO `tb_administrative_division` VALUES (2844, '黑龙江省', '230000', '绥化市', '231200', '明水县', '231225');
INSERT INTO `tb_administrative_division` VALUES (2845, '黑龙江省', '230000', '绥化市', '231200', '肇东市', '231282');
INSERT INTO `tb_administrative_division` VALUES (2846, '黑龙江省', '230000', '绥化市', '231200', '望奎县', '231221');
INSERT INTO `tb_administrative_division` VALUES (2847, '黑龙江省', '230000', '绥化市', '231200', '青冈县', '231223');
INSERT INTO `tb_administrative_division` VALUES (2848, '黑龙江省', '230000', '绥化市', '231200', '北林区', '231202');
INSERT INTO `tb_administrative_division` VALUES (2849, '黑龙江省', '230000', '绥化市', '231200', '兰西县', '231222');
INSERT INTO `tb_administrative_division` VALUES (2850, '黑龙江省', '230000', '绥化市', '231200', '安达市', '231281');
INSERT INTO `tb_administrative_division` VALUES (2851, '黑龙江省', '230000', '绥化市', '231200', '庆安县', '231224');
INSERT INTO `tb_administrative_division` VALUES (2852, '黑龙江省', '230000', '绥化市', '231200', '绥棱县', '231226');
INSERT INTO `tb_administrative_division` VALUES (2853, '黑龙江省', '230000', '鹤岗市', '230400', '向阳区', '230402');
INSERT INTO `tb_administrative_division` VALUES (2854, '黑龙江省', '230000', '鹤岗市', '230400', '工农区', '230403');
INSERT INTO `tb_administrative_division` VALUES (2855, '黑龙江省', '230000', '鹤岗市', '230400', '兴安区', '230405');
INSERT INTO `tb_administrative_division` VALUES (2856, '黑龙江省', '230000', '鹤岗市', '230400', '兴山区', '230407');
INSERT INTO `tb_administrative_division` VALUES (2857, '黑龙江省', '230000', '鹤岗市', '230400', '南山区', '230404');
INSERT INTO `tb_administrative_division` VALUES (2858, '黑龙江省', '230000', '鹤岗市', '230400', '绥滨县', '230422');
INSERT INTO `tb_administrative_division` VALUES (2859, '黑龙江省', '230000', '鹤岗市', '230400', '萝北县', '230421');
INSERT INTO `tb_administrative_division` VALUES (2860, '黑龙江省', '230000', '鹤岗市', '230400', '东山区', '230406');
INSERT INTO `tb_administrative_division` VALUES (2861, '黑龙江省', '230000', '伊春市', '230700', '伊春区', '230702');
INSERT INTO `tb_administrative_division` VALUES (2862, '黑龙江省', '230000', '伊春市', '230700', '上甘岭区', '230716');
INSERT INTO `tb_administrative_division` VALUES (2863, '黑龙江省', '230000', '伊春市', '230700', '铁力市', '230781');
INSERT INTO `tb_administrative_division` VALUES (2864, '黑龙江省', '230000', '伊春市', '230700', '嘉荫县', '230722');
INSERT INTO `tb_administrative_division` VALUES (2865, '黑龙江省', '230000', '伊春市', '230700', '新青区', '230707');
INSERT INTO `tb_administrative_division` VALUES (2866, '黑龙江省', '230000', '伊春市', '230700', '南岔区', '230703');
INSERT INTO `tb_administrative_division` VALUES (2867, '黑龙江省', '230000', '伊春市', '230700', '西林区', '230705');
INSERT INTO `tb_administrative_division` VALUES (2868, '黑龙江省', '230000', '伊春市', '230700', '汤旺河区', '230712');
INSERT INTO `tb_administrative_division` VALUES (2869, '黑龙江省', '230000', '伊春市', '230700', '美溪区', '230708');
INSERT INTO `tb_administrative_division` VALUES (2870, '黑龙江省', '230000', '伊春市', '230700', '五营区', '230710');
INSERT INTO `tb_administrative_division` VALUES (2871, '黑龙江省', '230000', '伊春市', '230700', '乌伊岭区', '230714');
INSERT INTO `tb_administrative_division` VALUES (2872, '黑龙江省', '230000', '伊春市', '230700', '友好区', '230704');
INSERT INTO `tb_administrative_division` VALUES (2873, '黑龙江省', '230000', '伊春市', '230700', '乌马河区', '230711');
INSERT INTO `tb_administrative_division` VALUES (2874, '黑龙江省', '230000', '伊春市', '230700', '带岭区', '230713');
INSERT INTO `tb_administrative_division` VALUES (2875, '黑龙江省', '230000', '伊春市', '230700', '红星区', '230715');
INSERT INTO `tb_administrative_division` VALUES (2876, '黑龙江省', '230000', '伊春市', '230700', '翠峦区', '230706');
INSERT INTO `tb_administrative_division` VALUES (2877, '黑龙江省', '230000', '伊春市', '230700', '金山屯区', '230709');
INSERT INTO `tb_administrative_division` VALUES (2878, '吉林省', '220000', '白山市', '220600', '抚松县', '220621');
INSERT INTO `tb_administrative_division` VALUES (2879, '吉林省', '220000', '白山市', '220600', '长白朝鲜族自治县', '220623');
INSERT INTO `tb_administrative_division` VALUES (2880, '吉林省', '220000', '白山市', '220600', '靖宇县', '220622');
INSERT INTO `tb_administrative_division` VALUES (2881, '吉林省', '220000', '白山市', '220600', '临江市', '220681');
INSERT INTO `tb_administrative_division` VALUES (2882, '吉林省', '220000', '白山市', '220600', '江源区', '220625');
INSERT INTO `tb_administrative_division` VALUES (2883, '吉林省', '220000', '白山市', '220600', '浑江区', '220602');
INSERT INTO `tb_administrative_division` VALUES (2884, '吉林省', '220000', '辽源市', '220400', '东辽县', '220422');
INSERT INTO `tb_administrative_division` VALUES (2885, '吉林省', '220000', '辽源市', '220400', '龙山区', '220402');
INSERT INTO `tb_administrative_division` VALUES (2886, '吉林省', '220000', '辽源市', '220400', '东丰县', '220421');
INSERT INTO `tb_administrative_division` VALUES (2887, '吉林省', '220000', '辽源市', '220400', '西安区', '220403');
INSERT INTO `tb_administrative_division` VALUES (2888, '吉林省', '220000', '延边朝鲜族自治州', '222400', '珲春市', '222404');
INSERT INTO `tb_administrative_division` VALUES (2889, '吉林省', '220000', '延边朝鲜族自治州', '222400', '图们市', '222402');
INSERT INTO `tb_administrative_division` VALUES (2890, '吉林省', '220000', '延边朝鲜族自治州', '222400', '和龙市', '222406');
INSERT INTO `tb_administrative_division` VALUES (2891, '吉林省', '220000', '延边朝鲜族自治州', '222400', '敦化市', '222403');
INSERT INTO `tb_administrative_division` VALUES (2892, '吉林省', '220000', '延边朝鲜族自治州', '222400', '龙井市', '222405');
INSERT INTO `tb_administrative_division` VALUES (2893, '吉林省', '220000', '延边朝鲜族自治州', '222400', '汪清县', '222424');
INSERT INTO `tb_administrative_division` VALUES (2894, '吉林省', '220000', '延边朝鲜族自治州', '222400', '延吉市', '222401');
INSERT INTO `tb_administrative_division` VALUES (2895, '吉林省', '220000', '延边朝鲜族自治州', '222400', '安图县', '222426');
INSERT INTO `tb_administrative_division` VALUES (2896, '吉林省', '220000', '白城市', '220800', '大安市', '220882');
INSERT INTO `tb_administrative_division` VALUES (2897, '吉林省', '220000', '白城市', '220800', '镇赉县', '220821');
INSERT INTO `tb_administrative_division` VALUES (2898, '吉林省', '220000', '白城市', '220800', '洮北区', '220802');
INSERT INTO `tb_administrative_division` VALUES (2899, '吉林省', '220000', '白城市', '220800', '通榆县', '220822');
INSERT INTO `tb_administrative_division` VALUES (2900, '吉林省', '220000', '白城市', '220800', '洮南市', '220881');
INSERT INTO `tb_administrative_division` VALUES (2901, '吉林省', '220000', '吉林市', '220200', '蛟河市', '220281');
INSERT INTO `tb_administrative_division` VALUES (2902, '吉林省', '220000', '吉林市', '220200', '舒兰市', '220283');
INSERT INTO `tb_administrative_division` VALUES (2903, '吉林省', '220000', '吉林市', '220200', '永吉县', '220221');
INSERT INTO `tb_administrative_division` VALUES (2904, '吉林省', '220000', '吉林市', '220200', '磐石市', '220284');
INSERT INTO `tb_administrative_division` VALUES (2905, '吉林省', '220000', '吉林市', '220200', '昌邑区', '220202');
INSERT INTO `tb_administrative_division` VALUES (2906, '吉林省', '220000', '吉林市', '220200', '桦甸市', '220282');
INSERT INTO `tb_administrative_division` VALUES (2907, '吉林省', '220000', '吉林市', '220200', '船营区', '220204');
INSERT INTO `tb_administrative_division` VALUES (2908, '吉林省', '220000', '吉林市', '220200', '丰满区', '220211');
INSERT INTO `tb_administrative_division` VALUES (2909, '吉林省', '220000', '吉林市', '220200', '龙潭区', '220203');
INSERT INTO `tb_administrative_division` VALUES (2910, '吉林省', '220000', '松原市', '220700', '乾安县', '220723');
INSERT INTO `tb_administrative_division` VALUES (2911, '吉林省', '220000', '松原市', '220700', '长岭县', '220722');
INSERT INTO `tb_administrative_division` VALUES (2912, '吉林省', '220000', '松原市', '220700', '宁江区', '220702');
INSERT INTO `tb_administrative_division` VALUES (2913, '吉林省', '220000', '松原市', '220700', '前郭尔罗斯蒙古族自治县', '220721');
INSERT INTO `tb_administrative_division` VALUES (2914, '吉林省', '220000', '松原市', '220700', '扶余市', '220724');
INSERT INTO `tb_administrative_division` VALUES (2915, '吉林省', '220000', '长春市', '220100', '九台市', '220181');
INSERT INTO `tb_administrative_division` VALUES (2916, '吉林省', '220000', '长春市', '220100', '双阳区', '220112');
INSERT INTO `tb_administrative_division` VALUES (2917, '吉林省', '220000', '长春市', '220100', '德惠市', '220183');
INSERT INTO `tb_administrative_division` VALUES (2918, '吉林省', '220000', '长春市', '220100', '绿园区', '220106');
INSERT INTO `tb_administrative_division` VALUES (2919, '吉林省', '220000', '长春市', '220100', '农安县', '220122');
INSERT INTO `tb_administrative_division` VALUES (2920, '吉林省', '220000', '长春市', '220100', '朝阳区', '220104');
INSERT INTO `tb_administrative_division` VALUES (2921, '吉林省', '220000', '长春市', '220100', '榆树市', '220182');
INSERT INTO `tb_administrative_division` VALUES (2922, '吉林省', '220000', '长春市', '220100', '宽城区', '220103');
INSERT INTO `tb_administrative_division` VALUES (2923, '吉林省', '220000', '长春市', '220100', '南关区', '220102');
INSERT INTO `tb_administrative_division` VALUES (2924, '吉林省', '220000', '长春市', '220100', '二道区', '220105');
INSERT INTO `tb_administrative_division` VALUES (2925, '吉林省', '220000', '通化市', '220500', '梅河口市', '220581');
INSERT INTO `tb_administrative_division` VALUES (2926, '吉林省', '220000', '通化市', '220500', '二道江区', '220503');
INSERT INTO `tb_administrative_division` VALUES (2927, '吉林省', '220000', '通化市', '220500', '东昌区', '220502');
INSERT INTO `tb_administrative_division` VALUES (2928, '吉林省', '220000', '通化市', '220500', '集安市', '220582');
INSERT INTO `tb_administrative_division` VALUES (2929, '吉林省', '220000', '通化市', '220500', '辉南县', '220523');
INSERT INTO `tb_administrative_division` VALUES (2930, '吉林省', '220000', '通化市', '220500', '柳河县', '220524');
INSERT INTO `tb_administrative_division` VALUES (2931, '吉林省', '220000', '通化市', '220500', '通化县', '220521');
INSERT INTO `tb_administrative_division` VALUES (2932, '吉林省', '220000', '四平市', '220300', '双辽市', '220382');
INSERT INTO `tb_administrative_division` VALUES (2933, '吉林省', '220000', '四平市', '220300', '铁东区', '220303');
INSERT INTO `tb_administrative_division` VALUES (2934, '吉林省', '220000', '四平市', '220300', '梨树县', '220322');
INSERT INTO `tb_administrative_division` VALUES (2935, '吉林省', '220000', '四平市', '220300', '公主岭市', '220381');
INSERT INTO `tb_administrative_division` VALUES (2936, '吉林省', '220000', '四平市', '220300', '铁西区', '220302');
INSERT INTO `tb_administrative_division` VALUES (2937, '吉林省', '220000', '四平市', '220300', '伊通满族自治县', '220323');

-- ----------------------------
-- Table structure for tb_binding_remove_ralation
-- ----------------------------
DROP TABLE IF EXISTS `tb_binding_remove_ralation`;
CREATE TABLE `tb_binding_remove_ralation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `unitID` bigint(16) NULL DEFAULT NULL COMMENT '合作伙伴编号',
  `prtms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人真实号码,对应AXB业务中的号码A',
  `smbms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人安全号码,对应AXB业务中的号码X',
  `otherms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递员其他号码，对应AXB业务中的号码B',
  `subts` datetime(0) NULL DEFAULT NULL COMMENT '订购时间',
  `dissubts` datetime(0) NULL DEFAULT NULL COMMENT '解绑时间',
  `callrestrict` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来话控制\r\n0：AXB不做来话控制，即允许A和B以及其他号码拨打X\r\n1：AXB做来话控制，只允许A和B打X',
  `calldisplay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来显控制默认传入0,0，有传入1,1',
  `callrecording` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '录音控制\r\n0：不录音\r\n1：录音',
  `validitytime` datetime(0) NULL DEFAULT NULL COMMENT '号码有效期，以天为单位\r\n如调用本接口时时间为：2017-01-01 10:32:03， validitytime=5，则此安全号在2017-01-06 10:32:03失效；\r\n或者填写具体时间，例如validitytime=2018-01-01 01:00:00',
  `uuidinpartner` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合作伙伴对本安全号码的自定义编号，如快递单号，客户编号',
  `usertype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识用户类型，1为收件人，2为发件人',
  `regphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '解绑真实号码,对应AXB业务中的号码A',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '绑定状态，1绑定。0解绑',
  `source` int(11) NULL DEFAULT NULL COMMENT '数据来源: 0:根据菜单查询 :1WEB，2APP，3接口',
  `menu` int(11) NULL DEFAULT NULL COMMENT '菜单: 0:根据数据设备查询 1:匹配查询，2:地址查询，3:面单打印',
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_binding_remove_ralation
-- ----------------------------
INSERT INTO `tb_binding_remove_ralation` VALUES (5, 10000000034, '18410427797', '950135901236591', NULL, '2020-06-27 02:45:36', '2020-06-27 03:04:15', '0', '0,0', '1', '2020-06-29 02:45:36', '123', '1', NULL, '0', 1, 1, 1, 'zhangsan', '2020-06-26 18:45:38', '2020-06-26 19:04:15');
INSERT INTO `tb_binding_remove_ralation` VALUES (6, 10000000034, '18410427797', '950135901236577', NULL, '2020-06-27 02:53:28', '2020-06-27 03:04:15', '0', '0,0', '1', '2020-06-29 02:53:28', '123', '1', NULL, '0', 1, 1, 1, 'zhangsan', '2020-06-26 18:53:29', '2020-06-26 19:04:15');
INSERT INTO `tb_binding_remove_ralation` VALUES (7, 10000000034, '18410427797', '950135901236547', NULL, '2020-06-27 02:55:16', '2020-06-27 03:04:15', '0', '0,0', '1', '2020-06-29 02:55:16', '123', '1', NULL, '0', 1, 1, 1, 'zhangsan', '2020-06-26 18:55:17', '2020-06-26 19:04:15');
INSERT INTO `tb_binding_remove_ralation` VALUES (8, 10000000034, '18410427797', '950135901236538', NULL, '2020-06-27 03:00:52', '2020-06-27 03:04:15', '0', '0,0', '1', '2020-06-29 03:00:52', '123', '1', NULL, '1', 1, 1, 1, 'zhangsan', '2020-06-26 19:00:53', '2020-06-26 19:04:15');
INSERT INTO `tb_binding_remove_ralation` VALUES (9, 10000000034, '18410427797', '950135901236544', NULL, '1990-06-27 03:01:49', '2020-06-27 03:04:15', '0', '0,0', '1', '2020-06-29 03:01:49', '123', '1', NULL, '1', 1, 1, 1, 'zhangsan', '2020-06-26 19:01:50', '2020-06-26 19:04:15');
INSERT INTO `tb_binding_remove_ralation` VALUES (10, 10000000034, '18410427797', '950135901236508', NULL, '2020-06-27 03:04:00', '2020-06-27 03:04:15', '0', '0,0', '1', '2020-06-29 03:04:00', '123', '1', NULL, '1', 1, 1, 1, 'zhangsan', '2020-06-26 19:04:01', '2020-06-26 19:04:15');
INSERT INTO `tb_binding_remove_ralation` VALUES (11, 10000000034, '15122625539', '950135901236563', NULL, '2020-06-27 03:28:49', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-06-29 03:28:49', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-06-26 19:28:50', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (12, 10000000034, '15122625539', '950135901236568', NULL, '2020-06-27 22:24:14', NULL, '0', '0,0', '1', '2020-06-29 22:24:14', '12345678', '1', NULL, '1', NULL, NULL, NULL, NULL, '2020-06-27 14:24:15', '2020-06-27 14:24:15');
INSERT INTO `tb_binding_remove_ralation` VALUES (13, 10000000034, '15122625539', '950135901236575', NULL, '2020-06-27 22:27:53', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-06-29 22:27:53', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-06-27 14:27:54', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (14, 10000000034, '15122625539', '950135901236542', NULL, '2020-06-27 23:22:21', NULL, '0', '0,0', '1', '2020-06-29 23:22:21', '12345678', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-06-27 15:22:22', '2020-06-27 15:22:22');
INSERT INTO `tb_binding_remove_ralation` VALUES (15, 10000000034, '15122625539', '950135901236571', NULL, '2020-07-01 00:45:50', NULL, '0', '0,0', '1', '2020-07-03 00:45:50', '1234567890', '1', NULL, '1', NULL, NULL, NULL, NULL, '2020-06-30 16:45:50', '2020-06-30 16:45:50');
INSERT INTO `tb_binding_remove_ralation` VALUES (16, 10000000034, '15122625539', '950135901236591', NULL, '2020-07-01 22:43:19', NULL, '0', '0,0', '1', '2020-07-03 22:43:19', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 14:43:20', '2020-07-01 14:43:20');
INSERT INTO `tb_binding_remove_ralation` VALUES (17, 10000000034, '15122625539', '950135901236577', NULL, '2020-07-01 22:45:33', NULL, '0', '0,0', '1', '2020-07-03 22:45:33', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 14:45:34', '2020-07-01 14:45:34');
INSERT INTO `tb_binding_remove_ralation` VALUES (18, 10000000034, '15122625539', '950135901236528', NULL, '2020-07-01 23:13:51', NULL, '0', '0,0', '1', '2020-07-03 23:13:51', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 15:13:52', '2020-07-01 15:13:52');
INSERT INTO `tb_binding_remove_ralation` VALUES (19, 10000000034, '15122625539', '950135901236537', NULL, '2020-07-02 01:19:14', NULL, '0', '0,0', '1', '2020-07-04 01:19:14', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:15', '2020-07-01 17:19:15');
INSERT INTO `tb_binding_remove_ralation` VALUES (20, 10000000034, '15122625539', '950135901236540', NULL, '2020-07-02 01:19:21', NULL, '0', '0,0', '1', '2020-07-04 01:19:21', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:21', '2020-07-01 17:19:21');
INSERT INTO `tb_binding_remove_ralation` VALUES (21, 10000000034, '15122625539', '950135901236594', NULL, '2020-07-02 01:19:23', NULL, '0', '0,0', '1', '2020-07-04 01:19:23', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:23', '2020-07-01 17:19:23');
INSERT INTO `tb_binding_remove_ralation` VALUES (22, 10000000034, '15122625539', '950135901236579', NULL, '2020-07-02 01:19:24', NULL, '0', '0,0', '1', '2020-07-04 01:19:24', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:25', '2020-07-01 17:19:25');
INSERT INTO `tb_binding_remove_ralation` VALUES (23, 10000000034, '15122625539', '950135901236558', NULL, '2020-07-02 01:19:25', NULL, '0', '0,0', '1', '2020-07-04 01:19:25', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:26', '2020-07-01 17:19:26');
INSERT INTO `tb_binding_remove_ralation` VALUES (24, 10000000034, '15122625539', '950135901236574', NULL, '2020-07-02 01:19:26', NULL, '0', '0,0', '1', '2020-07-04 01:19:26', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:26', '2020-07-01 17:19:26');
INSERT INTO `tb_binding_remove_ralation` VALUES (25, 10000000034, '15122625539', '950135901236589', NULL, '2020-07-02 01:19:26', NULL, '0', '0,0', '1', '2020-07-04 01:19:26', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:27', '2020-07-01 17:19:27');
INSERT INTO `tb_binding_remove_ralation` VALUES (26, 10000000034, '15122625539', '950135901236554', NULL, '2020-07-02 01:19:27', NULL, '0', '0,0', '1', '2020-07-04 01:19:27', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:27', '2020-07-01 17:19:27');
INSERT INTO `tb_binding_remove_ralation` VALUES (27, 10000000034, '15122625539', '950135901236536', NULL, '2020-07-02 01:19:27', NULL, '0', '0,0', '1', '2020-07-04 01:19:27', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:27', '2020-07-01 17:19:27');
INSERT INTO `tb_binding_remove_ralation` VALUES (28, 10000000034, '15122625539', '950135901236531', NULL, '2020-07-02 01:19:27', NULL, '0', '0,0', '1', '2020-07-04 01:19:27', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:27', '2020-07-01 17:19:27');
INSERT INTO `tb_binding_remove_ralation` VALUES (29, 10000000034, '15122625539', '950135901236559', NULL, '2020-07-02 01:19:27', NULL, '0', '0,0', '1', '2020-07-04 01:19:27', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:28', '2020-07-01 17:19:28');
INSERT INTO `tb_binding_remove_ralation` VALUES (30, 10000000034, '15122625539', '950135901236563', NULL, '2020-07-02 01:19:27', NULL, '0', '0,0', '1', '2020-07-04 01:19:27', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:28', '2020-07-01 17:19:28');
INSERT INTO `tb_binding_remove_ralation` VALUES (31, 10000000034, '15122625539', '950135901236546', NULL, '2020-07-02 01:19:27', NULL, '0', '0,0', '1', '2020-07-04 01:19:27', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:28', '2020-07-01 17:19:28');
INSERT INTO `tb_binding_remove_ralation` VALUES (32, 10000000034, '15122625539', '950135901236500', NULL, '2020-07-02 01:19:27', NULL, '0', '0,0', '1', '2020-07-04 01:19:27', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:28', '2020-07-01 17:19:28');
INSERT INTO `tb_binding_remove_ralation` VALUES (33, 10000000034, '15122625539', '950135901236519', NULL, '2020-07-02 01:19:28', NULL, '0', '0,0', '1', '2020-07-04 01:19:28', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:28', '2020-07-01 17:19:28');
INSERT INTO `tb_binding_remove_ralation` VALUES (34, 10000000034, '15122625539', '950135901236570', NULL, '2020-07-02 01:19:28', NULL, '0', '0,0', '1', '2020-07-04 01:19:28', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:28', '2020-07-01 17:19:28');
INSERT INTO `tb_binding_remove_ralation` VALUES (35, 10000000034, '15122625539', '950135901236575', NULL, '2020-07-02 01:19:28', NULL, '0', '0,0', '1', '2020-07-04 01:19:28', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:28', '2020-07-01 17:19:28');
INSERT INTO `tb_binding_remove_ralation` VALUES (36, 10000000034, '15122625539', '950135901236504', NULL, '2020-07-02 01:19:28', NULL, '0', '0,0', '1', '2020-07-04 01:19:28', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:29', '2020-07-01 17:19:29');
INSERT INTO `tb_binding_remove_ralation` VALUES (37, 10000000034, '15122625539', '950135901236547', NULL, '2020-07-02 01:19:28', NULL, '0', '0,0', '1', '2020-07-04 01:19:28', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:29', '2020-07-01 17:19:29');
INSERT INTO `tb_binding_remove_ralation` VALUES (38, 10000000034, '15122625539', '950135901236580', NULL, '2020-07-02 01:19:28', NULL, '0', '0,0', '1', '2020-07-04 01:19:28', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:29', '2020-07-01 17:19:29');
INSERT INTO `tb_binding_remove_ralation` VALUES (39, 10000000034, '15122625539', '950135901236586', NULL, '2020-07-02 01:19:29', NULL, '0', '0,0', '1', '2020-07-04 01:19:29', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:29', '2020-07-01 17:19:29');
INSERT INTO `tb_binding_remove_ralation` VALUES (40, 10000000034, '15122625539', '950135901236555', NULL, '2020-07-02 01:19:29', NULL, '0', '0,0', '1', '2020-07-04 01:19:29', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:29', '2020-07-01 17:19:29');
INSERT INTO `tb_binding_remove_ralation` VALUES (41, 10000000034, '15122625539', '950135901236518', NULL, '2020-07-02 01:19:29', NULL, '0', '0,0', '1', '2020-07-04 01:19:29', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:29', '2020-07-01 17:19:29');
INSERT INTO `tb_binding_remove_ralation` VALUES (42, 10000000034, '15122625539', '950135901236593', NULL, '2020-07-02 01:19:29', NULL, '0', '0,0', '1', '2020-07-04 01:19:29', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:30', '2020-07-01 17:19:30');
INSERT INTO `tb_binding_remove_ralation` VALUES (43, 10000000034, '15122625539', '950135901236584', NULL, '2020-07-02 01:19:29', NULL, '0', '0,0', '1', '2020-07-04 01:19:29', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:30', '2020-07-01 17:19:30');
INSERT INTO `tb_binding_remove_ralation` VALUES (44, 10000000034, '15122625539', '950135901236539', NULL, '2020-07-02 01:19:29', NULL, '0', '0,0', '1', '2020-07-04 01:19:29', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:30', '2020-07-01 17:19:30');
INSERT INTO `tb_binding_remove_ralation` VALUES (45, 10000000034, '15122625539', '950135901236562', NULL, '2020-07-02 01:19:30', NULL, '0', '0,0', '1', '2020-07-04 01:19:30', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:30', '2020-07-01 17:19:30');
INSERT INTO `tb_binding_remove_ralation` VALUES (46, 10000000034, '15122625539', '950135901236534', NULL, '2020-07-02 01:19:30', NULL, '0', '0,0', '1', '2020-07-04 01:19:30', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:30', '2020-07-01 17:19:30');
INSERT INTO `tb_binding_remove_ralation` VALUES (47, 10000000034, '15122625539', '950135901236587', NULL, '2020-07-02 01:19:30', NULL, '0', '0,0', '1', '2020-07-04 01:19:30', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:30', '2020-07-01 17:19:30');
INSERT INTO `tb_binding_remove_ralation` VALUES (48, 10000000034, '15122625539', '950135901236560', NULL, '2020-07-02 01:19:30', NULL, '0', '0,0', '1', '2020-07-04 01:19:30', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:31', '2020-07-01 17:19:31');
INSERT INTO `tb_binding_remove_ralation` VALUES (49, 10000000034, '15122625539', '950135901236514', NULL, '2020-07-02 01:19:30', NULL, '0', '0,0', '1', '2020-07-04 01:19:30', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:31', '2020-07-01 17:19:31');
INSERT INTO `tb_binding_remove_ralation` VALUES (50, 10000000034, '15122625539', '950135901236517', NULL, '2020-07-02 01:19:30', NULL, '0', '0,0', '1', '2020-07-04 01:19:30', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:31', '2020-07-01 17:19:31');
INSERT INTO `tb_binding_remove_ralation` VALUES (51, 10000000034, '15122625539', '950135901236509', NULL, '2020-07-02 01:19:31', NULL, '0', '0,0', '1', '2020-07-04 01:19:31', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:31', '2020-07-01 17:19:31');
INSERT INTO `tb_binding_remove_ralation` VALUES (52, 10000000034, '15122625539', '950135901236576', NULL, '2020-07-02 01:19:31', NULL, '0', '0,0', '1', '2020-07-04 01:19:31', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:31', '2020-07-01 17:19:31');
INSERT INTO `tb_binding_remove_ralation` VALUES (53, 10000000034, '15122625539', '950135901236598', NULL, '2020-07-02 01:19:31', NULL, '0', '0,0', '1', '2020-07-04 01:19:31', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:31', '2020-07-01 17:19:31');
INSERT INTO `tb_binding_remove_ralation` VALUES (54, 10000000034, '15122625539', '950135901236529', NULL, '2020-07-02 01:19:31', NULL, '0', '0,0', '1', '2020-07-04 01:19:31', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:32', '2020-07-01 17:19:32');
INSERT INTO `tb_binding_remove_ralation` VALUES (55, 10000000034, '15122625539', '950135901236561', NULL, '2020-07-02 01:19:31', NULL, '0', '0,0', '1', '2020-07-04 01:19:31', '888888', '1', NULL, '1', NULL, NULL, 1, 'test', '2020-07-01 17:19:32', '2020-07-01 17:19:32');
INSERT INTO `tb_binding_remove_ralation` VALUES (56, 10000000034, '15122625539', '950135901236526', NULL, '2020-07-02 22:02:21', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 22:02:21', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 14:02:22', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (57, 10000000034, '15122625539', '950135901236549', NULL, '2020-07-02 22:04:27', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 22:04:27', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 14:04:29', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (58, 10000000034, '15122625539', '950135901236541', NULL, '2020-07-02 22:07:31', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 22:07:31', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 14:07:31', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (59, 10000000034, '15122625539', '950135901236585', NULL, '2020-07-02 22:14:04', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 22:14:04', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 14:14:06', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (60, 10000000034, '15122625539', '950135901236516', NULL, '2020-07-02 23:16:54', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 23:16:54', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 15:16:55', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (61, 10000000034, '15122625539', '950135901236569', NULL, '2020-07-02 23:30:31', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 23:30:31', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 15:30:32', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (62, 10000000034, '15122625539', '950135901236581', NULL, '2020-07-02 23:31:47', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 23:31:47', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 15:31:48', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (63, 10000000034, '15122625539', '950135901236522', NULL, '2020-07-02 23:33:23', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 23:33:23', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 15:33:24', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (64, 10000000034, '15122625539', '950135901236543', NULL, '2020-07-02 23:33:49', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 23:33:49', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 15:33:49', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (65, 10000000034, '15122625539', '950135901236578', NULL, '2020-07-02 23:35:59', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 23:35:59', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 15:35:59', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (66, 10000000034, '15122625539', '950135901236595', NULL, '2020-07-02 23:37:03', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 23:37:03', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 15:37:04', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (67, 10000000034, '15122625539', '950135901236582', NULL, '2020-07-02 23:38:42', '2020-07-02 23:40:08', '0', '0,0', '1', '2020-07-04 23:38:42', '123456', '1', NULL, '0', NULL, NULL, NULL, NULL, '2020-07-02 15:38:43', '2020-07-02 15:40:08');
INSERT INTO `tb_binding_remove_ralation` VALUES (68, 10000000034, '15122625539', '950135901236508', NULL, '2020-07-03 00:18:08', NULL, '0', '0,0', '1', '2020-07-05 00:18:08', '123456', '1', NULL, '1', NULL, NULL, NULL, NULL, '2020-07-02 16:18:09', '2020-07-02 16:18:09');
INSERT INTO `tb_binding_remove_ralation` VALUES (69, 10000000034, '15122625539', '950135901236588', NULL, '2020-07-03 00:29:57', NULL, '0', '0,0', '1', '2020-07-05 00:29:57', '123456', '1', NULL, '1', NULL, NULL, NULL, NULL, '2020-07-02 16:29:58', '2020-07-02 16:29:58');

-- ----------------------------
-- Table structure for tb_binding_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_binding_user_info`;
CREATE TABLE `tb_binding_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `unitID` int(16) NULL DEFAULT NULL COMMENT '合作伙伴编号',
  `validitytime` int(11) NULL DEFAULT NULL COMMENT '默认绑定时间向后推迟48小时，如有配置取配置值',
  `callrestrict` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来话控制，默认0；\r\n0：AXB不做来话控制，即允许A和B以及其他号码拨打X\r\n1：AXB做来话控制，只允许A和B打X',
  `calldisplay` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来显控制，默认0,0；0：被叫UID(本UID)\r\n1：被叫UID所属企业统一标识(T_Unit中的UnitUIDNumber)\r\n2：主叫的真实号码\r\n3：主叫的UID\r\n4：95013X+主叫的真实号码\r\n注：主叫无UID时（即\'0,0\'中的第二列）不能设置为3；主叫有UID时（即\'0,0\'中的第一列）不能设置为4',
  `callrecording` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认录音，0：不录音；1：录音',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_detail_trajectory_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_detail_trajectory_info`;
CREATE TABLE `tb_detail_trajectory_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traceNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `opTime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `opOrgSimpleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作码',
  `opName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作名',
  `desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `operatorName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `telephone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_detail_trajectory_outside_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_detail_trajectory_outside_info`;
CREATE TABLE `tb_detail_trajectory_outside_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traceNo` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运单号',
  `opTime` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `opCode` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作码',
  `opName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作名',
  `opDesc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作描述',
  `opOrgProvName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作网点省名',
  `opOrgCity` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作网点城市',
  `opOrgCode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作网点编码',
  `opOrgName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作网点名称',
  `operatorNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员工号',
  `operatorName` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作员工名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_detail_trajectory_outside_info
-- ----------------------------
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (1, '9610259229251', '2020-05-26 01:11:03', '10', '收寄', '【邢台县快包揽收部】已收件,揽投员:张爱林,电话:13513291127', '河北省', '邢台市', '05406200', '邢台县快包揽收部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (2, '9610259229251', '2020-05-26 08:58:54', '20', '运输', '离开【邢台县快包揽收部】,下一站【邢台邮件处理中心】', '河北省', '邢台市', '05406200', '邢台县快包揽收部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (3, '9610259229251', '2020-05-26 09:42:38', '20', '运输', '到达【邢台邮件处理中心】', '河北省', '邢台市', '05400071', '邢台邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (4, '9610259229251', '2020-05-26 12:28:28', '20', '运输', '离开【邢台邮件处理中心】,下一站【廊坊环渤海集散中心】', '河北省', '邢台市', '05400071', '邢台邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (5, '9610259229251', '2020-05-26 19:20:37', '20', '运输', '到达【廊坊环渤海集散中心】（经转）', '河北省', '廊坊市', '06500083', '廊坊环渤海集散中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (6, '9610259229251', '2020-05-26 20:50:30', '20', '运输', '离开【廊坊环渤海集散中心】,下一站【天津市邮件处理中心】（经转）', '河北省', '廊坊市', '06500083', '廊坊环渤海集散中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (7, '9610259229251', '2020-05-26 23:10:12', '20', '运输', '到达【天津市邮件处理中心】', '天津市', '天津市', '30000071', '天津市邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (8, '9610259229251', '2020-05-27 05:17:36', '20', '运输', '离开【天津市邮件处理中心】,下一站【天津市河东区一号桥邮政营业部】', '天津市', '天津市', '30000071', '天津市邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (9, '9610259229251', '2020-05-27 05:55:55', '20', '运输', '到达【天津市河东区一号桥邮政营业部】', '天津市', '天津市', '30010012', '天津市河东区一号桥邮政营业部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (10, '9610259229251', '2020-05-27 06:09:13', '70', '试投', '【天津市河东区一号桥邮政营业部】安排投递,投递员:于承千,电话:17614353616,揽投部电话:022-84346881', '天津市', '天津市', '30010012', '天津市河东区一号桥邮政营业部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (11, '9610259229251', '2020-05-27 07:49:02', '80', '妥投', '已签收,本人签收 :孟秋月,投递员:于承千,电话:17614353616', '天津市', '天津市', '30010012', '天津市河东区一号桥邮政营业部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (12, '123', '2019-06-04 12:20:22', '10', '收寄', '【盐城市邮政局测试支局】已收件', '江苏省', '盐城市', '22400999', '盐城市邮政局测试支局', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (13, '123', '2019-06-08 07:59:21', '20', '运输', '到达【邮政昆山市邮件组】（经转）', '江苏省', '苏州市', '21536170', '邮政昆山市邮件组', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (14, '123', '2019-06-08 13:46:55', '20', '运输', '离开【邮政苏州市邮件处理分局】,下一站【苏州市国际邮件】（经转）', '江苏省', '苏州市', '21506000', '邮政苏州市邮件处理分局', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (15, '123', '2019-06-11 04:42:42', '70', '试投', '【兴顺街营业部】安排投递,投递员:李红梅,电话:18524488503,揽投部电话:18524488381', '辽宁省', '沈阳市', '11002306', '兴顺街营业部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (16, '123', '2019-06-11 04:43:21', '70', '试投', '【兴顺街营业部】安排投递,投递员:田娟,电话:18524488509,揽投部电话:18524488381', '辽宁省', '沈阳市', '11002306', '兴顺街营业部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (17, '123', '2019-06-11 06:45:24', '80', '妥投', '已签收,信报箱,投递员:田娟,电话:18524488509', '辽宁省', '沈阳市', '11002306', '兴顺街营业部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (18, '123', '2019-06-12 10:22:23', '20', '运输', '到达【汉中邮件处理中心】（经转）', '陕西省', '汉中市', '72300071', '汉中邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (19, '123', '2019-06-12 12:04:26', '20', '运输', '离开【汉中邮件处理中心】,下一站【西安中心】（经转）', '陕西省', '汉中市', '72300071', '汉中邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (20, '123', '2019-06-12 19:27:34', '20', '运输', '到达【西安中心】（经转）', '陕西省', '西安市', '71000071', '西安中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (21, '123', '2019-06-12 22:30:17', '20', '运输', '离开【西安中心】,下一站【西安国际】（经转）', '陕西省', '西安市', '71000071', '西安中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (22, '123', '2019-06-17 06:18:10', '20', '运输', '到达【杭州中心】（经转）', '浙江省', '杭州市', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (23, '123', '2019-06-17 11:50:30', '20', '运输', '离开【杭州中心】,下一站【杭州市国际邮件】（经转）', '浙江省', '杭州市', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (24, '123', '2019-06-27 07:56:09', '20', '运输', '离开【兴化市戴南揽投部】,下一站【中国邮政集团公司江苏省兴化市分公司戴南支局】', '江苏省', '泰州市', '22572102', '兴化市戴南揽投部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (25, '123', '2019-07-04 09:44:19', '20', '运输', '到达【邮政大庆市邮件】', '黑龙江省', '大庆市', '16303100', '邮政大庆市邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (26, '123', '2019-07-04 11:53:44', '20', '运输', '离开【邮政大庆市邮件】,下一站【哈尔滨中心局松北处理中心】', '黑龙江省', '大庆市', '16303100', '邮政大庆市邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (27, '123', '2019-07-04 14:06:02', '20', '运输', '到达【哈尔滨中心局松北处理中心】（经转）', '黑龙江省', '哈尔滨市', '15000163', '哈尔滨中心局松北处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (28, '123', '2019-07-04 23:54:34', '20', '运输', '离开【邮政哈尔滨邮件】,下一站【哈尔滨国际】（经转）', '黑龙江省', '哈尔滨市', '15000071', '邮政哈尔滨邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (29, '123', '2019-07-07 06:06:40', '20', '运输', '到达【杭州中心】（经转）', '浙江省', '杭州市', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (30, '123', '2019-07-07 11:19:35', '20', '运输', '离开【杭州中心】,下一站【杭州市国际邮件】（经转）', '浙江省', '杭州市', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (31, '123', '2019-07-09 14:25:26', '20', '运输', '离开【江门中心】,下一站【江高中心】（经转）', '广东省', '江门市', '52900071', '江门中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (32, '123', '2019-07-09 16:26:37', '20', '运输', '到达【江高中心】（经转）', '广东省', '广州市', '51000004', '江高中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (33, '123', '2019-07-09 23:32:37', '20', '运输', '离开【江高中心】,下一站【广州国际】（经转）', '广东省', '广州市', '51000004', '江高中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (34, '123', '2019-07-14 06:06:17', '20', '运输', '到达【杭州中心】（经转）', '浙江省', '杭州市', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (35, '123', '2019-07-14 11:26:12', '20', '运输', '离开【杭州中心】,下一站【杭州市国际邮件】（经转）', '浙江省', '杭州市', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (36, '123', '2019-07-18 13:56:26', '20', '运输', '到达【遵义市本部运营管理部网路运营中心】（经转）', '贵州省', '遵义市', '56300103', '遵义市本部运营管理部网路运营中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (37, '123', '2019-07-19 08:52:04', '20', '运输', '离开【遵义市本部运营管理部网路运营中心】,下一站【邮政贵阳市本部邮件】（经转）', '贵州省', '遵义市', '56300103', '遵义市本部运营管理部网路运营中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (38, '123', '2019-07-19 13:02:36', '20', '运输', '到达【邮政贵阳市本部邮件】（经转）', '贵州省', '贵阳市', '55002171', '邮政贵阳市本部邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (39, '123', '2019-07-19 22:47:52', '20', '运输', '离开【邮政贵阳市本部邮件】,下一站【贵阳国际邮件处理中心】（经转）', '贵州省', '贵阳市', '55002171', '邮政贵阳市本部邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (40, '123', '2019-07-30 11:28:25', '20', '运输', '离开【杭州中心】,下一站【杭州市国际邮件】（经转）', '浙江省', '杭州市', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (41, '123', '2019-07-31 00:05:00', '20', '运输', '到达【杭州市国际邮件】（经转）', '浙江省', '杭州市', '31000001', '杭州市国际邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (42, '123', '2019-08-14 12:45:18', '20', '运输', '到达【来宾市邮件处理中心】（经转）', '广西壮族自治区', '来宾市', '54610052', '来宾市邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (43, '123', '2019-08-14 12:59:44', '20', '运输', '离开【来宾市邮件处理中心】,下一站【南宁中心】（经转）', '广西壮族自治区', '来宾市', '54610052', '来宾市邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (44, '123', '2019-08-14 16:01:28', '20', '运输', '到达【南宁中心】（经转）', '广西壮族自治区', '南宁市', '53000071', '南宁中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (45, '123', '2019-08-19 14:58:39', '20', '运输', '到达【国际邮件转运部】（经转）', '北京市', '北京市', '10000075', '国际邮件转运部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (46, '123', '2019-08-19 16:35:09', '20', '运输', '离开【国际邮件转运部】,下一站【京邮国际】（经转）', '北京市', '北京市', '10000075', '国际邮件转运部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (47, '123', '2019-08-21 03:42:58', '20', '运输', '到达【长春中心】（经转）', '吉林省', '长春市', '13000071', '长春中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (48, '123', '2019-08-21 06:56:55', '20', '运输', '离开【长春中心】,下一站【长春国际互换局】（经转）', '吉林省', '长春市', '13000071', '长春中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (49, '123', '2019-08-26 08:49:47', '20', '运输', '到达【邮政大庆市邮件】', '黑龙江', '大庆', '16303100', '邮政大庆市邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (50, '123', '2019-08-26 11:59:03', '20', '运输', '离开【邮政大庆市邮件】,下一站【哈尔滨中心局松北处理中心】', '黑龙江', '大庆', '16303100', '邮政大庆市邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (51, '123', '2019-08-26 14:41:15', '20', '运输', '到达【哈尔滨中心局松北处理中心】（经转）', '黑龙江', '哈尔滨', '15000163', '哈尔滨中心局松北处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (52, '123', '2019-08-26 23:28:42', '20', '运输', '离开【邮政哈尔滨邮件】,下一站【哈尔滨国际】（经转）', '黑龙江', '哈尔滨', '15000071', '邮政哈尔滨邮件', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (53, '123', '2019-08-31 03:55:06', '20', '运输', '到达【长春中心】（经转）', '吉林', '长春', '13000071', '长春中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (54, '123', '2019-08-31 22:42:49', '20', '运输', '离开【长春中心】,下一站【长春国际互换局】（经转）', '吉林', '长春', '13000071', '长春中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (55, '123', '2019-09-04 05:39:42', '20', '运输', '到达【杭州中心】（经转）', '浙江', '杭州', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (56, '123', '2019-09-04 11:46:27', '20', '运输', '离开【杭州中心】,下一站【杭州市国际邮件】（经转）', '浙江', '杭州', '31000071', '杭州中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (57, '123', '2019-09-07 04:36:52', '20', '运输', '到达【长春中心】（经转）', '吉林', '长春', '13000071', '长春中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (58, '123', '2019-09-11 05:47:33', '20', '运输', '离开【长春中心】,下一站【长春国际互换局】（经转）', '吉林', '长春', '13000071', '长春中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (59, '123', '2019-09-17 10:28:27', '20', '运输', '到达【邮政大同邮件处理中心】（经转）', '山西省', '大同市', '03700071', '邮政大同邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (60, '123', '2019-09-17 13:41:12', '20', '运输', '离开【邮政大同邮件处理中心】,下一站【太原中心】（经转）', '山西省', '大同市', '03700071', '邮政大同邮件处理中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (61, '123', '2019-09-17 18:25:07', '20', '运输', '到达【太原中心】（经转）', '山西省', '太原市', '03000071', '太原中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (62, '123', '2019-09-17 23:04:29', '20', '运输', '离开【太原航站】,下一站【太原国际】（经转）', '山西省', '太原市', '03000061', '太原航站', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (63, '123', '2019-09-19 05:37:10', '80', '妥投', '已签收，签收人：朱力行,投递局:邮政常州市清潭支局', '江苏省', '常州市', '21301501', '邮政常州市清潭支局', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (64, '123', '2019-11-14 01:53:35', '10', '收寄', '【电白县罗坑邮政支局】已收件', '广东省', '茂名市', '52543101', '电白县罗坑邮政支局', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (65, '123', '2019-11-20 01:50:44', '10', '收寄', '【电白县罗坑邮政支局】已收件', '广东省', '茂名市', '52543101', '电白县罗坑邮政支局', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (66, '1171957742684', '2020-06-15 08:50:05', '10', '收寄', '【昆山市电商与物流项目组】已收件,揽投员:许海容,电话:15062652622', '江苏省', '苏州市', '21536200', '昆山市电商与物流项目组', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (67, '1171957742684', '2020-06-15 08:59:21', '20', '运输', '离开【昆山市电商与物流项目组】,下一站【江苏昆山市处理中心】', '江苏省', '苏州市', '21536200', '昆山市电商与物流项目组', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (68, '1171957742684', '2020-06-15 12:47:23', '20', '运输', '离开【江苏昆山市中心】,下一站【南京航空集散中心】', '江苏省', '苏州市', '21536170', '江苏昆山市中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (69, '1171957742684', '2020-06-15 16:40:03', '20', '运输', '到达【南京航空集散中心】（经转）', '江苏省', '南京市', '21112100', '南京航空集散中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (70, '1171957742684', '2020-06-16 06:34:28', '20', '运输', '离开【南京航空集散中心】,下一站【北京航站】（经转）', '江苏省', '南京市', '21112100', '南京航空集散中心', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (71, '1171957742684', '2020-06-16 09:23:56', '20', '运输', '到达【北京航站】', '北京市', '北京市', '10000072', '北京航站', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (72, '1171957742684', '2020-06-16 12:56:14', '20', '运输', '离开【北京航站】,下一站【北京新顺处理中心】', '北京市', '北京市', '10000072', '北京航站', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (73, '1171957742684', '2020-06-17 00:38:29', '70', '试投', '【北京市密云县西田各庄邮政所】安排投递,投递员:王立冬,电话:18514807413,揽投部电话:010-61018092', '北京市', '北京市', '10150901', '北京市密云县西田各庄邮政所', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (74, '1171957742684', '2020-06-17 03:03:24', '20', '运输', '离开【密云营业部】,下一站【北京市密云县西田各庄邮政所】', '北京市', '北京市', '10159901', '密云营业部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (75, '1171957742684', '2020-06-17 06:40:41', '80', '妥投', '已签收,本人签收 :张天富,投递员:王立冬,电话:18514807413', '北京市', '北京市', '10150901', '北京市密云县西田各庄邮政所', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (76, '1171957742684', '2020-06-30 08:54:15', '70', '试投', '【密云营业部】安排投递,投递员:密云袁颖,电话:18519362431,揽投部电话:010-69071940', '北京市', '北京市', '10159901', '密云营业部', NULL, NULL);
INSERT INTO `tb_detail_trajectory_outside_info` VALUES (77, '1171957742684', '2020-06-30 08:56:20', '80', '妥投', '已签收,本人签收 ,投递员:密云袁颖,电话:18519362431', '北京市', '北京市', '10159901', '密云营业部', NULL, NULL);

-- ----------------------------
-- Table structure for tb_end_trajectory_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_end_trajectory_info`;
CREATE TABLE `tb_end_trajectory_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traceNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opTime` datetime(0) NULL DEFAULT NULL,
  `opName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `opOrgSimpleName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `record_length` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_export_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_export_info`;
CREATE TABLE `tb_export_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主建id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户Id',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `total_num` int(11) NULL DEFAULT NULL COMMENT '总条数',
  `sucess_num` int(11) NULL DEFAULT NULL COMMENT '成功条数',
  `money` double(11, 2) NULL DEFAULT NULL COMMENT '金额',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_export_info
-- ----------------------------
INSERT INTO `tb_export_info` VALUES (44, 3, '87.xlsx_20200623214753.xlsx', 87, 0, 0.00, '2020-06-23 13:47:54', NULL);
INSERT INTO `tb_export_info` VALUES (45, 3, '87.xlsx_20200623214924.xlsx', 87, 86, 25.80, '2020-06-23 13:49:25', NULL);
INSERT INTO `tb_export_info` VALUES (46, 1, '87.xlsx_20200705230529.xlsx', 87, 86, 25.80, '2020-07-05 15:05:31', NULL);
INSERT INTO `tb_export_info` VALUES (47, 1, '87.xlsx_20200705230911.xlsx', 87, 86, 25.80, '2020-07-05 15:09:12', NULL);
INSERT INTO `tb_export_info` VALUES (48, 1, '87.xlsx_20200705231111.xlsx', 87, 86, 25.80, '2020-07-05 15:11:12', NULL);
INSERT INTO `tb_export_info` VALUES (49, 1, '87.xlsx_20200705231905.xlsx', 87, 86, 25.80, '2020-07-05 15:19:06', NULL);
INSERT INTO `tb_export_info` VALUES (50, 1, '87.xlsx_20200705232159.xlsx', 87, 86, 25.80, '2020-07-05 15:21:59', NULL);
INSERT INTO `tb_export_info` VALUES (51, 1, '87.xlsx_20200705232519.xlsx', 87, 86, 25.80, '2020-07-05 15:25:20', NULL);
INSERT INTO `tb_export_info` VALUES (52, 1, '87.xlsx_20200705232759.xlsx', 87, 86, 25.80, '2020-07-05 15:28:00', NULL);
INSERT INTO `tb_export_info` VALUES (53, 1, '87.xlsx_20200705233428.xlsx', 87, 86, 25.80, '2020-07-05 15:34:29', NULL);
INSERT INTO `tb_export_info` VALUES (54, 1, '87.xlsx_20200705235636.xlsx', 87, 86, 25.80, '2020-07-05 15:56:37', NULL);

-- ----------------------------
-- Table structure for tb_order_batch_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_batch_info`;
CREATE TABLE `tb_order_batch_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `batch_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `total_num` int(11) NULL DEFAULT NULL COMMENT '总记录数',
  `success_num` int(11) NULL DEFAULT NULL COMMENT '匹配成功数',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '金额',
  `status` int(1) NULL DEFAULT NULL COMMENT '匹配状态:0,未匹配1,已匹配',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `modify_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_batch_info
-- ----------------------------
INSERT INTO `tb_order_batch_info` VALUES (3, '202006232148171606', 'order_20200624004424.xlsx', 87, 86, 25.80, 1, 3, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_batch_info` VALUES (4, '202006240019171724', 'order_20200627053640.xlsx', 87, 0, 0.00, 1, 1, '2020-06-26 21:36:42', '2020-06-23 16:19:18');
INSERT INTO `tb_order_batch_info` VALUES (5, '202006241155591473', 'order_20200624115604.xlsx', 10, 8, 2.40, 1, 3, '2020-06-24 03:56:05', '2020-06-24 03:56:00');

-- ----------------------------
-- Table structure for tb_order_import
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_import`;
CREATE TABLE `tb_order_import`  (
  `id` bigint(11) NOT NULL,
  `order_date` datetime(0) NULL DEFAULT NULL COMMENT '下单日期',
  `send_date` datetime(0) NULL DEFAULT NULL COMMENT '收寄日期',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `mail_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `fee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收费',
  `inner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `count` int(11) NULL DEFAULT NULL COMMENT '数量',
  `reciver_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reciver_mobile_one` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reciver_province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reciver_city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reciver_county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reciver_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sender_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sender_mobile_one` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_channel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '下单平台',
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '订单id',
  `is_fee` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '付费情况 0未付费 1付费',
  `weight` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `real_fee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实际运费',
  `package_fee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包装',
  `total_fee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合计费用',
  `profit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '利润',
  `profit_rate` decimal(10, 2) NULL DEFAULT NULL COMMENT '利润率',
  PRIMARY KEY (`id`, `is_fee`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_order_original_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_original_info`;
CREATE TABLE `tb_order_original_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主建',
  `batch_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `sender_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件人姓名',
  `sender_mobile_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件人电话1',
  `sender_mobile_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件人电话2',
  `sender_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件省',
  `sender_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件市',
  `sender_county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件区',
  `sender_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件详细地址',
  `reciver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `reciver_mobile_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人电话1',
  `reciver_mobile_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人电话2',
  `reciver_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件省',
  `reciver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件市',
  `reciver_county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件区',
  `reciver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件详细地址',
  `operation_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员id',
  `operation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员姓名',
  `operation_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `city_wide_flag` int(1) NULL DEFAULT NULL COMMENT '同城标识（1同城，0外阜）',
  `sorting_status` int(255) NULL DEFAULT NULL COMMENT '分拣码匹配状态（1已匹配、0未匹配）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 359 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_original_info
-- ----------------------------
INSERT INTO `tb_order_original_info` VALUES (175, '202006232148171606', '20200623214817168382', '张三', '13800138000', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138000', NULL, '北京市', NULL, NULL, '北京市朝阳区东风镇石佛营西里25号楼108', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (176, '202006232148171606', '20200623214817170698', '张三', '13800138001', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138001', NULL, '北京市', NULL, NULL, '北京市通州区中仓街道北小园5号楼232', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (177, '202006232148171606', '20200623214817114085', '张三', '13800138002', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138002', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (178, '202006232148171606', '20200623214817121149', '张三', '13800138003', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138003', NULL, '北京市', NULL, NULL, '北京市大兴区旧宫镇北京大兴九银村镇银行(旧宫支行)', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (179, '202006232148171606', '20200623214817144529', '张三', '13800138004', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138004', NULL, '北京市', NULL, NULL, '北京市通州区梨园北洋洼266号邮政', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (180, '202006232148171606', '20200623214817116788', '张三', '13800138005', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138005', NULL, '北京市', NULL, NULL, '北京市东城区国瑞城中区13号楼1单元601号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (181, '202006232148171606', '20200623214817133847', '张三', '13800138006', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138006', NULL, '北京市', NULL, NULL, '北京市东城区安定门街道安定门内大街227号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (182, '202006232148171606', '20200623214817110631', '张三', '13800138007', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138007', NULL, '北京市', NULL, NULL, '北京市大兴区北京经济技术开发区经海四路156号院C2号楼4层', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (183, '202006232148171606', '20200623214817135921', '张三', '13800138008', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138008', NULL, '北京市', NULL, NULL, '北京市丰台区丰台街道丰台区东大街5号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (184, '202006232148171606', '20200623214817176239', '张三', '13800138009', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138009', NULL, '北京市', NULL, NULL, '北京市通州区运河西大街174号通州区邮政局', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (185, '202006232148171606', '20200623214817173911', '张三', '13800138010', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138010', NULL, '北京市', NULL, NULL, '北京市昌平区北七家镇王府家庭农场赋丽园40号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (186, '202006232148171606', '20200623214817143536', '张三', '13800138011', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138011', NULL, '北京市', NULL, NULL, '北京市门头沟区河滩路2号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (187, '202006232148171606', '20200623214817126665', '张三', '13800138012', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138012', NULL, '北京市', NULL, NULL, '北京市顺义区新顺南大街7号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (188, '202006232148171606', '20200623214817169075', '张三', '13800138013', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138013', NULL, '北京市', NULL, NULL, '北京市大兴区滨河街27号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (189, '202006232148171606', '20200623214817165770', '张三', '13800138014', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138014', NULL, '北京市', NULL, NULL, '北京市朝阳区来广营镇蕴实园', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (190, '202006232148171606', '20200623214817162053', '张三', '13800138015', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138015', NULL, '北京市', NULL, NULL, '北京市通州区张家湾镇高营村', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (191, '202006232148171606', '20200623214817184846', '张三', '13800138016', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138016', NULL, '北京市', NULL, NULL, '北京市通州区西营前街小区15号楼4单元421', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (192, '202006232148171606', '20200623214817104516', '张三', '13800138017', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138017', NULL, '北京市', NULL, NULL, '北京市昌平区城北街道政府街25号昌平邮局', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (193, '202006232148171606', '20200623214817109141', '张三', '13800138018', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138018', NULL, '北京市', NULL, NULL, '北京市昌平区城北街道政府街邮政支局（转延庆局）', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (194, '202006232148171606', '20200623214817156931', '张三', '13800138019', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138019', NULL, '北京市', NULL, NULL, '北京市海淀区王庄路27号院2-5-402', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (195, '202006232148171606', '20200623214817173284', '张三', '13800138020', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138020', NULL, '北京市', NULL, NULL, '北京市丰台区嘉园二里小区18号楼4单元402室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (196, '202006232148171606', '20200623214817111662', '张三', '13800138021', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138021', NULL, '北京市', NULL, NULL, '北京市丰台区东铁匠营街道东木樨园11号楼九门502室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (197, '202006232148171606', '20200623214817102189', '张三', '13800138022', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138022', NULL, '北京市', NULL, NULL, '北京市东城区东交民巷7号院11号楼2单元403号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (198, '202006232148171606', '20200623214817140158', '张三', '13800138023', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138023', NULL, '北京市', NULL, NULL, '北京市石景山区鲁谷街道依翠园小区17号楼1803号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (199, '202006232148171606', '20200623214817168669', '张三', '13800138024', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138024', NULL, '北京市', NULL, NULL, '北京市朝阳区百子湾东里沿海赛洛城419号楼1单元401室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (200, '202006232148171606', '20200623214817119114', '张三', '13800138025', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138025', NULL, '北京市', NULL, NULL, '北京市通州区西营前街17号楼321室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (201, '202006232148171606', '20200623214817127709', '张三', '13800138026', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138026', NULL, '北京市', NULL, NULL, '北京市西城区新居东里一号楼底商红霞品质生活体验店', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (202, '202006232148171606', '20200623214817153067', '张三', '13800138027', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138027', NULL, '北京市', NULL, NULL, '北京市海淀区苏家坨镇苏三四村内世纪华联超市门口取货。（如快递不能进村，到村口打电话可出来取）', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (203, '202006232148171606', '20200623214817148508', '张三', '13800138028', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138028', NULL, '北京市', NULL, NULL, '北京市大兴区欣荣北大街18-3号大兴九银村镇银行', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (204, '202006232148171606', '20200623214817137296', '张三', '13800138029', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138029', NULL, '北京市', NULL, NULL, '北京市通州区世纪星城74-3-802', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (205, '202006232148171606', '20200623214817170565', '张三', '13800138030', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138030', NULL, '北京市', NULL, NULL, '北京市西城区天桥街道EMS大院', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (206, '202006232148171606', '20200623214817164410', '张三', '13800138031', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138031', NULL, '北京市', NULL, NULL, '北京市丰台区东铁匠营街道刘家窑南里25号楼1505', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (207, '202006232148171606', '20200623214817104680', '张三', '13800138032', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138032', NULL, '北京市', NULL, NULL, '北京市石景山区玉泉西里1区远洋沁山水11楼1门1002', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (208, '202006232148171606', '20200623214817156873', '张三', '13800138033', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138033', NULL, '北京市', NULL, NULL, '北京市丰台区方庄镇中国邮政集团公司北京市丰台区分公司', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (209, '202006232148171606', '20200623214817133023', '张三', '13800138034', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138034', NULL, '北京市', NULL, NULL, '北京市海淀区上地西路6号快手总部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (210, '202006232148171606', '20200623214817189235', '张三', '13800138035', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138035', NULL, '北京市', NULL, NULL, '北京市朝阳区武圣西里24楼6单元101', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (211, '202006232148171606', '20200623214817107212', '张三', '13800138036', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138036', NULL, '北京市', NULL, NULL, '北京市海淀区五道口东升园公寓10号楼201室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (212, '202006232148171606', '20200623214817133935', '张三', '13800138037', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138037', NULL, '北京市', NULL, NULL, '北京市丰台区莲花池东路126号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (213, '202006232148171606', '20200623214817119902', '张三', '13800138038', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138038', NULL, '北京市', NULL, NULL, '北京市东城区东华门街道前门东大街7号楼', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (214, '202006232148171606', '20200623214817162844', '张三', '13800138039', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138039', NULL, '北京市', NULL, NULL, '北京市石景山区古城大街特钢东门一号楼五单元72号 13910673617', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (215, '202006232148171606', '20200623214817112555', '张三', '13800138040', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138040', NULL, '北京市', NULL, NULL, '北京市丰台区右安门外东庄20号楼2单元205', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (216, '202006232148171606', '20200623214817121139', '张三', '13800138041', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138041', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道合生·滨江帝景124楼3－101', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (217, '202006232148171606', '20200623214817141919', '张三', '13800138042', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138042', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道玉桥中路2号院10号楼742室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (218, '202006232148171606', '20200623214817101236', '张三', '13800138043', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138043', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号 通州邮局', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (219, '202006232148171606', '20200623214817184449', '张三', '13800138044', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138044', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号通州邮局', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (220, '202006232148171606', '20200623214817173339', '张三', '13800138045', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138045', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号通州邮政局', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (221, '202006232148171606', '20200623214817116146', '张三', '13800138046', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138046', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号邮局', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (222, '202006232148171606', '20200623214817171663', '张三', '13800138047', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138047', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号中国邮政通州分公司', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (223, '202006232148171606', '20200623214817103732', '张三', '13800138048', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138048', NULL, '北京市', NULL, NULL, '北京市通州区运河西大街174号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (224, '202006232148171606', '20200623214817110486', '张三', '13800138049', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138049', NULL, '北京市', NULL, NULL, '北京市海淀区中国邮政集团公司北京市海淀区分公司，海淀区综合办公室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (225, '202006232148171606', '20200623214817128289', '张三', '13800138050', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138050', NULL, '北京市', NULL, NULL, '北京市海淀区北太平庄街道知春路太月园小区4号楼407', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (226, '202006232148171606', '20200623214817185487', '张三', '13800138051', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138051', NULL, '北京市', NULL, NULL, '北京市顺义区钱粮北路3号院 华玺瀚楟3-4-1302', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (227, '202006232148171606', '20200623214817116969', '张三', '13800138052', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138052', NULL, '北京市', NULL, NULL, '北京市朝阳区平房镇雅成一里10号楼3单元202室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (228, '202006232148171606', '20200623214817173725', '张三', '13800138053', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138053', NULL, '北京市', NULL, NULL, '北京市房山区良乡镇良乡西路11号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (229, '202006232148171606', '20200623214817185006', '张三', '13800138054', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138054', NULL, '北京市', NULL, NULL, '北京市房山区良乡镇良乡西路11号邮政局', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (230, '202006232148171606', '20200623214817185771', '张三', '13800138055', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138055', NULL, '北京市', NULL, NULL, '北京市东城区美术馆后街23号北京市中医医院门诊西药房', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (231, '202006232148171606', '20200623214817157619', '张三', '13800138056', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138056', NULL, '北京市', NULL, NULL, '北京市通州区玉带河西街30号二中家属楼5单元532', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (232, '202006232148171606', '20200623214817121320', '张三', '13800138057', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138057', NULL, '北京市', NULL, NULL, '北京市通州区张家湾镇上店村495号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (233, '202006232148171606', '20200623214817125388', '张三', '13800138058', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138058', NULL, '北京市', NULL, NULL, '北京市通州区蓝山国际2号楼3单元801室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (234, '202006232148171606', '20200623214817122430', '张三', '13800138059', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138059', NULL, '北京市', NULL, NULL, '北京市东城区东单大华路1号北京医院', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (235, '202006232148171606', '20200623214817123735', '张三', '13800138060', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138060', NULL, '北京市', NULL, NULL, '北京市通州区梨园镇小稿村416号楼8单元881室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (236, '202006232148171606', '20200623214817117642', '张三', '13800138061', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138061', NULL, '北京市', NULL, NULL, '北京市通州区张家湾镇太玉园小区西区37号楼4单元一层', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (237, '202006232148171606', '20200623214817118116', '张三', '13800138062', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138062', NULL, '北京市', NULL, NULL, '北京市通州区宋庄镇首开·香溪郡5-1-201', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (238, '202006232148171606', '20200623214817150847', '张三', '13800138063', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138063', NULL, '北京市', NULL, NULL, '北京市朝阳区惠新西街33号院5号楼802', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (239, '202006232148171606', '20200623214817128187', '张三', '13800138064', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138064', NULL, '北京市', NULL, NULL, '北京市海淀区志新北里16号楼东楼1706', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (240, '202006232148171606', '20200623214817183547', '张三', '13800138065', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138065', NULL, '北京市', NULL, NULL, '北京市通州区中国邮政永乐店邮政支局(永乐大街30号)', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (241, '202006232148171606', '20200623214817186952', '张三', '13800138066', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138066', NULL, '北京市', NULL, NULL, '北京市大兴区西红门镇金荣园北院七天假日酒店（金旺来）', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (242, '202006232148171606', '20200623214817157721', '张三', '13800138067', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138067', NULL, '北京市', NULL, NULL, '北京市朝阳区劲松四区408号楼6门3号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (243, '202006232148171606', '20200623214817170124', '张三', '13800138068', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138068', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号通州区邮局综合办', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (244, '202006232148171606', '20200623214817169520', '张三', '13800138069', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138069', NULL, '北京市', NULL, NULL, '北京市朝阳区十八里店镇十里河闽龙广场闽龙茶城58号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (245, '202006232148171606', '20200623214817148195', '张三', '13800138070', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138070', NULL, '北京市', NULL, NULL, '北京市通州区梨园镇东里南区55号楼二单元301室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (246, '202006232148171606', '20200623214817116150', '张三', '13800138071', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138071', NULL, '北京市', NULL, NULL, '北京市房山区良乡西路11号 中国邮政(西路邮政支局)', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (247, '202006232148171606', '20200623214817189839', '张三', '13800138072', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138072', NULL, '北京市', NULL, NULL, '北京市东城区珠市口东大街20一5号肯德基', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (248, '202006232148171606', '20200623214817189528', '张三', '13800138073', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138073', NULL, '北京市', NULL, NULL, '北京市石景山区西井一区5栋5单元301', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (249, '202006232148171606', '20200623214817173071', '张三', '13800138074', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138074', NULL, '北京市', NULL, NULL, '北京市通州区西集镇国防路邮储银行西集支行', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (250, '202006232148171606', '20200623214817145949', '张三', '13800138075', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138075', NULL, '北京市', NULL, NULL, '北京市西城区南礼士路头条5号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (251, '202006232148171606', '20200623214817159871', '张三', '13800138076', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138076', NULL, '北京市', NULL, NULL, '北京市东城区前门街道前门东大街7号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (252, '202006232148171606', '20200623214817144533', '张三', '13800138077', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138077', NULL, '北京市', NULL, NULL, '北京市朝阳区中国邮政集团公司朝阳区分公司朝阳区综合办公室', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (253, '202006232148171606', '20200623214817132865', '张三', '13800138078', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138078', NULL, '北京市', NULL, NULL, '北京市通州区杨庄路世纪星城·长城国际(杨庄南里66号楼)底商世纪星城邮政所', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (254, '202006232148171606', '20200623214817120052', '张三', '13800138079', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138079', NULL, '北京市', NULL, NULL, '北京市石景山区八角街道石景山路52号邮政局', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (255, '202006232148171606', '20200623214817182213', '张三', '13800138080', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138080', NULL, '北京市', NULL, NULL, '北京市大兴区旧宫镇清和园小区7号楼10单元601', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (256, '202006232148171606', '20200623214817144837', '张三', '13800138081', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138081', NULL, '北京市', NULL, NULL, '北京市大兴区采育镇北京大兴九银村镇银行(采育支行)', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (257, '202006232148171606', '20200623214817113839', '张三', '13800138082', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138082', NULL, '北京市', NULL, NULL, '北京市丰台区西局北街104黔藏酒坊', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (258, '202006232148171606', '20200623214817100900', '张三', '13800138083', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138083', NULL, '北京市', NULL, NULL, '北京市东城区东四十条甲100号506', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (259, '202006232148171606', '20200623214817126054', '张三', '13800138084', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138084', NULL, '北京市', NULL, NULL, '北京市西城区广安门外街道马连道中新家园1区1号楼2门401房', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (260, '202006232148171606', '20200623214817117149', '张三', '13800138085', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138085', NULL, '北京市', NULL, NULL, '北京市丰台区方庄镇蒲芳路22号', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (261, '202006232148171606', '20200623214817113425', '张三', '13800138086', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138086', NULL, '北京市', NULL, NULL, '北京市丰台区卢沟桥乡丰仪家园小区西门小白楼', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, NULL, '2020-06-23 16:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_order_original_info` VALUES (262, '202006240019171724', '20200624001917142854', NULL, NULL, '010-京-0-姚家A125-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (263, '202006240019171724', '20200624001917180017', NULL, NULL, '010-京-0-新华T8-85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (264, '202006240019171724', '20200624001917113477', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (265, '202006240019171724', '20200624001917130545', NULL, NULL, '010-京-0-旧宫D163-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (266, '202006240019171724', '20200624001917174250', NULL, NULL, '010-京-0-翠屏T1-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (267, '202006240019171724', '20200624001917174146', NULL, NULL, '010-京-0-花市N62-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (268, '202006240019171724', '20200624001917169420', NULL, NULL, '010-京-0-张自N9-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (269, '202006240019171724', '20200624001917147082', NULL, NULL, '010-京-0-次渠T13-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (270, '202006240019171724', '20200624001917132475', NULL, NULL, '010-京-0-丰台X71-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (271, '202006240019171724', '20200624001917175188', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (272, '202006240019171724', '20200624001917121459', NULL, NULL, '010-京-0-东三C6-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (273, '202006240019171724', '20200624001917142834', NULL, NULL, '010-京-0-大峪J1-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (274, '202006240019171724', '20200624001917143143', NULL, NULL, '010-京-0-新顺S1-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (275, '202006240019171724', '20200624001917177211', NULL, NULL, '010-京-0-黄村D1-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (276, '202006240019171724', '20200624001917178732', NULL, NULL, '010-京-0-红军B112-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (277, '202006240019171724', '20200624001917131723', NULL, NULL, '010-京-0-台湖T6-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (278, '202006240019171724', '20200624001917176449', NULL, NULL, '010-京-0-新华T8-85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (279, '202006240019171724', '20200624001917100146', NULL, NULL, '010-京-0-科技C1-41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (280, '202006240019171724', '20200624001917101338', NULL, NULL, '010-京-0-科技C1-32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (281, '202006240019171724', '20200624001917144046', NULL, NULL, '010-京-0-学院B83-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (282, '202006240019171724', '20200624001917138072', NULL, NULL, '010-京-0-草桥N67-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (283, '202006240019171724', '20200624001917176823', NULL, NULL, '010-京-0-木樨N75-*', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (284, '202006240019171724', '20200624001917165916', NULL, NULL, '010-京-0-金宝N5-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (285, '202006240019171724', '20200624001917177641', NULL, NULL, '010-京-0-鲁谷X40-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (286, '202006240019171724', '20200624001917155062', NULL, NULL, '010-京-0-百子A124-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (287, '202006240019171724', '20200624001917178374', NULL, NULL, '010-京-0-新华T8-85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (288, '202006240019171724', '20200624001917158848', NULL, NULL, '010-京-0-马连N55-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (289, '202006240019171724', '20200624001917141351', NULL, NULL, '010-京-0-苏家B194-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (290, '202006240019171724', '20200624001917179807', NULL, NULL, '010-京-0-西红D162-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (291, '202006240019171724', '20200624001917164385', NULL, NULL, '010-京-0-翠屏T1-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (292, '202006240019171724', '20200624001917117545', NULL, NULL, '010-京-0-天桥N50-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (293, '202006240019171724', '20200624001917119258', NULL, NULL, '010-京-0-木樨N75-*', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (294, '202006240019171724', '20200624001917151721', NULL, NULL, '010-京-0-鲁谷X40-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (295, '202006240019171724', '20200624001917157897', NULL, NULL, '010-京-0-成寿N78-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (296, '202006240019171724', '20200624001917148043', NULL, NULL, '010-京-0-上地B92-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (297, '202006240019171724', '20200624001917111223', NULL, NULL, '010-京-0-劲松A21-009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (298, '202006240019171724', '20200624001917103738', NULL, NULL, '010-京-0-学院B83-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (299, '202006240019171724', '20200624001917109595', NULL, NULL, '010-京-0-马连N55-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (300, '202006240019171724', '20200624001917160979', NULL, NULL, '010-京-0-王府N6-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (301, '202006240019171724', '20200624001917105965', NULL, NULL, '010-京-0-新古X43-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (302, '202006240019171724', '20200624001917123053', NULL, NULL, '010-京-0-开阳N69-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (303, '202006240019171724', '20200624001917187482', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (304, '202006240019171724', '20200624001917186852', NULL, NULL, '010-京-0-金鹰T2-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (305, '202006240019171724', '20200624001917141060', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (306, '202006240019171724', '20200624001917101263', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (307, '202006240019171724', '20200624001917129156', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (308, '202006240019171724', '20200624001917154252', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (309, '202006240019171724', '20200624001917120494', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (310, '202006240019171724', '20200624001917170262', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (311, '202006240019171724', '20200624001917175716', NULL, NULL, '010-京-0-苏州X89-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (312, '202006240019171724', '20200624001917121253', NULL, NULL, '010-京-0-北太B88-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (313, '202006240019171724', '20200624001917126461', NULL, NULL, '010-京-0-新顺S1-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (314, '202006240019171724', '20200624001917116432', NULL, NULL, '010-京-0-青年A123-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (315, '202006240019171724', '20200624001917150020', NULL, NULL, '010-京-0-西路F5-8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (316, '202006240019171724', '20200624001917111031', NULL, NULL, '010-京-0-西路F5-8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (317, '202006240019171724', '20200624001917112929', NULL, NULL, '010-京-0-东四N10-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (318, '202006240019171724', '20200624001917109017', NULL, NULL, '010-京-0-新华T8-85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (319, '202006240019171724', '20200624001917104637', NULL, NULL, '010-京-0-张家T3-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (320, '202006240019171724', '20200624001917114138', NULL, NULL, '010-京-0-翠屏T1-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (321, '202006240019171724', '20200624001917137067', NULL, NULL, '010-京-0-金宝N5-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (322, '202006240019171724', '20200624001917155639', NULL, NULL, '010-京-0-梨园T7-*', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (323, '202006240019171724', '20200624001917144269', NULL, NULL, '010-京-0-张家T3-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (324, '202006240019171724', '20200624001917171530', NULL, NULL, '010-京-0-宋庄T11-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (325, '202006240019171724', '20200624001917111300', NULL, NULL, '010-京-0-小关B29-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (326, '202006240019171724', '20200624001917145344', NULL, NULL, '010-京-0-二里B87-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (327, '202006240019171724', '20200624001917120563', NULL, NULL, '010-京-0-永乐T14-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (328, '202006240019171724', '20200624001917141827', NULL, NULL, '010-京-0-西红D162-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (329, '202006240019171724', '20200624001917167059', NULL, NULL, '010-京-0-劲松A21-008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (330, '202006240019171724', '20200624001917116891', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (331, '202006240019171724', '20200624001917128425', NULL, NULL, '010-京-0-翠城A122-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (332, '202006240019171724', '20200624001917109276', NULL, NULL, '010-京-0-翠屏T1-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (333, '202006240019171724', '20200624001917144479', NULL, NULL, '010-京-0-西路F5-8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (334, '202006240019171724', '20200624001917125444', NULL, NULL, '010-京-0-天桥N50-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (335, '202006240019171724', '20200624001917169119', NULL, NULL, '010-京-0-金顶X41-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (336, '202006240019171724', '20200624001917173760', NULL, NULL, '010-京-0-郎府T12-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (337, '202006240019171724', '20200624001917187921', NULL, NULL, '010-京-0-三里X45-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (338, '202006240019171724', '20200624001917132104', NULL, NULL, '010-京-0-王府N6-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (339, '202006240019171724', '20200624001917135536', NULL, NULL, '010-京-0-科园B105-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (340, '202006240019171724', '20200624001917139607', NULL, NULL, '010-京-0-翠屏T1-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (341, '202006240019171724', '20200624001917172980', NULL, NULL, '010-京-0-新古X43-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (342, '202006240019171724', '20200624001917157088', NULL, NULL, '010-京-0-旧宫D163-38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (343, '202006240019171724', '20200624001917135859', NULL, NULL, '010-京-0-6-大兴-45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (344, '202006240019171724', '20200624001917115779', NULL, NULL, '010-京-0-三路X161-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (345, '202006240019171724', '20200624001917146588', NULL, NULL, '010-京-0-北新B7-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (346, '202006240019171724', '20200624001917169787', NULL, NULL, '010-京-0-马连N55-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (347, '202006240019171724', '20200624001917108737', NULL, NULL, '010-京-0-成寿N78-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (348, '202006240019171724', '20200624001917122838', NULL, NULL, '010-京-0-三路X161-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_order_original_info` VALUES (349, '202006241155591473', '20200624115559103684', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市丰台区方庄芳古园二区13号楼308室', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (350, '202006241155591473', '20200624115559124381', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市朝阳区武圣西里8号楼5门401', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (351, '202006241155591473', '20200624115559135313', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市海淀区苏家坨凤仪佳苑一里南门', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (352, '202006241155591473', '20200624115559178022', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市大兴区瀛海镇永旭嘉园小区5-2-1401', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (353, '202006241155591473', '20200624115559143731', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市大兴区天河西路小区 2-1-506', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (354, '202006241155591473', '20200624115559174933', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市大兴区青云店镇大东园小区23号楼2单元201', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (355, '202006241155591473', '20200624115559130440', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市海淀区芙蓉里小区8号楼503', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (356, '202006241155591473', '20200624115559131786', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市通州区东营前街11号楼341', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (357, '202006241155591473', '20200624115559109663', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市房山区燕山富燕一区10-2-603', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');
INSERT INTO `tb_order_original_info` VALUES (358, '202006241155591473', '20200624115559118948', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市朝阳区夏都盈座1号楼C单元1006', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, NULL, '2020-06-24 03:56:05', '2020-06-24 03:56:00');

-- ----------------------------
-- Table structure for tb_price_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_price_info`;
CREATE TABLE `tb_price_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `menu` int(11) NULL DEFAULT NULL COMMENT '菜单: 0:根据数据设备查询 1:匹配查询，2:地址查询，3:面单打印，4:号码呼转',
  `source` int(11) NULL DEFAULT NULL COMMENT '数据来源: 0:根据菜单查询 :1WEB，2APP，3接口',
  `price` double(11, 2) NULL DEFAULT NULL COMMENT '单价:元',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_price_info
-- ----------------------------
INSERT INTO `tb_price_info` VALUES (1, 1, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (2, 2, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (3, 3, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (4, 4, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (5, 5, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (6, 6, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (7, 7, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (8, 8, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (9, 9, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (10, 10, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (11, 11, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (12, 12, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (13, 13, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (14, 14, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (15, 15, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (16, 16, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (17, 17, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (18, 18, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (19, 19, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (20, 20, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (21, 21, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (22, 22, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (23, 23, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (24, 24, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (25, 25, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (26, 26, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (27, 27, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (28, 28, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (29, 29, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (30, 30, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (31, 31, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (32, 32, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (33, 33, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (34, 34, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (35, 35, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (36, 36, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (37, 37, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (38, 38, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (39, 39, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (40, 40, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (41, 41, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (42, 42, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (43, 43, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (44, 44, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (45, 45, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (46, 46, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (47, 47, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (48, 48, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (49, 1, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (50, 2, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (51, 3, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (52, 4, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (53, 5, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (54, 6, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (55, 7, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (56, 8, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (57, 9, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (58, 10, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (59, 11, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (60, 12, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (61, 13, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (62, 14, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (63, 15, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (64, 16, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (65, 17, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (66, 18, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (67, 19, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (68, 20, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (69, 21, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (70, 22, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (71, 23, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (72, 24, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (73, 25, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (74, 26, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (75, 27, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (76, 28, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (77, 29, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (78, 30, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (79, 31, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (80, 32, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (81, 33, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (82, 34, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (83, 35, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (84, 36, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (85, 37, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (86, 38, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (87, 39, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (88, 40, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (89, 41, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (90, 42, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (91, 43, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (92, 44, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (93, 45, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (94, 46, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (95, 47, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (96, 48, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (97, 1, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (98, 2, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (99, 3, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (100, 4, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (101, 5, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (102, 6, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (103, 7, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (104, 8, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (105, 9, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (106, 10, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (107, 11, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (108, 12, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (109, 13, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (110, 14, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (111, 15, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (112, 16, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (113, 17, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (114, 18, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (115, 19, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (116, 20, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (117, 21, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (118, 22, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (119, 23, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (120, 24, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (121, 25, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (122, 26, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (123, 27, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (124, 28, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (125, 29, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (126, 30, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (127, 31, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (128, 32, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (129, 33, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (130, 34, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (131, 35, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (132, 36, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (133, 37, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (134, 38, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (135, 39, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (136, 40, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (137, 41, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (138, 42, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (139, 43, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (140, 44, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (141, 45, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (142, 46, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (143, 47, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (144, 48, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (145, 1, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (146, 2, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (147, 3, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (148, 4, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (149, 5, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (150, 6, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (151, 7, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (152, 8, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (153, 9, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (154, 10, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (155, 11, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (156, 12, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (157, 13, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (158, 14, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (159, 15, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (160, 16, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (161, 17, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (162, 18, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (163, 19, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (164, 20, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (165, 21, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (166, 22, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (167, 23, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (168, 24, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (169, 25, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (170, 26, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (171, 27, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (172, 28, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (173, 29, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (174, 30, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (175, 31, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (176, 32, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (177, 33, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (178, 34, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (179, 35, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (180, 36, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (181, 37, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (182, 38, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (183, 39, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (184, 40, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (185, 41, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (186, 42, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (187, 43, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (188, 44, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (189, 45, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (190, 46, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (191, 47, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (192, 48, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (193, 49, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (194, 49, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (195, 49, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (196, 49, 2, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (197, 50, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (198, 50, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (199, 50, 2, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (200, 50, 2, 2, 0.10);

-- ----------------------------
-- Table structure for tb_recv_post_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_recv_post_info`;
CREATE TABLE `tb_recv_post_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `traceNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postDate` datetime(0) NULL DEFAULT NULL,
  `receivePlace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bizProductName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bizProductNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `baseProductName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `service` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postagePaid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postageStandard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `insuranceAmount` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `insurancePremiumAmo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realWeight` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remarksenderNo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `senderType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sender_tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverLinker` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverMobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receiverAddr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postalcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inner_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `returnn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `optime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_sorting_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_sorting_info`;
CREATE TABLE `tb_sorting_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `org_num` int(11) NULL DEFAULT NULL COMMENT '机构号',
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `sorting_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分拣码第三级',
  `distribu_center` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集散中心',
  `dlv_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投递部',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区',
  `area_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `marking` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `receive1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `receive2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sorting_info
-- ----------------------------
INSERT INTO `tb_sorting_info` VALUES (1, 10220013, '昌平区政府街营业部', '0-昌平', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (2, 10260004, '大兴区兴丰营业部', '0-大兴', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (3, 10248804, '房山区良乡西路营业部', '西路F5', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (4, 10240204, '房山区交道营业部', '交道F6', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (5, 10070007, '东城区安定门营业部', '安定B11', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (6, 10010805, '朝阳区安贞营业部', '安贞B129', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (7, 10002223, '朝阳区百子湾营业部', '百子A124', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (8, 10010026, '海淀区宝盛里营业部', '宝盛B192', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (9, 10080003, '海淀区八宝庄营业部', '八宝X142', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (10, 10002180, '海淀区北太平庄营业部', '北太B88', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (11, 10001208, '朝阳区北苑营业部', '北苑B12', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (12, 10000713, '东城区北新桥营业部', '北新B7', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (13, 10012503, '朝阳区酒仙桥营业部', '酒仙A16', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (14, 10001310, '东城区和平里营业部', '和平B13', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (15, 10070005, '朝阳区甜水园营业部', '甜水A26', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (16, 10002733, '朝阳区工体营业部', '工体A27', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (17, 10000616, '东城区金宝街营业部', '金宝N5', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (18, 10000618, '东城区王府井营业部', '王府N6', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (19, 10001008, '西城区张自忠路营业部', '张自N9', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (20, 10003122, '西城区六部口营业部', '六部N31', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (21, 10003218, '西城区西单营业部', '西单X32', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (22, 10003508, '西城区新街口营业部', '新街X35', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (23, 10003814, '海淀区会城门营业部', '会城X38', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (24, 10003812, '西城区三里河营业部', '三里X45', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (25, 10005113, '西城区天桥营业部', '天桥N50', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (26, 10008338, '海淀区学院路营业部', '学院B83', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (27, 10008412, '海淀区清华营业部', '清华B84', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (28, 10000360, '朝阳区垡头营业部', '垡头A23', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (29, 10000435, '朝阳区管庄营业部', '定福A324', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (30, 10000436, '朝阳区红军营营业部', '红军B112', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (31, 10000358, '朝阳区向军里营业部', '向军A220', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (32, 10010034, '大兴区博大街营业部', '博大D9', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (33, 10010035, '大兴区南海家园营业部', '南海D8', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (34, 10000322, '丰台区和义营业部', '东高N76', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (35, 10008337, '海淀区二里庄营业部', '二里B87', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (36, 10240019, '房山区长阳营业部', '长阳F3', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (37, 10000438, '丰台区角门营业部', '角门N68', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (38, 10000439, '丰台区开阳里营业部', '开阳N69', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (39, 10000437, '丰台区丰台营业部', '丰台X71', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (40, 10000441, '丰台区长辛店营业部', '长辛X72', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (41, 10000433, '东城区光明楼营业部', '光明N61', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (42, 10007014, '丰台区花乡营业部', '花乡X160', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (43, 10062106, '朝阳区首都机场邮政支局投递部', '机场621', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (44, 10060003, '朝阳区建国门邮政支局投递部', '建国600', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (45, 10000103, '东城区建内大街营业部', '建内1', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (46, 10000616, '东城区金宝街营业部', '金宝N5', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (47, 10110018, '通州区金鹰营业部', '金鹰T2', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (48, 10080004, '海淀区田村营业部', '田村X143', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (49, 10260039, '大兴区兴华营业部', '兴华D5', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (50, 10050001, '西城区牛街营业部', '牛街N53', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (51, 10070006, '朝阳区将台路营业部', '将台A15', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (52, 10220036, '昌平区西沙屯营业部', '西沙C5', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (53, 10007514, '丰台区石榴庄营业部', '石榴N79', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (54, 10001208, '朝阳区北苑营业部', '北苑B12', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (55, 10005408, '丰台区草桥欣园营业部', '草桥N67', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (56, 10050002, '丰台区程庄营业部', '程庄X171', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (57, 10002314, '朝阳区翠城营业部', '翠城A122', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (58, 10001805, '朝阳区东坝营业部', '东坝A18', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (59, 10001010, '东城区东四营业部', '东四N10', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (60, 10242503, '房山区房山营业部', '房山F1', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (61, 10006213, '东城区花市营业部', '花市N62', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (62, 10002115, '朝阳区劲松营业部', '劲松A21', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (63, 10007614, '大兴区旧宫营业部', '旧宫D163', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (64, 10004909, '石景山区鲁谷营业部', '鲁谷X40', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (65, 10110015, '通州区潞城营业部', '潞城T5', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (66, 10230805, '门头沟区门头沟营业部', '门沟J2', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (67, 10012302, '朝阳区青年路营业部', '青年A123', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (68, 10002412, '朝阳区三间房营业部', '三间A24', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (69, 10040003, '海淀区上地营业部', '上地B92', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (70, 10009708, '海淀区世纪城营业部', '世纪X97', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (71, 10019103, '海淀区塔院营业部', '塔院B191', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (72, 10112602, '通州区翠屏南里营业部', '翠屏T1', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (73, 10111304, '通州区张家湾营业部', '张家T3', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (74, 10002917, '朝阳区小关营业部', '小关B29', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (75, 10010127, '朝阳区小营营业部', '小营B101', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (76, 10219901, '延庆区延庆营业部', '延庆Y1', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (77, 10260902, '大兴区黄村营业部', '黄村D1', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (78, 10009411, '海淀区永丰营业部', '永丰B294', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (79, 10009612, '海淀区育新花园营业部', '育新B96', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (80, 10007013, '丰台区朱家坟营业部', '朱家X74', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (81, 10000440, '丰台区科学城营业部', '科城X70', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (82, 10010504, '朝阳区科学园营业部', '科园B105', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (83, 10062110, '朝阳区来广营营业部', '来广B106', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (84, 10110204, '通州区马驹桥营业部', '马驹T4', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (85, 10230030, '门头沟区大峪营业部', '大峪J1', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (86, 10000352, '丰台区木樨园营业部', '木樨N75', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (87, 10000350, '海淀区农大南路营业部', '农大B193', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (88, 10000099, '朝阳区十里河营业部', '十里A221', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (89, 10000443, '石景山区新古城营业部', '新古X43', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (90, 10012103, '朝阳区双桥营业部', '双桥A121', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (91, 10131806, '顺义区后沙峪营业部', '后沙S4', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (92, 10131204, '顺义区天竺营业部', '天竺S2', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (93, 10130030, '顺义区新顺营业部', '新顺S1', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (94, 10130070, '顺义区李桥营业部', '李桥S7', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (95, 10006807, '丰台区四路通营业部', '四路N77', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (96, 10010022, '海淀区苏家坨营业部', '苏家B194', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (97, 10016403, '丰台区成寿寺营业部', '成寿N78', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (98, 10220910, '昌平区东三旗营业部', '东三C6', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (99, 10004422, '西城区动物园营业部', '动物X44', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (100, 10002035, '朝阳区呼家楼营业部', '呼家A20', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (101, 10010222, '朝阳区花家地营业部', '花家A102', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (102, 10004114, '石景山区金顶街营业部', '金顶X41', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (103, 10220015, '昌平区科技园营业部', '科技C1', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (104, 10005527, '西城区马连道营业部', '马连N55', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (105, 10007111, '丰台区三路居营业部', '三路X161', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (106, 10008614, '海淀区双榆树营业部', '双榆B86', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (107, 10016203, '大兴区西红门营业部', '西红D162', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (108, 10002815, '朝阳区西坝河营业部', '西坝A28', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (109, 10008910, '海淀区苏州街营业部', '苏州X89', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (110, 10002522, '朝阳区姚家园营业部', '姚家A125', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (111, 10000088, '朝阳区永安里营业部', '永安A22', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (112, 10008014, '海淀区中关村营业部', '中关B80', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (113, 10004804, '海淀区紫竹院营业部', '紫竹X48', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (114, 10221813, '昌平区天通苑营业部', '天通C4', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (115, 10110058, '通州区次渠营业部', '次渠T13', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (116, 10110059, '通州区胡各庄营业部', '胡各T10', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (117, 10110060, '通州区郎府营业部', '郎府T12', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (118, 10110061, '通州区梨园营业部', '梨园T7', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (119, 10110062, '通州区宋庄营业部', '宋庄T11', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (120, 10110063, '通州区台湖营业部', '台湖T6', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (121, 10110064, '通州区新华营业部', '新华T8', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (122, 10110065, '通州区永乐店营业部', '永乐T14', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (123, 10110066, '通州区运河营业部', '运河T9', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (124, 10000348, '海淀区万寿路营业部', '万寿X36', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (125, 10040001, '海淀区文慧园营业部', '文慧B82', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (126, 10010036, '丰台区五里店营业部', '五里X166', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (127, 10000444, '西城区西四营业部', '西四X34', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (128, 10260018, '大兴区兴政营业部', '兴政D4', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (129, 10130043, '顺义区杨镇营业部', '杨镇S5', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (130, 10000344, '海淀区颐和园营业部', '颐和B91', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (131, 10000092, '大兴区瀛海营业部', '瀛海D7', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (132, 10003915, '海淀区永定路营业部', '永定X39', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (133, 10240018, '房山区迎风营业部', '迎风F4', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (134, 10220609, '昌平区沙河营业部', '沙河C3', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (135, 10220814, '昌平区回龙观营业部', '回龙C2', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (136, 10008519, '海淀区清河营业部', '清河B85', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (137, 10010032, '朝阳区大郊亭营业部', '大郊A224', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (138, 10002240, '朝阳区万达广场营业部', '万达A222', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (139, 10000434, '朝阳区慈云寺营业部', '慈云A25', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (140, 10130069, '顺义区南法信营业部', '南法S6', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (141, 10010031, '朝阳区石佛营营业部', '石佛A223', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (142, 10000357, '朝阳区双合营业部', '双合A323', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (143, 10261204, '大兴区芦城营业部', '芦城D2', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (144, 10017607, '大兴区亦庄营业部', '亦庄D176', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (145, 10262706, '大兴区新媒体营业部', '新媒D3', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (146, 10007015, '丰台区芳菲路营业部', '芳菲X170', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (147, 10008115, '海淀区魏公村营业部', '魏公X81', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (148, 10008336, '海淀区保福寺营业部', '保福B190', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (149, 10159901, '密云区密云营业部', '密云M1', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (150, 10010024, '海淀区四季青营业部', '四季X195', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (151, 10000346, '海淀区西北旺营业部', '西北B94', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (152, 10009508, '海淀区温泉营业部', '温泉B95', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (153, 10009308, '海淀区香山营业部', '香山X93', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (154, 10000442, '石景山区高井营业部', '高井X42', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (155, 10130032, '顺义区马坡营业部', '马坡S3', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (156, 10210501, '延庆县分公司大井庄邮政所', '京延5', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (157, 10003721, '西城区阜外营业部', '阜外X37', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (158, 10129901, '平谷区平谷营业部', '平谷P1', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (159, 10140301, '怀柔区九渡河邮政所', '京怀九渡', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (160, 10141201, '怀柔区长哨营邮政所', '京怀长哨', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (161, 10141401, '怀柔区喇叭沟门邮政所', '京怀喇叭', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (162, 10240104, '房山区南关营业部', '南关F2', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (163, NULL, NULL, '怀柔H1', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_sorting_info_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tb_sorting_info_copy1`;
CREATE TABLE `tb_sorting_info_copy1`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `org_num` int(11) NULL DEFAULT NULL COMMENT '机构号',
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `sorting_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分拣码第三级',
  `distribu_center` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '集散中心',
  `dlv_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投递部',
  `area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分区',
  `area_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `marking` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标识',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `receive1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留字段',
  `receive2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 383 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sorting_info_copy1
-- ----------------------------
INSERT INTO `tb_sorting_info_copy1` VALUES (1, 10002035, '朝阳北路分公司呼家楼营投部', '速呼家楼', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (2, 10002240, '大柳树分公司万达广场营投部', '京速万达', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (3, 10002522, '朝阳北路分公司姚家园营投部', '速姚家园', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (4, 10002733, '工体', 'A27', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (5, 10070005, '甜水园', 'A26', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (6, 10060003, '建国门投递部', '建国600', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (7, 10000358, '朝阳区寄递事业部向军里营业部', '朝阳向军', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (8, 10000434, '朝阳区寄递事业部慈云寺营业部', '朝阳慈云', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (9, 10002223, '大柳树分公司百子湾营运部', '百子湾速', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (10, 10012103, '大柳树区域双桥揽投部', '双桥揽投', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (11, 10010032, '朝阳区寄递事业部大郊亭营业部', '朝阳郊亭', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (12, 10002115, '大柳树分公司劲松营投部', '京速劲松', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (13, 10002314, '物流公司大柳树分公司翠城揽投部', '京速翠城', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (14, 10000088, '大柳树区分公司永安里揽投部', '速永安里', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (15, 10000099, '十里河揽投部', '十里河', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (16, 10000360, '朝阳区寄递事业部垡头营业部', '朝阳垡头', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (17, 10260039, '朝阳区分公司垡头邮政支局大宗组', '京23大', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (18, 10010222, '花家地营投部', '速花家地', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (19, 10070006, '望京分公司望京营运部', '京700望', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (20, 10012503, '农展', 'A125', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (21, 10002815, '望京分公司香河园营投部', '速香河园', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (22, 10002412, '大柳树分公司三间房营运部', '京速三间', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (23, 10012302, '朝阳北路分公司青年路营投部', '京速青年', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (24, 10000435, '朝阳区寄递事业部管庄营业部', '朝阳管庄', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (25, 10010031, '朝阳区寄递事业部石佛营营业部', '朝阳石佛', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (26, 10001805, '望京分公司东坝营投部', '京速东坝', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (27, 10130030, '顺义区速递分公司新顺分部', '顺速新顺', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (28, 10130032, '顺义分公司马坡拦投部', '京速马坡', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (29, 10131204, '顺义区速递分公司天竺分部', '顺速天竺', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (30, 10131806, '顺义区速递分公司空港营投部', '顺速空港', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (31, 10062106, '首都机场投递部', '机场621', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (32, 10130043, '顺义区寄递事业部杨镇揽投部', '杨镇营投', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (33, 10130069, '顺义区寄递事业部南法信营业部', '顺义南法', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (34, 10130070, '顺义区寄递事业部李桥营业部', '顺义李桥', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (35, 10111304, '通州分公司张家湾营投部', '京速通张', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (36, 10110204, '通州马驹桥揽投部', '马驹桥', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (37, 10000357, '朝阳区寄递事业部双合营业部', '朝阳双合', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (38, 10110063, '通州区寄递事业部台湖营业部', '通州台湖', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (39, 10110058, '通州区寄递事业部次渠营业部', '通州次渠', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (40, 10110065, '通州区寄递事业部永乐店营业部', '通州永乐', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (41, 10110060, '通州区寄递事业部郎府营业部', '通州郎府', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (42, 10110018, '通州分公司金鹰揽投部', '金鹰揽投', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (43, 10112602, '通州分公司翠屏南里营投部', '京速通翠', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (44, 10110015, '通州分公司潞城揽投部', '京速潞城', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (45, 10110064, '通州区寄递事业部新华营业部', '通州新华', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (46, 10110061, '通州区寄递事业部梨园营业部', '通州梨园', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (47, 10110066, '通州区寄递事业部运河营业部', '通州运河', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (48, 10110059, '通州区寄递事业部胡各庄营业部', '通州胡各', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (49, 10110062, '通州区寄递事业部宋庄营业部', '通州宋庄', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (50, 10000713, '安定门分公司北新桥营投部', '速北新桥', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (51, 10001208, '安定门分公司北苑营投部', '京速北苑', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (52, 10002917, '安定门分公司小关营运部', '京速小关', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (53, 10010127, '安定门分公司小营营投部', '京速小营', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (54, 10070007, '安定门', 'A11', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (55, 10001310, '和平里', 'A13', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (56, 10062110, '望京区域来广营揽投部', '来广营', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (57, 10010504, '安定门区域科学园', '科学园', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (58, 10010805, '朝阳区寄递事业部安贞营业部', '安贞揽投', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (59, 10000436, '朝阳区寄递事业部红军营营业部', '朝阳红军', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (60, 10008519, '上地分公司清河营投部', '京速清河', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (61, 10009612, '上地分公司育新花园营投部', '京速育新', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (62, 10040003, '上地分公司上地营运部', '京速上地', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (63, 10010026, '海淀区寄递事业部宝盛里营业部', '宝盛里', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (64, 10000350, '海淀区寄递事业部农大南路营业部', '农大南路', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (65, 10220015, '昌平区速递分公司科技园营投部', '速科技园', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (66, 10220609, '昌平区速递分公司沙河分部', '昌速沙河', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (67, 10220814, '昌平区寄递事业部回龙观营业部', '昌速旗舰', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (68, 10220910, '昌平区速递分公司东三旗分部', '速东三旗', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (69, 10220013, '政府街邮政支局投递组', '0-昌平', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (70, 10221813, '上地区域天通苑揽投部', '天通苑', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (71, 10220036, '昌平区寄递事业部西沙屯营业部', '京昌西沙', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (72, 10009411, '上帝分公司永丰营投部', '京速永丰', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (73, 10009508, '上地区域温泉揽投部', '温泉营投', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (74, 10000346, '海淀区寄递事业部西北旺营业部', '西北旺', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (75, 10010022, '海淀区寄递事业部苏家坨营业部', '苏家坨', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (76, 10002180, '北太平庄营投部', '京速北太', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (77, 10008014, '中关村分公司中关村营运部', '速中关村', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (78, 10008336, '海淀区寄递事业部保福寺营业部', '京速大运', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (79, 10008614, '中关村分公司双榆树营投部', '速双榆树', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (80, 10019103, '牡丹园分公司塔院营投部', '京速塔院', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (81, 10008338, '学院路', 'D83', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (82, 10008412, '清华', 'D84', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (83, 10008337, '海淀区寄递事业部二里庄营业部', '二里庄', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (84, 10040001, '海淀区寄递事业部文慧园营业部', '文慧园营', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (85, 10000344, '海淀区寄递事业部颐和园营业部', '颐和园', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (86, 10000433, '东城区寄递事业部光明楼营业部', '光明楼营', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (87, 10000438, '丰台区寄递事业部角门营业部', '丰台角门', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (88, 10000439, '丰台区寄递事业部开阳里营业部', '丰台开阳', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (89, 10005408, '丽泽桥分公司草桥欣园营运部', '京速草桥', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (90, 10005527, '丽泽桥分公司马连道营投部', '速马连道', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (91, 10006213, '永安路分公司花市营投部', '京速花市', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (92, 10050001, '永安路分公司牛街营运部', '京500牛', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (93, 10003122, '六部口', 'B31', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (94, 10005113, '天桥', 'C50', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (95, 10006807, '永安路区域四路通', '四路通营', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (96, 10001010, '物流公司金宝街分公司东四揽投部', '京速东四', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (97, 10001008, '张自忠路', 'A9', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (98, 10000616, '金宝街', 'A5', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (99, 10000618, '王府井', 'A6', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (100, 10010034, '大兴区寄递事业部博大街营业部', '大兴博大', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (101, 10010035, '大兴区寄递事业部南海家园营业部', '大兴南海', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (102, 10000352, '丰台区寄递事业部木樨园营业部', '木樨园', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (103, 10007514, '大红门分公司海慧寺营运部', '京海彗速', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (104, 10007614, '海慧寺分公司旧宫营投部', '京速旧宫', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (105, 10016203, '海慧寺分公司西红门营投部', '速西红门', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (106, 10016403, '海慧寺分公司成寿寺营投部', '速成寿寺', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (107, 10017607, '亦庄分公司亦庄营运部', '亦庄速分', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (108, 10000322, '东高地营业部', '东高地营', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (109, 10000092, '速物海慧寺区域瀛海', '瀛海', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (110, 10260902, '大兴分公司医药基地营投部', '京速医药', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (111, 10262706, '大兴分公司大兴揽投部', '京速大兴', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (112, 10260004, '兴丰邮政支局投递组', '0-大兴', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (113, 10261204, '芦城', 'JD2', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (114, 10260018, '速物大兴兴政', '兴政', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (115, 10001702, '西城区中南海邮政支局中南海投递部', '中南海17', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (116, 10004114, '万寿路分公司金顶街营投部', '速金顶街', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (117, 10009308, '世纪城分公司香山营投部', '京速香山', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (118, 10080004, '万寿路分公司田村营运部', '京143投', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (119, 10004909, '万寿路分公司鲁谷营投部', '京速鲁谷', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (120, 10230805, '门头沟分公司门头沟揽投部', '京速门沟', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (121, 10003915, '海淀区寄递事业部永定路营业部', '永定路营', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (122, 10010024, '海淀区寄递事业部四季青营业部', '四季青', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (123, 10230030, '门头沟区寄递事业部大峪营业部', '门头大峪', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (124, 10000442, '石景山区寄递事业部高井营业部', '石景高井', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (125, 10000443, '石景山区寄递事业部新古城营业部', '石景新古', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (126, 10007015, '总部基地分公司芳菲路营投部', '京速芳菲', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (127, 10050002, '万丰路分公司西局欣园营运部', '京速程庄', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (128, 10007111, '总部基地分公司三路居营投部', '速三路居', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (129, 10007014, '永安路区域花乡揽投部', '花乡市场', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (130, 10000440, '丰台区寄递事业部科学城营业部', '科学城营', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (131, 10000437, '丰台区寄递事业部丰台营业部', '丰台营业', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (132, 10010036, '丰台区寄递事业部五里店营业部', '五里店营', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (133, 10004422, '阜成门分公司动物园营投部', '速动物园', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (134, 10003812, '三里河', 'B45', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (135, 10003508, '新街口', 'B34', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (136, 10003218, '西直门', 'B32', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (137, 10003814, '北蜂窝', 'B38', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (138, 10003721, '阜外', 'B37', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (139, 10000444, '西城区寄递事业部西四营业部', '西四营业', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (140, 10007013, '万丰路分公司云岗营投部', '京速云岗', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (141, 10240104, '房山分公司良乡营投部', '京速良乡', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (142, 10242503, '房山分公司房山揽投部', '京速房山', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (143, 10240204, '交道邮政支局投递组', '2-交道', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (144, 10248804, '良乡西路邮政支局投递组', '0-良西', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (145, 10240019, '房山区寄递事业部长阳营业部', '房山长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (146, 10240018, '房山区寄递事业部迎风营业部', '房山迎风', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (147, 10000441, '丰台区寄递事业部长辛店营业部', '丰台长辛', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (148, 10004804, '万寿路分公司紫竹院营投部', '速紫竹院', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (149, 10008115, '世纪城分公司魏公村营投部', '速魏公村', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (150, 10009708, '世纪城分公司世纪城营运部', '京速世分', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (151, 10080003, '万寿路分公司八宝庄营运部', '京800八', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (152, 10008910, '海淀区寄递事业部苏州街营业部', '速新起点', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (153, 10000348, '海淀区寄递事业部万寿路营业部', '万寿路', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (154, 10149902, '怀柔分公司怀柔揽投部', '京速怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (155, 10159901, '密云分公司密云揽投部', '京速密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (156, 10129901, '平谷分公司平谷揽投部', '京速平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (157, 10219901, '延庆分公司延庆揽投部', '京速延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (158, 10002707, '三源里投递部', '三源里27', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (159, 10112501, '富河园邮政所', '25-富河园', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (160, 10002207, '双井投递部', '双井22', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (161, 10002807, '香河园投递部', '香河园27', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (162, 10002109, '农光里投递部', '农光里21', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (163, 10002611, '水碓子投递部', '水碓子26', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (164, 10001801, '楼梓庄投递部', '楼梓庄18', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (165, 10110202, '通州商函处理中心', '京1105大', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (166, 10002507, '慈云寺投递部', '慈云寺25', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (167, 10002012, '呼家楼投递部', '呼家楼20', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (168, 10012401, '百子湾投递部', '百湾124', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (169, 10002307, '垡头投递部', '垡头23', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (170, 10010212, '望京投递部', '望京106', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (171, 10001606, '酒仙桥投递部', '酒仙桥16', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (172, 10001504, '大山子投递部', '大山子16', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (173, 10012301, '青年路投递部', '青年123', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (174, 10002406, '三间房投递部', '三间房24', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (175, 10131803, '后沙峪邮政支局投递组', '18后沙', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (176, 10131701, '顺义区半壁店邮政支局', '17-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (177, 10131601, '南法信邮政所', '16-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (178, 10131301, '李遂邮政所', '13-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (179, 10131203, '天竺邮政支局投递组', '12天竺', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (180, 10130103, '牛栏山邮政支局投递组', '1-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (181, 10130027, '木林邮政支局投递部', '14-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (182, 10130020, '裕龙邮政所', '21-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (183, 10130015, '板桥邮政所', '22-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (184, 10130010, '马坡邮政所', '19-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (185, 10130002, '顺义区石园邮政支局', '20-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (186, 10130905, '杨各庄邮政支局投递组', '9-杨镇', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (187, 10130803, '大孙各庄邮政支局投递组', '8-杨镇', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (188, 10130701, '张各庄邮政所', '7-杨镇', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (189, 10130601, '龙湾屯邮政所', '6-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (190, 10130401, '李桥邮政所', '4-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (191, 10130301, '高丽营邮政所', '3-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (192, 10130023, '新顺邮政支局投递组', '0-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (193, 10110901, '马头邮政所', '9-永乐店', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (194, 10111201, '觅子店邮政所', '12-永乐店', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (195, 10110503, '永乐店邮政支局投递组', '5-永乐店', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (196, 10111401, '机场邮政所', '14-张家湾', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (197, 10111601, '台湖邮政所', '16-张家湾', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (198, 10110401, '牛堡屯邮政所', '4-张家湾', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (199, 10111303, '张家湾邮政支局投递组', '13-张家湾', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (200, 10110701, '甘棠邮政所', '7-郎府', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (201, 10110603, '西集邮政支局投递组', '6-郎府', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (202, 10110801, '郎府邮政所', '8-郎府', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (203, 10110301, '大杜社邮政所', '3-马桥', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (204, 10110203, '马驹桥邮政支局投递组', '2-马桥', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (205, 10111101, '次渠邮政所', '11-马桥', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (206, 10111802, '疃里邮政所', '29-宋庄', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (207, 10111901, '徐辛庄邮政所', '19-宋庄', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (208, 10111804, '宋庄邮政支局投递组', '18-宋庄', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (209, 10111701, '胡各庄邮政所', '17-胡庄', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (210, 10110107, '梨园邮政支局投递组', '21-梨园', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (211, 10110008, '新华大街邮政支局投递组', '0-通州', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (212, 10110109, '运河邮政支局投递组', '1-运河', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (213, 10010109, '亚运村投递部', '亚运101', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (214, 10012001, '六铺炕投递部', '六铺炕11', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (215, 10001105, '安外投递部', '安外11', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (216, 10000905, '地安门投递部', '地安门9', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (217, 10221303, '十三陵邮政支局投递组', '13-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (218, 10221204, '兴寿邮政支局投递组', '12-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (219, 10221105, '小汤山邮政支局投递组', '11-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (220, 10220812, '龙锦苑邮政支局投递组', '8-龙锦', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (221, 10220607, '沙河邮政支局投递组', '6-沙河', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (222, 10220503, '阳坊邮政支局投递组', '5-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (223, 10220401, '西峰山邮政所', '4-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (224, 10220206, '南口邮政支局投递组', '2-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (225, 10002914, '安贞投递部', '安贞29', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (226, 10001204, '北苑投递部', '北苑12', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (227, 10000704, '北新桥投递部', '北新桥7', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (228, 10001304, '和平里投递部', '和平里13', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (229, 10019201, '宝盛里投递部', '宝盛里192', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (230, 10019301, '农大南路投递部', '农大193', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (231, 10009606, '育新花园投递部', '育新96', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (232, 10008507, '清河投递部', '清河85', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (233, 10221806, '天通西苑邮政支局投递组', '18-天通', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (234, 10220907, '东三旗邮政支局投递组', '9-东三', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (235, 10009505, '温泉投递部', '温泉95', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (236, 10009406, '西北旺投递部', '西北旺94', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (237, 10008403, '清华大学投递部', '清华84', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (238, 10019001, '保福寺投递部', '保福寺80', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (239, 10008006, '中关村投递部', '中关村80', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (240, 10009110, '颐和园投递部', '颐园193', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (241, 10008815, '北太平庄投递部', '北太平88', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (242, 10008314, '学院路投递部', '学院路83', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (243, 10008606, '双榆树投递部', '双榆树86', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (244, 10008203, '文慧园西路投递部', '文慧园88', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (245, 10007711, '西罗园投递部', '西罗园75', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (246, 10007903, '石榴庄投递部', '石榴庄79', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (247, 10007808, '方庄投递部', '方庄78', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (248, 10005305, '牛街投递部', '牛街53', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (249, 10005529, '广外商投中心', '商广安门', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (250, 10005116, '虎坊路商投分站', '商虎坊路', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (251, 10006105, '光明楼投递部', '光明楼61', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (252, 10006204, '东花市南里投递部', '东花市62', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (253, 10007607, '东高地投递部', '东高地76', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (254, 10006904, '开阳里投递部', '开阳里68', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (255, 10007509, '木樨园投递部', '木樨园75', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (256, 10006805, '角门投递部', '角门', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (257, 10005003, '永安路投递部', '50商虎坊', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (258, 10005405, '里仁街投递部', '54商广安', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (259, 10005204, '骡马市投递部', '52商虎坊', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (260, 10005506, '马连道投递部', '55商广安', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (261, 10003105, '西长安街投递部', '31商虎坊', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (262, 10000107, '站商投中心', '商北京站', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (263, 10001003, '东四投递部', '东四10', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (264, 10000605, '王府井投递部', '王府井6', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (265, 10000508, '东单投递部', '东单5', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (266, 10000103, '建内大街投递部', '建内1', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (267, 10017602, '亦庄投递部', '亦庄176', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (268, 10016301, '旧宫投递部', '旧宫176', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (269, 10016201, '西红门投递部', '西红162', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (270, 10262901, '大兴区埝坛邮政支局', '29-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (271, 10262703, '兴华路邮政支局投递组', '27-兴华', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (272, 10261203, '芦城邮政支局投递组', '12-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (273, 10261101, '魏善庄邮政所', '11-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (274, 10260701, '安定邮政所', '7-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (275, 10260603, '采育邮政支局投递组', '6-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (276, 10260503, '青云店邮政支局投递组', '3-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (277, 10260401, '礼贤邮政所', '4-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (278, 10260203, '榆垡邮政支局投递组', '2-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (279, 10260104, '庞各庄邮政支局投递组', '1-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (280, 10262803, '邮政大兴区广茂大街投递组', '京广茂', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (281, 10240003, '城关投递组', '99-城关', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (282, 10016101, '小井投递部', '小井161', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (283, 10007304, '太平桥投递部', '太平161', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (284, 10004011, '永乐商务投递中心', '伍芳园40', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (285, 10004002, '伍芳园投递部', '伍芳园40', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (286, 10244601, '官道邮政所', '46-良西', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (287, 10000313, '万丰路区域政务中心', '万丰路政', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (288, 10004203, '高井投递部', '高井41', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (289, 10014301, '田村投递部', '田村143', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (290, 10019501, '四季青投递部', '四季195', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (291, 10009305, '香山投递部', '香山193', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (292, 10004304, '新古城投递部', '新古城40', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (293, 10004106, '金顶街投递部', '金顶街41', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (294, 10003906, '永定路投递部', '永定路39', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (295, 10230802, '石龙邮政支局投递部', '8-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (296, 10230503, '雁翅邮政支局投递部', '5-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (297, 10230401, '木城涧邮政所', '4-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (298, 10230301, '大台邮政所', '3-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (299, 10231101, '清水邮政所', '11-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (300, 10230903, '斋堂邮政支局投递组', '9-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (301, 10230103, '王平村邮政支局投递组', '1-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (302, 10230011, '大峪邮政支局投递组', '0-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (303, 10007017, '科学城投递部', '科学城70', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (304, 10016601, '五里店投递部', '五里166', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (305, 10007105, '丰台投递部', '丰台166', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (306, 10004407, '西外大街投递部', '44商阜成', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (307, 10003723, '阜成门商投中心', '商阜成门', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (308, 10014001, '金融街邮局投递部', '金融街33', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (309, 10003807, '会城门投递部', '会城门36', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (310, 10003403, '西四投递部', '西四34', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (311, 10003209, '西单投递部', '西单32', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (312, 10003504, '新街口投递部', '新街口35', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (313, 10004509, '三里河投递部', '45商阜成', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (314, 10003709, '百万庄投递部', '37商阜成', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (315, 10240901, '张坊邮政所', '9-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (316, 10250201, '东风街所', '11-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (317, 10250003, '迎风街投递组', '10-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (318, 10240703, '长沟邮政支局投递组', '7-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (319, 10241303, '新镇邮政支局投递组', '13-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (320, 10241703, '河北邮政支局投递组', '17-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (321, 10242301, '韩村河邮政所', '23-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (322, 10242502, '星城投递组', '25-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (323, 10248807, '长阳投递部', '1-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (324, 10007402, '云岗投递部', '云岗74', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (325, 10007207, '长辛店投递部', '长辛店72', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (326, 10008904, '苏州街投递部', '苏州街80', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (327, 10008107, '魏公村投递部', '魏公村48', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (328, 10004801, '紫竹院投递部', '紫竹院48', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (329, 10009703, '世纪城投递部', '97投', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (330, 10003607, '万寿路投递部', '万寿路36', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (331, 10140301, '邮政怀柔区九渡河邮政所', '京怀九渡', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (332, 10141201, '邮政怀柔区长哨营邮政所', '京怀长哨', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (333, 10141401, '邮政怀柔区喇叭沟门邮政所', '京怀喇叭', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (334, 10140501, '渤海邮政所', '05-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (335, 10140901, '琉璃庙邮政所', '9-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (336, 10140801, '怀北庄邮政所', '8-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (337, 10140703, '雁栖邮政支局投递组', '7-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (338, 10140008, '北大街邮政支局投递组', '0-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (339, 10141602, '装指院邮政代办所', '16-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (340, 10141301, '七道河邮政所', '13-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (341, 10141105, '汤河口邮政支局投递组', '11-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (342, 10150009, '密云县鼓楼大街邮政支局投递组', '99-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (343, 10151501, '密云县冯家峪邮政所', '15-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (344, 10151301, '密云县石城邮政所', '13-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (345, 10150601, '密云县新城子邮政所', '6-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (346, 10150501, '密云县东庄禾邮政所', '5-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (347, 10150301, '密云县北庄邮政所', '3-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (348, 10150901, '密云县西田各庄邮政所', '9-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (349, 10150007, '密云县康宝路邮政支局投递组', '0-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (350, 10151601, '密云县不老屯邮政所', '16-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (351, 10151201, '密云县溪翁庄邮政支局', '12-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (352, 10150801, '密云县古北口邮政所', '8-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (353, 10150701, '密云县高岭邮政所', '7-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (354, 10150401, '密云县太师屯邮政支局', '4-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (355, 10150201, '密云县大城子邮政所', '2-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (356, 10150101, '密云县塘子邮政支局', '1-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (357, 10121501, '镇罗营邮政所', '15-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (358, 10121401, '马昌营邮政代办所', '14-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (359, 10121201, '南独乐河邮政所', '12-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (360, 10121101, '山东庄邮政代办所', '11-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (361, 10120901, '乐政务邮政代办所', '9-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (362, 10120705, '大华山邮政支局投递组', '7-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (363, 10120603, '峪口邮政支局投递组', '6-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (364, 10120503, '官庄邮政支局投递组', '5-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (365, 10120401, '马坊邮政所', '4-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (366, 10120301, '门楼庄投递组', '3-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (367, 10120201, '靠山集邮政所', '2-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (368, 10120103, '金海湖邮政支局投递组', '1-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (369, 10120008, '新平邮政支局投递组', '0-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (370, 10210501, '邮政延庆区大井庄邮政所', '京延5', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (371, 10210601, '邮政延庆区大庄科邮政所', '京延6', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (372, 10210801, '延庆千家店', '08-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (373, 10210701, '延庆四海邮政所', '07-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (374, 10211203, '延庆八达岭投递部', '12-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (375, 10211501, '延庆县张山营邮政所', '15-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (376, 10210903, '延庆县旧县邮政支局投递组', '9-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (377, 10210404, '延庆县永宁邮政支局投递组', '4-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (378, 10210201, '延庆县西拨子邮政所', '2-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (379, 10210105, '延庆县康庄邮政支局投递组', '1-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (380, 10210010, '延庆县东外大街邮政支局投递组', '0-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (381, 10000616, '东城区金宝街营业部', '金宝街营', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info_copy1` VALUES (382, 10007015, '总部基地分公司芳菲路营投部', '程庄X171', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_sorting_matching_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_sorting_matching_info`;
CREATE TABLE `tb_sorting_matching_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主建id',
  `batch_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `sender_name` varchar(255) CHARACTER SET utf32 COLLATE utf32_general_ci NULL DEFAULT NULL COMMENT '寄件人姓名',
  `sender_mobile_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件人电话1',
  `sender_mobile_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件人电话2',
  `sender_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件省',
  `sender_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件市',
  `sender_county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件区',
  `sender_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '寄件详细地址',
  `reciver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `reciver_mobile_one` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人电话1',
  `reciver_mobile_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人电话2',
  `reciver_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件省',
  `reciver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件市',
  `reciver_county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件区',
  `reciver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件详细地址',
  `datoubi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大头笔',
  `datoubi_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大头笔编码',
  `consolidation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集包地名称',
  `consolidation_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集包地编码',
  `level_four_sorting_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '四级分拣码',
  `sorting_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分拣码',
  `marking` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识',
  `distribu_center` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '集散中心',
  `dlv_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投递部代码',
  `dlv_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投递部名称',
  `org_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构代码',
  `org_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `operation_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员id',
  `operation_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作员姓名',
  `operation_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `matching_distribu_center_status` int(1) NULL DEFAULT NULL COMMENT '集散中心匹配状态:1已匹配、0未匹配',
  `city_wide_flag` int(255) NULL DEFAULT NULL COMMENT '同城标识:1同城，0外阜',
  `sorting_status` int(1) NULL DEFAULT NULL COMMENT '分拣码匹配状态：0：匹配失败 1：已匹配成功',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sorting_matching_info
-- ----------------------------
INSERT INTO `tb_sorting_matching_info` VALUES (1, '202006240019171724', '20200624001917142854', NULL, NULL, '010-京-0-姚家A125-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (2, '202006240019171724', '20200624001917180017', NULL, NULL, '010-京-0-新华T8-85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (3, '202006240019171724', '20200624001917113477', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (4, '202006240019171724', '20200624001917130545', NULL, NULL, '010-京-0-旧宫D163-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (5, '202006240019171724', '20200624001917174250', NULL, NULL, '010-京-0-翠屏T1-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (6, '202006240019171724', '20200624001917174146', NULL, NULL, '010-京-0-花市N62-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (7, '202006240019171724', '20200624001917169420', NULL, NULL, '010-京-0-张自N9-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (8, '202006240019171724', '20200624001917147082', NULL, NULL, '010-京-0-次渠T13-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (9, '202006240019171724', '20200624001917132475', NULL, NULL, '010-京-0-丰台X71-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (10, '202006240019171724', '20200624001917175188', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (11, '202006240019171724', '20200624001917121459', NULL, NULL, '010-京-0-东三C6-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (12, '202006240019171724', '20200624001917142834', NULL, NULL, '010-京-0-大峪J1-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (13, '202006240019171724', '20200624001917143143', NULL, NULL, '010-京-0-新顺S1-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (14, '202006240019171724', '20200624001917177211', NULL, NULL, '010-京-0-黄村D1-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (15, '202006240019171724', '20200624001917178732', NULL, NULL, '010-京-0-红军B112-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (16, '202006240019171724', '20200624001917131723', NULL, NULL, '010-京-0-台湖T6-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (17, '202006240019171724', '20200624001917176449', NULL, NULL, '010-京-0-新华T8-85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (18, '202006240019171724', '20200624001917100146', NULL, NULL, '010-京-0-科技C1-41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (19, '202006240019171724', '20200624001917101338', NULL, NULL, '010-京-0-科技C1-32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (20, '202006240019171724', '20200624001917144046', NULL, NULL, '010-京-0-学院B83-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (21, '202006240019171724', '20200624001917138072', NULL, NULL, '010-京-0-草桥N67-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (22, '202006240019171724', '20200624001917176823', NULL, NULL, '010-京-0-木樨N75-*', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (23, '202006240019171724', '20200624001917165916', NULL, NULL, '010-京-0-金宝N5-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (24, '202006240019171724', '20200624001917177641', NULL, NULL, '010-京-0-鲁谷X40-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (25, '202006240019171724', '20200624001917155062', NULL, NULL, '010-京-0-百子A124-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (26, '202006240019171724', '20200624001917178374', NULL, NULL, '010-京-0-新华T8-85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (27, '202006240019171724', '20200624001917158848', NULL, NULL, '010-京-0-马连N55-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (28, '202006240019171724', '20200624001917141351', NULL, NULL, '010-京-0-苏家B194-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (29, '202006240019171724', '20200624001917179807', NULL, NULL, '010-京-0-西红D162-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (30, '202006240019171724', '20200624001917164385', NULL, NULL, '010-京-0-翠屏T1-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (31, '202006240019171724', '20200624001917117545', NULL, NULL, '010-京-0-天桥N50-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (32, '202006240019171724', '20200624001917119258', NULL, NULL, '010-京-0-木樨N75-*', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (33, '202006240019171724', '20200624001917151721', NULL, NULL, '010-京-0-鲁谷X40-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (34, '202006240019171724', '20200624001917157897', NULL, NULL, '010-京-0-成寿N78-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (35, '202006240019171724', '20200624001917148043', NULL, NULL, '010-京-0-上地B92-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (36, '202006240019171724', '20200624001917111223', NULL, NULL, '010-京-0-劲松A21-009', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (37, '202006240019171724', '20200624001917103738', NULL, NULL, '010-京-0-学院B83-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (38, '202006240019171724', '20200624001917109595', NULL, NULL, '010-京-0-马连N55-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (39, '202006240019171724', '20200624001917160979', NULL, NULL, '010-京-0-王府N6-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (40, '202006240019171724', '20200624001917105965', NULL, NULL, '010-京-0-新古X43-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (41, '202006240019171724', '20200624001917123053', NULL, NULL, '010-京-0-开阳N69-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (42, '202006240019171724', '20200624001917187482', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (43, '202006240019171724', '20200624001917186852', NULL, NULL, '010-京-0-金鹰T2-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (44, '202006240019171724', '20200624001917141060', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (45, '202006240019171724', '20200624001917101263', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (46, '202006240019171724', '20200624001917129156', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (47, '202006240019171724', '20200624001917154252', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (48, '202006240019171724', '20200624001917120494', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (49, '202006240019171724', '20200624001917170262', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (50, '202006240019171724', '20200624001917175716', NULL, NULL, '010-京-0-苏州X89-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (51, '202006240019171724', '20200624001917121253', NULL, NULL, '010-京-0-北太B88-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (52, '202006240019171724', '20200624001917126461', NULL, NULL, '010-京-0-新顺S1-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (53, '202006240019171724', '20200624001917116432', NULL, NULL, '010-京-0-青年A123-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (54, '202006240019171724', '20200624001917150020', NULL, NULL, '010-京-0-西路F5-8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (55, '202006240019171724', '20200624001917111031', NULL, NULL, '010-京-0-西路F5-8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (56, '202006240019171724', '20200624001917112929', NULL, NULL, '010-京-0-东四N10-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (57, '202006240019171724', '20200624001917109017', NULL, NULL, '010-京-0-新华T8-85', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (58, '202006240019171724', '20200624001917104637', NULL, NULL, '010-京-0-张家T3-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (59, '202006240019171724', '20200624001917114138', NULL, NULL, '010-京-0-翠屏T1-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (60, '202006240019171724', '20200624001917137067', NULL, NULL, '010-京-0-金宝N5-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (61, '202006240019171724', '20200624001917155639', NULL, NULL, '010-京-0-梨园T7-*', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (62, '202006240019171724', '20200624001917144269', NULL, NULL, '010-京-0-张家T3-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (63, '202006240019171724', '20200624001917171530', NULL, NULL, '010-京-0-宋庄T11-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (64, '202006240019171724', '20200624001917111300', NULL, NULL, '010-京-0-小关B29-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (65, '202006240019171724', '20200624001917145344', NULL, NULL, '010-京-0-二里B87-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (66, '202006240019171724', '20200624001917120563', NULL, NULL, '010-京-0-永乐T14-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (67, '202006240019171724', '20200624001917141827', NULL, NULL, '010-京-0-西红D162-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (68, '202006240019171724', '20200624001917167059', NULL, NULL, '010-京-0-劲松A21-008', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (69, '202006240019171724', '20200624001917116891', NULL, NULL, '010-京-0-运河T9-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (70, '202006240019171724', '20200624001917128425', NULL, NULL, '010-京-0-翠城A122-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (71, '202006240019171724', '20200624001917109276', NULL, NULL, '010-京-0-翠屏T1-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (72, '202006240019171724', '20200624001917144479', NULL, NULL, '010-京-0-西路F5-8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (73, '202006240019171724', '20200624001917125444', NULL, NULL, '010-京-0-天桥N50-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (74, '202006240019171724', '20200624001917169119', NULL, NULL, '010-京-0-金顶X41-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (75, '202006240019171724', '20200624001917173760', NULL, NULL, '010-京-0-郎府T12-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (76, '202006240019171724', '20200624001917187921', NULL, NULL, '010-京-0-三里X45-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (77, '202006240019171724', '20200624001917132104', NULL, NULL, '010-京-0-王府N6-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (78, '202006240019171724', '20200624001917135536', NULL, NULL, '010-京-0-科园B105-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (79, '202006240019171724', '20200624001917139607', NULL, NULL, '010-京-0-翠屏T1-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (80, '202006240019171724', '20200624001917172980', NULL, NULL, '010-京-0-新古X43-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (81, '202006240019171724', '20200624001917157088', NULL, NULL, '010-京-0-旧宫D163-38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (82, '202006240019171724', '20200624001917135859', NULL, NULL, '010-京-0-6-大兴-45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (83, '202006240019171724', '20200624001917115779', NULL, NULL, '010-京-0-三路X161-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (84, '202006240019171724', '20200624001917146588', NULL, NULL, '010-京-0-北新B7-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (85, '202006240019171724', '20200624001917169787', NULL, NULL, '010-京-0-马连N55-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (86, '202006240019171724', '20200624001917108737', NULL, NULL, '010-京-0-成寿N78-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (87, '202006240019171724', '20200624001917122838', NULL, NULL, '010-京-0-三路X161-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '快乐', '2020-06-23 16:19:18', NULL, 1, 0, NULL, '2020-06-23 16:19:18', '2020-06-23 16:19:18');
INSERT INTO `tb_sorting_matching_info` VALUES (88, '202006232148171606', '20200623214817168382', '张三', '13800138000', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138000', NULL, '北京市', NULL, NULL, '北京市朝阳区东风镇石佛营西里25号楼108', '010-京', '010-京', '010-京', '', '010-京-0-姚家A125-12', '姚家A125', NULL, '东区', 'D1', '甜水园', '10002522', '朝阳区姚家园营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (89, '202006232148171606', '20200623214817170698', '张三', '13800138001', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138001', NULL, '北京市', NULL, NULL, '北京市通州区中仓街道北小园5号楼232', '010-京', '010-京', '010-京', '', '010-京-0-新华T8-85', '新华T8', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110064', '通州区新华营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (90, '202006232148171606', '20200623214817114085', '张三', '13800138002', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138002', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (91, '202006232148171606', '20200623214817121149', '张三', '13800138003', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138003', NULL, '北京市', NULL, NULL, '北京市大兴区旧宫镇北京大兴九银村镇银行(旧宫支行)', '010-京', '010-京', '010-京', '', '010-京-0-旧宫D163-14', '旧宫D163', NULL, '南区', 'N3', '旧宫', '10007614', '大兴区旧宫营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (92, '202006232148171606', '20200623214817144529', '张三', '13800138004', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138004', NULL, '北京市', NULL, NULL, '北京市通州区梨园北洋洼266号邮政', '010-京', '010-京', '010-京', '', '010-京-0-翠屏T1-24', '翠屏T1', '通州本揽本投', '东区', 'D8', '翠屏南里', '10112602', '通州区翠屏南里营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (93, '202006232148171606', '20200623214817116788', '张三', '13800138005', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138005', NULL, '北京市', NULL, NULL, '北京市东城区国瑞城中区13号楼1单元601号', '010-京', '010-京', '010-京', '', '010-京-0-花市N62-01', '花市N62', NULL, '南区', 'N1', '天桥', '10006213', '东城区花市营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (94, '202006232148171606', '20200623214817133847', '张三', '13800138006', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138006', NULL, '北京市', NULL, NULL, '北京市东城区安定门街道安定门内大街227号', '010-京', '010-京', '010-京', '', '010-京-0-张自N9-01', '张自N9', NULL, '南区', 'N2', '金宝街', '10001008', '西城区张自忠路营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (95, '202006232148171606', '20200623214817110631', '张三', '13800138007', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138007', NULL, '北京市', NULL, NULL, '北京市大兴区北京经济技术开发区经海四路156号院C2号楼4层', '010-京', '010-京', '010-京', '', '010-京-0-次渠T13-16', '次渠T13', '通州本揽本投', '东区', 'D7', '次渠', '10110058', '通州区次渠营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (96, '202006232148171606', '20200623214817135921', '张三', '13800138008', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138008', NULL, '北京市', NULL, NULL, '北京市丰台区丰台街道丰台区东大街5号', '010-京', '010-京', '010-京', '', '010-京-0-丰台X71-06', '丰台X71', NULL, '西区', 'X2', '程庄', '10000437', '丰台区丰台营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (97, '202006232148171606', '20200623214817176239', '张三', '13800138009', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138009', NULL, '北京市', NULL, NULL, '北京市通州区运河西大街174号通州区邮政局', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (98, '202006232148171606', '20200623214817173911', '张三', '13800138010', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138010', NULL, '北京市', NULL, NULL, '北京市昌平区北七家镇王府家庭农场赋丽园40号', '010-京', '010-京', '010-京', '', '010-京-0-东三C6-11', '东三C6', NULL, '海淀', 'H3', '回龙观', '10220910', '昌平区东三旗营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (99, '202006232148171606', '20200623214817143536', '张三', '13800138011', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138011', NULL, '北京市', NULL, NULL, '北京市门头沟区河滩路2号', '010-京', '010-京', '010-京', '', '010-京-0-大峪J1-16', '大峪J1', NULL, '西区', 'X1', '田村', '10230030', '门头沟区大峪营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (100, '202006232148171606', '20200623214817126665', '张三', '13800138012', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138012', NULL, '北京市', NULL, NULL, '北京市顺义区新顺南大街7号', '010-京', '010-京', '010-京', '', '010-京-0-新顺S1-22', '新顺S1', NULL, '东区', 'D6', '天竺', '10130030', '顺义区新顺营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (101, '202006232148171606', '20200623214817169075', '张三', '13800138013', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138013', NULL, '北京市', NULL, NULL, '北京市大兴区滨河街27号', '010-京', '010-京', '010-京', '', '010-京-0-黄村D1-02', '黄村D1', NULL, '南区', 'N4', '兴政', '10260902', '大兴区黄村营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (102, '202006232148171606', '20200623214817165770', '张三', '13800138014', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138014', NULL, '北京市', NULL, NULL, '北京市朝阳区来广营镇蕴实园', '010-京', '010-京', '010-京', '', '010-京-0-红军B112-24', '红军B112', NULL, '海淀', 'H1', '北苑', '10000436', '朝阳区红军营营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (103, '202006232148171606', '20200623214817162053', '张三', '13800138015', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138015', NULL, '北京市', NULL, NULL, '北京市通州区张家湾镇高营村', '010-京', '010-京', '010-京', '', '010-京-0-台湖T6-10', '台湖T6', '通州本揽本投', '东区', 'D7', '次渠', '10110063', '通州区台湖营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (104, '202006232148171606', '20200623214817184846', '张三', '13800138016', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138016', NULL, '北京市', NULL, NULL, '北京市通州区西营前街小区15号楼4单元421', '010-京', '010-京', '010-京', '', '010-京-0-新华T8-85', '新华T8', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110064', '通州区新华营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (105, '202006232148171606', '20200623214817104516', '张三', '13800138017', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138017', NULL, '北京市', NULL, NULL, '北京市昌平区城北街道政府街25号昌平邮局', '010-京', '010-京', '010-京', '', '010-京-0-科技C1-41', '科技C1', NULL, '海淀', 'H3', '回龙观', '10220015', '昌平区科技园营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (106, '202006232148171606', '20200623214817109141', '张三', '13800138018', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138018', NULL, '北京市', NULL, NULL, '北京市昌平区城北街道政府街邮政支局（转延庆局）', '010-京', '010-京', '010-京', '', '010-京-0-科技C1-32', '科技C1', NULL, '海淀', 'H3', '回龙观', '10220015', '昌平区科技园营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (107, '202006232148171606', '20200623214817156931', '张三', '13800138019', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138019', NULL, '北京市', NULL, NULL, '北京市海淀区王庄路27号院2-5-402', '010-京', '010-京', '010-京', '', '010-京-0-学院B83-10', '学院B83', NULL, '海淀', 'H5', '中关村', '10008338', '海淀区学院路营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (108, '202006232148171606', '20200623214817173284', '张三', '13800138020', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138020', NULL, '北京市', NULL, NULL, '北京市丰台区嘉园二里小区18号楼4单元402室', '010-京', '010-京', '010-京', '', '010-京-0-草桥N67-04', '草桥N67', NULL, '南区', 'N1', '天桥', '10005408', '丰台区草桥欣园营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (109, '202006232148171606', '20200623214817111662', '张三', '13800138021', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138021', NULL, '北京市', NULL, NULL, '北京市丰台区东铁匠营街道东木樨园11号楼九门502室', '010-京', '010-京', '010-京', '', '010-京-0-木樨N75-*', '木樨N75', NULL, '南区', 'N3', '东高地', '10000352', '丰台区木樨园营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (110, '202006232148171606', '20200623214817102189', '张三', '13800138022', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138022', NULL, '北京市', NULL, NULL, '北京市东城区东交民巷7号院11号楼2单元403号', '010-京', '010-京', '010-京', '', '010-京-0-金宝N5-13', '金宝N5', NULL, '南区', 'N2', '金宝街', '10000616', '东城区金宝街营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (111, '202006232148171606', '20200623214817140158', '张三', '13800138023', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138023', NULL, '北京市', NULL, NULL, '北京市石景山区鲁谷街道依翠园小区17号楼1803号', '010-京', '010-京', '010-京', '', '010-京-0-鲁谷X40-23', '鲁谷X40', NULL, '西区', 'X1', '田村', '10004909', '石景山区鲁谷营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (112, '202006232148171606', '20200623214817168669', '张三', '13800138024', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138024', NULL, '北京市', NULL, NULL, '北京市朝阳区百子湾东里沿海赛洛城419号楼1单元401室', '010-京', '010-京', '010-京', '', '010-京-0-百子A124-15', '百子A124', NULL, '东区', 'D2', '百子湾', '10002223', '朝阳区百子湾营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (113, '202006232148171606', '20200623214817119114', '张三', '13800138025', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138025', NULL, '北京市', NULL, NULL, '北京市通州区西营前街17号楼321室', '010-京', '010-京', '010-京', '', '010-京-0-新华T8-85', '新华T8', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110064', '通州区新华营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (114, '202006232148171606', '20200623214817127709', '张三', '13800138026', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138026', NULL, '北京市', NULL, NULL, '北京市西城区新居东里一号楼底商红霞品质生活体验店', '010-京', '010-京', '010-京', '', '010-京-0-马连N55-03', '马连N55', NULL, '南区', 'N1', '天桥', '10005527', '西城区马连道营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (115, '202006232148171606', '20200623214817153067', '张三', '13800138027', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138027', NULL, '北京市', NULL, NULL, '北京市海淀区苏家坨镇苏三四村内世纪华联超市门口取货。（如快递不能进村，到村口打电话可出来取）', '010-京', '010-京', '010-京', '', '010-京-0-苏家B194-11', '苏家B194', NULL, '海淀', 'H4', '屯佃', '10010022', '海淀区苏家坨营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (116, '202006232148171606', '20200623214817148508', '张三', '13800138028', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138028', NULL, '北京市', NULL, NULL, '北京市大兴区欣荣北大街18-3号大兴九银村镇银行', '010-京', '010-京', '010-京', '', '010-京-0-西红D162-06', '西红D162', NULL, '南区', 'N3', '旧宫', '10016203', '大兴区西红门营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (117, '202006232148171606', '20200623214817137296', '张三', '13800138029', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138029', NULL, '北京市', NULL, NULL, '北京市通州区世纪星城74-3-802', '010-京', '010-京', '010-京', '', '010-京-0-翠屏T1-03', '翠屏T1', '通州本揽本投', '东区', 'D8', '翠屏南里', '10112602', '通州区翠屏南里营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (118, '202006232148171606', '20200623214817170565', '张三', '13800138030', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138030', NULL, '北京市', NULL, NULL, '北京市西城区天桥街道EMS大院', '010-京', '010-京', '010-京', '', '010-京-0-天桥N50-10', '天桥N50', NULL, '南区', 'N1', '天桥', '10005113', '西城区天桥营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (119, '202006232148171606', '20200623214817164410', '张三', '13800138031', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138031', NULL, '北京市', NULL, NULL, '北京市丰台区东铁匠营街道刘家窑南里25号楼1505', '010-京', '010-京', '010-京', '', '010-京-0-木樨N75-*', '木樨N75', NULL, '南区', 'N3', '东高地', '10000352', '丰台区木樨园营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (120, '202006232148171606', '20200623214817104680', '张三', '13800138032', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138032', NULL, '北京市', NULL, NULL, '北京市石景山区玉泉西里1区远洋沁山水11楼1门1002', '010-京', '010-京', '010-京', '', '010-京-0-鲁谷X40-10', '鲁谷X40', NULL, '西区', 'X1', '田村', '10004909', '石景山区鲁谷营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (121, '202006232148171606', '20200623214817156873', '张三', '13800138033', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138033', NULL, '北京市', NULL, NULL, '北京市丰台区方庄镇中国邮政集团公司北京市丰台区分公司', '010-京', '010-京', '010-京', '', '010-京-0-成寿N78-11', '成寿N78', NULL, '南区', 'N3', '旧宫', '10016403', '丰台区成寿寺营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (122, '202006232148171606', '20200623214817133023', '张三', '13800138034', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138034', NULL, '北京市', NULL, NULL, '北京市海淀区上地西路6号快手总部', '010-京', '010-京', '010-京', '', '010-京-0-上地B92-08', '上地B92', NULL, '海淀', 'H2', '育新花园', '10040003', '海淀区上地营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (123, '202006232148171606', '20200623214817189235', '张三', '13800138035', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138035', NULL, '北京市', NULL, NULL, '北京市朝阳区武圣西里24楼6单元101', '010-京', '010-京', '010-京', '', '010-京-0-劲松A21-009', '劲松A21', NULL, '东区', 'D3', '十里河', '10002115', '朝阳区劲松营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (124, '202006232148171606', '20200623214817107212', '张三', '13800138036', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138036', NULL, '北京市', NULL, NULL, '北京市海淀区五道口东升园公寓10号楼201室', '010-京', '010-京', '010-京', '', '010-京-0-学院B83-01', '学院B83', NULL, '海淀', 'H5', '中关村', '10008338', '海淀区学院路营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (125, '202006232148171606', '20200623214817133935', '张三', '13800138037', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138037', NULL, '北京市', NULL, NULL, '北京市丰台区莲花池东路126号', '010-京', '010-京', '010-京', '', '010-京-0-马连N55-01', '马连N55', NULL, '南区', 'N1', '天桥', '10005527', '西城区马连道营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (126, '202006232148171606', '20200623214817119902', '张三', '13800138038', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138038', NULL, '北京市', NULL, NULL, '北京市东城区东华门街道前门东大街7号楼', '010-京', '010-京', '010-京', '', '010-京-0-王府N6-21', '王府N6', NULL, '南区', 'N2', '金宝街', '10000618', '东城区王府井营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (127, '202006232148171606', '20200623214817162844', '张三', '13800138039', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138039', NULL, '北京市', NULL, NULL, '北京市石景山区古城大街特钢东门一号楼五单元72号 13910673617', '010-京', '010-京', '010-京', '', '010-京-0-新古X43-08', '新古X43', NULL, '西区', 'X1', '田村', '10000443', '石景山区新古城营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (128, '202006232148171606', '20200623214817112555', '张三', '13800138040', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138040', NULL, '北京市', NULL, NULL, '北京市丰台区右安门外东庄20号楼2单元205', '010-京', '010-京', '010-京', '', '010-京-0-开阳N69-01', '开阳N69', NULL, '南区', 'N1', '天桥', '10000439', '丰台区开阳里营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (129, '202006232148171606', '20200623214817121139', '张三', '13800138041', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138041', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道合生·滨江帝景124楼3－101', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (130, '202006232148171606', '20200623214817141919', '张三', '13800138042', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138042', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道玉桥中路2号院10号楼742室', '010-京', '010-京', '010-京', '', '010-京-0-金鹰T2-08', '金鹰T2', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110018', '通州区金鹰营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (131, '202006232148171606', '20200623214817101236', '张三', '13800138043', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138043', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号 通州邮局', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (132, '202006232148171606', '20200623214817184449', '张三', '13800138044', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138044', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号通州邮局', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (133, '202006232148171606', '20200623214817173339', '张三', '13800138045', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138045', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号通州邮政局', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (134, '202006232148171606', '20200623214817116146', '张三', '13800138046', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138046', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号邮局', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (135, '202006232148171606', '20200623214817171663', '张三', '13800138047', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138047', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号中国邮政通州分公司', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (136, '202006232148171606', '20200623214817103732', '张三', '13800138048', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138048', NULL, '北京市', NULL, NULL, '北京市通州区运河西大街174号', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (137, '202006232148171606', '20200623214817110486', '张三', '13800138049', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138049', NULL, '北京市', NULL, NULL, '北京市海淀区中国邮政集团公司北京市海淀区分公司，海淀区综合办公室', '010-京', '010-京', '010-京', '', '010-京-0-苏州X89-10', '苏州X89', NULL, '西区', 'X5', '八宝庄', '10008910', '海淀区苏州街营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (138, '202006232148171606', '20200623214817128289', '张三', '13800138050', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138050', NULL, '北京市', NULL, NULL, '北京市海淀区北太平庄街道知春路太月园小区4号楼407', '010-京', '010-京', '010-京', '', '010-京-0-北太B88-13', '北太B88', NULL, '海淀', 'H5', '中关村', '10002180', '海淀区北太平庄营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (139, '202006232148171606', '20200623214817185487', '张三', '13800138051', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138051', NULL, '北京市', NULL, NULL, '北京市顺义区钱粮北路3号院 华玺瀚楟3-4-1302', '010-京', '010-京', '010-京', '', '010-京-0-新顺S1-22', '新顺S1', NULL, '东区', 'D6', '天竺', '10130030', '顺义区新顺营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (140, '202006232148171606', '20200623214817116969', '张三', '13800138052', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138052', NULL, '北京市', NULL, NULL, '北京市朝阳区平房镇雅成一里10号楼3单元202室', '010-京', '010-京', '010-京', '', '010-京-0-青年A123-07', '青年A123', NULL, '东区', 'D5', '三间房', '10012302', '朝阳区青年路营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (141, '202006232148171606', '20200623214817173725', '张三', '13800138053', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138053', NULL, '北京市', NULL, NULL, '北京市房山区良乡镇良乡西路11号', '010-京', '010-京', '010-京', '', '010-京-0-西路F5-8', '西路F5', NULL, '西区', 'X4', '云岗', '10248804', '房山区良乡西路营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (142, '202006232148171606', '20200623214817185006', '张三', '13800138054', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138054', NULL, '北京市', NULL, NULL, '北京市房山区良乡镇良乡西路11号邮政局', '010-京', '010-京', '010-京', '', '010-京-0-西路F5-8', '西路F5', NULL, '西区', 'X4', '云岗', '10248804', '房山区良乡西路营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (143, '202006232148171606', '20200623214817185771', '张三', '13800138055', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138055', NULL, '北京市', NULL, NULL, '北京市东城区美术馆后街23号北京市中医医院门诊西药房', '010-京', '010-京', '010-京', '', '010-京-0-东四N10-10', '东四N10', NULL, '南区', 'N2', '金宝街', '10001010', '东城区东四营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (144, '202006232148171606', '20200623214817157619', '张三', '13800138056', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138056', NULL, '北京市', NULL, NULL, '北京市通州区玉带河西街30号二中家属楼5单元532', '010-京', '010-京', '010-京', '', '010-京-0-新华T8-85', '新华T8', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110064', '通州区新华营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (145, '202006232148171606', '20200623214817121320', '张三', '13800138057', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138057', NULL, '北京市', NULL, NULL, '北京市通州区张家湾镇上店村495号', '010-京', '010-京', '010-京', '', '010-京-0-张家T3-11', '张家T3', '通州本揽本投', '东区', 'D7', '次渠', '10111304', '通州区张家湾营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (146, '202006232148171606', '20200623214817125388', '张三', '13800138058', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138058', NULL, '北京市', NULL, NULL, '北京市通州区蓝山国际2号楼3单元801室', '010-京', '010-京', '010-京', '', '010-京-0-翠屏T1-23', '翠屏T1', '通州本揽本投', '东区', 'D8', '翠屏南里', '10112602', '通州区翠屏南里营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (147, '202006232148171606', '20200623214817122430', '张三', '13800138059', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138059', NULL, '北京市', NULL, NULL, '北京市东城区东单大华路1号北京医院', '010-京', '010-京', '010-京', '', '010-京-0-金宝N5-13', '金宝N5', NULL, '南区', 'N2', '金宝街', '10000616', '东城区金宝街营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (148, '202006232148171606', '20200623214817123735', '张三', '13800138060', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138060', NULL, '北京市', NULL, NULL, '北京市通州区梨园镇小稿村416号楼8单元881室', '010-京', '010-京', '010-京', '', '010-京-0-梨园T7-*', '梨园T7', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110061', '通州区梨园营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (149, '202006232148171606', '20200623214817117642', '张三', '13800138061', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138061', NULL, '北京市', NULL, NULL, '北京市通州区张家湾镇太玉园小区西区37号楼4单元一层', '010-京', '010-京', '010-京', '', '010-京-0-张家T3-11', '张家T3', '通州本揽本投', '东区', 'D7', '次渠', '10111304', '通州区张家湾营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (150, '202006232148171606', '20200623214817118116', '张三', '13800138062', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138062', NULL, '北京市', NULL, NULL, '北京市通州区宋庄镇首开·香溪郡5-1-201', '010-京', '010-京', '010-京', '', '010-京-0-宋庄T11-04', '宋庄T11', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110062', '通州区宋庄营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (151, '202006232148171606', '20200623214817150847', '张三', '13800138063', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138063', NULL, '北京市', NULL, NULL, '北京市朝阳区惠新西街33号院5号楼802', '010-京', '010-京', '010-京', '', '010-京-0-小关B29-19', '小关B29', NULL, '海淀', 'H1', '北苑', '10002917', '朝阳区小关营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:23', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (152, '202006232148171606', '20200623214817128187', '张三', '13800138064', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138064', NULL, '北京市', NULL, NULL, '北京市海淀区志新北里16号楼东楼1706', '010-京', '010-京', '010-京', '', '010-京-0-二里B87-02', '二里B87', NULL, '海淀', 'H5', '中关村', '10008337', '海淀区二里庄营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (153, '202006232148171606', '20200623214817183547', '张三', '13800138065', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138065', NULL, '北京市', NULL, NULL, '北京市通州区中国邮政永乐店邮政支局(永乐大街30号)', '010-京', '010-京', '010-京', '', '010-京-0-永乐T14-09', '永乐T14', '通州本揽本投', '东区', 'D7', '次渠', '10110065', '通州区永乐店营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (154, '202006232148171606', '20200623214817186952', '张三', '13800138066', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138066', NULL, '北京市', NULL, NULL, '北京市大兴区西红门镇金荣园北院七天假日酒店（金旺来）', '010-京', '010-京', '010-京', '', '010-京-0-西红D162-01', '西红D162', NULL, '南区', 'N3', '旧宫', '10016203', '大兴区西红门营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (155, '202006232148171606', '20200623214817157721', '张三', '13800138067', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138067', NULL, '北京市', NULL, NULL, '北京市朝阳区劲松四区408号楼6门3号', '010-京', '010-京', '010-京', '', '010-京-0-劲松A21-008', '劲松A21', NULL, '东区', 'D3', '十里河', '10002115', '朝阳区劲松营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (156, '202006232148171606', '20200623214817170124', '张三', '13800138068', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138068', NULL, '北京市', NULL, NULL, '北京市通州区玉桥街道运河西大街174号通州区邮局综合办', '010-京', '010-京', '010-京', '', '010-京-0-运河T9-28', '运河T9', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110066', '通州区运河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (157, '202006232148171606', '20200623214817169520', '张三', '13800138069', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138069', NULL, '北京市', NULL, NULL, '北京市朝阳区十八里店镇十里河闽龙广场闽龙茶城58号', '010-京', '010-京', '010-京', '', '010-京-0-翠城A122-11', '翠城A122', NULL, '东区', 'D3', '十里河', '10002314', '朝阳区翠城营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (158, '202006232148171606', '20200623214817148195', '张三', '13800138070', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138070', NULL, '北京市', NULL, NULL, '北京市通州区梨园镇东里南区55号楼二单元301室', '010-京', '010-京', '010-京', '', '010-京-0-翠屏T1-19', '翠屏T1', '通州本揽本投', '东区', 'D8', '翠屏南里', '10112602', '通州区翠屏南里营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (159, '202006232148171606', '20200623214817116150', '张三', '13800138071', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138071', NULL, '北京市', NULL, NULL, '北京市房山区良乡西路11号 中国邮政(西路邮政支局)', '010-京', '010-京', '010-京', '', '010-京-0-西路F5-8', '西路F5', NULL, '西区', 'X4', '云岗', '10248804', '房山区良乡西路营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (160, '202006232148171606', '20200623214817189839', '张三', '13800138072', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138072', NULL, '北京市', NULL, NULL, '北京市东城区珠市口东大街20一5号肯德基', '010-京', '010-京', '010-京', '', '010-京-0-天桥N50-14', '天桥N50', NULL, '南区', 'N1', '天桥', '10005113', '西城区天桥营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (161, '202006232148171606', '20200623214817189528', '张三', '13800138073', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138073', NULL, '北京市', NULL, NULL, '北京市石景山区西井一区5栋5单元301', '010-京', '010-京', '010-京', '', '010-京-0-金顶X41-11', '金顶X41', NULL, '西区', 'X1', '田村', '10004114', '石景山区金顶街营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (162, '202006232148171606', '20200623214817173071', '张三', '13800138074', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138074', NULL, '北京市', NULL, NULL, '北京市通州区西集镇国防路邮储银行西集支行', '010-京', '010-京', '010-京', '', '010-京-0-郎府T12-16', '郎府T12', '通州本揽本投', '东区', 'D7', '次渠', '10110060', '通州区郎府营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (163, '202006232148171606', '20200623214817145949', '张三', '13800138075', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138075', NULL, '北京市', NULL, NULL, '北京市西城区南礼士路头条5号', '010-京', '010-京', '010-京', '', '010-京-0-三里X45-20', '三里X45', NULL, '西区', 'X3', '三里河', '10003812', '西城区三里河营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (164, '202006232148171606', '20200623214817159871', '张三', '13800138076', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138076', NULL, '北京市', NULL, NULL, '北京市东城区前门街道前门东大街7号', '010-京', '010-京', '010-京', '', '010-京-0-王府N6-21', '王府N6', NULL, '南区', 'N2', '金宝街', '10000618', '东城区王府井营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (165, '202006232148171606', '20200623214817144533', '张三', '13800138077', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138077', NULL, '北京市', NULL, NULL, '北京市朝阳区中国邮政集团公司朝阳区分公司朝阳区综合办公室', '010-京', '010-京', '010-京', '', '010-京-0-科园B105-27', '科园B105', NULL, '海淀', 'H1', '北苑', '10010504', '朝阳区科学园营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (166, '202006232148171606', '20200623214817132865', '张三', '13800138078', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138078', NULL, '北京市', NULL, NULL, '北京市通州区杨庄路世纪星城·长城国际(杨庄南里66号楼)底商世纪星城邮政所', '010-京', '010-京', '010-京', '', '010-京-0-翠屏T1-03', '翠屏T1', '通州本揽本投', '东区', 'D8', '翠屏南里', '10112602', '通州区翠屏南里营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (167, '202006232148171606', '20200623214817120052', '张三', '13800138079', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138079', NULL, '北京市', NULL, NULL, '北京市石景山区八角街道石景山路52号邮政局', '010-京', '010-京', '010-京', '', '010-京-0-新古X43-12', '新古X43', NULL, '西区', 'X1', '田村', '10000443', '石景山区新古城营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (168, '202006232148171606', '20200623214817182213', '张三', '13800138080', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138080', NULL, '北京市', NULL, NULL, '北京市大兴区旧宫镇清和园小区7号楼10单元601', '010-京', '010-京', '010-京', '', '010-京-0-旧宫D163-38', '旧宫D163', NULL, '南区', 'N3', '旧宫', '10007614', '大兴区旧宫营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (169, '202006232148171606', '20200623214817144837', '张三', '13800138081', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138081', NULL, '北京市', NULL, NULL, '北京市大兴区采育镇北京大兴九银村镇银行(采育支行)', '010-京', '010-京', '010-京', '', '010-京-0-6-大兴-45', '大兴', NULL, NULL, NULL, NULL, NULL, NULL, '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (170, '202006232148171606', '20200623214817113839', '张三', '13800138082', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138082', NULL, '北京市', NULL, NULL, '北京市丰台区西局北街104黔藏酒坊', '010-京', '010-京', '010-京', '', '010-京-0-三路X161-07', '三路X161', NULL, '西区', 'X2', '程庄', '10007111', '丰台区三路居营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (171, '202006232148171606', '20200623214817100900', '张三', '13800138083', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138083', NULL, '北京市', NULL, NULL, '北京市东城区东四十条甲100号506', '010-京', '010-京', '010-京', '', '010-京-0-北新B7-04', '北新B7', NULL, '海淀', 'H1', '北苑', '10000713', '东城区北新桥营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (172, '202006232148171606', '20200623214817126054', '张三', '13800138084', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138084', NULL, '北京市', NULL, NULL, '北京市西城区广安门外街道马连道中新家园1区1号楼2门401房', '010-京', '010-京', '010-京', '', '010-京-0-马连N55-12', '马连N55', NULL, '南区', 'N1', '天桥', '10005527', '西城区马连道营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (173, '202006232148171606', '20200623214817117149', '张三', '13800138085', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138085', NULL, '北京市', NULL, NULL, '北京市丰台区方庄镇蒲芳路22号', '010-京', '010-京', '010-京', '', '010-京-0-成寿N78-11', '成寿N78', NULL, '南区', 'N3', '旧宫', '10016403', '丰台区成寿寺营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (174, '202006232148171606', '20200623214817113425', '张三', '13800138086', NULL, '北京市', '北京市', '西城区', '永安路121号', '李四', '13800138086', NULL, '北京市', NULL, NULL, '北京市丰台区卢沟桥乡丰仪家园小区西门小白楼', '010-京', '010-京', '010-京', '', '010-京-0-三路X161-05', '三路X161', NULL, '西区', 'X2', '程庄', '10007111', '丰台区三路居营业部', '3', '岳翔', '2020-06-23 13:48:18', NULL, 1, 1, NULL, '2020-06-24 00:44:24', '2020-06-23 13:48:18');
INSERT INTO `tb_sorting_matching_info` VALUES (175, '202006241155591473', '20200624115559103684', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市丰台区方庄芳古园二区13号楼308室', '010-京', '010-京', '010-京', '', '010-京-0-成寿N78-05', '成寿N78', NULL, '南区', 'N3', '旧宫', '10016403', '丰台区成寿寺营业部', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (176, '202006241155591473', '20200624115559124381', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市朝阳区武圣西里8号楼5门401', '010-京', '010-京', '010-京', '', '010-京-0-劲松A21-009', '劲松A21', NULL, '东区', 'D3', '十里河', '10002115', '朝阳区劲松营业部', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (177, '202006241155591473', '20200624115559135313', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市海淀区苏家坨凤仪佳苑一里南门', '010-京', '010-京', '010-京', '', '010-京-0-苏家B194-06', '苏家B194', NULL, '海淀', 'H4', '屯佃', '10010022', '海淀区苏家坨营业部', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (178, '202006241155591473', '20200624115559178022', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市大兴区瀛海镇永旭嘉园小区5-2-1401', '010-京', '010-京', '010-京', '', '010-京-0-瀛海D7-05', '瀛海D7', NULL, '南区', 'N3', '旧宫', '10000092', '大兴区瀛海营业部', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (179, '202006241155591473', '20200624115559143731', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市大兴区天河西路小区 2-1-506', '010-京', '010-京', '010-京', '', '010-京-0-29-大兴-*', '大兴', NULL, NULL, NULL, NULL, NULL, NULL, '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (180, '202006241155591473', '20200624115559174933', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市大兴区青云店镇大东园小区23号楼2单元201', '010-京', '010-京', '010-京', '', '010-京-0-3-大兴-43', '大兴', NULL, NULL, NULL, NULL, NULL, NULL, '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (181, '202006241155591473', '20200624115559130440', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市海淀区芙蓉里小区8号楼503', '010-京', '010-京', '010-京', '', '010-京-0-中关B80-09', '中关B80', NULL, '海淀', 'H5', '中关村', '10008014', '海淀区中关村营业部', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (182, '202006241155591473', '20200624115559131786', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市通州区东营前街11号楼341', '010-京', '010-京', '010-京', '', '010-京-0-新华T8-85', '新华T8', '通州本揽本投', '东区', 'D8', '翠屏南里', '10110064', '通州区新华营业部', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (183, '202006241155591473', '20200624115559109663', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市房山区燕山富燕一区10-2-603', '010-京', '010-京', '010-京', '', '010-京-0-迎风F4-10', '迎风F4', NULL, '西区', 'X4', '云岗', '10240018', '房山区迎风营业部', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');
INSERT INTO `tb_sorting_matching_info` VALUES (184, '202006241155591473', '20200624115559118948', '张三', '13800138000', NULL, '北京市', '北京市', NULL, '永安路121号', '张三', '13800138000', NULL, '北京市', NULL, NULL, '北京市朝阳区夏都盈座1号楼C单元1006', '010-京', '010-京', '010-京', '', '010-京-0-花家A102-11', '花家A102', NULL, '东区', 'D4', '花家地', '10010222', '朝阳区花家地营业部', '3', '岳翔', '2020-06-24 03:56:00', NULL, 1, 1, NULL, '2020-06-24 11:56:04', '2020-06-24 03:56:00');

-- ----------------------------
-- Table structure for tb_user_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_info`;
CREATE TABLE `tb_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `imei` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机串号',
  `mac` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'PC网卡地址',
  `status` int(1) NULL DEFAULT NULL COMMENT '用户状态:1生效，0失效',
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'token',
  `invalid_date` datetime(0) NULL DEFAULT NULL COMMENT 'token失效日期',
  `org_num` int(11) NULL DEFAULT NULL COMMENT '机构号',
  `org_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构名称',
  `remaining_sum` double(11, 2) NULL DEFAULT NULL COMMENT '余额',
  `project_base` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目归属地',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `role_id` bigint(11) NULL DEFAULT NULL COMMENT '角色id',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `receive1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_user_index`(`id`, `username`, `mobile`, `token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES (1, 'test', '123', '快乐', '13720975543', '123456', '11', 1, '8494907a-5c0a-4ecf-b277-513885e83fe0', '2020-09-05 00:00:00', NULL, NULL, 8306.30, NULL, NULL, NULL, '2020-07-05 23:56:36', '2020-06-04 22:23:40', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (2, 'shiyan', '123456', '世延', '18330297651', '864911032348602', NULL, 1, '2ff42645-5824-472f-a131-f38068a3df79', '2020-06-13 15:59:59', NULL, NULL, 9980.30, NULL, NULL, NULL, '2020-06-13 02:47:03', '2020-06-04 22:23:43', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (3, 'yuexiang', '123456', '岳翔', '18518266887', '5aa0ca9a85b2af2e', NULL, 1, 'c789bc97-3afb-447a-916a-1093e63ef9c9', '2020-06-28 15:59:59', NULL, NULL, 9425.10, NULL, NULL, NULL, '2020-06-28 14:27:22', '2020-06-04 22:23:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (4, 'tiankong', '123456', '天空', NULL, NULL, NULL, 1, NULL, '2020-06-05 00:00:00', NULL, NULL, 10.00, NULL, NULL, NULL, '2020-06-12 09:54:26', '2020-06-04 22:23:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (5, 'gaoguixi', '123456', '高贵玺', '13911629594', '860731044136785', NULL, 1, 'fe7fd902-fc01-4acb-80d7-654edf732d8f', '2020-06-26 15:59:59', NULL, NULL, 9.90, NULL, NULL, NULL, '2020-06-26 19:24:05', '2020-06-04 22:23:51', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (6, 'houjie', '123456', '侯杰', '18612683369', '866236044567470', NULL, 1, 'f9c323c8-d410-484a-9911-ad0e967dcedd', '2020-06-12 23:59:59', 10007515, '同城南区', 99.60, NULL, NULL, NULL, '2020-06-12 18:51:14', '2020-06-04 22:23:54', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (7, 'renxiyuan', '123456', '任喜缘', '13141417463', NULL, NULL, 1, NULL, '2020-06-05 00:00:00', NULL, NULL, 10.00, NULL, NULL, NULL, '2020-06-12 09:54:19', '2020-06-04 22:23:57', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (8, 'hanjun', '123456', '韩珺', '13911333928', '867788044120634', NULL, 1, '4e0b56f9-3fca-4055-a9da-b005b878b7a3', '2020-06-05 00:00:00', NULL, NULL, 10.00, NULL, NULL, NULL, '2020-06-12 09:54:17', '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (9, 'lushuang', '123456', '陆霜', '13910778442', '868078040794155', NULL, 1, 'f8fbf692-3cc9-434e-87d2-be299ef5ba1c', '2020-06-07 23:59:59', NULL, NULL, 100.00, NULL, NULL, NULL, '2020-06-07 10:00:51', '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (10, 'zhulei', '123456', '朱磊', '13910706388', NULL, NULL, 1, NULL, NULL, NULL, NULL, 100.00, NULL, NULL, NULL, NULL, '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (11, 'wangboyang', '123456', '王泊洋', '15901015572', NULL, NULL, 1, NULL, NULL, NULL, NULL, 100.00, NULL, NULL, NULL, '2020-06-12 10:11:59', '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (12, 'jiangjing', '123456', '姜靖', '18611382999', NULL, NULL, 1, NULL, NULL, 10000079, '同城职能', 100.00, NULL, NULL, NULL, NULL, '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (13, 'niujuncheng', '123456', '牛俊程', '15201581459', NULL, NULL, 1, NULL, NULL, 10000600, '西站信息局', 100.00, NULL, NULL, NULL, NULL, '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (14, 'yangxingwei', '123456', '杨兴威', '13601097718', NULL, NULL, 1, NULL, NULL, NULL, NULL, 100.00, NULL, NULL, NULL, NULL, '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (15, 'wangyanmin', '123456', '王彦敏', '18519364788', '861042049168735', NULL, 1, '027fb3d7-442f-49a4-b78b-a13e7d8f013a', '2020-06-12 23:59:59', NULL, NULL, 100.00, NULL, NULL, NULL, '2020-06-12 16:33:01', '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (16, 'haojinjie', '123456', '郝金捷', '13716071765', NULL, NULL, 1, NULL, '2020-06-13 15:59:59', 10230030, '门头沟区大峪营业部', 100.00, NULL, NULL, NULL, '2020-06-23 19:25:47', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (17, 'lihuaigang', '123456', '李怀刚', '13718141317', NULL, NULL, 1, NULL, NULL, 10000600, '西站信息局', 100.00, NULL, NULL, NULL, NULL, '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (18, '18.0', '123456', '刘会', '18301232060', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:25:49', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (19, '19.0', '123456', '梁旭', '13693309656', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:25:51', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (20, '20.0', '123456', '刘海军', '13552263105', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:25:53', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (21, '21.0', '123456', '梁超', '18519361203', '863639041927592', NULL, 1, 'be2f07d5-c8ce-4220-a069-20212d33d5c9', '2020-06-24 15:59:59', NULL, '同城东区', 99.20, NULL, NULL, NULL, '2020-06-24 14:46:21', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (22, '22.0', '123456', '黄全伟', '18519361805', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:25:57', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (23, '23.0', '123456', '穆建章', '18519361754', '862702038015036', NULL, 1, '45321100-08d3-4680-84ed-d58a3b0da538', '2020-06-25 15:59:59', NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-25 08:46:38', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (24, '24.0', '123456', '张阳光', '18519361802', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:01', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (25, '25.0', '123456', '史力宝', '18519361281', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:03', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (26, '26.0', '123456', '李忠奎', '18519368372', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:06', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (27, '27.0', '123456', '杨堆', '18519361272', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:08', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (28, '28.0', '123456', '魏银龙', '15801464853', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:10', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (29, '29.0', '123456', '郭婷婷', '15699952257', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:12', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (30, '30.0', '123456', '杨更斌', '18519361747', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:15', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (31, '31.0', '123456', '陈诗勤', '18519361412', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:18', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (32, '32.0', '123456', '张帅', '18519361158', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:20', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (33, '33.0', '123456', '赵允天', '18519361770', '862702038014062', NULL, 1, '823e925b-985b-44d5-b594-5238948bdfd7', '2020-06-26 15:59:59', NULL, '同城东区', 99.80, NULL, NULL, NULL, '2020-06-26 13:44:41', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (34, '34.0', '123456', '李宝', '18519362627', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:24', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (35, '35.0', '123456', '高磊', '13581619167', '863472047343055', NULL, 1, 'c12f6c58-5bc3-4f6a-8189-a20e7a1c3c68', '2020-06-28 15:59:59', NULL, '同城东区', 99.60, NULL, NULL, NULL, '2020-06-28 12:03:09', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (36, '36.0', '123456', '宋文昌', '13901240462', NULL, NULL, 1, NULL, NULL, NULL, '同城东区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:28', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (37, '37.0', '123456', '王灌楠', '13810559417', '864511045612281', NULL, 1, '3f5ffc82-1f0f-416e-ac2d-cbc296b38741', '2020-06-28 15:59:59', 10000079, '同城职能', 99.80, NULL, NULL, NULL, '2020-06-28 10:10:07', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (38, '38.0', '123456', '王顺超', '13701009074', NULL, NULL, 1, NULL, NULL, 10000079, '同城职能', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:32', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (39, '39.0', '123456', '袁勇', '18519364460', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:34', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (40, '40.0', '123456', '乔国栋', '18519364503', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:37', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (41, '41.0', '123456', '朱丽荣', '13301102986', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:39', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (42, '42.0', '123456', '王文鹏', '13121322533', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:42', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (43, '43.0', '123456', '刘毅', '13651150887', '9e2dee2dda38bb10', NULL, 1, 'e34f10a5-75b5-4ac1-942e-ecb1ef56a2e7', '2020-06-23 15:59:59', 10007515, '同城南区', 99.90, NULL, NULL, NULL, '2020-06-23 21:37:51', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (44, '44.0', '123456', '顾彤艳', '15010299964', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:47', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (45, '45.0', '123456', '王杰红', '18210936039', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:49', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (46, '46.0', '123456', '李俊兴', '18611730192', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:51', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (47, '47.0', '123456', '朱立超', '18519364713', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:53', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (48, '48.0', '123456', '于飞', '18519361235', NULL, NULL, 1, NULL, NULL, 10007515, '同城南区', 100.00, NULL, NULL, NULL, '2020-06-23 19:26:56', '2020-06-23 18:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (49, '49.0', '123456', '段芳芳', '18701470013', NULL, NULL, 1, NULL, NULL, NULL, NULL, 100.00, NULL, NULL, NULL, '2020-06-24 11:03:36', '2020-06-24 11:00:00', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (50, '50.0', '123456', '张铭珊', '17610512706', '08b40b6dc5f43816', NULL, 1, '7772c012-0987-480f-b5ee-365081889571', '2020-06-28 15:59:59', NULL, NULL, 99.90, NULL, NULL, NULL, '2020-06-28 20:41:47', '2020-06-25 21:48:00', NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
