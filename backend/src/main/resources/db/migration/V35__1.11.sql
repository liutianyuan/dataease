ALTER TABLE `panel_group`
ADD COLUMN `status` varchar(255) NULL DEFAULT 'publish' COMMENT '1.publish--发布 2.unpublished--未发布' AFTER `mobile_layout`;

UPDATE `sys_menu` SET `sub_count` = 1 WHERE `menu_id` = 40;
INSERT INTO `sys_menu` (`menu_id`, `pid`, `sub_count`, `type`, `title`, `name`, `component`, `menu_sort`, `icon`, `path`, `i_frame`, `cache`, `hidden`, `permission`, `create_by`, `update_by`, `create_time`, `update_time`) VALUES (401, 40, 0, 2, '查看系统模板', NULL, NULL, 999, NULL, NULL, 0, 0, 0, 'sys-template:read', NULL, NULL, 1614930862373, 1614930862373);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint(20) NOT NULL COMMENT '操作人',
  `login_name` varchar(255) NOT NULL COMMENT '登录账号',
  `nick_name` varchar(255) NOT NULL COMMENT '姓名',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip',
  `source_type` int(8) NOT NULL COMMENT '资源类型',
  `source_id` varchar(255) NOT NULL COMMENT '资源ID',
  `source_name` varchar(255) NOT NULL COMMENT '资源名称',
  `operate_type` int(8) NOT NULL COMMENT '操作类型',
  `position` longtext COMMENT '资源位置',
  `remark` longtext COMMENT '备注信息',
  `time` bigint(13) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO `sys_menu` VALUES (618, 1, 1, 1, '日志管理', 'system-log', 'system/log/index', 15, 'peoples', 'log', b'0', b'0', b'0', 'log:read', NULL, NULL, NULL, 1620281952752);
INSERT INTO `sys_menu` VALUES (619, 618, 0, 2, '导出日志', NULL, NULL, 1, NULL, NULL, b'0', b'0', b'0', 'log:export', NULL, NULL, NULL, NULL);
