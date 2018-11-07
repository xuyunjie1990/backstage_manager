-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.5.57 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5288
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 manager 的数据库结构
CREATE DATABASE IF NOT EXISTS `manager` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `manager`;

-- 导出  表 manager.sys_config 结构
CREATE TABLE IF NOT EXISTS `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统配置信息表';

-- 正在导出表  manager.sys_config 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` (`id`, `param_key`, `param_value`, `status`, `remark`) VALUES
	(1, 'CLOUD_STORAGE_CONFIG_KEY', '{"aliyunAccessKeyId":"","aliyunAccessKeySecret":"","aliyunBucketName":"","aliyunDomain":"","aliyunEndPoint":"","aliyunPrefix":"","qcloudBucketName":"","qcloudDomain":"","qcloudPrefix":"","qcloudSecretId":"","qcloudSecretKey":"","qiniuAccessKey":"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ","qiniuBucketName":"ios-app","qiniuDomain":"http://7xqbwh.dl1.z0.glb.clouddn.com","qiniuPrefix":"upload","qiniuSecretKey":"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV","type":1}', 0, '云存储配置信息');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;

-- 导出  表 manager.sys_dept 结构
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- 正在导出表  manager.sys_dept 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `name`, `order_num`, `del_flag`) VALUES
	(1, 0, '总裁办', 0, 0),
	(2, 1, '长沙分公司', 1, 0),
	(3, 1, '上海分公司', 2, 0),
	(4, 3, '技术部', 0, 0),
	(5, 3, '销售部', 1, 0);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 manager.sys_dict 结构
CREATE TABLE IF NOT EXISTS `sys_dict` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '字典名称',
  `type` varchar(100) NOT NULL COMMENT '字典类型',
  `code` varchar(100) NOT NULL COMMENT '字典码',
  `value` varchar(1000) NOT NULL COMMENT '字典值',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '删除标记  -1：已删除  0：正常',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='数据字典表';

-- 正在导出表  manager.sys_dict 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` (`id`, `name`, `type`, `code`, `value`, `order_num`, `remark`, `del_flag`) VALUES
	(1, '性别', 'sex', '0', '女', 0, NULL, 0),
	(2, '性别', 'sex', '1', '男', 1, NULL, 0),
	(3, '性别', 'sex', '2', '未知', 3, NULL, 0);
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;

-- 导出  表 manager.sys_log 结构
CREATE TABLE IF NOT EXISTS `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- 正在导出表  manager.sys_log 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES
	(1, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '{"userId":2,"username":"xyj","password":"b14d14dc1c031f602fed12b57b0df333a0c5ea01c0d6f76cf57ab71495a82a71","salt":"02Gp8lUsgIluJi6PCYiQ","email":"18600151568@163.com","mobile":"18600151568","status":1,"roleIdList":[],"createTime":"Nov 6, 2018 4:49:08 PM","deptId":4,"deptName":"技术部"}', 154, '0:0:0:0:0:0:0:1', '2018-11-06 16:49:08'),
	(2, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '{"roleId":1,"roleName":"普通管理员","remark":"","deptId":1,"deptName":"人人开源集团","menuIdList":[1,2,15,16,17,18,3,19,20,21,22,4,23,24,25,26,5,6,7,8,9,10,11,12,13,14,27,29,30,31,32,33,34,35,36,37,38,39,40],"deptIdList":[1],"createTime":"Nov 6, 2018 4:50:08 PM"}', 61, '0:0:0:0:0:0:0:1', '2018-11-06 16:50:09'),
	(3, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '{"userId":2,"username":"xyj","salt":"02Gp8lUsgIluJi6PCYiQ","email":"18600151568@163.com","mobile":"18600151568","status":1,"roleIdList":[1],"createTime":"Nov 6, 2018 4:49:08 PM","deptId":4,"deptName":"技术部"}', 15, '0:0:0:0:0:0:0:1', '2018-11-06 16:50:18'),
	(4, 'admin', '保存菜单', 'com.hh.controller.sys.SysMenuController.save()', '{"menuId":41,"parentId":0,"parentName":"一级菜单","name":"客户管理","type":0,"icon":"fa fa-users","orderNum":0}', 13, '0:0:0:0:0:0:0:1', '2018-11-07 14:56:45'),
	(5, 'admin', '修改菜单', 'com.hh.controller.sys.SysMenuController.update()', '{"menuId":1,"parentId":0,"parentName":"一级菜单","name":"系统管理","type":0,"icon":"fa fa-cog","orderNum":1}', 12, '0:0:0:0:0:0:0:1', '2018-11-07 14:57:49'),
	(6, 'admin', '删除菜单', 'com.hh.controller.sys.SysMenuController.delete()', '6', 0, '0:0:0:0:0:0:0:1', '2018-11-07 14:59:59'),
	(7, 'admin', '删除菜单', 'com.hh.controller.sys.SysMenuController.delete()', '7', 0, '0:0:0:0:0:0:0:1', '2018-11-07 15:00:05'),
	(8, 'admin', '保存配置', 'com.hh.controller.sys.SysConfigController.save()', '{"id":2,"paramKey":"123","paramValue":"123","remark":"12"}', 823, '0:0:0:0:0:0:0:1', '2018-11-07 15:01:09'),
	(9, 'admin', '删除配置', 'com.hh.controller.sys.SysConfigController.delete()', '[2]', 10, '0:0:0:0:0:0:0:1', '2018-11-07 15:01:17');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;

