/*
 Navicat Premium Data Transfer

 Source Server         : bjyx
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : 101.200.164.172:3306
 Source Schema         : bjyxquery

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 08/06/2020 01:33:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_export_info
-- ----------------------------
INSERT INTO `tb_export_info` VALUES (20, 1, 'shuju.xls_20200527235745.xlsx', 363, 354, 177.00, '2020-05-27 23:57:46', NULL);
INSERT INTO `tb_export_info` VALUES (21, 1, 'shuju.xls_20200527235804.xlsx', 363, 354, 177.00, '2020-05-27 23:58:05', NULL);
INSERT INTO `tb_export_info` VALUES (22, 1, 'shuju.xls_20200528003259.xlsx', 363, 354, 177.00, '2020-05-28 00:33:00', NULL);
INSERT INTO `tb_export_info` VALUES (23, 1, 'shuju.xls_20200528003649.xlsx', 363, 354, 177.00, '2020-05-28 00:36:49', NULL);
INSERT INTO `tb_export_info` VALUES (24, 1, 'shuju.xls_20200528003706.xlsx', 363, 354, 177.00, '2020-05-28 00:37:07', NULL);
INSERT INTO `tb_export_info` VALUES (25, 3, '888.xlsx_20200528004118.xlsx', 419, 408, 40.80, '2020-05-28 00:41:19', NULL);
INSERT INTO `tb_export_info` VALUES (26, 3, '999.xlsx_20200528004311.xlsx', 363, 354, 35.40, '2020-05-28 00:43:12', NULL);
INSERT INTO `tb_export_info` VALUES (27, 1, 'shuju.xls_20200528005139.xlsx', 363, 354, 177.00, '2020-05-28 00:51:40', NULL);
INSERT INTO `tb_export_info` VALUES (28, 1, 'shuju.xls_20200528012852.xlsx', 363, 354, 177.00, '2020-05-28 01:28:53', NULL);
INSERT INTO `tb_export_info` VALUES (29, 3, '999.xlsx_20200528013722.xlsx', 363, 354, 35.40, '2020-05-28 01:37:23', NULL);
INSERT INTO `tb_export_info` VALUES (30, 3, '999.xlsx_20200528013736.xlsx', 363, 354, 35.40, '2020-05-28 01:37:36', NULL);
INSERT INTO `tb_export_info` VALUES (31, 3, '999.xlsx_20200528013744.xlsx', 363, 354, 35.40, '2020-05-28 01:37:45', NULL);
INSERT INTO `tb_export_info` VALUES (32, 3, '999.xlsx_20200528013753.xlsx', 363, 354, 35.40, '2020-05-28 01:37:53', NULL);
INSERT INTO `tb_export_info` VALUES (33, 3, '999.xlsx_20200528013952.xlsx', 363, 354, 35.40, '2020-05-28 01:39:53', NULL);
INSERT INTO `tb_export_info` VALUES (34, 3, '999.xlsx_20200528013957.xlsx', 363, 354, 35.40, '2020-05-28 01:39:58', NULL);
INSERT INTO `tb_export_info` VALUES (35, 3, '999.xlsx_20200528014001.xlsx', 363, 354, 35.40, '2020-05-28 01:40:01', NULL);
INSERT INTO `tb_export_info` VALUES (36, 3, '999.xlsx_20200528014005.xlsx', 363, 354, 35.40, '2020-05-28 01:40:06', NULL);
INSERT INTO `tb_export_info` VALUES (37, 3, '999.xlsx_20200528014010.xlsx', 363, 354, 35.40, '2020-05-28 01:40:10', NULL);
INSERT INTO `tb_export_info` VALUES (38, 3, '888.xlsx_20200528150218.xlsx', 419, 408, 40.80, '2020-05-28 15:02:18', NULL);
INSERT INTO `tb_export_info` VALUES (39, 3, '888.xlsx_20200528154930.xlsx', 419, 408, 40.80, '2020-05-28 15:49:31', NULL);
INSERT INTO `tb_export_info` VALUES (40, 3, '888.xlsx_20200529171607.xlsx', 419, 408, 40.80, '2020-05-29 17:16:08', NULL);
INSERT INTO `tb_export_info` VALUES (41, 3, '888.xlsx_20200531182940.xlsx', 419, 408, 40.80, '2020-05-31 18:29:41', NULL);
INSERT INTO `tb_export_info` VALUES (42, 3, '87.xlsx_20200606015312.xlsx', 87, 83, 8.30, '2020-06-06 01:53:13', NULL);
INSERT INTO `tb_export_info` VALUES (43, 1, 'shuju.xls_20200606020406.xlsx', 363, 354, 177.00, '2020-06-06 02:04:06', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_price_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_price_info`;
CREATE TABLE `tb_price_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NULL DEFAULT NULL,
  `menu` int(11) NULL DEFAULT NULL COMMENT '菜单: 0:根据数据设备查询 1:匹配查询，2:地址查询，3:面单打印',
  `source` int(11) NULL DEFAULT NULL COMMENT '数据来源: 0:根据菜单查询 :1WEB，2APP，3接口',
  `price` double(11, 2) NULL DEFAULT NULL COMMENT '单价:元',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_price_info
-- ----------------------------
INSERT INTO `tb_price_info` VALUES (1, 1, 0, 1, 0.50);
INSERT INTO `tb_price_info` VALUES (2, 3, 1, 1, 0.10);
INSERT INTO `tb_price_info` VALUES (3, 2, 2, 1, 0.10);
INSERT INTO `tb_price_info` VALUES (4, 2, 1, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (5, 3, 1, 2, 0.01);
INSERT INTO `tb_price_info` VALUES (6, 5, 1, 2, 0.10);
INSERT INTO `tb_price_info` VALUES (7, 5, 1, 1, 0.30);
INSERT INTO `tb_price_info` VALUES (8, 9, 1, 2, 0.00);

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
) ENGINE = InnoDB AUTO_INCREMENT = 382 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_sorting_info
-- ----------------------------
INSERT INTO `tb_sorting_info` VALUES (1, 10002035, '朝阳北路分公司呼家楼营投部', '速呼家楼', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (2, 10002240, '大柳树分公司万达广场营投部', '京速万达', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (3, 10002522, '朝阳北路分公司姚家园营投部', '速姚家园', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (4, 10002733, '工体', 'A27', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (5, 10070005, '甜水园', 'A26', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (6, 10060003, '建国门投递部', '建国600', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (7, 10000358, '朝阳区寄递事业部向军里营业部', '朝阳向军', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (8, 10000434, '朝阳区寄递事业部慈云寺营业部', '朝阳慈云', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (9, 10002223, '大柳树分公司百子湾营运部', '百子湾速', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (10, 10012103, '大柳树区域双桥揽投部', '双桥揽投', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (11, 10010032, '朝阳区寄递事业部大郊亭营业部', '朝阳郊亭', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (12, 10002115, '大柳树分公司劲松营投部', '京速劲松', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (13, 10002314, '物流公司大柳树分公司翠城揽投部', '京速翠城', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (14, 10000088, '大柳树区分公司永安里揽投部', '速永安里', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (15, 10000099, '十里河揽投部', '十里河', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (16, 10000360, '朝阳区寄递事业部垡头营业部', '朝阳垡头', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (17, 10260039, '朝阳区分公司垡头邮政支局大宗组', '京23大', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (18, 10010222, '花家地营投部', '速花家地', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (19, 10070006, '望京分公司望京营运部', '京700望', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (20, 10012503, '农展', 'A125', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (21, 10002815, '望京分公司香河园营投部', '速香河园', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (22, 10002412, '大柳树分公司三间房营运部', '京速三间', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (23, 10012302, '朝阳北路分公司青年路营投部', '京速青年', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (24, 10000435, '朝阳区寄递事业部管庄营业部', '朝阳管庄', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (25, 10010031, '朝阳区寄递事业部石佛营营业部', '朝阳石佛', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (26, 10001805, '望京分公司东坝营投部', '京速东坝', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (27, 10130030, '顺义区速递分公司新顺分部', '顺速新顺', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (28, 10130032, '顺义分公司马坡拦投部', '京速马坡', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (29, 10131204, '顺义区速递分公司天竺分部', '顺速天竺', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (30, 10131806, '顺义区速递分公司空港营投部', '顺速空港', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (31, 10062106, '首都机场投递部', '机场621', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (32, 10130043, '顺义区寄递事业部杨镇揽投部', '杨镇营投', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (33, 10130069, '顺义区寄递事业部南法信营业部', '顺义南法', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (34, 10130070, '顺义区寄递事业部李桥营业部', '顺义李桥', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (35, 10111304, '通州分公司张家湾营投部', '京速通张', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (36, 10110204, '通州马驹桥揽投部', '马驹桥', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (37, 10000357, '朝阳区寄递事业部双合营业部', '朝阳双合', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (38, 10110063, '通州区寄递事业部台湖营业部', '通州台湖', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (39, 10110058, '通州区寄递事业部次渠营业部', '通州次渠', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (40, 10110065, '通州区寄递事业部永乐店营业部', '通州永乐', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (41, 10110060, '通州区寄递事业部郎府营业部', '通州郎府', '东区', '次渠', NULL, 'D7', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (42, 10110018, '通州分公司金鹰揽投部', '金鹰揽投', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (43, 10112602, '通州分公司翠屏南里营投部', '京速通翠', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (44, 10110015, '通州分公司潞城揽投部', '京速潞城', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (45, 10110064, '通州区寄递事业部新华营业部', '通州新华', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (46, 10110061, '通州区寄递事业部梨园营业部', '通州梨园', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (47, 10110066, '通州区寄递事业部运河营业部', '通州运河', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (48, 10110059, '通州区寄递事业部胡各庄营业部', '通州胡各', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (49, 10110062, '通州区寄递事业部宋庄营业部', '通州宋庄', '东区', '翠屏南里', NULL, 'D8', '通州本揽本投', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (50, 10000713, '安定门分公司北新桥营投部', '速北新桥', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (51, 10001208, '安定门分公司北苑营投部', '京速北苑', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (52, 10002917, '安定门分公司小关营运部', '京速小关', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (53, 10010127, '安定门分公司小营营投部', '京速小营', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (54, 10070007, '安定门', 'A11', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (55, 10001310, '和平里', 'A13', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (56, 10062110, '望京区域来广营揽投部', '来广营', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (57, 10010504, '安定门区域科学园', '科学园', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (58, 10010805, '朝阳区寄递事业部安贞营业部', '安贞揽投', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (59, 10000436, '朝阳区寄递事业部红军营营业部', '朝阳红军', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (60, 10008519, '上地分公司清河营投部', '京速清河', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (61, 10009612, '上地分公司育新花园营投部', '京速育新', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (62, 10040003, '上地分公司上地营运部', '京速上地', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (63, 10010026, '海淀区寄递事业部宝盛里营业部', '宝盛里', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (64, 10000350, '海淀区寄递事业部农大南路营业部', '农大南路', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (65, 10220015, '昌平区速递分公司科技园营投部', '速科技园', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (66, 10220609, '昌平区速递分公司沙河分部', '昌速沙河', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (67, 10220814, '昌平区寄递事业部回龙观营业部', '昌速旗舰', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (68, 10220910, '昌平区速递分公司东三旗分部', '速东三旗', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (69, 10220013, '政府街邮政支局投递组', '0-昌平', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (70, 10221813, '上地区域天通苑揽投部', '天通苑', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (71, 10220036, '昌平区寄递事业部西沙屯营业部', '京昌西沙', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (72, 10009411, '上帝分公司永丰营投部', '京速永丰', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (73, 10009508, '上地区域温泉揽投部', '温泉营投', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (74, 10000346, '海淀区寄递事业部西北旺营业部', '西北旺', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (75, 10010022, '海淀区寄递事业部苏家坨营业部', '苏家坨', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (76, 10002180, '北太平庄营投部', '京速北太', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (77, 10008014, '中关村分公司中关村营运部', '速中关村', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (78, 10008336, '海淀区寄递事业部保福寺营业部', '京速大运', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (79, 10008614, '中关村分公司双榆树营投部', '速双榆树', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (80, 10019103, '牡丹园分公司塔院营投部', '京速塔院', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (81, 10008338, '学院路', 'D83', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (82, 10008412, '清华', 'D84', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (83, 10008337, '海淀区寄递事业部二里庄营业部', '二里庄', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (84, 10040001, '海淀区寄递事业部文慧园营业部', '文慧园营', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (85, 10000344, '海淀区寄递事业部颐和园营业部', '颐和园', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (86, 10000433, '东城区寄递事业部光明楼营业部', '光明楼营', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (87, 10000438, '丰台区寄递事业部角门营业部', '丰台角门', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (88, 10000439, '丰台区寄递事业部开阳里营业部', '丰台开阳', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (89, 10005408, '丽泽桥分公司草桥欣园营运部', '京速草桥', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (90, 10005527, '丽泽桥分公司马连道营投部', '速马连道', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (91, 10006213, '永安路分公司花市营投部', '京速花市', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (92, 10050001, '永安路分公司牛街营运部', '京500牛', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (93, 10003122, '六部口', 'B31', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (94, 10005113, '天桥', 'C50', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (95, 10006807, '永安路区域四路通', '四路通营', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (96, 10001010, '物流公司金宝街分公司东四揽投部', '京速东四', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (97, 10001008, '张自忠路', 'A9', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (98, 10000616, '金宝街', 'A5', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (99, 10000618, '王府井', 'A6', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (100, 10010034, '大兴区寄递事业部博大街营业部', '大兴博大', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (101, 10010035, '大兴区寄递事业部南海家园营业部', '大兴南海', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (102, 10000352, '丰台区寄递事业部木樨园营业部', '木樨园', '南区', '东高地', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (103, 10007514, '大红门分公司海慧寺营运部', '京海彗速', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (104, 10007614, '海慧寺分公司旧宫营投部', '京速旧宫', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (105, 10016203, '海慧寺分公司西红门营投部', '速西红门', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (106, 10016403, '海慧寺分公司成寿寺营投部', '速成寿寺', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (107, 10017607, '亦庄分公司亦庄营运部', '亦庄速分', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (108, 10000322, '东高地营业部', '东高地营', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (109, 10000092, '速物海慧寺区域瀛海', '瀛海', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (110, 10260902, '大兴分公司医药基地营投部', '京速医药', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (111, 10262706, '大兴分公司大兴揽投部', '京速大兴', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (112, 10260004, '兴丰邮政支局投递组', '0-大兴', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (113, 10261204, '芦城', 'JD2', '南区', '兴政', NULL, 'N4', '非核心', NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (114, 10260018, '速物大兴兴政', '兴政', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (115, 10001702, '西城区中南海邮政支局中南海投递部', '中南海17', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (116, 10004114, '万寿路分公司金顶街营投部', '速金顶街', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (117, 10009308, '世纪城分公司香山营投部', '京速香山', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (118, 10080004, '万寿路分公司田村营运部', '京143投', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (119, 10004909, '万寿路分公司鲁谷营投部', '京速鲁谷', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (120, 10230805, '门头沟分公司门头沟揽投部', '京速门沟', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (121, 10003915, '海淀区寄递事业部永定路营业部', '永定路营', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (122, 10010024, '海淀区寄递事业部四季青营业部', '四季青', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (123, 10230030, '门头沟区寄递事业部大峪营业部', '门头大峪', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (124, 10000442, '石景山区寄递事业部高井营业部', '石景高井', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (125, 10000443, '石景山区寄递事业部新古城营业部', '石景新古', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (126, 10007015, '总部基地分公司芳菲路营投部', '京速芳菲', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (127, 10050002, '万丰路分公司西局欣园营运部', '京速程庄', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (128, 10007111, '总部基地分公司三路居营投部', '速三路居', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (129, 10007014, '永安路区域花乡揽投部', '花乡市场', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (130, 10000440, '丰台区寄递事业部科学城营业部', '科学城营', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (131, 10000437, '丰台区寄递事业部丰台营业部', '丰台营业', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (132, 10010036, '丰台区寄递事业部五里店营业部', '五里店营', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (133, 10004422, '阜成门分公司动物园营投部', '速动物园', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (134, 10003812, '三里河', 'B45', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (135, 10003508, '新街口', 'B34', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (136, 10003218, '西直门', 'B32', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (137, 10003814, '北蜂窝', 'B38', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (138, 10003721, '阜外', 'B37', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (139, 10000444, '西城区寄递事业部西四营业部', '西四营业', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (140, 10007013, '万丰路分公司云岗营投部', '京速云岗', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (141, 10240104, '房山分公司良乡营投部', '京速良乡', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (142, 10242503, '房山分公司房山揽投部', '京速房山', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (143, 10240204, '交道邮政支局投递组', '2-交道', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (144, 10248804, '良乡西路邮政支局投递组', '0-良西', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (145, 10240019, '房山区寄递事业部长阳营业部', '房山长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (146, 10240018, '房山区寄递事业部迎风营业部', '房山迎风', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (147, 10000441, '丰台区寄递事业部长辛店营业部', '丰台长辛', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (148, 10004804, '万寿路分公司紫竹院营投部', '速紫竹院', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (149, 10008115, '世纪城分公司魏公村营投部', '速魏公村', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (150, 10009708, '世纪城分公司世纪城营运部', '京速世分', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (151, 10080003, '万寿路分公司八宝庄营运部', '京800八', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (152, 10008910, '海淀区寄递事业部苏州街营业部', '速新起点', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (153, 10000348, '海淀区寄递事业部万寿路营业部', '万寿路', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (154, 10149902, '怀柔分公司怀柔揽投部', '京速怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (155, 10159901, '密云分公司密云揽投部', '京速密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (156, 10129901, '平谷分公司平谷揽投部', '京速平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (157, 10219901, '延庆分公司延庆揽投部', '京速延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (158, 10002707, '三源里投递部', '三源里27', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (159, 10112501, '富河园邮政所', '25-富河园', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (160, 10002207, '双井投递部', '双井22', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (161, 10002807, '香河园投递部', '香河园27', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (162, 10002109, '农光里投递部', '农光里21', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (163, 10002611, '水碓子投递部', '水碓子26', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (164, 10001801, '楼梓庄投递部', '楼梓庄18', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (165, 10110202, '通州商函处理中心', '京1105大', '东区', NULL, NULL, 'D0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (166, 10002507, '慈云寺投递部', '慈云寺25', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (167, 10002012, '呼家楼投递部', '呼家楼20', '东区', '甜水园', NULL, 'D1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (168, 10012401, '百子湾投递部', '百湾124', '东区', '百子湾', NULL, 'D2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (169, 10002307, '垡头投递部', '垡头23', '东区', '十里河', NULL, 'D3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (170, 10010212, '望京投递部', '望京106', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (171, 10001606, '酒仙桥投递部', '酒仙桥16', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (172, 10001504, '大山子投递部', '大山子16', '东区', '花家地', NULL, 'D4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (173, 10012301, '青年路投递部', '青年123', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (174, 10002406, '三间房投递部', '三间房24', '东区', '三间房', NULL, 'D5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (175, 10131803, '后沙峪邮政支局投递组', '18后沙', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (176, 10131701, '顺义区半壁店邮政支局', '17-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (177, 10131601, '南法信邮政所', '16-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (178, 10131301, '李遂邮政所', '13-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (179, 10131203, '天竺邮政支局投递组', '12天竺', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (180, 10130103, '牛栏山邮政支局投递组', '1-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (181, 10130027, '木林邮政支局投递部', '14-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (182, 10130020, '裕龙邮政所', '21-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (183, 10130015, '板桥邮政所', '22-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (184, 10130010, '马坡邮政所', '19-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (185, 10130002, '顺义区石园邮政支局', '20-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (186, 10130905, '杨各庄邮政支局投递组', '9-杨镇', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (187, 10130803, '大孙各庄邮政支局投递组', '8-杨镇', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (188, 10130701, '张各庄邮政所', '7-杨镇', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (189, 10130601, '龙湾屯邮政所', '6-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (190, 10130401, '李桥邮政所', '4-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (191, 10130301, '高丽营邮政所', '3-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (192, 10130023, '新顺邮政支局投递组', '0-顺义', '东区', '天竺', NULL, 'D6', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (193, 10110901, '马头邮政所', '9-永乐店', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (194, 10111201, '觅子店邮政所', '12-永乐店', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (195, 10110503, '永乐店邮政支局投递组', '5-永乐店', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (196, 10111401, '机场邮政所', '14-张家湾', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (197, 10111601, '台湖邮政所', '16-张家湾', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (198, 10110401, '牛堡屯邮政所', '4-张家湾', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (199, 10111303, '张家湾邮政支局投递组', '13-张家湾', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (200, 10110701, '甘棠邮政所', '7-郎府', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (201, 10110603, '西集邮政支局投递组', '6-郎府', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (202, 10110801, '郎府邮政所', '8-郎府', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (203, 10110301, '大杜社邮政所', '3-马桥', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (204, 10110203, '马驹桥邮政支局投递组', '2-马桥', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (205, 10111101, '次渠邮政所', '11-马桥', '东区', '次渠', NULL, 'D7', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (206, 10111802, '疃里邮政所', '29-宋庄', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (207, 10111901, '徐辛庄邮政所', '19-宋庄', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (208, 10111804, '宋庄邮政支局投递组', '18-宋庄', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (209, 10111701, '胡各庄邮政所', '17-胡庄', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (210, 10110107, '梨园邮政支局投递组', '21-梨园', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (211, 10110008, '新华大街邮政支局投递组', '0-通州', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (212, 10110109, '运河邮政支局投递组', '1-运河', '东区', '翠屏南里', NULL, 'D8', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (213, 10010109, '亚运村投递部', '亚运101', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (214, 10012001, '六铺炕投递部', '六铺炕11', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (215, 10001105, '安外投递部', '安外11', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (216, 10000905, '地安门投递部', '地安门9', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (217, 10221303, '十三陵邮政支局投递组', '13-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (218, 10221204, '兴寿邮政支局投递组', '12-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (219, 10221105, '小汤山邮政支局投递组', '11-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (220, 10220812, '龙锦苑邮政支局投递组', '8-龙锦', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (221, 10220607, '沙河邮政支局投递组', '6-沙河', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (222, 10220503, '阳坊邮政支局投递组', '5-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (223, 10220401, '西峰山邮政所', '4-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (224, 10220206, '南口邮政支局投递组', '2-昌平', '海淀', NULL, NULL, 'H0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (225, 10002914, '安贞投递部', '安贞29', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (226, 10001204, '北苑投递部', '北苑12', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (227, 10000704, '北新桥投递部', '北新桥7', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (228, 10001304, '和平里投递部', '和平里13', '海淀', '北苑', NULL, 'H1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (229, 10019201, '宝盛里投递部', '宝盛里192', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (230, 10019301, '农大南路投递部', '农大193', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (231, 10009606, '育新花园投递部', '育新96', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (232, 10008507, '清河投递部', '清河85', '海淀', '育新花园', NULL, 'H2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (233, 10221806, '天通西苑邮政支局投递组', '18-天通', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (234, 10220907, '东三旗邮政支局投递组', '9-东三', '海淀', '回龙观', NULL, 'H3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (235, 10009505, '温泉投递部', '温泉95', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (236, 10009406, '西北旺投递部', '西北旺94', '海淀', '屯佃', NULL, 'H4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (237, 10008403, '清华大学投递部', '清华84', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (238, 10019001, '保福寺投递部', '保福寺80', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (239, 10008006, '中关村投递部', '中关村80', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (240, 10009110, '颐和园投递部', '颐园193', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (241, 10008815, '北太平庄投递部', '北太平88', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (242, 10008314, '学院路投递部', '学院路83', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (243, 10008606, '双榆树投递部', '双榆树86', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (244, 10008203, '文慧园西路投递部', '文慧园88', '海淀', '中关村', NULL, 'H5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (245, 10007711, '西罗园投递部', '西罗园75', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (246, 10007903, '石榴庄投递部', '石榴庄79', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (247, 10007808, '方庄投递部', '方庄78', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (248, 10005305, '牛街投递部', '牛街53', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (249, 10005529, '广外商投中心', '商广安门', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (250, 10005116, '虎坊路商投分站', '商虎坊路', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (251, 10006105, '光明楼投递部', '光明楼61', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (252, 10006204, '东花市南里投递部', '东花市62', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (253, 10007607, '东高地投递部', '东高地76', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (254, 10006904, '开阳里投递部', '开阳里68', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (255, 10007509, '木樨园投递部', '木樨园75', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (256, 10006805, '角门投递部', '角门', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (257, 10005003, '永安路投递部', '50商虎坊', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (258, 10005405, '里仁街投递部', '54商广安', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (259, 10005204, '骡马市投递部', '52商虎坊', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (260, 10005506, '马连道投递部', '55商广安', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (261, 10003105, '西长安街投递部', '31商虎坊', '南区', '天桥', NULL, 'N1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (262, 10000107, '站商投中心', '商北京站', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (263, 10001003, '东四投递部', '东四10', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (264, 10000605, '王府井投递部', '王府井6', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (265, 10000508, '东单投递部', '东单5', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (266, 10000103, '建内大街投递部', '建内1', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (267, 10017602, '亦庄投递部', '亦庄176', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (268, 10016301, '旧宫投递部', '旧宫176', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (269, 10016201, '西红门投递部', '西红162', '南区', '旧宫', NULL, 'N3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (270, 10262901, '大兴区埝坛邮政支局', '29-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (271, 10262703, '兴华路邮政支局投递组', '27-兴华', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (272, 10261203, '芦城邮政支局投递组', '12-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (273, 10261101, '魏善庄邮政所', '11-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (274, 10260701, '安定邮政所', '7-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (275, 10260603, '采育邮政支局投递组', '6-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (276, 10260503, '青云店邮政支局投递组', '3-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (277, 10260401, '礼贤邮政所', '4-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (278, 10260203, '榆垡邮政支局投递组', '2-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (279, 10260104, '庞各庄邮政支局投递组', '1-大兴', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (280, 10262803, '邮政大兴区广茂大街投递组', '京广茂', '南区', '兴政', NULL, 'N4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (281, 10240003, '城关投递组', '99-城关', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (282, 10016101, '小井投递部', '小井161', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (283, 10007304, '太平桥投递部', '太平161', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (284, 10004011, '永乐商务投递中心', '伍芳园40', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (285, 10004002, '伍芳园投递部', '伍芳园40', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (286, 10244601, '官道邮政所', '46-良西', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (287, 10000313, '万丰路区域政务中心', '万丰路政', '西区', NULL, NULL, 'X0', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (288, 10004203, '高井投递部', '高井41', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (289, 10014301, '田村投递部', '田村143', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (290, 10019501, '四季青投递部', '四季195', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (291, 10009305, '香山投递部', '香山193', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (292, 10004304, '新古城投递部', '新古城40', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (293, 10004106, '金顶街投递部', '金顶街41', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (294, 10003906, '永定路投递部', '永定路39', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (295, 10230802, '石龙邮政支局投递部', '8-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (296, 10230503, '雁翅邮政支局投递部', '5-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (297, 10230401, '木城涧邮政所', '4-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (298, 10230301, '大台邮政所', '3-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (299, 10231101, '清水邮政所', '11-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (300, 10230903, '斋堂邮政支局投递组', '9-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (301, 10230103, '王平村邮政支局投递组', '1-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (302, 10230011, '大峪邮政支局投递组', '0-门头', '西区', '田村', NULL, 'X1', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (303, 10007017, '科学城投递部', '科学城70', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (304, 10016601, '五里店投递部', '五里166', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (305, 10007105, '丰台投递部', '丰台166', '西区', '程庄', NULL, 'X2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (306, 10004407, '西外大街投递部', '44商阜成', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (307, 10003723, '阜成门商投中心', '商阜成门', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (308, 10014001, '金融街邮局投递部', '金融街33', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (309, 10003807, '会城门投递部', '会城门36', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (310, 10003403, '西四投递部', '西四34', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (311, 10003209, '西单投递部', '西单32', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (312, 10003504, '新街口投递部', '新街口35', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (313, 10004509, '三里河投递部', '45商阜成', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (314, 10003709, '百万庄投递部', '37商阜成', '西区', '三里河', NULL, 'X3', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (315, 10240901, '张坊邮政所', '9-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (316, 10250201, '东风街所', '11-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (317, 10250003, '迎风街投递组', '10-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (318, 10240703, '长沟邮政支局投递组', '7-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (319, 10241303, '新镇邮政支局投递组', '13-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (320, 10241703, '河北邮政支局投递组', '17-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (321, 10242301, '韩村河邮政所', '23-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (322, 10242502, '星城投递组', '25-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (323, 10248807, '长阳投递部', '1-长阳', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (324, 10007402, '云岗投递部', '云岗74', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (325, 10007207, '长辛店投递部', '长辛店72', '西区', '云岗', NULL, 'X4', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (326, 10008904, '苏州街投递部', '苏州街80', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (327, 10008107, '魏公村投递部', '魏公村48', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (328, 10004801, '紫竹院投递部', '紫竹院48', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (329, 10009703, '世纪城投递部', '97投', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (330, 10003607, '万寿路投递部', '万寿路36', '西区', '八宝庄', NULL, 'X5', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (331, 10140301, '邮政怀柔区九渡河邮政所', '京怀九渡', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (332, 10141201, '邮政怀柔区长哨营邮政所', '京怀长哨', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (333, 10141401, '邮政怀柔区喇叭沟门邮政所', '京怀喇叭', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (334, 10140501, '渤海邮政所', '05-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (335, 10140901, '琉璃庙邮政所', '9-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (336, 10140801, '怀北庄邮政所', '8-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (337, 10140703, '雁栖邮政支局投递组', '7-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (338, 10140008, '北大街邮政支局投递组', '0-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (339, 10141602, '装指院邮政代办所', '16-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (340, 10141301, '七道河邮政所', '13-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (341, 10141105, '汤河口邮政支局投递组', '11-怀柔', '下沉', '怀柔', NULL, 'HR', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (342, 10150009, '密云县鼓楼大街邮政支局投递组', '99-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (343, 10151501, '密云县冯家峪邮政所', '15-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (344, 10151301, '密云县石城邮政所', '13-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (345, 10150601, '密云县新城子邮政所', '6-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (346, 10150501, '密云县东庄禾邮政所', '5-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (347, 10150301, '密云县北庄邮政所', '3-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (348, 10150901, '密云县西田各庄邮政所', '9-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (349, 10150007, '密云县康宝路邮政支局投递组', '0-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (350, 10151601, '密云县不老屯邮政所', '16-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (351, 10151201, '密云县溪翁庄邮政支局', '12-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (352, 10150801, '密云县古北口邮政所', '8-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (353, 10150701, '密云县高岭邮政所', '7-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (354, 10150401, '密云县太师屯邮政支局', '4-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (355, 10150201, '密云县大城子邮政所', '2-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (356, 10150101, '密云县塘子邮政支局', '1-密云', '下沉', '密云', NULL, 'MY', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (357, 10121501, '镇罗营邮政所', '15-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (358, 10121401, '马昌营邮政代办所', '14-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (359, 10121201, '南独乐河邮政所', '12-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (360, 10121101, '山东庄邮政代办所', '11-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (361, 10120901, '乐政务邮政代办所', '9-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (362, 10120705, '大华山邮政支局投递组', '7-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (363, 10120603, '峪口邮政支局投递组', '6-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (364, 10120503, '官庄邮政支局投递组', '5-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (365, 10120401, '马坊邮政所', '4-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (366, 10120301, '门楼庄投递组', '3-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (367, 10120201, '靠山集邮政所', '2-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (368, 10120103, '金海湖邮政支局投递组', '1-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (369, 10120008, '新平邮政支局投递组', '0-平谷', '下沉', '平谷', NULL, 'PG', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (370, 10210501, '邮政延庆区大井庄邮政所', '京延5', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (371, 10210601, '邮政延庆区大庄科邮政所', '京延6', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (372, 10210801, '延庆千家店', '08-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (373, 10210701, '延庆四海邮政所', '07-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (374, 10211203, '延庆八达岭投递部', '12-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (375, 10211501, '延庆县张山营邮政所', '15-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (376, 10210903, '延庆县旧县邮政支局投递组', '9-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (377, 10210404, '延庆县永宁邮政支局投递组', '4-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (378, 10210201, '延庆县西拨子邮政所', '2-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (379, 10210105, '延庆县康庄邮政支局投递组', '1-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (380, 10210010, '延庆县东外大街邮政支局投递组', '0-延庆', '下沉', '延庆', NULL, 'YQ', NULL, NULL, '北京', NULL, NULL, NULL, NULL);
INSERT INTO `tb_sorting_info` VALUES (381, 10000616, '东城区金宝街营业部', '金宝街营', '南区', '金宝街', NULL, 'N2', NULL, NULL, '北京', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_sorting_matching_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_sorting_matching_info`;
CREATE TABLE `tb_sorting_matching_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主建id',
  `batch_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批次号',
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
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
  `modify_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `receive1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive4` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `receive5` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_user_index`(`id`, `username`, `mobile`, `token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_info
-- ----------------------------
INSERT INTO `tb_user_info` VALUES (1, 'test', '123', '快乐', '13720975543', '123456', '11', 1, '8494907a-5c0a-4ecf-b277-513885e83fe0', '2020-06-05 00:00:00', NULL, NULL, 8584.00, NULL, NULL, '2020-06-06 02:04:06', '2020-06-04 22:23:40', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (2, 'shiyan', '123456', '世延', '18330297651', '864911032348602', NULL, 1, '2ff42645-5824-472f-a131-f38068a3df79', '2020-06-06 00:00:00', NULL, NULL, 9987.10, NULL, NULL, '2020-06-05 22:26:59', '2020-06-04 22:23:43', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (3, 'yuexiang', '123456', '岳翔', '18518266887', '4a74124bc44d5b53', NULL, 1, '55a2090e-78d4-4411-b1cf-869e1d096e00', '2020-06-07 23:59:59', NULL, NULL, 91.54, NULL, NULL, '2020-06-07 00:51:14', '2020-06-04 22:23:45', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (4, 'tiankong', '123456', NULL, NULL, NULL, NULL, 1, NULL, '2020-06-05 00:00:00', NULL, NULL, NULL, NULL, NULL, '2020-06-04 22:23:49', '2020-06-04 22:23:47', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (5, 'gaoguixi', '123456', '高贵玺', '13911629594', '860731044136785', NULL, 1, 'fe7fd902-fc01-4acb-80d7-654edf732d8f', '2020-06-07 23:59:59', NULL, NULL, 9.30, NULL, NULL, '2020-06-07 18:03:08', '2020-06-04 22:23:51', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (6, 'houjie', '123456', '侯杰', '18612683369', '866236044567470', NULL, 1, 'f9c323c8-d410-484a-9911-ad0e967dcedd', '2020-06-05 00:00:00', 10007515, '北京同城南区', NULL, NULL, NULL, '2020-06-04 22:23:55', '2020-06-04 22:23:54', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (7, 'renxiyuan', '123456', '任喜缘', '13141417463', NULL, NULL, 1, NULL, '2020-06-05 00:00:00', NULL, NULL, NULL, NULL, NULL, '2020-06-04 22:23:59', '2020-06-04 22:23:57', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (8, 'hanjun', '123456', '韩珺', '13911333928', '867788044120634', NULL, 1, '4e0b56f9-3fca-4055-a9da-b005b878b7a3', '2020-06-05 00:00:00', NULL, NULL, NULL, NULL, NULL, '2020-06-04 22:24:03', '2020-06-04 22:24:01', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `tb_user_info` VALUES (9, 'lushuang', '123456', '陆霜', '13910778442', '868078040794155', NULL, 1, 'f8fbf692-3cc9-434e-87d2-be299ef5ba1c', '2020-06-07 23:59:59', NULL, NULL, 100.00, NULL, NULL, '2020-06-07 10:00:51', NULL, NULL, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
