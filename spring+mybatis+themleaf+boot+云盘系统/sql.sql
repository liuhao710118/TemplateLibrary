/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.100.10
 Source Server Type    : MySQL
 Source Server Version : 50742 (5.7.42)
 Source Host           : 192.168.100.10:3306
 Source Schema         : cloudspacesystemdatabase

 Target Server Type    : MySQL
 Target Server Version : 50742 (5.7.42)
 File Encoding         : 65001

 Date: 27/12/2023 16:03:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_files_records
-- ----------------------------
DROP TABLE IF EXISTS `t_files_records`;
CREATE TABLE `t_files_records`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isfile` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1是文件，2是文件夹',
  `parent_mkdir_id` int(11) NULL DEFAULT 0,
  `ftype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '未知',
  `disk_mapping_location` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '磁盘映射路径',
  `fsize` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '文件大小',
  `uid` int(11) NOT NULL COMMENT '所属用户ID',
  `last_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `parent_mkdir_id`(`parent_mkdir_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  UNIQUE INDEX `fname`(`fname`, `isfile`, `parent_mkdir_id`, `ftype`, `uid`) USING BTREE,
  CONSTRAINT `t_files_records_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `t_user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of t_files_records
-- ----------------------------
BEGIN;
INSERT INTO `t_files_records` (`fid`, `fname`, `isfile`, `parent_mkdir_id`, `ftype`, `disk_mapping_location`, `fsize`, `uid`, `last_update_time`) VALUES (28, '/', 2, 0, 'mkdir_root', NULL, 0.00, 1, '2023-12-27 00:50:45'), (36, 'gson-2.8.9.jar', 1, 28, '.jar', NULL, 258075.00, 1, '2023-12-27 01:59:13'), (37, 'a', 2, 28, 'mkdir', NULL, 0.00, 1, '2023-12-27 01:59:51'), (38, 'gson-2.8.9.jar', 1, 37, '.jar', NULL, 258075.00, 1, '2023-12-27 02:05:50'), (39, 'a', 2, 37, 'mkdir', NULL, 0.00, 1, '2023-12-27 02:32:57'), (40, 'b', 2, 39, 'mkdir', NULL, 0.00, 1, '2023-12-27 02:33:02'), (41, 'c', 2, 40, 'mkdir', NULL, 0.00, 1, '2023-12-27 04:58:35'), (42, 'b', 2, 41, 'mkdir', NULL, 0.00, 1, '2023-12-27 04:58:40'), (43, 'df', 2, 42, 'mkdir', NULL, 0.00, 1, '2023-12-27 04:58:45'), (44, 'sdadas', 2, 28, 'mkdir', NULL, 0.00, 1, '2023-12-27 06:48:01'), (45, 'd', 2, 44, 'mkdir', NULL, 0.00, 1, '2023-12-27 04:59:12'), (46, 'ty', 2, 44, 'mkdir', NULL, 0.00, 1, '2023-12-27 04:59:16'), (47, 'inst.exe', 1, 28, '.exe', NULL, 1551312.00, 1, '2023-12-27 05:13:07'), (49, '/', 2, 0, 'mkdir_root', NULL, 0.00, 2, '2023-12-27 05:22:34'), (50, 'hero.png', 1, 49, '.png', NULL, 153793.00, 2, '2023-12-27 05:23:26'), (51, 'element-icons.ttf', 1, 49, '.ttf', NULL, 55956.00, 2, '2023-12-27 05:23:32'), (52, 'a', 2, 49, 'mkdir', NULL, 0.00, 2, '2023-12-27 05:23:41'), (53, 'b', 2, 49, 'mkdir', NULL, 0.00, 2, '2023-12-27 05:23:45'), (54, 'c', 2, 49, 'mkdir', NULL, 0.00, 2, '2023-12-27 05:23:48'), (55, 'd', 2, 49, 'mkdir', NULL, 0.00, 2, '2023-12-27 05:23:50'), (56, 'e', 2, 49, 'mkdir', NULL, 0.00, 2, '2023-12-27 05:23:53'), (57, 'f', 2, 49, 'mkdir', NULL, 0.00, 2, '2023-12-27 05:23:56'), (58, 'hero.png', 1, 37, '.png', NULL, 153793.00, 1, '2023-12-27 14:08:29'), (59, '/', 2, 0, 'mkdir_root', NULL, 0.00, 3, '2023-12-27 14:09:58'), (60, 'a', 2, 59, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:10:01'), (61, 'adasdasd', 2, 59, 'mkdir', NULL, 0.00, 3, '2023-12-27 06:12:48'), (63, 'aa', 2, 60, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:10:14'), (64, 'ab', 2, 60, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:10:18'), (65, 'ac', 2, 60, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:10:20'), (66, 'hero.png', 1, 59, '.png', NULL, 153793.00, 3, '2023-12-27 14:10:27'), (67, 'gson-2.8.9.jar', 1, 59, '.jar', NULL, 258075.00, 3, '2023-12-27 14:10:34'), (70, 'hero.png', 1, 61, '.png', NULL, 153793.00, 3, '2023-12-27 14:42:42'), (71, 'element-icons.ttf', 1, 61, '.ttf', NULL, 55956.00, 3, '2023-12-27 14:42:47'), (73, 'b', 2, 61, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:42:54'), (74, 'c', 2, 61, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:42:57'), (75, 'd', 2, 61, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:43:00'), (76, 's', 2, 72, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:43:08'), (77, 'd', 2, 72, 'mkdir', NULL, 0.00, 3, '2023-12-27 14:43:13'), (79, 'hero.png', 1, 72, '.png', NULL, 153793.00, 3, '2023-12-27 14:43:32'), (80, '/', 2, 0, 'mkdir_root', NULL, 0.00, 4, '2023-12-27 14:45:36'), (84, 'a', 2, 80, 'mkdir', NULL, 0.00, 4, '2023-12-27 14:46:01'), (85, 'mkdira', 2, 80, 'mkdir', NULL, 0.00, 4, '2023-12-27 06:47:17'), (88, 'aa', 2, 84, 'mkdir', NULL, 0.00, 4, '2023-12-27 14:46:21'), (89, 'aabb', 2, 84, 'mkdir', NULL, 0.00, 4, '2023-12-27 14:46:26'), (91, 'b', 2, 89, 'mkdir', NULL, 0.00, 4, '2023-12-27 14:46:34'), (93, 'c', 2, 89, 'mkdir', NULL, 0.00, 4, '2023-12-27 14:46:40'), (94, 'g', 2, 93, 'mkdir', NULL, 0.00, 4, '2023-12-27 14:46:46'), (95, 'f', 2, 94, 'mkdir', NULL, 0.00, 4, '2023-12-27 14:46:50'), (96, '/', 2, 0, 'mkdir_root', NULL, 0.00, 7, '2023-12-27 15:34:15'), (97, 'hero.png', 1, 96, '.png', NULL, 153793.00, 7, '2023-12-27 15:34:20'), (98, 'gson-2.8.9.jar', 1, 96, '.jar', NULL, 258075.00, 7, '2023-12-27 15:34:25'), (99, '/', 2, 0, 'mkdir_root', NULL, 0.00, 9, '2023-12-27 15:48:23');
COMMIT;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'default_name',
  `uaccount` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `upassword` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '123456',
  `free_space_size` decimal(20, 2) NOT NULL DEFAULT 10737418240000.00,
  `total_space_size` decimal(20, 2) NOT NULL DEFAULT 10737418240000.00,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci;