-- 导出  表 manager.sys_menu 结构
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- 正在导出表  manager.sys_menu 的数据：~30 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES
	(1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 1),
	(2, 1, '管理员管理', 'modules/sys/user.html', NULL, 1, 'fa fa-user', 1),
	(3, 1, '角色管理', 'modules/sys/role.html', NULL, 1, 'fa fa-user-secret', 2),
	(4, 1, '菜单管理', 'modules/sys/menu.html', NULL, 1, 'fa fa-th-list', 3),
	(5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4),
	(15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0),
	(16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0),
	(17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0),
	(18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0),
	(19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0),
	(20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0),
	(21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0),
	(22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0),
	(23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0),
	(24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0),
	(25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0),
	(26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0),
	(27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6),
	(29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7),
	(31, 1, '部门管理', 'modules/sys/dept.html', NULL, 1, 'fa fa-file-code-o', 1),
	(32, 31, '查看', NULL, 'sys:dept:list,sys:dept:info', 2, NULL, 0),
	(33, 31, '新增', NULL, 'sys:dept:save,sys:dept:select', 2, NULL, 0),
	(34, 31, '修改', NULL, 'sys:dept:update,sys:dept:select', 2, NULL, 0),
	(35, 31, '删除', NULL, 'sys:dept:delete', 2, NULL, 0),
	(36, 1, '字典管理', 'modules/sys/dict.html', NULL, 1, 'fa fa-bookmark-o', 6),
	(37, 36, '查看', NULL, 'sys:dict:list,sys:dict:info', 2, NULL, 6),
	(38, 36, '新增', NULL, 'sys:dict:save', 2, NULL, 6),
	(39, 36, '修改', NULL, 'sys:dict:update', 2, NULL, 6),
	(40, 36, '删除', NULL, 'sys:dict:delete', 2, NULL, 6),
	(41, 0, '客户管理', NULL, NULL, 0, 'fa fa-users', 0);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 manager.sys_oss 结构
CREATE TABLE IF NOT EXISTS `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- 正在导出表  manager.sys_oss 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_oss` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_oss` ENABLE KEYS */;

-- 导出  表 manager.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色';

-- 正在导出表  manager.sys_role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `dept_id`, `create_time`) VALUES
	(1, '普通管理员', '', 1, '2018-11-06 16:50:08');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 manager.sys_role_dept 结构
CREATE TABLE IF NOT EXISTS `sys_role_dept` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色与部门对应关系';

-- 正在导出表  manager.sys_role_dept 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` (`id`, `role_id`, `dept_id`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;

-- 导出  表 manager.sys_role_menu 结构
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- 正在导出表  manager.sys_role_menu 的数据：~39 rows (大约)
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 1, 15),
	(4, 1, 16),
	(5, 1, 17),
	(6, 1, 18),
	(7, 1, 3),
	(8, 1, 19),
	(9, 1, 20),
	(10, 1, 21),
	(11, 1, 22),
	(12, 1, 4),
	(13, 1, 23),
	(14, 1, 24),
	(15, 1, 25),
	(16, 1, 26),
	(17, 1, 5),
	(18, 1, 6),
	(19, 1, 7),
	(20, 1, 8),
	(21, 1, 9),
	(22, 1, 10),
	(23, 1, 11),
	(24, 1, 12),
	(25, 1, 13),
	(26, 1, 14),
	(27, 1, 27),
	(28, 1, 29),
	(29, 1, 30),
	(30, 1, 31),
	(31, 1, 32),
	(32, 1, 33),
	(33, 1, 34),
	(34, 1, 35),
	(35, 1, 36),
	(36, 1, 37),
	(37, 1, 38),
	(38, 1, 39),
	(39, 1, 40);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

-- 导出  表 manager.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统用户';

-- 正在导出表  manager.sys_user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `dept_id`, `create_time`) VALUES
	(1, 'admin', 'e1153123d7d180ceeb820d577ff119876678732a68eef4e6ffc0b1f06a01f91b', 'YzcmCZNvbXocrsz9dm8e', '18600151568@163.com', '13612345678', 1, 1, '2016-11-11 11:11:11'),
	(2, 'xyj', 'b14d14dc1c031f602fed12b57b0df333a0c5ea01c0d6f76cf57ab71495a82a71', '02Gp8lUsgIluJi6PCYiQ', '18600151568@163.com', '18600151568', 1, 4, '2018-11-06 16:49:08');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 manager.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- 正在导出表  manager.sys_user_role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES
	(1, 2, 1);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
