-- 电子围栏主表
CREATE TABLE `f_electronic_fence` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `fence_name` VARCHAR(100) NOT NULL COMMENT '围栏名称',
  `fence_type` VARCHAR(20) NOT NULL COMMENT '围栏类型: parking-停车区, forbidden-禁行区, working-工作区',
  `dock_id` BIGINT DEFAULT NULL COMMENT '码头ID（工作区必填）',
  `dock_name` VARCHAR(100) DEFAULT NULL COMMENT '码头名称',
  `status` INT NOT NULL DEFAULT 1 COMMENT '状态: 1-启用, 0-禁用',
  `factory_id` BIGINT DEFAULT NULL COMMENT '工厂ID',
  `factory_name` VARCHAR(100) DEFAULT NULL COMMENT '工厂名称',
  `dept_id` BIGINT DEFAULT NULL COMMENT '部门ID',
  `create_by` VARCHAR(64) DEFAULT NULL COMMENT '创建者',
  `create_date` DATETIME DEFAULT NULL COMMENT '创建时间',
  `update_by` VARCHAR(64) DEFAULT NULL COMMENT '更新者',
  `update_date` DATETIME DEFAULT NULL COMMENT '修改时间',
  `deleted` INT NOT NULL DEFAULT 0 COMMENT '删除状态: 0-未删除, 1-已删除',
  `remark` VARCHAR(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  INDEX `idx_fence_type` (`fence_type`),
  INDEX `idx_dock_id` (`dock_id`),
  INDEX `idx_deleted` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='电子围栏表';

-- 电子围栏点位表
CREATE TABLE `f_electronic_fence_point` (
  `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `fence_id` BIGINT NOT NULL COMMENT '围栏ID',
  `lng` DECIMAL(12,8) NOT NULL COMMENT '经度',
  `lat` DECIMAL(12,8) NOT NULL COMMENT '纬度',
  `sort_order` INT NOT NULL DEFAULT 0 COMMENT '排序号',
  PRIMARY KEY (`id`),
  INDEX `idx_fence_id` (`fence_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='电子围栏点位表';
