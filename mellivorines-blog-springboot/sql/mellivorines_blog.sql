/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : mellivorines_blog

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 15/09/2023 23:39:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mellivorines_blog_about
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_about`;
CREATE TABLE `mellivorines_blog_about` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci COMMENT '内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-关于';

-- ----------------------------
-- Records of mellivorines_blog_about
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_about` (`id`, `content`, `create_time`, `update_time`) VALUES (1, '{\"content\":\"this is about\"}', '2022-07-24 17:22:13', '2022-09-23 14:37:34');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_article
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_article`;
CREATE TABLE `mellivorines_blog_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '作者',
  `category_id` int NOT NULL COMMENT '文章分类',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '内容',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶 0否 1是',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0否 1是',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除  0否 1是',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态值 1公开 2私密 3草稿',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文章类型 1原创 2转载 3翻译',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '访问密码',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '原文链接',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `mellivorines_blog_category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_article_user_id` FOREIGN KEY (`user_id`) REFERENCES `mellivorines_blog_user_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-文章';

-- ----------------------------
-- Records of mellivorines_blog_article
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_article` (`id`, `user_id`, `category_id`, `article_cover`, `article_title`, `article_content`, `is_top`, `is_featured`, `is_delete`, `status`, `type`, `password`, `original_url`, `create_time`, `update_time`) VALUES (1, 1, 1, '\"\"', 'jagsdad', 'akudgaudfashda', 0, 0, 0, 1, 1, '123456', '\"\"', '2023-08-18 19:16:22', '2023-08-18 19:16:25');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_article_tag`;
CREATE TABLE `mellivorines_blog_article_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '文章id',
  `tag_id` int NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_tag_1` (`article_id`) USING BTREE,
  KEY `fk_article_tag_2` (`tag_id`) USING BTREE,
  CONSTRAINT `article_id` FOREIGN KEY (`article_id`) REFERENCES `mellivorines_blog_article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `tag_id` FOREIGN KEY (`tag_id`) REFERENCES `mellivorines_blog_tag` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-文章标签';

-- ----------------------------
-- Records of mellivorines_blog_article_tag
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_article_tag` (`id`, `article_id`, `tag_id`) VALUES (1, 1, 1);
INSERT INTO `mellivorines_blog_article_tag` (`id`, `article_id`, `tag_id`) VALUES (2, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_category
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_category`;
CREATE TABLE `mellivorines_blog_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '分类名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-分类';

-- ----------------------------
-- Records of mellivorines_blog_category
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_category` (`id`, `category_name`, `create_time`, `update_time`) VALUES (1, 'Mysql', '2023-08-18 19:12:37', '2023-08-18 19:12:40');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_comment`;
CREATE TABLE `mellivorines_blog_comment` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int NOT NULL COMMENT '评论用户Id',
  `topic_id` int DEFAULT NULL COMMENT '评论主题id',
  `comment_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '评论内容',
  `reply_user_id` int DEFAULT NULL COMMENT '回复用户id',
  `parent_id` int DEFAULT NULL COMMENT '父评论id',
  `type` tinyint NOT NULL COMMENT '评论类型 1.文章 2.留言 3.关于我 4.友链 5.说说',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除  0否 1是',
  `is_review` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否审核',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_comment_user` (`user_id`) USING BTREE,
  KEY `fk_comment_parent` (`parent_id`) USING BTREE,
  CONSTRAINT `fk_comment_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `mellivorines_blog_comment` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-内容';

-- ----------------------------
-- Records of mellivorines_blog_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_exception_log
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_exception_log`;
CREATE TABLE `mellivorines_blog_exception_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `opt_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求接口',
  `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求方式',
  `request_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求方式',
  `request_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '请求参数',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作描述',
  `exception_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '异常信息',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='表-异常日志';

-- ----------------------------
-- Records of mellivorines_blog_exception_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_friend_link`;
CREATE TABLE `mellivorines_blog_friend_link` (
  `id` int NOT NULL AUTO_INCREMENT,
  `link_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '链接名',
  `link_avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '链接头像',
  `link_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '链接地址',
  `link_intro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '链接介绍',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_friend_link_user` (`link_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-友链';

-- ----------------------------
-- Records of mellivorines_blog_friend_link
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_job
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_job`;
CREATE TABLE `mellivorines_blog_job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(1) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` tinyint(1) DEFAULT '1' COMMENT '是否并发执行（0禁止 1允许）',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态（0暂停 1正常）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of mellivorines_blog_job
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_job` (`id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_time`, `update_time`, `remark`) VALUES (81, '统计用户地域分布', '默认', 'auroraQuartz.statisticalUserArea', '0 0,30 * * * ?', 3, 1, 1, '2022-08-11 21:49:27', '2022-08-13 08:49:47', '统计用户的地域分布');
INSERT INTO `mellivorines_blog_job` (`id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_time`, `update_time`, `remark`) VALUES (82, '统计访问量', '默认', 'auroraQuartz.saveUniqueView', '0 0 0 * * ?', 3, 1, 1, '2022-08-12 16:35:11', NULL, '向数据库中写入每天的访问量');
INSERT INTO `mellivorines_blog_job` (`id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_time`, `update_time`, `remark`) VALUES (83, '清空redis访客记录', '默认', 'auroraQuartz.clear', '0 0 1 * * ?', 3, 1, 1, '2022-08-12 16:36:30', '2022-08-13 08:47:48', '清空redis访客记录');
INSERT INTO `mellivorines_blog_job` (`id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_time`, `update_time`, `remark`) VALUES (84, '百度SEO', '默认', 'auroraQuartz.baiduSeo', '0 0/10 * * * ?', 3, 1, 1, '2022-08-13 21:19:08', '2022-08-19 14:13:52', '百度SEO');
INSERT INTO `mellivorines_blog_job` (`id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_time`, `update_time`, `remark`) VALUES (85, '清理定时任务日志', '默认', 'auroraQuartz.clearJobLogs', '0 0 0 * * ?', 3, 1, 1, '2022-08-13 21:26:21', NULL, '清理定时任务日志');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_job_log
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_job_log`;
CREATE TABLE `mellivorines_blog_job_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_id` int NOT NULL COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` tinyint(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6175 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of mellivorines_blog_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_menu
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_menu`;
CREATE TABLE `mellivorines_blog_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '菜单名',
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '菜单路径',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '组件',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '菜单icon',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_num` tinyint(1) NOT NULL COMMENT '排序',
  `parent_id` int DEFAULT NULL COMMENT '父id',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏  0否1是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_menu_parent_id` (`parent_id`),
  CONSTRAINT `fk_menu_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `mellivorines_blog_menu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-菜单';

-- ----------------------------
-- Records of mellivorines_blog_menu
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (1, '首页', '/', '/home/Home.vue', 'el-icon-myshouye', '2021-01-26 17:06:51', '2022-07-27 16:33:11', 1, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (2, '文章管理', '/article-submenu', 'Layout', 'el-icon-mywenzhang-copy', '2021-01-25 20:43:07', '2022-07-27 16:32:55', 2, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (3, '消息管理', '/message-submenu', 'Layout', 'el-icon-myxiaoxi', '2021-01-25 20:44:17', '2022-07-27 16:32:57', 3, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (4, '系统管理', '/system-submenu', 'Layout', 'el-icon-myshezhi', '2021-01-25 20:45:57', '2021-01-25 20:45:59', 5, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (5, '个人中心', '/setting', '/setting/Setting.vue', 'el-icon-myuser', '2021-01-26 17:22:38', '2021-01-26 17:22:41', 7, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (6, '发布文章', '/articles', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2021-01-26 14:30:48', '2021-01-26 14:30:51', 1, 2, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (7, '修改文章', '/articles/*', '/article/Article.vue', 'el-icon-myfabiaowenzhang', '2021-01-26 14:31:32', '2022-07-28 16:28:06', 2, 2, 1);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (8, '文章列表', '/article-list', '/article/ArticleList.vue', 'el-icon-mywenzhangliebiao', '2021-01-26 14:32:13', '2021-01-26 14:32:16', 3, 2, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (9, '分类管理', '/categories', '/category/Category.vue', 'el-icon-myfenlei', '2021-01-26 14:33:42', '2021-01-26 14:33:43', 4, 2, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (10, '标签管理', '/tags', '/tag/Tag.vue', 'el-icon-myicontag', '2021-01-26 14:34:33', '2021-01-26 14:34:36', 5, 2, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (11, '评论管理', '/comments', '/comment/Comment.vue', 'el-icon-mypinglunzu', '2021-01-26 14:35:31', '2021-01-26 14:35:34', 1, 3, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (13, '用户列表', '/users', '/user/User.vue', 'el-icon-myyonghuliebiao', '2021-01-26 14:38:09', '2021-01-26 14:38:12', 1, 202, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (14, '角色管理', '/roles', '/role/Role.vue', 'el-icon-myjiaoseliebiao', '2021-01-26 14:39:01', '2021-01-26 14:39:03', 2, 213, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (15, '接口管理', '/resources', '/resource/Resource.vue', 'el-icon-myjiekouguanli', '2021-01-26 14:40:14', '2021-08-07 20:00:28', 2, 213, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (16, '菜单管理', '/menus', '/menu/Menu.vue', 'el-icon-mycaidan', '2021-01-26 14:40:54', '2021-08-07 10:18:49', 2, 213, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (17, '友链管理', '/links', '/friendLink/FriendLink.vue', 'el-icon-mydashujukeshihuaico-', '2021-01-26 14:41:35', '2021-01-26 14:41:37', 3, 4, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (18, '关于我', '/about', '/about/About.vue', 'el-icon-myguanyuwo', '2021-01-26 14:42:05', '2021-01-26 14:42:10', 4, 4, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (19, '日志管理', '/log-submenu', 'Layout', 'el-icon-myguanyuwo', '2021-01-31 21:33:56', '2021-01-31 21:33:59', 6, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (20, '操作日志', '/operation/log', '/log/OperationLog.vue', 'el-icon-myguanyuwo', '2021-01-31 15:53:21', '2022-07-28 10:51:28', 1, 19, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (201, '在线用户', '/online/users', '/user/Online.vue', 'el-icon-myyonghuliebiao', '2021-02-05 14:59:51', '2021-02-05 14:59:53', 7, 202, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (202, '用户管理', '/users-submenu', 'Layout', 'el-icon-myyonghuliebiao', '2021-02-06 23:44:59', '2022-07-27 16:32:59', 4, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (205, '相册管理', '/album-submenu', 'Layout', 'el-icon-myimage-fill', '2021-08-03 15:10:54', '2021-08-07 20:02:06', 5, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (206, '相册列表', '/albums', '/album/Album.vue', 'el-icon-myzhaopian', '2021-08-03 20:29:19', '2021-08-04 11:45:47', 1, 205, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (208, '照片管理', '/albums/:albumId', '/album/Photo.vue', 'el-icon-myzhaopian', '2021-08-03 21:37:47', '2021-08-05 10:24:08', 1, 205, 1);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (209, '定时任务', '/quartz', '/quartz/Quartz.vue', 'el-icon-myyemianpeizhi', '2021-08-04 11:36:27', '2021-08-07 20:01:26', 2, 4, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (210, '照片回收站', '/photos/delete', '/album/Delete.vue', 'el-icon-myhuishouzhan', '2021-08-05 13:55:19', NULL, 3, 205, 1);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (213, '权限管理', '/permission-submenu', 'Layout', 'el-icon-mydaohanglantubiao_quanxianguanli', '2021-08-07 19:56:55', '2021-08-07 19:59:40', 4, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (214, '网站管理', '/website', '/website/Website.vue', 'el-icon-myxitong', '2021-08-07 20:06:41', NULL, 1, 4, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (220, '定时任务日志', '/quartz/log/:quartzId', '/log/QuartzLog.vue', 'el-icon-myguanyuwo', '2022-07-28 10:53:23', '2022-08-05 10:27:47', 2, 19, 1);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (221, '说说管理', '/talk-submenu', 'Layout', 'el-icon-mypinglun', '2022-08-15 17:27:10', '2022-08-15 17:27:39', 3, NULL, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (222, '说说列表', '/talk-list', '/talk/TalkList.vue', 'el-icon-myiconfontdongtaidianji', '2022-08-15 17:29:05', NULL, 1, 221, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (223, '发布说说', '/talks', '/talk/Talk.vue', 'el-icon-myfabusekuai', '2022-08-15 17:34:26', '2022-08-16 16:06:04', 2, 221, 0);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (224, '修改说说', '/talks/:talkId', '/talk/Talk.vue', 'el-icon-myfabusekuai', '2022-08-16 16:06:59', '2022-08-16 16:08:21', 3, 221, 1);
INSERT INTO `mellivorines_blog_menu` (`id`, `name`, `path`, `component`, `icon`, `create_time`, `update_time`, `order_num`, `parent_id`, `is_hidden`) VALUES (225, '异常日志', '/exception/log', '/log/ExceptionLog.vue', 'el-icon-myguanyuwo', '2022-08-25 13:40:08', '2022-08-25 13:40:31', 1, 19, 0);
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_operation_log`;
CREATE TABLE `mellivorines_blog_operation_log` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `opt_module` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '操作模块',
  `opt_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '操作类型',
  `opt_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '操作url',
  `opt_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '操作方法',
  `opt_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '操作描述',
  `request_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '请求参数',
  `request_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '请求方式',
  `response_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '返回数据',
  `user_id` int NOT NULL COMMENT '用户id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '用户昵称',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '操作ip',
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '操作地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1671 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-操作日志';

-- ----------------------------
-- Records of mellivorines_blog_operation_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_photo
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_photo`;
CREATE TABLE `mellivorines_blog_photo` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_id` int DEFAULT NULL COMMENT '相册id',
  `photo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '照片名',
  `photo_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '照片描述',
  `photo_src` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '照片地址',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_photo_album_id` (`album_id`),
  CONSTRAINT `fk_photo_album_id` FOREIGN KEY (`album_id`) REFERENCES `mellivorines_blog_photo_album` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-照片';

-- ----------------------------
-- Records of mellivorines_blog_photo
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_photo_album
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_photo_album`;
CREATE TABLE `mellivorines_blog_photo_album` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `album_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '相册名',
  `album_desc` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '相册描述',
  `album_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '相册封面',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态值 1公开 2私密',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-相册';

-- ----------------------------
-- Records of mellivorines_blog_photo_album
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_resource
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_resource`;
CREATE TABLE `mellivorines_blog_resource` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resource_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '资源名',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '权限路径',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '请求方式',
  `parent_id` int DEFAULT NULL COMMENT '父模块id',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名访问 0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_rs_ parent_id` (`parent_id`),
  CONSTRAINT `fk_rs_ parent_id` FOREIGN KEY (`parent_id`) REFERENCES `mellivorines_blog_resource` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-资源';

-- ----------------------------
-- Records of mellivorines_blog_resource
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1050, 'aurora信息', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1051, '分类模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1052, '友链模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1053, '定时任务日志模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1054, '定时任务模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1055, '异常处理模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1056, '操作日志模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1057, '文章模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1058, '标签模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1059, '照片模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1060, '用户信息模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1061, '用户账号模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1062, '相册模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1063, '菜单模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1064, '角色模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1065, '评论模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1066, '说说模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1067, '资源模块', NULL, NULL, NULL, 0, '2022-08-19 22:26:21', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1068, '获取系统信息', '/', 'GET', 1050, 1, '2022-08-19 22:26:22', '2022-08-19 22:26:55');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1069, '查看关于我信息', '/about', 'GET', 1050, 1, '2022-08-19 22:26:22', '2022-08-19 22:26:57');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1070, '获取系统后台信息', '/admin', 'GET', 1050, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1071, '修改关于我信息', '/admin/about', 'PUT', 1050, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1072, '获取后台文章', '/admin/articles', 'GET', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1073, '保存和修改文章', '/admin/articles', 'POST', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1074, '删除或者恢复文章', '/admin/articles', 'PUT', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1075, '物理删除文章', '/admin/articles/delete', 'DELETE', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1076, '导出文章', '/admin/articles/export', 'POST', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1077, '上传文章图片', '/admin/articles/images', 'POST', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1078, '导入文章', '/admin/articles/import', 'POST', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1079, '修改文章是否置顶和推荐', '/admin/articles/topAndFeatured', 'PUT', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1080, '根据id查看后台文章', '/admin/articles/*', 'GET', 1057, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1081, '查看后台分类列表', '/admin/categories', 'GET', 1051, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1082, '添加或修改分类', '/admin/categories', 'POST', 1051, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1083, '删除分类', '/admin/categories', 'DELETE', 1051, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1084, '搜索文章分类', '/admin/categories/search', 'GET', 1051, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1085, '查询后台评论', '/admin/comments', 'GET', 1065, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1086, '删除评论', '/admin/comments', 'DELETE', 1065, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1087, '审核评论', '/admin/comments/review', 'PUT', 1065, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1088, '上传博客配置图片', '/admin/config/images', 'POST', 1050, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1089, '获取定时任务的日志列表', '/admin/jobLogs', 'GET', 1053, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1090, '删除定时任务的日志', '/admin/jobLogs', 'DELETE', 1053, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1091, '清除定时任务的日志', '/admin/jobLogs/clean', 'DELETE', 1053, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1092, '获取定时任务日志的所有组名', '/admin/jobLogs/jobGroups', 'GET', 1053, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1093, '获取任务列表', '/admin/jobs', 'GET', 1054, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1094, '添加定时任务', '/admin/jobs', 'POST', 1054, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1095, '修改定时任务', '/admin/jobs', 'PUT', 1054, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1096, '删除定时任务', '/admin/jobs', 'DELETE', 1054, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1097, '获取所有job分组', '/admin/jobs/jobGroups', 'GET', 1054, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1098, '执行某个任务', '/admin/jobs/run', 'PUT', 1054, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1099, '更改任务的状态', '/admin/jobs/status', 'PUT', 1054, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1100, '根据id获取任务', '/admin/jobs/*', 'GET', 1054, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1101, '查看后台友链列表', '/admin/links', 'GET', 1052, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1102, '保存或修改友链', '/admin/links', 'POST', 1052, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1103, '删除友链', '/admin/links', 'DELETE', 1052, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1104, '查看菜单列表', '/admin/menus', 'GET', 1063, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1105, '新增或修改菜单', '/admin/menus', 'POST', 1063, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1106, '修改目录是否隐藏', '/admin/menus/isHidden', 'PUT', 1063, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1107, '删除菜单', '/admin/menus/*', 'DELETE', 1063, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1108, '查看操作日志', '/admin/operation/logs', 'GET', 1056, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1109, '删除操作日志', '/admin/operation/logs', 'DELETE', 1056, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1110, '根据相册id获取照片列表', '/admin/photos', 'GET', 1059, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1111, '保存照片', '/admin/photos', 'POST', 1059, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1112, '更新照片信息', '/admin/photos', 'PUT', 1059, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1113, '删除照片', '/admin/photos', 'DELETE', 1059, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1114, '移动照片相册', '/admin/photos/album', 'PUT', 1059, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1115, '查看后台相册列表', '/admin/photos/albums', 'GET', 1062, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1116, '保存或更新相册', '/admin/photos/albums', 'POST', 1062, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1117, '上传相册封面', '/admin/photos/albums/cover', 'POST', 1062, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1118, '获取后台相册列表信息', '/admin/photos/albums/info', 'GET', 1062, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1119, '根据id删除相册', '/admin/photos/albums/*', 'DELETE', 1062, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1120, '根据id获取后台相册信息', '/admin/photos/albums/*/info', 'GET', 1062, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1121, '更新照片删除状态', '/admin/photos/delete', 'PUT', 1059, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1122, '查看资源列表', '/admin/resources', 'GET', 1067, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1123, '新增或修改资源', '/admin/resources', 'POST', 1067, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1124, '删除资源', '/admin/resources/*', 'DELETE', 1067, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1125, '保存或更新角色', '/admin/role', 'POST', 1064, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1126, '查看角色菜单选项', '/admin/role/menus', 'GET', 1063, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1127, '查看角色资源选项', '/admin/role/resources', 'GET', 1067, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1128, '查询角色列表', '/admin/roles', 'GET', 1064, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1129, '删除角色', '/admin/roles', 'DELETE', 1064, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1130, '查询后台标签列表', '/admin/tags', 'GET', 1058, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1131, '添加或修改标签', '/admin/tags', 'POST', 1058, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1132, '删除标签', '/admin/tags', 'DELETE', 1058, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1133, '搜索文章标签', '/admin/tags/search', 'GET', 1058, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1134, '查看后台说说', '/admin/talks', 'GET', 1066, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1135, '保存或修改说说', '/admin/talks', 'POST', 1066, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1136, '删除说说', '/admin/talks', 'DELETE', 1066, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1137, '上传说说图片', '/admin/talks/images', 'POST', 1066, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1138, '根据id查看后台说说', '/admin/talks/*', 'GET', 1066, 1, '2022-08-19 22:26:22', '2022-08-19 22:33:52');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1139, '查看当前用户菜单', '/admin/user/menus', 'GET', 1063, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1140, '查询后台用户列表', '/admin/users', 'GET', 1061, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1141, '获取用户区域分布', '/admin/users/area', 'GET', 1061, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1142, '修改用户禁用状态', '/admin/users/disable', 'PUT', 1060, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1143, '查看在线用户', '/admin/users/online', 'GET', 1060, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1144, '修改管理员密码', '/admin/users/password', 'PUT', 1061, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1145, '查询用户角色选项', '/admin/users/role', 'GET', 1064, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1146, '修改用户角色', '/admin/users/role', 'PUT', 1060, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1147, '下线用户', '/admin/users/*/online', 'DELETE', 1060, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1148, '获取网站配置', '/admin/website/config', 'GET', 1050, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1149, '更新网站配置', '/admin/website/config', 'PUT', 1050, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1150, '根据相册id查看照片列表', '/albums/*/photos', 'GET', 1059, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:54');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1151, '获取所有文章归档', '/archives/all', 'GET', 1057, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:35');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1152, '获取所有文章', '/articles/all', 'GET', 1057, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:37');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1153, '根据分类id获取文章', '/articles/categoryId', 'GET', 1057, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:38');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1154, '搜索文章', '/articles/search', 'GET', 1057, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:40');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1155, '根据标签id获取文章', '/articles/tagId', 'GET', 1057, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:40');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1156, '获取置顶和推荐文章', '/articles/topAndFeatured', 'GET', 1057, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:41');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1157, '根据id获取文章', '/articles/*', 'GET', 1057, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:42');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1158, '/处理BizException', '/bizException', 'GET', 1055, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1159, '/处理BizException', '/bizException', 'HEAD', 1055, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1160, '/处理BizException', '/bizException', 'POST', 1055, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1161, '/处理BizException', '/bizException', 'PUT', 1055, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1162, '/处理BizException', '/bizException', 'DELETE', 1055, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1163, '/处理BizException', '/bizException', 'OPTIONS', 1055, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1164, '/处理BizException', '/bizException', 'PATCH', 1055, 0, '2022-08-19 22:26:22', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1165, '获取所有分类', '/categories/all', 'GET', 1051, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:05');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1166, '获取评论', '/comments', 'GET', 1065, 1, '2022-08-19 22:26:22', '2022-08-19 22:33:50');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1167, '添加评论', '/comments/save', 'POST', 1065, 0, '2022-08-19 22:26:22', '2022-08-19 22:33:47');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1168, '获取前七个评论', '/comments/topSeven', 'GET', 1065, 1, '2022-08-19 22:26:22', '2022-08-19 22:33:44');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1169, '查看友链列表', '/links', 'GET', 1052, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:13');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1170, '获取相册列表', '/photos/albums', 'GET', 1062, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:25');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1171, 'report', '/report', 'POST', 1050, 1, '2022-08-19 22:26:22', '2022-08-19 22:27:00');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1172, '获取所有标签', '/tags/all', 'GET', 1058, 1, '2022-08-19 22:26:22', '2022-08-19 22:31:23');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1173, '获取前十个标签', '/tags/topTen', 'GET', 1058, 1, '2022-08-19 22:26:22', '2022-08-19 22:31:27');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1174, '查看说说列表', '/talks', 'GET', 1066, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:38');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1175, '根据id查看说说', '/talks/*', 'GET', 1066, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:38');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1176, '更新用户头像', '/users/avatar', 'POST', 1060, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:05');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1177, '发送邮箱验证码', '/users/code', 'GET', 1061, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:15');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1178, '绑定用户邮箱', '/users/email', 'PUT', 1060, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:06');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1179, '更新用户信息', '/users/info', 'PUT', 1060, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:07');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1180, '根据id获取用户信息', '/users/info/*', 'GET', 1060, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:07');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1181, '用户登出', '/users/logout', 'POST', 1061, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:15');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1182, 'qq登录', '/users/oauth/qq', 'POST', 1061, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:16');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1183, '修改密码', '/users/password', 'PUT', 1061, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:18');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1184, '用户注册', '/users/register', 'POST', 1061, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:17');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1185, '修改用户的订阅状态', '/users/subscribe', 'PUT', 1060, 1, '2022-08-19 22:26:22', '2022-08-19 22:28:08');
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1186, '异常日志模块', NULL, NULL, NULL, 0, '2022-08-25 15:13:40', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1187, '获取异常日志', '/admin/exception/logs', 'GET', 1186, 0, '2022-08-25 15:14:27', NULL);
INSERT INTO `mellivorines_blog_resource` (`id`, `resource_name`, `url`, `request_method`, `parent_id`, `is_anonymous`, `create_time`, `update_time`) VALUES (1188, '删除异常日志', '/admin/exception/logs', 'DELETE', 1186, 0, '2022-08-25 15:14:59', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_role
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_role`;
CREATE TABLE `mellivorines_blog_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '角色名',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用  0否 1是',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表角色';

-- ----------------------------
-- Records of mellivorines_blog_role
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_role` (`id`, `role_name`, `is_disable`, `create_time`, `update_time`) VALUES (1, 'admin', 0, '2022-07-20 13:25:19', '2022-08-16 16:07:49');
INSERT INTO `mellivorines_blog_role` (`id`, `role_name`, `is_disable`, `create_time`, `update_time`) VALUES (2, 'user', 0, '2022-07-20 13:25:40', '2022-08-19 22:55:26');
INSERT INTO `mellivorines_blog_role` (`id`, `role_name`, `is_disable`, `create_time`, `update_time`) VALUES (14, 'test', 0, '2022-08-19 21:48:14', '2022-08-19 22:38:15');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_role_menu`;
CREATE TABLE `mellivorines_blog_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `menu_id` int DEFAULT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `r_m_role_id` (`role_id`),
  KEY `r_m_menu_id` (`menu_id`),
  CONSTRAINT `r_m_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `mellivorines_blog_menu` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `r_m_role_id` FOREIGN KEY (`role_id`) REFERENCES `mellivorines_blog_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2886 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-角色-菜单';

-- ----------------------------
-- Records of mellivorines_blog_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2784, 1, 1);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2785, 1, 2);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2786, 1, 6);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2787, 1, 7);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2788, 1, 8);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2789, 1, 9);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2790, 1, 10);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2791, 1, 3);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2792, 1, 11);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2793, 1, 221);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2794, 1, 222);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2795, 1, 223);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2796, 1, 224);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2797, 1, 202);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2798, 1, 13);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2799, 1, 201);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2800, 1, 213);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2801, 1, 14);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2802, 1, 15);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2803, 1, 16);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2804, 1, 4);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2805, 1, 214);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2806, 1, 209);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2807, 1, 17);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2808, 1, 18);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2809, 1, 205);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2810, 1, 206);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2811, 1, 208);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2812, 1, 210);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2813, 1, 19);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2814, 1, 20);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2815, 1, 225);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2816, 1, 220);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2817, 1, 5);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2852, 14, 1);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2853, 14, 2);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2854, 14, 6);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2855, 14, 7);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2856, 14, 8);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2857, 14, 9);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2858, 14, 10);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2859, 14, 3);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2860, 14, 11);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2861, 14, 221);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2862, 14, 222);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2863, 14, 223);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2864, 14, 224);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2865, 14, 202);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2866, 14, 13);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2867, 14, 201);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2868, 14, 213);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2869, 14, 14);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2870, 14, 15);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2871, 14, 16);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2872, 14, 4);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2873, 14, 214);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2874, 14, 209);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2875, 14, 17);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2876, 14, 18);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2877, 14, 205);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2878, 14, 206);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2879, 14, 208);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2880, 14, 210);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2881, 14, 19);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2882, 14, 20);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2883, 14, 225);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2884, 14, 220);
INSERT INTO `mellivorines_blog_role_menu` (`id`, `role_id`, `menu_id`) VALUES (2885, 14, 5);
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_role_resource`;
CREATE TABLE `mellivorines_blog_role_resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int DEFAULT NULL COMMENT '角色id',
  `resource_id` int DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `r_r_role_id` (`role_id`),
  KEY `r_r_resource_id` (`resource_id`),
  CONSTRAINT `r_r_resource_id` FOREIGN KEY (`resource_id`) REFERENCES `mellivorines_blog_resource` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `r_r_role_id` FOREIGN KEY (`role_id`) REFERENCES `mellivorines_blog_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-角色-权限';

-- ----------------------------
-- Records of mellivorines_blog_role_resource
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5406, 2, 1146);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5407, 2, 1167);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5408, 1, 1050);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5409, 1, 1070);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5410, 1, 1071);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5411, 1, 1088);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5412, 1, 1148);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5413, 1, 1149);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5414, 1, 1051);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5415, 1, 1081);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5416, 1, 1082);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5417, 1, 1083);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5418, 1, 1084);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5419, 1, 1052);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5420, 1, 1101);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5421, 1, 1102);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5422, 1, 1103);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5423, 1, 1053);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5424, 1, 1089);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5425, 1, 1090);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5426, 1, 1091);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5427, 1, 1092);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5428, 1, 1054);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5429, 1, 1093);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5430, 1, 1094);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5431, 1, 1095);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5432, 1, 1096);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5433, 1, 1097);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5434, 1, 1098);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5435, 1, 1099);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5436, 1, 1100);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5437, 1, 1055);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5438, 1, 1158);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5439, 1, 1159);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5440, 1, 1160);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5441, 1, 1161);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5442, 1, 1162);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5443, 1, 1163);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5444, 1, 1164);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5445, 1, 1056);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5446, 1, 1108);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5447, 1, 1109);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5448, 1, 1057);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5449, 1, 1072);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5450, 1, 1073);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5451, 1, 1074);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5452, 1, 1075);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5453, 1, 1076);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5454, 1, 1077);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5455, 1, 1078);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5456, 1, 1079);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5457, 1, 1080);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5458, 1, 1058);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5459, 1, 1130);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5460, 1, 1131);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5461, 1, 1132);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5462, 1, 1133);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5463, 1, 1059);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5464, 1, 1110);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5465, 1, 1111);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5466, 1, 1112);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5467, 1, 1113);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5468, 1, 1114);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5469, 1, 1121);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5470, 1, 1060);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5471, 1, 1142);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5472, 1, 1143);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5473, 1, 1146);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5474, 1, 1147);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5475, 1, 1061);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5476, 1, 1140);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5477, 1, 1141);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5478, 1, 1144);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5479, 1, 1062);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5480, 1, 1115);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5481, 1, 1116);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5482, 1, 1117);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5483, 1, 1118);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5484, 1, 1119);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5485, 1, 1120);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5486, 1, 1063);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5487, 1, 1104);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5488, 1, 1105);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5489, 1, 1106);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5490, 1, 1107);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5491, 1, 1126);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5492, 1, 1139);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5493, 1, 1064);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5494, 1, 1125);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5495, 1, 1128);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5496, 1, 1129);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5497, 1, 1145);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5498, 1, 1065);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5499, 1, 1085);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5500, 1, 1086);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5501, 1, 1087);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5502, 1, 1167);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5503, 1, 1066);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5504, 1, 1134);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5505, 1, 1135);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5506, 1, 1136);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5507, 1, 1137);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5508, 1, 1067);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5509, 1, 1122);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5510, 1, 1123);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5511, 1, 1124);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5512, 1, 1127);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5513, 1, 1186);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5514, 1, 1187);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5515, 1, 1188);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5516, 14, 1070);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5517, 14, 1148);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5518, 14, 1081);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5519, 14, 1084);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5520, 14, 1101);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5521, 14, 1089);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5522, 14, 1092);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5523, 14, 1093);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5524, 14, 1097);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5525, 14, 1100);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5526, 14, 1108);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5527, 14, 1072);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5528, 14, 1080);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5529, 14, 1130);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5530, 14, 1133);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5531, 14, 1110);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5532, 14, 1143);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5533, 14, 1140);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5534, 14, 1141);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5535, 14, 1115);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5536, 14, 1118);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5537, 14, 1104);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5538, 14, 1126);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5539, 14, 1139);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5540, 14, 1128);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5541, 14, 1145);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5542, 14, 1085);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5543, 14, 1134);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5544, 14, 1122);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5545, 14, 1127);
INSERT INTO `mellivorines_blog_role_resource` (`id`, `role_id`, `resource_id`) VALUES (5546, 14, 1187);
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_tag`;
CREATE TABLE `mellivorines_blog_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '标签名',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-标签';

-- ----------------------------
-- Records of mellivorines_blog_tag
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_tag` (`id`, `tag_name`, `create_time`, `update_time`) VALUES (1, '数据库', '2023-08-18 19:13:32', '2023-08-18 19:13:35');
INSERT INTO `mellivorines_blog_tag` (`id`, `tag_name`, `create_time`, `update_time`) VALUES (2, 'Mysql', '2023-08-18 20:17:50', '2023-08-18 20:17:53');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_talk
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_talk`;
CREATE TABLE `mellivorines_blog_talk` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '说说id',
  `user_id` int NOT NULL COMMENT '用户id',
  `content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '说说内容',
  `images` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '图片',
  `is_top` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否置顶',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1.公开 2.私密',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_talk_user_id` (`user_id`),
  CONSTRAINT `fk_talk_user_id` FOREIGN KEY (`user_id`) REFERENCES `mellivorines_blog_user_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-说说';

