-- ============================================================
-- 全局排队调度系统 - 数据库变更脚本
-- 执行时间: 2026-06-10
-- ============================================================

-- 1. f_appointment_task 表新增排队相关字段
ALTER TABLE f_appointment_task
  ADD COLUMN checkin_type VARCHAR(20) DEFAULT NULL COMMENT '签到类型: normal/late/early',
  ADD COLUMN call_count INT DEFAULT 0 COMMENT '被叫号次数',
  ADD COLUMN miss_count INT DEFAULT 0 COMMENT '过号次数',
  ADD COLUMN call_time DATETIME DEFAULT NULL COMMENT '最近叫号时间',
  ADD COLUMN assigned_dock_id BIGINT DEFAULT NULL COMMENT '叫号分配码头ID',
  ADD COLUMN assigned_dock_name VARCHAR(200) DEFAULT NULL COMMENT '叫号分配码头名称',
  ADD COLUMN dispatcher_id BIGINT DEFAULT NULL COMMENT '发货员ID',
  ADD COLUMN dispatcher_name VARCHAR(100) DEFAULT NULL COMMENT '发货员名称',
  ADD COLUMN queue_enter_time DATETIME DEFAULT NULL COMMENT '进入排队时间';

-- 2. 添加索引优化排队查询（queue_enter_time为排队排序唯一字段）
CREATE INDEX idx_task_queue ON f_appointment_task(task_status, queue_enter_time);
CREATE INDEX idx_task_call_time ON f_appointment_task(task_status, call_time);

-- 3. 新增菜单：排队调度
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, menu_type, visible, status, perms, icon, create_by, create_time)
VALUES ('排队调度', (SELECT id FROM (SELECT id FROM sys_menu WHERE menu_name = '系统管理' LIMIT 1) tmp), 7, 'queue', 'system/queue/index', 'C', '0', '0', 'system:queue:list', 'peoples', 'admin', NOW());

-- 4. 新增按钮权限
SET @queueMenuId = LAST_INSERT_ID();

INSERT INTO sys_menu (menu_name, parent_id, order_num, menu_type, perms, create_by, create_time)
VALUES ('叫号', @queueMenuId, 1, 'F', 'system:queue:call', 'admin', NOW());

INSERT INTO sys_menu (menu_name, parent_id, order_num, menu_type, perms, create_by, create_time)
VALUES ('确认入厂', @queueMenuId, 2, 'F', 'system:queue:confirm', 'admin', NOW());

INSERT INTO sys_menu (menu_name, parent_id, order_num, menu_type, perms, create_by, create_time)
VALUES ('过号', @queueMenuId, 3, 'F', 'system:queue:miss', 'admin', NOW());

-- 5. 注册定时任务：叫号超时检查（每分钟执行一次）
INSERT INTO sys_job (job_name, job_group, invoke_target, cron_expression, misfire_policy, concurrent, status, create_by, create_time)
VALUES ('叫号超时检查', 'DEFAULT', 'queueCallTimeoutTask.checkTimeout()', '0 */1 * * * ?', '3', '1', '0', 'admin', NOW());