-- ----------------------------
-- Records of t_user
-- ----------------------------
BEGIN;
INSERT INTO `t_user` (`uid`, `uname`, `uaccount`, `upassword`, `free_space_size`, `total_space_size`) VALUES (1, '张三', 'zhangsan', '123456', 10737416276820.00, 10737418240000.00), (2, '李四', 'lisi', '123456', 10737418184044.00, 10737418240000.00), (3, '王五', 'wangwu', '123456', 10737418086207.00, 10737418240000.00), (4, 'test', 'test', '123456', 10737417981925.00, 10737418240000.00), (7, '测试账户', 'test1', 'qwert', 10737417981925.00, 10737418240000.00), (8, '测试账户', 'test2', '123456', 10737418240000.00, 10737418240000.00), (9, '测试账户3', 'test3', '123456', 10737418240000.00, 10737418240000.00);
COMMIT;

-- ----------------------------
-- Function structure for getparentId
-- ----------------------------
DROP FUNCTION IF EXISTS `getparentId`;
delimiter ;;
CREATE FUNCTION `getparentId`(in_id int)
 RETURNS varchar(1000) CHARSET utf8
begin 
	declare ids varchar(1000) default ''; 
  declare tempid int; 
 
 set tempid = in_id; 
 while tempid is not null do 
  
	select parent_mkdir_id into tempid from t_files_records where fid=tempid;
 end while; 
 return ids; 
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