-- ----------------------------
-- Records of mellivorines_blog_talk
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_unique_view
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_unique_view`;
CREATE TABLE `mellivorines_blog_unique_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `views_count` int NOT NULL COMMENT '访问量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1539 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-访问量';

-- ----------------------------
-- Records of mellivorines_blog_unique_view
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_user_auth`;
CREATE TABLE `mellivorines_blog_user_auth` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_info_id` int NOT NULL COMMENT '用户信息id',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '密码',
  `login_type` tinyint(1) NOT NULL COMMENT '登录类型',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '用户登录ip',
  `ip_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '上次登录时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `user_info_id` (`user_info_id`),
  CONSTRAINT `user_info_id` FOREIGN KEY (`user_info_id`) REFERENCES `mellivorines_blog_user_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-用户-登陆';

-- ----------------------------
-- Records of mellivorines_blog_user_auth
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_user_auth` (`id`, `user_info_id`, `username`, `password`, `login_type`, `ip_address`, `ip_source`, `create_time`, `update_time`, `last_login_time`) VALUES (1, 1, 'lilinxi011@163.com', '$2a$10$GlOeNkMyEDo9KbW94o2Gx.VvGA.HC0G5DVXslXzZrv2pKLiY0gOau', 1, '182.118.236.146', '中国|河南省|洛阳市|联通', '2022-08-19 21:43:46', '2022-08-24 20:33:46', '2022-08-24 20:33:46');
INSERT INTO `mellivorines_blog_user_auth` (`id`, `user_info_id`, `username`, `password`, `login_type`, `ip_address`, `ip_source`, `create_time`, `update_time`, `last_login_time`) VALUES (1015, 1025, 'lilinxi015@163.com', '$2a$10$raBKZXgRsnlEcP.4lns2su3Em6l4H1O8vcE3IOXydUJZLYg2ARX0C', 1, NULL, NULL, '2023-09-02 23:51:56', '2023-09-02 23:51:56', NULL);
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_user_info
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_user_info`;
CREATE TABLE `mellivorines_blog_user_info` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '邮箱号',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '用户简介',
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '个人网站',
  `is_subscribe` tinyint(1) DEFAULT NULL COMMENT '是否订阅',
  `is_disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-用户-信息';

-- ----------------------------
-- Records of mellivorines_blog_user_info
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_user_info` (`id`, `email`, `nickname`, `avatar`, `intro`, `website`, `is_subscribe`, `is_disable`, `create_time`, `update_time`) VALUES (1, 'meikaihong015@163.com', '演示账号', 'https://static.linhaojun.top/avatar/2af2e2db20740e712f0a011a6f8c9af5.jpg', '演示账号的用户简介', 'https://www.linhaojun.top', 0, 0, '2022-08-19 21:42:04', '2022-08-24 17:11:35');
INSERT INTO `mellivorines_blog_user_info` (`id`, `email`, `nickname`, `avatar`, `intro`, `website`, `is_subscribe`, `is_disable`, `create_time`, `update_time`) VALUES (1025, 'lilinxi015@163.com', '用户', 'https://static.linhaojun.top/avatar/2af2e2db20740e712f0a011a6f8c9af5.jpg', NULL, NULL, NULL, 0, '2023-09-02 23:51:56', '2023-09-02 23:51:56');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_user_role
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_user_role`;
CREATE TABLE `mellivorines_blog_user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `role_id` int DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `u_r_user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `mellivorines_blog_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `u_r_user_id` FOREIGN KEY (`user_id`) REFERENCES `mellivorines_blog_user_auth` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1034 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-用户-角色';

