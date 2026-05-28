-- 随行人员明细表
CREATE TABLE IF NOT EXISTS `f_appointment_task_companion` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` BIGINT NOT NULL COMMENT '关联预约任务ID',
  `name` VARCHAR(100) DEFAULT NULL COMMENT '姓名',
  `country` VARCHAR(100) DEFAULT NULL COMMENT '国家',
  `phone` VARCHAR(50) DEFAULT NULL COMMENT '联系电话',
  `id_card_last_four` VARCHAR(4) DEFAULT NULL COMMENT '身份证后四位',
  `create_date` DATETIME DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_task_id` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='预约任务随行人员';
