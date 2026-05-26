/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : chushi2

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 25/09/2025 22:36:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (6, 'book', '', NULL, NULL, 'Book', 'crud', 'com.ruoyi.system', 'system', 'book', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2099-01-01 17:53:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (32, '6', 'id', NULL, 'varchar(50)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2099-01-01 17:53:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '6', 'ISBN', NULL, 'varchar(50)', 'String', 'isbn', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2099-01-01 17:53:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '6', 'booktitle', '书名', 'varchar(50)', 'String', 'booktitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2099-01-01 17:53:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '6', 'subject', '科目', 'varchar(50)', 'String', 'subject', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2099-01-01 17:53:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '6', 'author', '作者', 'varchar(30)', 'String', 'author', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2099-01-01 17:53:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '6', 'press', '出版社', 'varchar(100)', 'String', 'press', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2099-01-01 17:53:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '6', 'publication_date', '出版日期', 'varchar(100)', 'String', 'publicationDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2099-01-01 17:53:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '6', 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2099-01-01 17:53:59', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2099-01-01 08:42:27', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2099-01-01 08:42:27', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2099-01-01 08:42:27', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2099-01-01 08:42:27', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2099-01-01 08:42:27', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '管理系统', 0, '管理员', '15888888888', 'guanliyuan@qq.com', '0', '0', 'admin', '2099-01-01 08:42:27', 'admin', '2025-09-22 23:41:50');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '系统管理', 1, '管理员', '15888888888', 'guanliyuan@qq.com', '0', '0', 'admin', '2099-01-01 08:42:27', 'admin', '2025-09-22 23:42:11');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2099-01-01 08:42:27', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '部门1', 1, 'bumen', '15888888888', 'bumen@qq.com', '0', '0', 'admin', '2099-01-01 08:42:27', 'admin', '2025-09-22 23:42:28');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '用户管理部门', 4, '用户', '15888888888', 'xuanchuan@qq.com', '0', '2', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 13:44:32');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '部门2', 2, 'bumen', '15888888888', 'bumen@qq.com', '0', '0', 'admin', '2099-01-01 08:42:27', 'admin', '2025-09-22 23:42:45');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '李帅', '15888888888', 'lishuai@qq.com', '0', '2', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 14:09:53');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2099-01-01 08:42:27', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2099-01-01 08:42:27', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2099-01-01 08:42:27', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2099-01-01 08:42:27', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 09:09:59');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2099-01-01 09:46:25');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2099-01-01 09:52:28');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 09:52:33');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 10:53:21');
INSERT INTO `sys_logininfor` VALUES (105, 'liyi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：liyi 不存在', '2099-01-01 10:53:28');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 10:53:35');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 11:00:43');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 11:00:46');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 11:47:34');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 13:57:00');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 15:03:31');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 16:05:15');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 16:40:03');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 17:50:03');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 17:50:25');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2099-01-01 08:53:31');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 08:53:34');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 12:39:02');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 13:33:30');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 13:34:52');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 13:34:56');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 16:38:18');
INSERT INTO `sys_logininfor` VALUES (123, 'lishuai', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2099-01-01 16:38:27');
INSERT INTO `sys_logininfor` VALUES (124, 'liyi', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：liyi 不存在', '2099-01-01 16:38:39');
INSERT INTO `sys_logininfor` VALUES (125, 'lishuai', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 16:38:49');
INSERT INTO `sys_logininfor` VALUES (126, 'lishuai', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 17:09:12');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 17:09:16');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 17:18:05');
INSERT INTO `sys_logininfor` VALUES (129, 'lishuai', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2099-01-01 17:18:13');
INSERT INTO `sys_logininfor` VALUES (130, 'lishuai', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 17:18:17');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2099-01-01 17:54:47');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 17:54:54');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 17:36:40');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2099-01-01 11:19:28');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 11:19:38');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '192.168.24.169', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 11:37:47');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 11:41:43');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 15:42:15');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 16:48:51');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 22:45:39');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 15:57:48');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 12:59:44');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 13:03:30');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 13:04:03');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2099-01-01 13:06:25');
INSERT INTO `sys_logininfor` VALUES (146, 'lishuai', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 13:06:31');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2099-01-01 13:43:38');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-22 12:37:23');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-22 13:21:29');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-22 21:43:31');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-22 22:29:24');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-22 23:41:11');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-22 23:52:00');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 13', 'Windows 10', '0', '登录成功', '2025-09-25 22:19:38');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2089 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2099-01-01 08:42:27', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2099-01-01 08:42:27', 'admin', '2025-09-22 12:49:05', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2099-01-01 08:42:27', 'admin', '2025-09-22 23:48:24', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2099-01-01 08:42:27', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 16:28:39', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2099-01-01 08:42:27', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2099-01-01 08:42:27', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 15:06:17', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '1', '0', 'system:dict:list', 'dict', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 15:07:07', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '1', '0', 'system:config:list', 'edit', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 15:06:04', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 15:06:24', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '1', '', 'log', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 15:06:28', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2099-01-01 08:42:27', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '1', '0', 'monitor:job:list', 'job', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 13:46:09', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '1', '0', 'monitor:druid:list', 'druid', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 13:46:13', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '1', '0', 'monitor:server:list', 'server', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 13:46:17', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '1', '0', 'monitor:cache:list', 'redis', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 13:46:21', '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '1', '0', 'monitor:cache:list', 'redis-list', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 13:46:25', '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 1, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 15:04:23', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2099-01-01 08:42:27', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 1, 'C', '1', '0', 'tool:swagger:list', 'swagger', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 13:01:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2099-01-01 08:42:27', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2099-01-01 08:42:27', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '模块管理', 0, 2, 'flight', NULL, NULL, 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2099-01-01 15:11:57', 'admin', '2025-09-22 13:22:06', '');
INSERT INTO `sys_menu` VALUES (2001, '模块信息', 2000, 1, 'flight', 'wenjian/flight/index', NULL, 1, 0, 'C', '0', '0', 'wenjian:flight:list', 'list', 'admin', '2099-01-01 15:12:55', 'admin', '2099-01-01 16:38:08', '');
INSERT INTO `sys_menu` VALUES (2002, '模块信息查询', 2001, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wenjian:flight:query', '#', 'admin', '2099-01-01 15:13:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '模块信息新增', 2001, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wenjian:flight:add', '#', 'admin', '2099-01-01 15:30:38', 'admin', '2099-01-01 15:32:54', '');
INSERT INTO `sys_menu` VALUES (2004, '模块信息修改', 2001, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wenjian:flight:edit', '#', 'admin', '2099-01-01 15:31:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '模块信息删除', 2001, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wenjian:filght:remove', '#', 'admin', '2099-01-01 15:31:59', 'admin', '2099-01-01 15:59:52', '');
INSERT INTO `sys_menu` VALUES (2006, '模块信息导出', 2001, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'wenjian:flight:export', '#', 'admin', '2099-01-01 15:32:36', 'admin', '2099-01-01 16:00:51', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2099-01-01 08:42:27', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2099-01-01 08:42:27', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 363 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2099-01-01 10:57:37');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'flight,fprice,journalism,activity,message', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 11:48:03');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2099-01-01 11:48:07');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"Activity\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":2,\"columnName\":\"title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Label\",\"columnComment\":\"标签\",\"columnId\":3,\"columnName\":\"label\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"label\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Atime\",\"columnComment\":\"发布时间\",\"columnId\":4,\"columnName\":\"atime\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"atime\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:00:52');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"flight\",\"className\":\"Flight\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键编号\",\"columnId\":8,\"columnName\":\"id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Ftype\",\"columnComment\":\"类型(单程/往返)\",\"columnId\":9,\"columnName\":\"ftype\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"ftype\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"StartSite\",\"columnComment\":\"开始地\",\"columnId\":10,\"columnName\":\"start_site\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"startSite\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"EndSite\",\"columnComment\":\"到达地\",\"columnId\":11,\"columnName\":\"end_site\",\"columnType\":\"varchar(20)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"endSite\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:01:40');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"activity\",\"className\":\"Activity\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2099-01-01 14:00:52\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":2,\"columnName\":\"title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2099-01-01 14:00:52\",\"usableColumn\":false},{\"capJavaField\":\"Label\",\"columnComment\":\"标签\",\"columnId\":3,\"columnName\":\"label\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"label\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2099-01-01 14:00:52\",\"usableColumn\":false},{\"capJavaField\":\"Atime\",\"columnComment\":\"发布时间\",\"columnId\":4,\"columnName\":\"atime\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:01:52');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"fprice\",\"className\":\"Fprice\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"FlightId\",\"columnComment\":\"航班编号\",\"columnId\":15,\"columnName\":\"flight_id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"flightId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Position\",\"columnComment\":\"票位\",\"columnId\":16,\"columnName\":\"position\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"position\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Fprice\",\"columnComment\":\"价格\",\"columnId\":17,\"columnName\":\"fprice\",\"columnType\":\"decimal(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"fprice\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:02:19');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"journalism\",\"className\":\"Journalism\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":18,\"columnName\":\"id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":19,\"columnName\":\"title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Label\",\"columnComment\":\"标签\",\"columnId\":20,\"columnName\":\"label\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"label\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Atime\",\"columnComment\":\"发布时间\",\"columnId\":21,\"columnName\":\"atime\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"atime\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"que', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:02:37');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"message\",\"className\":\"Message\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Title\",\"columnComment\":\"标题\",\"columnId\":26,\"columnName\":\"title\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"title\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Label\",\"columnComment\":\"标签\",\"columnId\":27,\"columnName\":\"label\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"label\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Atime\",\"columnComment\":\"发布时间\",\"columnId\":28,\"columnName\":\"atime\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 11:48:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"atime\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:02:57');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2099-01-01 14:03:03');
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"航空公司\",\"email\":\"lishuai@qq.com\",\"leader\":\"李帅\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:08:52');
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":101,\"deptName\":\"航空总公司\",\"email\":\"lishuai@qq.com\",\"leader\":\"李帅\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:09:12');
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2099-01-01 14:09:21');
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:09:24');
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2099-01-01 14:09:25');
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:09:28');
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:09:29');
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:09:33');
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":106,\"deptName\":\"财务部门\",\"email\":\"lishuai@qq.com\",\"leader\":\"李帅\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:09:53');
INSERT INTO `sys_oper_log` VALUES (119, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":105,\"deptName\":\"后勤部门\",\"email\":\"houqin@qq.com\",\"leader\":\"后勤\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:10:09');
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":104,\"deptName\":\"宣传部门\",\"email\":\"xuanchuan@qq.com\",\"leader\":\"宣传\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:10:51');
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":103,\"deptName\":\"售票部门\",\"email\":\"shoupiao@qq.com\",\"leader\":\"售票\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:11:38');
INSERT INTO `sys_oper_log` VALUES (122, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/3', '127.0.0.1', '内网IP', '{postIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:13:48');
INSERT INTO `sys_oper_log` VALUES (123, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/2', '127.0.0.1', '内网IP', '{postIds=2}', NULL, 1, '项目经理已分配,不能删除', '2099-01-01 14:13:52');
INSERT INTO `sys_oper_log` VALUES (124, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"flag\":false,\"params\":{},\"postCode\":\"se\",\"postId\":2,\"postName\":\"经理\",\"postSort\":\"2\",\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:14:13');
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"后勤部门\",\"leader\":\"后勤\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2099-01-01 08:42:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"lishuai\",\"params\":{},\"password\":\"\",\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:14:47');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:03:57');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tool/build/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"build\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":115,\"menuName\":\"表单构建\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"build\",\"perms\":\"tool:build:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:04:23');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tool/swagger/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"swagger\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":117,\"menuName\":\"系统接口\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":3,\"path\":\"swagger\",\"perms\":\"tool:swagger:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:04:28');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:05:49');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/config/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":106,\"menuName\":\"参数设置\",\"menuType\":\"C\",\"orderNum\":7,\"params\":{},\"parentId\":1,\"path\":\"config\",\"perms\":\"system:config:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:06:04');
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/post/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"post\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":104,\"menuName\":\"岗位管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":1,\"path\":\"post\",\"perms\":\"system:post:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:06:17');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notice/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"message\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":107,\"menuName\":\"通知公告\",\"menuType\":\"C\",\"orderNum\":8,\"params\":{},\"parentId\":1,\"path\":\"notice\",\"perms\":\"system:notice:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:06:24');
INSERT INTO `sys_oper_log` VALUES (133, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"log\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":108,\"menuName\":\"日志管理\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":1,\"path\":\"log\",\"perms\":\"\",\"query\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:06:29');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:06:55');
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dict/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":105,\"menuName\":\"字典管理\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":1,\"path\":\"dict\",\"perms\":\"system:dict:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:07:07');
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"textarea\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"flight\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:11:57');
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/flight/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班查询\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"flight\",\"perms\":\"wenjian:flight:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:12:55');
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"wenjian:flight:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:13:49');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"perms\":\"wenjian:flight:insert\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:30:38');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"wenjian:flight:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:31:41');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:31:59');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"perms\":\"wenjian:flight:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:32:36');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:30:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"航班信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:flight:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:32:54');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"journalism\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:37:04');
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:37:04\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"新闻管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"journalism\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:37:15');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:37:23');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/journalism/index\",\"createBy\":\"admin\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"journalism\",\"perms\":\"wenjian:journalism:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:38:36');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"perms\":\"wenjian:journalism:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:39:04');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻删除\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2007,\"perms\":\"wenjian:journalism:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:39:24');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2010', '127.0.0.1', '内网IP', '{menuId=2010}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:39:52');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻删除\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"perms\":\"wenjian:journalism:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:40:19');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"perms\":\"wenjian:journalism:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:40:49');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻修改\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2008,\"perms\":\"wenjian:journalism:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"新增菜单\'新闻修改\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2099-01-01 15:41:24');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻详情\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2008,\"perms\":\"wenjian:journalism:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:41:42');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:40:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"新闻修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"path\":\"\",\"perms\":\"wenjian:journalism:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:41:57');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新闻导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2008,\"perms\":\"wenjian:journalism:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:42:41');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"activity\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:43:49');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/activity/index\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"path\":\"activity\",\"perms\":\"wenjian:activity:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:44:37');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动信息导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"perms\":\"wenjian:activity:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:45:40');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2015,\"perms\":\"wenjian:activity:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:45:55');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动信息删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2015,\"perms\":\"wenjian:activity:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:46:09');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动信息修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"perms\":\"wenjian:activity:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:46:33');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2018', '127.0.0.1', '内网IP', '{menuId=2018}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:46:49');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2019', '127.0.0.1', '内网IP', '{menuId=2019}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:46:52');
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动信息新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"perms\":\"wenjian:activity:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:47:07');
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2016,\"perms\":\"wenjian:activity:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:47:31');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"活动信息详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2016,\"perms\":\"wenjian:activity:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:47:56');
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"留言管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"message\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:48:33');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/message/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"留言信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2024,\"path\":\"message\",\"perms\":\"wenjian:message:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:49:26');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"留言信息新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2025,\"perms\":\"wenjian:message:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:50:02');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"留言信息详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"perms\":\"wenjian:message:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:50:37');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"留言信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2025,\"perms\":\"wenjian:message:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:51:10');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"留言信息导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2025,\"perms\":\"wenjian:message:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:51:39');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"留言信息删除\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2025,\"perms\":\"wenjian:message:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:52:13');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/flight/index\",\"createTime\":\"2099-01-01 15:12:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"航班查询\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"flight\",\"perms\":\"wenjian:flight:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:59:07');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/journalism/index\",\"createTime\":\"2099-01-01 15:38:36\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"新闻信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"journalism\",\"perms\":\"wenjian:journalism:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:59:22');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:31:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"航班信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:filght:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:59:52');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:32:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"航班信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:flight:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:00:51');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/activity/index\",\"createTime\":\"2099-01-01 15:12:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"航班查询\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"flight\",\"perms\":\"wenjian:flight:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:02:07');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/journalism/index\",\"createTime\":\"2099-01-01 15:38:36\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"新闻信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"journalism\",\"perms\":\"wenjian:journalism:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:02:52');
INSERT INTO `sys_oper_log` VALUES (181, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"atime\":\"2023-02-08\",\"clevel\":\"1\",\"content\":\"<p>2</p>\",\"label\":\"2\",\"params\":{},\"title\":\"2\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [C:\\Users\\DELL\\Desktop\\xianyu\\项目\\航班\\flight\\ruoyi-admin\\target\\classes\\mapper\\wenjian\\JournalismMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.JournalismMapper.insertJournalism-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into journalism          ( title,             label,             atime,             content,                          clevel )           values ( ?,             ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2099-01-01 16:41:12');
INSERT INTO `sys_oper_log` VALUES (182, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"clevel\":\"2\",\"content\":\"<p>受冷空气影响，将会延迟飞行</p>\",\"id\":\"84951b04-05dc-4ab8-bb73-9c070f962ba8\",\"label\":\"飞行状况\",\"params\":{},\"title\":\"飞行或将遭遇冷空气受阻\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'id\' at row 1\r\n### The error may exist in file [C:\\Users\\DELL\\Desktop\\xianyu\\项目\\航班\\flight\\ruoyi-admin\\target\\classes\\mapper\\wenjian\\JournalismMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.JournalismMapper.insertJournalism-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into journalism          ( id,             title,             label,             atime,             content,                          clevel )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'id\' at row 1\n; Data truncation: Data too long for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'id\' at row 1', '2099-01-01 16:51:18');
INSERT INTO `sys_oper_log` VALUES (183, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"clevel\":\"2\",\"content\":\"<p>受冷空气影响，将会延迟飞行</p>\",\"id\":\"c6304e3e-f3db-4a32-9abf-8459c296387d\",\"label\":\"飞行状况\",\"params\":{},\"title\":\"飞行或将遭遇冷空气受阻\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'id\' at row 1\r\n### The error may exist in file [C:\\Users\\DELL\\Desktop\\xianyu\\项目\\航班\\flight\\ruoyi-admin\\target\\classes\\mapper\\wenjian\\JournalismMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.JournalismMapper.insertJournalism-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into journalism          ( id,             title,             label,             atime,             content,                          clevel )           values ( ?,             ?,             ?,             ?,             ?,                          ? )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'id\' at row 1\n; Data truncation: Data too long for column \'id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'id\' at row 1', '2099-01-01 16:51:43');
INSERT INTO `sys_oper_log` VALUES (184, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"clevel\":\"2\",\"content\":\"<p>受冷空气影响，将会延迟飞行</p>\",\"id\":\"efaae32f-33c0-4464-a16d-8cdadf5e88c0\",\"label\":\"飞行状况\",\"params\":{},\"title\":\"飞行或将遭遇冷空气受阻\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:53:35');
INSERT INTO `sys_oper_log` VALUES (185, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"clevel\":\"1\",\"content\":\"<p>1</p>\",\"id\":\"c292e640-f4f0-42fa-9492-d9a1b0c7e3c0\",\"label\":\"1\",\"params\":{},\"title\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:30:34');
INSERT INTO `sys_oper_log` VALUES (186, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"clevel\":\"3\",\"content\":\"<p>3</p>\",\"id\":\"c50e59b3-b185-4429-a73b-ed756a33223a\",\"label\":\"3\",\"params\":{},\"title\":\"32\"}', NULL, 1, 'String index out of range: 100', '2099-01-01 17:32:09');
INSERT INTO `sys_oper_log` VALUES (187, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"clevel\":\"2\",\"content\":\"<p\",\"id\":\"42c09424-6bcc-453e-937c-1414e604befe\",\"label\":\"2\",\"params\":{},\"title\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:33:16');
INSERT INTO `sys_oper_log` VALUES (188, 'journalism', 3, 'com.ruoyi.system.controller.JournalismController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/journalism/42c09424-6bcc-453e-937c-1414e604befe', '127.0.0.1', '内网IP', '{ids=42c09424-6bcc-453e-937c-1414e604befe}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:33:21');
INSERT INTO `sys_oper_log` VALUES (189, 'journalism', 3, 'com.ruoyi.system.controller.JournalismController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/journalism/c292e640-f4f0-42fa-9492-d9a1b0c7e3c0', '127.0.0.1', '内网IP', '{ids=c292e640-f4f0-42fa-9492-d9a1b0c7e3c0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:33:24');
INSERT INTO `sys_oper_log` VALUES (190, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"content\":\"<p\",\"id\":\"cfc5ebad-9dc5-43f5-a107-fd580fe2cd23\",\"label\":\"2\",\"params\":{},\"title\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:35:38');
INSERT INTO `sys_oper_log` VALUES (191, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"content\":\"<p>2\",\"id\":\"463b9f76-f9e7-45cb-9dfa-e35fa6cc63f5\",\"label\":\"2\",\"params\":{},\"title\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:38:01');
INSERT INTO `sys_oper_log` VALUES (192, 'journalism', 3, 'com.ruoyi.system.controller.JournalismController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/journalism/463b9f76-f9e7-45cb-9dfa-e35fa6cc63f5,cfc5ebad-9dc5-43f5-a107-fd580fe2cd23', '127.0.0.1', '内网IP', '{ids=463b9f76-f9e7-45cb-9dfa-e35fa6cc63f5,cfc5ebad-9dc5-43f5-a107-fd580fe2cd23}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:38:48');
INSERT INTO `sys_oper_log` VALUES (193, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"content\":\"33<\",\"id\":\"7cf31b3f-84b0-43d0-8bb0-672fcaad0df5\",\"params\":{},\"title\":\"饿\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:38:54');
INSERT INTO `sys_oper_log` VALUES (194, 'journalism', 3, 'com.ruoyi.system.controller.JournalismController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/journalism/7cf31b3f-84b0-43d0-8bb0-672fcaad0df5', '127.0.0.1', '内网IP', '{ids=7cf31b3f-84b0-43d0-8bb0-672fcaad0df5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:40:50');
INSERT INTO `sys_oper_log` VALUES (195, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"content\":\"嗯嗯\",\"id\":\"b641623a-684d-4436-be94-9c7b04368f4a\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:44:42');
INSERT INTO `sys_oper_log` VALUES (196, 'journalism', 3, 'com.ruoyi.system.controller.JournalismController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/journalism/b641623a-684d-4436-be94-9c7b04368f4a', '127.0.0.1', '内网IP', '{ids=b641623a-684d-4436-be94-9c7b04368f4a}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:44:45');
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/flight/index\",\"createTime\":\"2099-01-01 15:12:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"航班查询\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"flight\",\"perms\":\"wenjian:flight:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 08:56:05');
INSERT INTO `sys_oper_log` VALUES (198, 'activity', 1, 'com.ruoyi.system.controller.ActivityController.add()', 'POST', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"atime\":\"2023-02-25\",\"atype\":\"原创\",\"clevel\":\"3\",\"content\":\"<p>五一劳动节，五月一号到五月5号：五天假期经济舱打八折起售，尽请关注\",\"id\":\"cf4a4f87-d1a0-4967-b836-c86d43f2e060\",\"label\":\"优惠\",\"params\":{},\"title\":\"五一劳动节优惠票价\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:38:10');
INSERT INTO `sys_oper_log` VALUES (199, 'activity', 1, 'com.ruoyi.system.controller.ActivityController.add()', 'POST', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"content\":\"<p>\",\"id\":\"61df4d2b-f291-4d7b-a905-365bb0a88406\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:39:24');
INSERT INTO `sys_oper_log` VALUES (200, 'activity', 1, 'com.ruoyi.system.controller.ActivityController.add()', 'POST', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"content\":\"嗯嗯<\",\"id\":\"2fe618f2-973c-4c49-8f4d-ba4f9b2bfcc0\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:40:01');
INSERT INTO `sys_oper_log` VALUES (201, 'activity', 3, 'com.ruoyi.system.controller.ActivityController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/activity/2fe618f2-973c-4c49-8f4d-ba4f9b2bfcc0', '127.0.0.1', '内网IP', '{ids=2fe618f2-973c-4c49-8f4d-ba4f9b2bfcc0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:40:05');
INSERT INTO `sys_oper_log` VALUES (202, 'activity', 3, 'com.ruoyi.system.controller.ActivityController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/activity/61df4d2b-f291-4d7b-a905-365bb0a88406', '127.0.0.1', '内网IP', '{ids=61df4d2b-f291-4d7b-a905-365bb0a88406}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:40:07');
INSERT INTO `sys_oper_log` VALUES (203, 'activity', 1, 'com.ruoyi.system.controller.ActivityController.add()', 'POST', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"content\":\"呃呃呃\",\"id\":\"55b85aab-762b-42e4-8432-706d97fc9bd1\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:40:43');
INSERT INTO `sys_oper_log` VALUES (204, 'activity', 3, 'com.ruoyi.system.controller.ActivityController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/activity/55b85aab-762b-42e4-8432-706d97fc9bd1', '127.0.0.1', '内网IP', '{ids=55b85aab-762b-42e4-8432-706d97fc9bd1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:40:55');
INSERT INTO `sys_oper_log` VALUES (205, 'activity', 1, 'com.ruoyi.system.controller.ActivityController.add()', 'POST', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"content\":\"1\",\"id\":\"84128cbc-2d8d-430f-be72-a347374592a3\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:42:35');
INSERT INTO `sys_oper_log` VALUES (206, 'activity', 2, 'com.ruoyi.system.controller.ActivityController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"content\":\"<p>12</p>\",\"id\":\"84128cbc-2d8d-430f-be72-a347374592a3\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:42:39');
INSERT INTO `sys_oper_log` VALUES (207, 'activity', 3, 'com.ruoyi.system.controller.ActivityController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/activity/84128cbc-2d8d-430f-be72-a347374592a3', '127.0.0.1', '内网IP', '{ids=84128cbc-2d8d-430f-be72-a347374592a3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:42:43');
INSERT INTO `sys_oper_log` VALUES (208, 'activity', 2, 'com.ruoyi.system.controller.ActivityController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"atime\":\"2023-02-25\",\"atype\":\"原创\",\"clevel\":\"3\",\"content\":\"五一劳动节，五月一号到五月5号：五天假期经济舱打八折起售，尽请关注呃呃呃\",\"id\":\"cf4a4f87-d1a0-4967-b836-c86d43f2e060\",\"label\":\"优惠\",\"params\":{},\"title\":\"五一劳动节优惠票价\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:46:09');
INSERT INTO `sys_oper_log` VALUES (209, 'activity', 2, 'com.ruoyi.system.controller.ActivityController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"atime\":\"2023-02-25\",\"atype\":\"原创\",\"clevel\":\"3\",\"content\":\"五一劳动节，五月一号到五月5号：五天假期经济舱打八折起售，尽请关注……\",\"id\":\"cf4a4f87-d1a0-4967-b836-c86d43f2e060\",\"label\":\"优惠\",\"params\":{},\"title\":\"五一劳动节优惠票价\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:46:19');
INSERT INTO `sys_oper_log` VALUES (210, 'message', 1, 'com.ruoyi.system.controller.MessageController.add()', 'POST', 1, 'admin', NULL, '/wenjian/message', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"atype\":\"原创\",\"clevel\":\"2\",\"content\":\"于2023.02.10 10:00:00 在航空一楼捡到身份证李某帅 身份证号码是371421*********88 ,请失主到航空办理处前台领取。\",\"id\":\"4a43dae6-1935-4c27-b8e6-830ddf232230\",\"label\":\"丢失\",\"params\":{},\"title\":\"身份证丢失招领\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:53:25');
INSERT INTO `sys_oper_log` VALUES (211, 'message', 2, 'com.ruoyi.system.controller.MessageController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/message', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"atype\":\"原创\",\"clevel\":\"2\",\"content\":\"于2023.02.10 10:00:00 在航空一楼捡到身份证李某帅 身份证号码是371421*********88 ,请失主到航空办理处前台领取。\",\"id\":\"4a43dae6-1935-4c27-b8e6-830ddf232230\",\"label\":\"丢失\",\"params\":{},\"title\":\"身份证丢失招领\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:54:16');
INSERT INTO `sys_oper_log` VALUES (212, 'journalism', 1, 'com.ruoyi.system.controller.JournalismController.add()', 'POST', 1, 'admin', NULL, '/wenjian/journalism', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"atype\":\"原创\",\"clevel\":\"3\",\"content\":\"近日因雾霾天气受阻，于2023.2.10日上午8点延迟一小时飞行，尽情谅解……\",\"id\":\"1097fd7a-b88f-4b8f-804a-de49ce0a4483\",\"label\":\"雾霾、影响\",\"params\":{},\"title\":\"雾霾影响飞行\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 09:56:42');
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 10:02:00');
INSERT INTO `sys_oper_log` VALUES (214, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"南京东\",\"endTime\":\"2023-02-11\",\"ftype\":\"单程\",\"id\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"params\":{},\"startSite\":\"北京东\",\"startTime\":\"2099-01-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 10:16:31');
INSERT INTO `sys_oper_log` VALUES (215, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"qq\",\"endTime\":\"2023-03-15T16:00:00.000Z\",\"ftype\":\"单程\",\"id\":\"a3ad56a7-f914-43e1-95b4-ee6a9d2f931d\",\"params\":{},\"startSite\":\"qq\",\"startTime\":\"2099-01-01T16:01:00.000Z\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 10:50:09');
INSERT INTO `sys_oper_log` VALUES (216, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-03-14T16:00:00.000Z\",\"id\":\"35ec8d30-5bef-4cd1-8089-593fa5ff5081\",\"params\":{},\"startTime\":\"2023-03-14T16:00:00.000Z\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 10:52:23');
INSERT INTO `sys_oper_log` VALUES (217, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-03-14T16:00:00.000Z\",\"id\":\"3ef361e0-b205-4965-ae89-2ccbe9ab7213\",\"params\":{},\"startTime\":\"2023-03-14T16:00:00.000Z\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 10:53:41');
INSERT INTO `sys_oper_log` VALUES (218, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-03-22 00:00:00\",\"id\":\"f7ab13fc-73fc-4f93-bf8a-3020183c819c\",\"params\":{},\"startTime\":\"2023-01-31 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 10:54:10');
INSERT INTO `sys_oper_log` VALUES (219, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-03-24 11:05:00\",\"id\":\"074c25b2-31b7-4b44-bb29-59c67a94c94c\",\"params\":{},\"startTime\":\"2023-03-24 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 11:08:41');
INSERT INTO `sys_oper_log` VALUES (220, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"2023-03-16 00:39:01\",\"id\":\"62d68fa4-2050-4c07-ae55-fd296a30aad9\",\"params\":{},\"startTime\":\"2099-01-01 00:01:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 11:09:55');
INSERT INTO `sys_oper_log` VALUES (221, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"北京西\",\"endTime\":\"2099-01-01 11:00:00\",\"ftype\":\"单程\",\"id\":\"c31fb74a-4344-4656-8055-eee246bde830\",\"params\":{},\"startSite\":\"上海\",\"startTime\":\"2099-01-01 03:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 11:16:50');
INSERT INTO `sys_oper_log` VALUES (222, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/62d68fa4-2050-4c07-ae55-fd296a30aad9,f7ab13fc-73fc-4f93-bf8a-3020183c819c,074c25b2-31b7-4b44-bb29-59c67a94c94c', '127.0.0.1', '内网IP', '{ids=62d68fa4-2050-4c07-ae55-fd296a30aad9,f7ab13fc-73fc-4f93-bf8a-3020183c819c,074c25b2-31b7-4b44-bb29-59c67a94c94c}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 11:16:55');
INSERT INTO `sys_oper_log` VALUES (223, 'flight', 2, 'com.ruoyi.system.controller.FlightController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"北京西\",\"endTime\":\"2099-01-01 11:00:00\",\"ftype\":\"单程\",\"id\":\"c31fb74a-4344-4656-8055-eee246bde830\",\"params\":{},\"startSite\":\"上海东\",\"startTime\":\"2099-01-01 03:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 11:17:06');
INSERT INTO `sys_oper_log` VALUES (224, 'flight', 2, 'com.ruoyi.system.controller.FlightController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"南京东\",\"endTime\":\"2099-01-01 03:00:00\",\"ftype\":\"单程\",\"id\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"params\":{},\"startSite\":\"北京东\",\"startTime\":\"2099-01-01 01:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 11:24:06');
INSERT INTO `sys_oper_log` VALUES (225, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"ftype\":\"单程\",\"id\":\"64d95d9a-2289-4500-becd-6545e6d9d35b\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:51:00');
INSERT INTO `sys_oper_log` VALUES (226, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/64d95d9a-2289-4500-becd-6545e6d9d35b', '127.0.0.1', '内网IP', '{ids=64d95d9a-2289-4500-becd-6545e6d9d35b}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:51:06');
INSERT INTO `sys_oper_log` VALUES (227, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"ftype\":\"单程\",\"id\":\"454f520f-1800-489d-8c79-b716a1f375a6\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:51:37');
INSERT INTO `sys_oper_log` VALUES (228, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/454f520f-1800-489d-8c79-b716a1f375a6', '127.0.0.1', '内网IP', '{ids=454f520f-1800-489d-8c79-b716a1f375a6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:51:46');
INSERT INTO `sys_oper_log` VALUES (229, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"ftype\":\"单程\",\"id\":\"c184cc34-6bed-48b7-bce1-504d61c80b43\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:52:43');
INSERT INTO `sys_oper_log` VALUES (230, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"ftype\":\"单程\",\"id\":\"ebd54397-2faa-4e50-a7fb-6aa2da1ae5dd\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:52:51');
INSERT INTO `sys_oper_log` VALUES (231, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"ftype\":\"往返\",\"id\":\"f0cb5a93-8a58-4baa-89b5-9a53de22e984\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:54:03');
INSERT INTO `sys_oper_log` VALUES (232, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/c184cc34-6bed-48b7-bce1-504d61c80b43,ebd54397-2faa-4e50-a7fb-6aa2da1ae5dd,f0cb5a93-8a58-4baa-89b5-9a53de22e984', '127.0.0.1', '内网IP', '{ids=c184cc34-6bed-48b7-bce1-504d61c80b43,ebd54397-2faa-4e50-a7fb-6aa2da1ae5dd,f0cb5a93-8a58-4baa-89b5-9a53de22e984}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:54:22');
INSERT INTO `sys_oper_log` VALUES (233, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"fprice\":11,\"params\":{},\"position\":\"1\"},\"ftype\":\"单程\",\"id\":\"1d9442fd-f5df-409e-823e-e2a1107cc254\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:57:57');
INSERT INTO `sys_oper_log` VALUES (234, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"fprice\":555,\"params\":{},\"position\":\"1\"},\"fprice2\":{\"fprice\":222,\"params\":{},\"position\":\"2\"},\"fprice3\":{\"params\":{}},\"ftype\":\"单程\",\"id\":\"db61dae4-0bc2-4456-b02c-a24910ecc69a\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:00:56');
INSERT INTO `sys_oper_log` VALUES (235, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"fprice\":555,\"params\":{},\"position\":\"1\"},\"fprice2\":{\"fprice\":222,\"params\":{},\"position\":\"2\"},\"fprice3\":{\"params\":{}},\"ftype\":\"单程\",\"id\":\"dca14297-cf98-4253-84ed-d8c68c3e3596\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:02:38');
INSERT INTO `sys_oper_log` VALUES (236, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"fprice\":555,\"params\":{},\"position\":\"1\"},\"fprice2\":{\"fprice\":222,\"params\":{},\"position\":\"2\"},\"fprice3\":{\"params\":{}},\"ftype\":\"单程\",\"id\":\"fe872870-4149-4967-860a-b8bd84c05384\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:10:31');
INSERT INTO `sys_oper_log` VALUES (237, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"1751bfe8-bc0a-43f5-a385-23a3ff26845b\",\"fprice\":22,\"id\":\"01041876-c223-4ea3-ac59-1bd9172974b5\",\"params\":{},\"position\":\"1\"},\"fprice2\":{\"flightId\":\"1751bfe8-bc0a-43f5-a385-23a3ff26845b\",\"fprice\":22,\"id\":\"f13b7a86-8648-4f55-8e1e-b0a02743dc93\",\"params\":{},\"position\":\"2\"},\"fprice3\":{\"params\":{}},\"ftype\":\"单程\",\"id\":\"1751bfe8-bc0a-43f5-a385-23a3ff26845b\",\"params\":{},\"startSite\":\"2\",\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:15:10');
INSERT INTO `sys_oper_log` VALUES (238, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/1d9442fd-f5df-409e-823e-e2a1107cc254,dca14297-cf98-4253-84ed-d8c68c3e3596,db61dae4-0bc2-4456-b02c-a24910ecc69a,fe872870-4149-4967-860a-b8bd84c05384', '127.0.0.1', '内网IP', '{ids=1d9442fd-f5df-409e-823e-e2a1107cc254,dca14297-cf98-4253-84ed-d8c68c3e3596,db61dae4-0bc2-4456-b02c-a24910ecc69a,fe872870-4149-4967-860a-b8bd84c05384}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:15:44');
INSERT INTO `sys_oper_log` VALUES (239, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/1751bfe8-bc0a-43f5-a385-23a3ff26845b', '127.0.0.1', '内网IP', '{ids=1751bfe8-bc0a-43f5-a385-23a3ff26845b}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:15:48');
INSERT INTO `sys_oper_log` VALUES (240, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"c4aa5bbc-e38a-4669-b01c-58bc0889d5fe\",\"fprice\":1,\"id\":\"05b91402-e26e-4e78-8092-9a31dfb5e395\",\"params\":{},\"position\":\"1\"},\"fprice2\":{\"flightId\":\"c4aa5bbc-e38a-4669-b01c-58bc0889d5fe\",\"fprice\":2,\"id\":\"ad608686-7e06-4594-a2db-346bbef07224\",\"params\":{},\"position\":\"2\"},\"fprice3\":{\"params\":{}},\"ftype\":\"单程\",\"id\":\"c4aa5bbc-e38a-4669-b01c-58bc0889d5fe\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 14:16:03');
INSERT INTO `sys_oper_log` VALUES (241, 'flight', 2, 'com.ruoyi.system.controller.FlightController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"c4aa5bbc-e38a-4669-b01c-58bc0889d5fe\",\"fprice\":1,\"id\":\"18a2f10e-d400-4e84-9966-f7615a156258\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"c4aa5bbc-e38a-4669-b01c-58bc0889d5fe\",\"fprice\":2,\"id\":\"07f8f93e-6343-454c-8402-96b71fd5da3b\",\"params\":{},\"position\":\"商务舱\"},\"fprice3\":{\"flightId\":\"c4aa5bbc-e38a-4669-b01c-58bc0889d5fe\",\"fprice\":12,\"id\":\"56c6fd79-cca3-4750-81e9-0c37d4753f02\",\"params\":{},\"position\":\"头等舱\"},\"ftype\":\"单程\",\"id\":\"c4aa5bbc-e38a-4669-b01c-58bc0889d5fe\",\"params\":{},\"startSite\":\"12\",\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:20:18');
INSERT INTO `sys_oper_log` VALUES (242, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/c4aa5bbc-e38a-4669-b01c-58bc0889d5fe', '127.0.0.1', '内网IP', '{ids=c4aa5bbc-e38a-4669-b01c-58bc0889d5fe}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:20:35');
INSERT INTO `sys_oper_log` VALUES (243, 'flight', 2, 'com.ruoyi.system.controller.FlightController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"南京东\",\"endTime\":\"2099-01-01 03:00:00\",\"fprice\":{\"flightId\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"fprice\":123,\"id\":\"a2402506-c3b6-4284-9bd6-9c601f8c458d\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"fprice\":1322,\"id\":\"f7d1ec3f-7a7c-4096-af08-63bd11092b0d\",\"params\":{},\"position\":\"商务舱\"},\"fprice3\":{\"flightId\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"id\":\"816f67af-7039-47df-9fca-03ba6f232147\",\"params\":{},\"position\":\"\"},\"ftype\":\"单程\",\"id\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"params\":{},\"startSite\":\"北京东\",\"startTime\":\"2099-01-01 01:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:25:17');
INSERT INTO `sys_oper_log` VALUES (244, 'flight', 2, 'com.ruoyi.system.controller.FlightController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"北京西\",\"endTime\":\"2099-01-01 11:00:00\",\"fprice\":{\"flightId\":\"c31fb74a-4344-4656-8055-eee246bde830\",\"fprice\":323,\"id\":\"06214156-5325-4f45-b7aa-4043447cea14\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"c31fb74a-4344-4656-8055-eee246bde830\",\"id\":\"4ff914ad-35eb-481d-a2ec-ac9e1ae4867f\",\"params\":{},\"position\":\"\"},\"fprice3\":{\"flightId\":\"c31fb74a-4344-4656-8055-eee246bde830\",\"id\":\"80567b7e-472b-47a1-8627-81dbbb665ca5\",\"params\":{},\"position\":\"\"},\"ftype\":\"单程\",\"id\":\"c31fb74a-4344-4656-8055-eee246bde830\",\"params\":{},\"startSite\":\"上海东\",\"startTime\":\"2099-01-01 03:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:38:22');
INSERT INTO `sys_oper_log` VALUES (245, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"e14fba93-da8d-4b3e-a1ea-6a1981d28242\",\"fprice\":32423,\"id\":\"e836d189-8e95-4a50-9b61-ce5eff9e1df9\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"e14fba93-da8d-4b3e-a1ea-6a1981d28242\",\"fprice\":234,\"id\":\"b5dded13-5d44-4df2-bd1e-1f34cfe95227\",\"params\":{},\"position\":\"商务舱\"},\"fprice3\":{\"flightId\":\"e14fba93-da8d-4b3e-a1ea-6a1981d28242\",\"fprice\":234,\"id\":\"061afd9b-2644-41bc-97f0-e2851fef0fc9\",\"params\":{},\"position\":\"头等舱\"},\"id\":\"e14fba93-da8d-4b3e-a1ea-6a1981d28242\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:38:39');
INSERT INTO `sys_oper_log` VALUES (246, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/e14fba93-da8d-4b3e-a1ea-6a1981d28242', '127.0.0.1', '内网IP', '{ids=e14fba93-da8d-4b3e-a1ea-6a1981d28242}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:38:47');
INSERT INTO `sys_oper_log` VALUES (247, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"679dd01e-eacd-43e3-bf4c-3c701bb67d4b\",\"fprice\":123123,\"id\":\"085c3a42-6a63-476e-9b08-e20a29076968\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"679dd01e-eacd-43e3-bf4c-3c701bb67d4b\",\"id\":\"31eb9836-d762-41ad-8ee4-41409d870d65\",\"params\":{},\"position\":\"\"},\"fprice3\":{\"flightId\":\"679dd01e-eacd-43e3-bf4c-3c701bb67d4b\",\"id\":\"0e4267ba-43a4-4afa-9001-16727f35c7ca\",\"params\":{},\"position\":\"\"},\"id\":\"679dd01e-eacd-43e3-bf4c-3c701bb67d4b\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:39:12');
INSERT INTO `sys_oper_log` VALUES (248, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/679dd01e-eacd-43e3-bf4c-3c701bb67d4b', '127.0.0.1', '内网IP', '{ids=679dd01e-eacd-43e3-bf4c-3c701bb67d4b}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:39:35');
INSERT INTO `sys_oper_log` VALUES (249, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"2a396167-2658-455e-b1bb-fca392dfd199\",\"fprice\":23,\"id\":\"cc11bba3-b5b7-43de-803c-2b690cace508\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"2a396167-2658-455e-b1bb-fca392dfd199\",\"id\":\"05988663-2f39-4d3b-b534-a618be07aaff\",\"params\":{},\"position\":\"\"},\"fprice3\":{\"flightId\":\"2a396167-2658-455e-b1bb-fca392dfd199\",\"id\":\"57ec4a9c-21be-47b9-b5f0-4fa9749f2727\",\"params\":{},\"position\":\"\"},\"id\":\"2a396167-2658-455e-b1bb-fca392dfd199\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:39:42');
INSERT INTO `sys_oper_log` VALUES (250, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/2a396167-2658-455e-b1bb-fca392dfd199', '127.0.0.1', '内网IP', '{ids=2a396167-2658-455e-b1bb-fca392dfd199}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:40:01');
INSERT INTO `sys_oper_log` VALUES (251, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"6cd4906b-8355-4a40-bd96-89e329317b87\",\"fprice\":333,\"id\":\"ac997b03-eb14-46a6-aa33-43fe365ab4e3\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"6cd4906b-8355-4a40-bd96-89e329317b87\",\"id\":\"a7cfb069-f76b-48e0-b759-00403ca9ca43\",\"params\":{},\"position\":\"\"},\"fprice3\":{\"flightId\":\"6cd4906b-8355-4a40-bd96-89e329317b87\",\"id\":\"80097305-2eb0-4f21-a858-5ed9050a9bc4\",\"params\":{},\"position\":\"\"},\"id\":\"6cd4906b-8355-4a40-bd96-89e329317b87\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 15:42:52');
INSERT INTO `sys_oper_log` VALUES (252, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/6cd4906b-8355-4a40-bd96-89e329317b87', '127.0.0.1', '内网IP', '{ids=6cd4906b-8355-4a40-bd96-89e329317b87}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:01:15');
INSERT INTO `sys_oper_log` VALUES (253, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"12e6c80a-58b5-46fe-ad51-6a52e2502506\",\"fprice\":123,\"id\":\"e611b8e9-ac22-4847-9bc3-b4ae29ff599b\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"12e6c80a-58b5-46fe-ad51-6a52e2502506\",\"id\":\"a981fe11-dc21-4ae6-85ab-ea8984944c6f\",\"params\":{},\"position\":\"\"},\"fprice3\":{\"flightId\":\"12e6c80a-58b5-46fe-ad51-6a52e2502506\",\"id\":\"eff12284-e15c-442e-ac7a-91be8d70c062\",\"params\":{},\"position\":\"\"},\"id\":\"12e6c80a-58b5-46fe-ad51-6a52e2502506\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:01:32');
INSERT INTO `sys_oper_log` VALUES (254, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/12e6c80a-58b5-46fe-ad51-6a52e2502506', '127.0.0.1', '内网IP', '{ids=12e6c80a-58b5-46fe-ad51-6a52e2502506}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:03:17');
INSERT INTO `sys_oper_log` VALUES (255, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"cd20af91-8b22-4c1f-83b1-3b452ae91aef\",\"fprice\":123,\"id\":\"01baa6b4-3d4f-4a78-9a2a-866256a4080a\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"cd20af91-8b22-4c1f-83b1-3b452ae91aef\",\"id\":\"e7f3fbeb-b3e7-4da5-bf15-bbb2afff4b00\",\"params\":{},\"position\":\"\"},\"fprice3\":{\"flightId\":\"cd20af91-8b22-4c1f-83b1-3b452ae91aef\",\"id\":\"5483572f-9d64-4ab8-aea4-144311241fda\",\"params\":{},\"position\":\"\"},\"id\":\"cd20af91-8b22-4c1f-83b1-3b452ae91aef\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:04:01');
INSERT INTO `sys_oper_log` VALUES (256, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/cd20af91-8b22-4c1f-83b1-3b452ae91aef', '127.0.0.1', '内网IP', '{ids=cd20af91-8b22-4c1f-83b1-3b452ae91aef}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:09:54');
INSERT INTO `sys_oper_log` VALUES (257, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"8c2f5731-7add-4306-83fd-75d9b95e17e4\",\"fprice\":111,\"id\":\"f599a53e-878c-47ca-97c6-f420a239b561\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"params\":{},\"position\":\"\"},\"fprice3\":{\"params\":{},\"position\":\"\"},\"ftype\":\"单程\",\"id\":\"8c2f5731-7add-4306-83fd-75d9b95e17e4\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:10:00');
INSERT INTO `sys_oper_log` VALUES (258, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/8c2f5731-7add-4306-83fd-75d9b95e17e4', '127.0.0.1', '内网IP', '{ids=8c2f5731-7add-4306-83fd-75d9b95e17e4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:10:15');
INSERT INTO `sys_oper_log` VALUES (259, 'flight', 2, 'com.ruoyi.system.controller.FlightController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"南京东\",\"endTime\":\"2099-01-01 03:00:00\",\"fprice\":{\"flightId\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"fprice\":800,\"id\":\"043828af-3b7c-4e2e-803e-95c595148c35\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"fprice\":1000,\"id\":\"1823acd4-76b2-4395-b4af-aa634c70a88d\",\"params\":{},\"position\":\"商务舱\"},\"fprice3\":{\"flightId\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"fprice\":1200,\"id\":\"dbf124c1-a272-401a-9130-f94388e15458\",\"params\":{},\"position\":\"头等舱\"},\"ftype\":\"单程\",\"id\":\"300fdd8b-3c7b-47cb-9836-4b352e42f4f2\",\"params\":{},\"startSite\":\"北京东\",\"startTime\":\"2099-01-01 01:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:10:38');
INSERT INTO `sys_oper_log` VALUES (260, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endTime\":\"\",\"fprice\":{\"flightId\":\"06d732a7-354b-4373-9492-3aa2b4d9e01a\",\"fprice\":234,\"id\":\"455ed2cf-ced2-4f61-8bf6-ab8bc3167234\",\"params\":{},\"position\":\"商务舱\"},\"fprice2\":{\"flightId\":\"06d732a7-354b-4373-9492-3aa2b4d9e01a\",\"fprice\":34,\"id\":\"ada64f6b-669f-48ee-b825-fb05b3586208\",\"params\":{},\"position\":\"商务舱\"},\"fprice3\":{\"params\":{},\"position\":\"\"},\"ftype\":\"单程\",\"id\":\"06d732a7-354b-4373-9492-3aa2b4d9e01a\",\"params\":{},\"startTime\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:10:48');
INSERT INTO `sys_oper_log` VALUES (261, 'flight', 3, 'com.ruoyi.system.controller.FlightController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/flight/06d732a7-354b-4373-9492-3aa2b4d9e01a', '127.0.0.1', '内网IP', '{ids=06d732a7-354b-4373-9492-3aa2b4d9e01a}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:10:51');
INSERT INTO `sys_oper_log` VALUES (262, 'flight', 2, 'com.ruoyi.system.controller.FlightController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"北京西\",\"endTime\":\"2099-01-01 11:00:00\",\"fprice\":{\"flightId\":\"c31fb74a-4344-4656-8055-eee246bde830\",\"fprice\":1200,\"id\":\"17323fbe-45a1-4816-b7cf-6763f490ad32\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"params\":{},\"position\":\"\"},\"fprice3\":{\"params\":{},\"position\":\"\"},\"ftype\":\"单程\",\"id\":\"c31fb74a-4344-4656-8055-eee246bde830\",\"params\":{},\"startSite\":\"上海东\",\"startTime\":\"2099-01-01 03:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:26:41');
INSERT INTO `sys_oper_log` VALUES (263, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"后勤部门\",\"leader\":\"后勤\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"lishuai@qq.com\",\"loginDate\":\"2099-01-01 08:42:27\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"lishuai\",\"params\":{},\"password\":\"\",\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:27:08');
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:28:39');
INSERT INTO `sys_oper_log` VALUES (265, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2099-01-01 08:42:27\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2000,2001,2007,2008,2015,2016,2024,2025,100,1000,1001,1002,1003,1004,1005,1006,2002,2013,2023,2027],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:36:38');
INSERT INTO `sys_oper_log` VALUES (266, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/02/10/blob_20230210163654A001.jpeg\",\"code\":200}', 0, NULL, '2099-01-01 16:36:54');
INSERT INTO `sys_oper_log` VALUES (267, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"售票部门\",\"leader\":\"售票\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"liyi@163.com\",\"loginDate\":\"2099-01-01 13:33:31\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"liyi\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:37:12');
INSERT INTO `sys_oper_log` VALUES (268, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"password\":\"$2a$10$Xl2wzqeH.BzBMCcyWkzGGewCMG0Y9LdtGo4P5ajkr67U1VJoXX6S.\",\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:37:34');
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/flight/index\",\"createTime\":\"2099-01-01 15:12:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"航班信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"flight\",\"perms\":\"wenjian:flight:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 16:38:08');
INSERT INTO `sys_oper_log` VALUES (270, 'activity', 1, 'com.ruoyi.system.controller.ActivityController.add()', 'POST', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"clevel\":\"2\",\"content\":\"234\",\"id\":\"ee072cdf-2d30-4a1a-991f-b891fd94dfed\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:09:48');
INSERT INTO `sys_oper_log` VALUES (271, 'activity', 1, 'com.ruoyi.system.controller.ActivityController.add()', 'POST', 1, 'admin', NULL, '/wenjian/activity', '127.0.0.1', '内网IP', '{\"clevel\":\"1\",\"content\":\"234234\",\"id\":\"1ab8d375-0900-436e-bbd7-cdf3a8379e92\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:10:09');
INSERT INTO `sys_oper_log` VALUES (272, 'activity', 3, 'com.ruoyi.system.controller.ActivityController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/activity/1ab8d375-0900-436e-bbd7-cdf3a8379e92', '127.0.0.1', '内网IP', '{ids=1ab8d375-0900-436e-bbd7-cdf3a8379e92}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:10:20');
INSERT INTO `sys_oper_log` VALUES (273, 'activity', 3, 'com.ruoyi.system.controller.ActivityController.remove()', 'DELETE', 1, 'admin', NULL, '/wenjian/activity/ee072cdf-2d30-4a1a-991f-b891fd94dfed', '127.0.0.1', '内网IP', '{ids=ee072cdf-2d30-4a1a-991f-b891fd94dfed}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:10:22');
INSERT INTO `sys_oper_log` VALUES (274, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'lishuai', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/02/10/blob_20230210171945A001.jpeg\",\"code\":200}', 0, NULL, '2099-01-01 17:19:45');
INSERT INTO `sys_oper_log` VALUES (275, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'lishuai', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"后勤部门\",\"leader\":\"后勤\",\"orderNum\":3,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"lishuai@qq.com\",\"loginDate\":\"2099-01-01 16:38:49\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"lishuai\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15666666666\",\"remark\":\"测试员\",\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"lishuai\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:19:48');
INSERT INTO `sys_oper_log` VALUES (276, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'lishuai', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 123456', '{\"msg\":\"新密码不能与旧密码相同\",\"code\":500}', 0, NULL, '2099-01-01 17:20:02');
INSERT INTO `sys_oper_log` VALUES (277, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'lishuai', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '123456 1234567', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:20:07');
INSERT INTO `sys_oper_log` VALUES (278, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'lishuai', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '1234567 123456', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:20:13');
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:53:38');
INSERT INTO `sys_oper_log` VALUES (280, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1,2,3,4,5', '127.0.0.1', '内网IP', '{tableIds=1,2,3,4,5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:53:50');
INSERT INTO `sys_oper_log` VALUES (281, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'book,borrow,user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 17:53:59');
INSERT INTO `sys_oper_log` VALUES (282, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', NULL, 0, NULL, '2099-01-01 17:54:04');
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:11:57\",\"icon\":\"textarea\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"航班管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"class\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:00:34');
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/class/index\",\"createTime\":\"2099-01-01 15:12:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"航班信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"class\",\"perms\":\"wenjian:class:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:00:48');
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:13:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"航班信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:00:55');
INSERT INTO `sys_oper_log` VALUES (286, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:30:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"航班信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:01:03');
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:31:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"航班信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:01:16');
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:31:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"航班信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:01:36');
INSERT INTO `sys_oper_log` VALUES (289, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:32:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"航班信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:01:43');
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/class/index\",\"createTime\":\"2099-01-01 15:12:55\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"班级信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"class\",\"perms\":\"wenjian:class:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:02:01');
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:11:57\",\"icon\":\"textarea\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"班级管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"class\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:02:14');
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:30:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"班级信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:02:19');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:13:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"班级信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:02:27');
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:31:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"班级信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:02:33');
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:31:59\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"班级信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:02:39');
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:32:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"班级信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"wenjian:class:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:02:50');
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:37:04\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"新闻管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"integral\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:03:37');
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:37:04\",\"icon\":\"excel\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"积分管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"integral\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:03:44');
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/integral/index\",\"createTime\":\"2099-01-01 15:38:36\",\"icon\":\"select\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"积分信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2007,\"path\":\"integral\",\"perms\":\"wenjian:integral:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:04:04');
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:39:04\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"积分新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2008,\"path\":\"\",\"perms\":\"wenjian:integral:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:04:26');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:40:19\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2011,\"menuName\":\"积分删除\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2008,\"path\":\"\",\"perms\":\"wenjian:integral:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:04:43');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:40:49\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"积分修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2008,\"path\":\"\",\"perms\":\"wenjian:integral:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:04:54');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:41:42\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"积分详情\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2008,\"path\":\"\",\"perms\":\"wenjian:integral:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:05:09');
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:42:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"积分导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2008,\"path\":\"\",\"perms\":\"wenjian:integral:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:05:21');
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:43:49\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"新闻管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"journalism\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:06:14');
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/journalism/index\",\"createTime\":\"2099-01-01 15:44:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"新闻信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"path\":\"journalism\",\"perms\":\"wenjian:journalism:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:06:32');
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:45:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"新闻信息导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:06:57');
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:46:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"新闻信息修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:07:14');
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:47:07\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"新闻信息新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:07:39');
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:47:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"新闻信息详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:07:57');
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:47:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"新闻信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:08:07');
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:43:49\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"公告管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"journalism\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:08:25');
INSERT INTO `sys_oper_log` VALUES (313, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/journalism/index\",\"createTime\":\"2099-01-01 15:44:37\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2016,\"menuName\":\"公告信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2015,\"path\":\"journalism\",\"perms\":\"wenjian:journalism:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:08:30');
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:45:40\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"公告信息导出\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:08:35');
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:46:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2020,\"menuName\":\"公告信息修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:08:40');
INSERT INTO `sys_oper_log` VALUES (316, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:47:07\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"公告信息新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:08:51');
INSERT INTO `sys_oper_log` VALUES (317, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:47:56\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"公告信息详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:08:58');
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:47:31\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"公告信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2016,\"path\":\"\",\"perms\":\"wenjian:journalism:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:09:03');
INSERT INTO `sys_oper_log` VALUES (319, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:48:33\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"交流管理\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"message\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:09:20');
INSERT INTO `sys_oper_log` VALUES (320, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"wenjian/message/index\",\"createTime\":\"2099-01-01 15:49:26\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"交流信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2024,\"path\":\"message\",\"perms\":\"wenjian:message:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:09:26');
INSERT INTO `sys_oper_log` VALUES (321, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:50:02\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"交流信息新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2025,\"path\":\"\",\"perms\":\"wenjian:message:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:09:32');
INSERT INTO `sys_oper_log` VALUES (322, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:51:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2028,\"menuName\":\"交流信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2025,\"path\":\"\",\"perms\":\"wenjian:message:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:09:38');
INSERT INTO `sys_oper_log` VALUES (323, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:50:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"交流信息详情\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"path\":\"\",\"perms\":\"wenjian:message:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:09:43');
INSERT INTO `sys_oper_log` VALUES (324, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:51:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"交流信息导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2025,\"path\":\"\",\"perms\":\"wenjian:message:export\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:09:49');
INSERT INTO `sys_oper_log` VALUES (325, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:52:13\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"交流信息删除\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2025,\"path\":\"\",\"perms\":\"wenjian:message:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-22 16:09:55');
INSERT INTO `sys_oper_log` VALUES (326, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"tool/swagger/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"swagger\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":117,\"menuName\":\"系统接口\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":3,\"path\":\"swagger\",\"perms\":\"tool:swagger:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:01:00');
INSERT INTO `sys_oper_log` VALUES (327, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:01:10');
INSERT INTO `sys_oper_log` VALUES (328, 'flight', 1, 'com.ruoyi.system.controller.FlightController.add()', 'POST', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"天津\",\"endTime\":\"2099-01-01 08:00:00\",\"fprice\":{\"flightId\":\"3efce04b-e7e3-484a-8dd0-d2cb7c4a60f1\",\"fprice\":100,\"id\":\"86cdf67f-bfc6-49f2-8730-9cd27f471908\",\"params\":{},\"position\":\"经济舱\"},\"fprice2\":{\"flightId\":\"3efce04b-e7e3-484a-8dd0-d2cb7c4a60f1\",\"fprice\":200,\"id\":\"3c4a193d-c98e-460b-b6d6-88294f012347\",\"params\":{},\"position\":\"商务舱\"},\"fprice3\":{\"flightId\":\"3efce04b-e7e3-484a-8dd0-d2cb7c4a60f1\",\"fprice\":300,\"id\":\"c76692cb-01c5-4a75-8b82-ff7ecba7d261\",\"params\":{},\"position\":\"头等舱\"},\"ftype\":\"单程\",\"id\":\"3efce04b-e7e3-484a-8dd0-d2cb7c4a60f1\",\"params\":{},\"startSite\":\"山东\",\"startTime\":\"2099-01-01 02:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:05:21');
INSERT INTO `sys_oper_log` VALUES (329, 'flight', 2, 'com.ruoyi.system.controller.FlightController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/flight', '127.0.0.1', '内网IP', '{\"endSite\":\"天津\",\"endTime\":\"2099-01-01 08:00:00\",\"fprice\":{\"flightId\":\"3efce04b-e7e3-484a-8dd0-d2cb7c4a60f1\",\"fprice\":250,\"id\":\"14b1a07a-09cb-4029-8575-55351fbbfd5c\",\"params\":{},\"position\":\"商务舱\"},\"fprice2\":{\"flightId\":\"3efce04b-e7e3-484a-8dd0-d2cb7c4a60f1\",\"fprice\":100,\"id\":\"0723d2db-00fd-4294-8856-af308c562fcb\",\"params\":{},\"position\":\"经济舱\"},\"fprice3\":{\"flightId\":\"3efce04b-e7e3-484a-8dd0-d2cb7c4a60f1\",\"fprice\":300,\"id\":\"466191d8-057d-450d-a991-b95c83a76cbe\",\"params\":{},\"position\":\"头等舱\"},\"ftype\":\"单程\",\"id\":\"3efce04b-e7e3-484a-8dd0-d2cb7c4a60f1\",\"params\":{},\"startSite\":\"山东\",\"startTime\":\"2099-01-01 02:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:05:37');
INSERT INTO `sys_oper_log` VALUES (330, 'message', 2, 'com.ruoyi.system.controller.MessageController.edit()', 'PUT', 1, 'admin', NULL, '/wenjian/message', '127.0.0.1', '内网IP', '{\"atime\":\"2099-01-01\",\"atype\":\"原创\",\"clevel\":\"3\",\"content\":\"于2023.02.10 10:00:00 在航空一楼捡到身份证李某帅 身份证号码是371421*********88 ,请失主到航空办理处前台领取\",\"id\":\"4a43dae6-1935-4c27-b8e6-830ddf232230\",\"label\":\"丢失\",\"params\":{},\"title\":\"身份证丢失招领\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:06:19');
INSERT INTO `sys_oper_log` VALUES (331, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:44:07');
INSERT INTO `sys_oper_log` VALUES (332, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":104,\"deptName\":\"用户管理部门\",\"email\":\"xuanchuan@qq.com\",\"leader\":\"用户\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:44:25');
INSERT INTO `sys_oper_log` VALUES (333, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":104,\"deptName\":\"用户管理部门\",\"email\":\"xuanchuan@qq.com\",\"leader\":\"用户\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:44:32');
INSERT INTO `sys_oper_log` VALUES (334, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:45:26');
INSERT INTO `sys_oper_log` VALUES (335, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/job/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":110,\"menuName\":\"定时任务\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2,\"path\":\"job\",\"perms\":\"monitor:job:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:46:09');
INSERT INTO `sys_oper_log` VALUES (336, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/druid/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":111,\"menuName\":\"数据监控\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2,\"path\":\"druid\",\"perms\":\"monitor:druid:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:46:13');
INSERT INTO `sys_oper_log` VALUES (337, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/server/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":112,\"menuName\":\"服务监控\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2,\"path\":\"server\",\"perms\":\"monitor:server:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:46:17');
INSERT INTO `sys_oper_log` VALUES (338, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/index\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"redis\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":113,\"menuName\":\"缓存监控\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2,\"path\":\"cache\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:46:21');
INSERT INTO `sys_oper_log` VALUES (339, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"monitor/cache/list\",\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"redis-list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":114,\"menuName\":\"缓存列表\",\"menuType\":\"C\",\"orderNum\":6,\"params\":{},\"parentId\":2,\"path\":\"cacheList\",\"perms\":\"monitor:cache:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2099-01-01 13:46:25');
INSERT INTO `sys_oper_log` VALUES (340, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{\"dataScope\":\"\"}}', NULL, 0, NULL, '2099-01-01 13:49:07');
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 12:49:05');
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 12:51:20');
INSERT INTO `sys_oper_log` VALUES (343, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2025-09-22 12:52:11');
INSERT INTO `sys_oper_log` VALUES (344, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2025-09-22 12:52:21');
INSERT INTO `sys_oper_log` VALUES (345, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 15:11:57\",\"icon\":\"dict\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"航班管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"flight\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 13:22:06');
INSERT INTO `sys_oper_log` VALUES (346, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"系统管理\",\"email\":\"guanliyuan@qq.com\",\"leader\":\"管理员\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:41:42');
INSERT INTO `sys_oper_log` VALUES (347, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"管理系统\",\"email\":\"guanliyuan@qq.com\",\"leader\":\"管理员\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:41:50');
INSERT INTO `sys_oper_log` VALUES (348, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":101,\"deptName\":\"系统管理\",\"email\":\"guanliyuan@qq.com\",\"leader\":\"管理员\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:42:11');
INSERT INTO `sys_oper_log` VALUES (349, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:42:17');
INSERT INTO `sys_oper_log` VALUES (350, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":103,\"deptName\":\"部门1\",\"email\":\"bumen@qq.com\",\"leader\":\"bumen\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:42:28');
INSERT INTO `sys_oper_log` VALUES (351, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":105,\"deptName\":\"部门2\",\"email\":\"bumen@qq.com\",\"leader\":\"bumen\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:42:40');
INSERT INTO `sys_oper_log` VALUES (352, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"deptId\":105,\"deptName\":\"部门2\",\"email\":\"bumen@qq.com\",\"leader\":\"bumen\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:42:45');
INSERT INTO `sys_oper_log` VALUES (353, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/09/22/blob_20250922234530A001.jpeg\",\"code\":200}', 0, NULL, '2025-09-22 23:45:30');
INSERT INTO `sys_oper_log` VALUES (354, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"/profile/avatar/2023/02/10/blob_20230210163654A001.jpeg\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"售票部门\",\"leader\":\"售票\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"liyi@163.com\",\"loginDate\":\"2025-09-22 22:29:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"liyi\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:45:32');
INSERT INTO `sys_oper_log` VALUES (355, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"/profile/avatar/2023/02/10/blob_20230210163654A001.jpeg\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"售票部门\",\"leader\":\"售票\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"guanli@163.com\",\"loginDate\":\"2025-09-22 22:29:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"管理员\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:45:47');
INSERT INTO `sys_oper_log` VALUES (356, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2099-01-01 08:42:27\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:48:24');
INSERT INTO `sys_oper_log` VALUES (357, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/09/22/blob_20250922235229A002.jpeg\",\"code\":200}', 0, NULL, '2025-09-22 23:52:29');
INSERT INTO `sys_oper_log` VALUES (358, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"/profile/avatar/2023/02/10/blob_20230210163654A001.jpeg\",\"createBy\":\"admin\",\"createTime\":\"2099-01-01 08:42:27\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"部门1\",\"leader\":\"bumen\",\"orderNum\":1,\"params\":{\"@type\":\"java.util.HashMap\"},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"guanli@163.com\",\"loginDate\":\"2025-09-22 22:29:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"管理员\",\"params\":{\"@type\":\"java.util.HashMap\"},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{\"@type\":\"java.util.HashMap\"},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:52:31');
INSERT INTO `sys_oper_log` VALUES (359, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{roleIds=2}', NULL, 1, '普通角色已分配,不能删除', '2025-09-22 23:52:40');
INSERT INTO `sys_oper_log` VALUES (360, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{roleIds=2}', NULL, 1, '普通角色已分配,不能删除', '2025-09-22 23:52:55');
INSERT INTO `sys_oper_log` VALUES (361, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{tableIds=8}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:53:23');
INSERT INTO `sys_oper_log` VALUES (362, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{tableIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-09-22 23:53:24');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2099-01-01 08:42:27', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '经理', 2, '0', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 14:14:13', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2099-01-01 08:42:27', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2099-01-01 08:42:27', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 16:36:38', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2025);
INSERT INTO `sys_role_menu` VALUES (2, 2027);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'guanli@163.com', '15888888888', '1', '/profile/avatar/2023/02/10/blob_20230210163654A001.jpeg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-09-25 22:19:38', 'admin', '2099-01-01 08:42:27', '', '2025-09-25 22:19:38', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'lishuai', 'lishuai', '00', 'lishuai@qq.com', '15666666666', '0', '/profile/avatar/2023/02/10/blob_20230210171945A001.jpeg', '$2a$10$KbwUWe8JRhyVmKsrs6dPyeugUTsV9NBqO73tlzLBLiiJLnNVJ44aC', '0', '0', '127.0.0.1', '2099-01-01 13:06:31', 'admin', '2099-01-01 08:42:27', 'admin', '2099-01-01 13:06:31', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