-- ----------------------------
-- Records of mellivorines_blog_user_role
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_user_role` (`id`, `user_id`, `role_id`) VALUES (1, 1, 1);
INSERT INTO `mellivorines_blog_user_role` (`id`, `user_id`, `role_id`) VALUES (1033, 1015, 2);
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_website_config
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_website_config`;
CREATE TABLE `mellivorines_blog_website_config` (
  `id` int NOT NULL AUTO_INCREMENT,
  `config` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL COMMENT '配置信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-站点配置';

-- ----------------------------
-- Records of mellivorines_blog_website_config
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_website_config` (`id`, `config`, `create_time`, `update_time`) VALUES (1, '{\"alipayQRCode\":\"https://static.linhaojun.top/config/da4c6d8c13f66a8dd6716ddb48d73299.jpg\",\"author\":\"花未眠\",\"authorAvatar\":\"https://static.linhaojun.top/config/6e4f47f4bb66d2d30722d20e789b220e.jpg\",\"authorIntro\":\"一个疯狂的coder\",\"beianNumber\":\"苏ICP备2022012376号\",\"csdn\":\"\",\"englishName\":\"huaweimian\",\"gitee\":\"https://gitee.com/linhaojun\",\"github\":\"https://github.com/linhaojun857\",\"isCommentReview\":0,\"isEmailNotice\":1,\"isReward\":1,\"juejin\":\"\",\"logo\":\"https://static.linhaojun.top/config/cc36e9fa5aeb214e41495c1e2268f2db.png\",\"multiLanguage\":1,\"name\":\"花未眠\",\"notice\":\"代码已经开源，如果你感觉还行就给一个star吧。。。\",\"qq\":\"\",\"qqLogin\":1,\"stackoverflow\":\"\",\"touristAvatar\":\"https://static.linhaojun.top/config/2af2e2db20740e712f0a011a6f8c9af5.jpg\",\"twitter\":\"\",\"userAvatar\":\"https://static.linhaojun.top/config/0af1901da1e64dfb99bb61db21e716c4.jpeg\",\"weChat\":\"\",\"websiteCreateTime\":\"2022-08-19\",\"weiXinQRCode\":\"https://static.linhaojun.top/config/ed47edae605f74306f751c6fba9f14bd.png\",\"weibo\":\"\",\"zhihu\":\"\"}', '2022-07-24 12:05:33', '2022-08-20 12:48:28');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `CRON_EXPRESSION` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`) VALUES ('bootQuartzScheduler', 'BOOT_JOB_1', 'DEFAULT', '0 /2 * * * ? *', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`) VALUES ('bootQuartzScheduler', 'BOOT_JOB_2', 'DEFAULT', '0 /3 * * * ? *', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`, `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`) VALUES ('bootQuartzScheduler', 'BOOT_JOB_1', 'DEFAULT', NULL, 'io.github.mellivorines.salamanderblog.config.quartz.QuartzRecord', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740012424F4F545F4A4F425F504152414D5F4B455973720041696F2E6769746875622E6D656C6C69766F72696E65732E73616C616D616E646572626C6F672E6D6F64656C2E51756172747A4A6F624472616674242424496D706CC9D5DF47524D349A02000F5A00105F5F6265616E4E616D654C6F616465645A00125F5F63726561746554696D654C6F616465645A00125F5F63726F6E4578707265734C6F616465645A000A5F5F69644C6F616465644900095F5F696456616C75655A000E5F5F706172616D734C6F616465645A000E5F5F72656D61726B4C6F616465645A000D5F5F73746174654C6F616465644C000F5F5F6265616E4E616D6556616C75657400124C6A6176612F6C616E672F537472696E673B4C00115F5F63726561746554696D6556616C75657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C00115F5F63726F6E45787072657356616C756571007E00094C000D5F5F706172616D7356616C756571007E00094C000D5F5F72656D61726B56616C756571007E00094C000C5F5F737461746556616C75657400134C6A6176612F6C616E672F496E74656765723B4C000C5F5F7669736962696C6974797400284C6F72672F62616279666973682F6A696D6D65722F72756E74696D652F5669736962696C6974793B787001010101000000010101017400087072696E744A6F627372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E7071A0D11EE7874000E30202F32202A202A202A203F202A74000F7072696E744A6F622D706172616D73740012E68993E58DB0E4BFA1E681AFE4BBBBE58AA1737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000002707800);
INSERT INTO `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`, `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`) VALUES ('bootQuartzScheduler', 'BOOT_JOB_2', 'DEFAULT', NULL, 'io.github.mellivorines.salamanderblog.config.quartz.QuartzRecord', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740012424F4F545F4A4F425F504152414D5F4B455973720041696F2E6769746875622E6D656C6C69766F72696E65732E73616C616D616E646572626C6F672E6D6F64656C2E51756172747A4A6F624472616674242424496D706CC9D5DF47524D349A02000F5A00105F5F6265616E4E616D654C6F616465645A00125F5F63726561746554696D654C6F616465645A00125F5F63726F6E4578707265734C6F616465645A000A5F5F69644C6F616465644900095F5F696456616C75655A000E5F5F706172616D734C6F616465645A000E5F5F72656D61726B4C6F616465645A000D5F5F73746174654C6F616465644C000F5F5F6265616E4E616D6556616C75657400124C6A6176612F6C616E672F537472696E673B4C00115F5F63726561746554696D6556616C75657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C00115F5F63726F6E45787072657356616C756571007E00094C000D5F5F706172616D7356616C756571007E00094C000D5F5F72656D61726B56616C756571007E00094C000C5F5F737461746556616C75657400134C6A6176612F6C616E672F496E74656765723B4C000C5F5F7669736962696C6974797400284C6F72672F62616279666973682F6A696D6D65722F72756E74696D652F5669736962696C6974793B7870010101010000000201010174000874696D65724A6F627372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E7071A0E11EE7874000E30202F33202A202A202A203F202A74001674696D65724A6F622D706172616D732D757064617465740012E697B6E997B4E8BE93E587BAE4BBBBE58AA1737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000002707800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('bootQuartzScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('bootQuartzScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `INSTANCE_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES ('bootQuartzScheduler', 'MacBook-Pro.local1693146132806', 1693146136659, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `JOB_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `JOB_GROUP` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`) VALUES ('bootQuartzScheduler', 'BOOT_JOB_1', 'DEFAULT', 'BOOT_JOB_1', 'DEFAULT', NULL, 1693071720000, -1, 5, 'PAUSED', 'CRON', 1693071691000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740012424F4F545F4A4F425F504152414D5F4B455973720041696F2E6769746875622E6D656C6C69766F72696E65732E73616C616D616E646572626C6F672E6D6F64656C2E51756172747A4A6F624472616674242424496D706CC9D5DF47524D349A02000F5A00105F5F6265616E4E616D654C6F616465645A00125F5F63726561746554696D654C6F616465645A00125F5F63726F6E4578707265734C6F616465645A000A5F5F69644C6F616465644900095F5F696456616C75655A000E5F5F706172616D734C6F616465645A000E5F5F72656D61726B4C6F616465645A000D5F5F73746174654C6F616465644C000F5F5F6265616E4E616D6556616C75657400124C6A6176612F6C616E672F537472696E673B4C00115F5F63726561746554696D6556616C75657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C00115F5F63726F6E45787072657356616C756571007E00094C000D5F5F706172616D7356616C756571007E00094C000D5F5F72656D61726B56616C756571007E00094C000C5F5F737461746556616C75657400134C6A6176612F6C616E672F496E74656765723B4C000C5F5F7669736962696C6974797400284C6F72672F62616279666973682F6A696D6D65722F72756E74696D652F5669736962696C6974793B787001010101000000010101017400087072696E744A6F627372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E7071A0D11EE7874000E30202F32202A202A202A203F202A74000F7072696E744A6F622D706172616D73740012E68993E58DB0E4BFA1E681AFE4BBBBE58AA1737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000002707800);
INSERT INTO `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`) VALUES ('bootQuartzScheduler', 'BOOT_JOB_2', 'DEFAULT', 'BOOT_JOB_2', 'DEFAULT', NULL, 1693071720000, -1, 5, 'PAUSED', 'CRON', 1693071691000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C77080000001000000001740012424F4F545F4A4F425F504152414D5F4B455973720041696F2E6769746875622E6D656C6C69766F72696E65732E73616C616D616E646572626C6F672E6D6F64656C2E51756172747A4A6F624472616674242424496D706CC9D5DF47524D349A02000F5A00105F5F6265616E4E616D654C6F616465645A00125F5F63726561746554696D654C6F616465645A00125F5F63726F6E4578707265734C6F616465645A000A5F5F69644C6F616465644900095F5F696456616C75655A000E5F5F706172616D734C6F616465645A000E5F5F72656D61726B4C6F616465645A000D5F5F73746174654C6F616465644C000F5F5F6265616E4E616D6556616C75657400124C6A6176612F6C616E672F537472696E673B4C00115F5F63726561746554696D6556616C75657400194C6A6176612F74696D652F4C6F63616C4461746554696D653B4C00115F5F63726F6E45787072657356616C756571007E00094C000D5F5F706172616D7356616C756571007E00094C000D5F5F72656D61726B56616C756571007E00094C000C5F5F737461746556616C75657400134C6A6176612F6C616E672F496E74656765723B4C000C5F5F7669736962696C6974797400284C6F72672F62616279666973682F6A696D6D65722F72756E74696D652F5669736962696C6974793B7870010101010000000201010174000874696D65724A6F627372000D6A6176612E74696D652E536572955D84BA1B2248B20C00007870770A05000007E7071A0E11EE7874000E30202F33202A202A202A203F202A74001674696D65724A6F622D706172616D732D757064617465740012E697B6E997B4E8BE93E587BAE4BBBBE58AA1737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000002707800);
COMMIT;

-- ----------------------------
-- Table structure for quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `quartz_job`;
CREATE TABLE `quartz_job` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'SpringBean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '执行参数',
  `cron_expres` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `state` int DEFAULT NULL COMMENT '任务状态：1正常，2暂停，3删除',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='任务列表';

-- ----------------------------
-- Records of quartz_job
-- ----------------------------
BEGIN;
INSERT INTO `quartz_job` (`id`, `bean_name`, `params`, `cron_expres`, `state`, `remark`, `create_time`) VALUES (1, 'printJob', 'printJob-params', '0 /2 * * * ? *', 2, '打印信息任务', '2023-07-26 13:17:17');
INSERT INTO `quartz_job` (`id`, `bean_name`, `params`, `cron_expres`, `state`, `remark`, `create_time`) VALUES (2, 'timerJob', 'timerJob-params-update', '0 /3 * * * ? *', 2, '时间输出任务', '2023-07-26 14:17:17');
COMMIT;

-- ----------------------------
-- Table structure for quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `quartz_log`;
CREATE TABLE `quartz_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` int NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'SpringBean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '执行参数',
  `state` tinyint NOT NULL COMMENT '任务状态：1成功，2失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='任务日志';

-- ----------------------------
-- Records of quartz_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
