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

 Date: 10/12/2023 22:15:48
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
INSERT INTO `mellivorines_blog_about` (`id`, `content`, `create_time`, `update_time`) VALUES (1, '# 个人介绍\n**忻辰** 心心念念，暮暮晨晨\n\n# 喜欢的书\n\n《三体I》\n\n《三体II》\n\n《三体III》\n\n# 爱好\n\n💗Loading\n\n🍓Code\n\n🎵Music\n\n⭐️Study\n\n🤗Playing game is a bit great\n\n# 联系方式\n\n**QQ**: 316595344\n\n**WeChat**: lz316595344', '2022-07-24 17:22:13', '2022-09-23 14:37:34');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_article
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_article`;
CREATE TABLE `mellivorines_blog_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT '作者',
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
  CONSTRAINT `fk_article_user_id` FOREIGN KEY (`user_id`) REFERENCES `mellivorines_blog_user_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-文章';

-- ----------------------------
-- Records of mellivorines_blog_article
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_article` (`id`, `user_id`, `article_cover`, `article_title`, `article_content`, `is_top`, `is_featured`, `is_delete`, `status`, `type`, `password`, `original_url`, `create_time`, `update_time`) VALUES (1, 1, 'http://127.0.0.1:8080/local-plus/photos/656a9324a2f42ab815604db5.jpg', 'mellivorines-blog 博客后台', '# mellivorines-blog 博客后台\n\n## 使用的技术\n### 语言\n- kotlin\n### 框架- 基础框架：SpringBoot3\n- ORM框架：[jimmer](https://github.com/babyfish-ct/jimmer)\n- 权限框架：SpringSecurity\n- 缓存中间件：redis\n- 消息中间件：rabbitmq\n- 搜索引擎：elasticsearch\n- 对象存储：minio\n- 定时任务：quartz', 1, 0, 0, 1, 1, '123456', '\"\"', '2023-08-18 19:16:22', '2023-08-18 19:16:25');
INSERT INTO `mellivorines_blog_article` (`id`, `user_id`, `article_cover`, `article_title`, `article_content`, `is_top`, `is_featured`, `is_delete`, `status`, `type`, `password`, `original_url`, `create_time`, `update_time`) VALUES (2, 1025, 'http://127.0.0.1:8080/local-plus/photos/656a9324a2f42ab815604db5.jpg', '博客文档', '# mellivorines-bog---前后端分离博客\n\n## 前言\n\n- 开源不易，希望大家star支持一下\n- 由于本人上班，空余时间不固定，所以项目更新频率较慢，但是本项目会长期维护，有问题可以提issue，\n  同时也欢迎大家来共建此项目，包括但不限于：bug 修复、代码优化、功能开发等等\n- 本项目后端是kotlin配合springboot3对jimmer的一个实验项目，基于[linhaojun857](https://github.com/linhaojun857)的[aurora](https://github.com/linhaojun857/aurora)博客重构\n\n## 效果图\n\n### 白色主题：\n![图片1](http://127.0.0.1:8080/local-plus/photos/65756b9a81367bee69ba1a06.png)\n![图片2](http://127.0.0.1:8080/local-plus/photos/65756bc881367bee69ba1a07.png)\n\n### 黑色主题：\n![图片3](http://127.0.0.1:8080/local-plus/photos/65756bee81367bee69ba1a08.png)\n![图片4](http://127.0.0.1:8080/local-plus/photos/65756c0b81367bee69ba1a09.png)\n## 相关技术\n\n### 前端：\n\n- 样式来自于：[hexo的aurora主题](https://github.com/auroral-ui/hexo-theme-aurora)\n- 基础框架：vue3(前台) react(后台)\n- 状态管理：pinia(前台) zustand(后台)\n- 路由组件：vue-router(前台) react-router-dom(后台)\n- 网络请求：axios\n- 其他技术：详见前端项目的package.json\n\n### 后端：\n- 语言：kotlin\n- 基础框架：SpringBoot3\n- ORM框架：[jimmer](https://github.com/babyfish-ct/jimmer)\n- 权限框架：SpringSecurity\n- 缓存中间件：redis\n- 消息中间件：rabbitmq\n- 搜索引擎：elasticsearch\n- 对象存储：minio\n- 定时任务：quartz\n- 其他技术：详见后端项目的build.gradle.kts\n\n## 参考的技术文档\n- jimmer:https://babyfish-ct.gitee.io/jimmer-doc/\n\n## 后续计划\n\n- [ ] 前台代码优化\n- [ ] 后台react重构\n\n## 部署\n\n- 详见项目部署文档\n\n## 鸣谢\n- 感谢[babyfish](https://github.com/babyfish-ct/jimmer)开源的强大orm框架', 0, 1, 0, 1, 1, '123456', '\"\"', '2023-08-18 19:16:22', '2023-08-18 19:16:25');
INSERT INTO `mellivorines_blog_article` (`id`, `user_id`, `article_cover`, `article_title`, `article_content`, `is_top`, `is_featured`, `is_delete`, `status`, `type`, `password`, `original_url`, `create_time`, `update_time`) VALUES (135, 1, 'http://127.0.0.1:8080/local-plus/photos/656a9324a2f42ab815604db5.jpg', '滑动窗口（算法）', '# 算法分享：滑动窗口\n## 原题描述：\n给定一个字符串 s ，请你找出其中不含有重复字符的 最长子串 的长度。\n## 思路\n- 定义一个 map 数据结构存储 (k, v)，其中 key 值为字符，value 值为字符位置 +1，加 1 表示从字符位置后一个才开始不重复\n- 我们定义不重复子串的开始位置为 start，结束位置为 end\n- 随着 end 不断遍历向后，会遇到与 [start, end] 区间内字符相同的情况，此时将字符作为 key 值，获取其 value 值，并更新 start，此时 [start, end] 区间内不存在重复字符\n- 无论是否更新 start，都会更新其 map 数据结构和结果 ans。\n- 时间复杂度：O(n)\n## 代码实现\n```java\nimport java.util.HashMap;\n\n/**\n * 滑动窗口\n */\n@SuppressWarnings(\"all\")\nclass Solution {\n    public int lengthOfLongestSubstring(String s) {\n        HashMap<Character, Integer> map = new HashMap<>();\n        int ans = 0;\n        for(int start = 0,end = 0;end < s.length();end++){\n            char charAt = s.charAt(end);\n            if(map.containsKey(charAt)){\n                start = Math.max(map.get(charAt),start);\n            }\n            map.put(charAt,end+1);\n            ans = Math.max(end-start+1,ans);\n        }\n        return ans;\n    }\n\n    public static void main(String[] args) {\n        Solution test = new Solution();\n        System.out.println(test.lengthOfLongestSubstring(\"dvdf\"));\n    }\n}\n```\n\n\n\n', 0, 1, 0, 1, 1, '123456', '\"\"', '2023-08-18 19:16:22', '2023-08-18 19:16:25');
INSERT INTO `mellivorines_blog_article` (`id`, `user_id`, `article_cover`, `article_title`, `article_content`, `is_top`, `is_featured`, `is_delete`, `status`, `type`, `password`, `original_url`, `create_time`, `update_time`) VALUES (136, 1025, 'http://127.0.0.1:8080/local-plus/photos/656a9324a2f42ab815604db5.jpg', 'docker入门', '#  1.docker概述\n\n## 1.1 基本介绍\n\nDocker 是一个开源的应用容器引擎，基于 Go 语言 并遵从 Apache2.0 协议开源。\n\nDocker 可以让开发者打包他们的应用以及依赖包到一个轻量级、可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。\n\n容器是完全使用沙箱机制，相互之间不会有任何接口,更重要的是容器性能开销极低。\n\nDocker 从 17.03 版本之后分为 CE（Community Edition: 社区版） 和 EE（Enterprise Edition: 企业版），我们用社区版就可以了。[官网](https://docs.docker.com/)\n\n##  1.2 应用场景\n\n1. Web 应用的自动化打包和发布。\n\n2. 自动化测试和持续集成、发布。\n\n3. 在服务型环境中部署和调整数据库或其他的后台应用。\n\n4. 从头编译或者扩展现有的 Openshellift 或 Cloud Foundry 平台来搭建自己的 PaaS 环境。\n\n## 1.3 docker 的优势\n\nDocker 是一个用于开发，交付和运行应用程序的开放平台。Docker 使您能够将应用程序与基础架构分开，从而可以快速交付软件。借助 Docker，您可以与管理应用程序相同的方式来管理基础架构。通过利用 Docker 的方法来快速交付，测试和部署代码，您可以大大减少编写代码和在生产环境中运行代码之间的延迟。\n\n1. 快速，一致地交付您的应用程序。Docker 允许开发人员使用您提供的应用程序或服务的本地容器在标准化环境中工作，从而简化了开发的生命周期。\n\n容器非常适合持续集成和持续交付（CI / CD）工作流程，请考虑以下示例方案：\n\n您的开发人员在本地编写代码，并使用 Docker 容器与同事共享他们的工作。\n他们使用 Docker 将其应用程序推送到测试环境中，并执行自动或手动测试。\n当开发人员发现错误时，他们可以在开发环境中对其进行修复，然后将其重新部署到测试环境中，以进行测试和验证。\n测试完成后，将修补程序推送给生产环境，就像将更新的镜像推送到生产环境一样简单。\n\n2. 响应式部署和扩展\n   Docker 是基于容器的平台，允许高度可移植的工作负载。Docker 容器可以在开发人员的本机上，数据中心的物理或虚拟机上，云服务上或混合环境中运行。\n\nDocker 的可移植性和轻量级的特性，还可以使您轻松地完成动态管理的工作负担，并根据业务需求指示，实时扩展或拆除应用程序和服务。\n\n3. 在同一硬件上运行更多工作负载\n   Docker 轻巧快速。它为基于虚拟机管理程序的虚拟机提供了可行、经济、高效的替代方案，因此您可以利用更多的计算能力来实现业务目标。Docker 非常适合于高密度环境以及中小型部署，而您可以用更少的资源做更多的事情。\n\n# 2.虚拟化技术和容器化技术\n\n虚拟化技术特点：\n\n1. 资源占用多\n2. 冗余步骤多 \n3. 启动很慢\n\n容器化技术：容器化技术不是模拟的一个完整的操作系统\n\n比较Docker和虚拟机的不同：\n\n1. 传统虚拟机，虚拟出硬件，运行一个完整的操作系统，然后在这个系统上安装和运行软件。\n2. Docker容器内的应用直接运行在宿主机的内容，容器是没有自己的内核的，也没有虚拟硬件。\n3. 每个容器都是相互隔离的，每个容器都有属于自己的文件系统，互不影响。\n\n![20210717124434988.png](https://static.linhaojun.top/aurora/articles/c7ae4abaa3a228f0344dd4b480ff7445.png)\n\n# 3.docker的基本组成\n\nDocker的基本组成图如下：\n![20210717120256284.png](https://static.linhaojun.top/aurora/articles/8939ae04db634d407f5dec94ba82ec0f.png)\n\n说明：\n\n![20210717120343817.png](https://static.linhaojun.top/aurora/articles/323aef7768be3f055eb34b893202933d.png)\n\n# 4.Docker的安装\n\n查看系统的内核：\n\nuname -r\n\n系统内核版本为3.10.0\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# uname -r\n3.10.0-957.21.3.el7.x86_64\n```\n\n查看系统配置\n\ncat /etc/os-release\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# cat /etc/os-release\nNAME=\"CentOS Linux\"\nVERSION=\"7 (Core)\"\nID=\"centos\"\nID_LIKE=\"rhel fedora\"\nVERSION_ID=\"7\"\nPRETTY_NAME=\"CentOS Linux 7 (Core)\"\nANSI_COLOR=\"0;31\"\nCPE_NAME=\"cpe:/o:centos:centos:7\"\nHOME_URL=\"https://www.centos.org/\"\nBUG_REPORT_URL=\"https://bugs.centos.org/\"\n\nCENTOS_MANTISBT_PROJECT=\"CentOS-7\"\nCENTOS_MANTISBT_PROJECT_VERSION=\"7\"\nREDHAT_SUPPORT_PRODUCT=\"centos\"\nREDHAT_SUPPORT_PRODUCT_VERSION=\"7\"\n```\n\nDocker的安装步骤：\n\n## 4.1 卸载旧的版本\n\n```shell\nyum remove docker \\\n                  docker-client \\\n                  docker-client-latest \\\n                  docker-common \\\n                  docker-latest \\\n                  docker-latest-logrotate \\\n                  docker-logrotate \\\n                  docker-engine\n```\n\n## 4.2 下载需要的安装包\n\n```shell\nyum install -y yum-utils\n```\n\n## 4.3 设置镜像的仓库\n\n```shell\nyum-config-manager \\\n    --add-repo \\\n    https://download.docker.com/linux/centos/docker-ce.repo  #国外的地址\n    \n    # 设置阿里云的Docker镜像仓库\nyum-config-manager \\\n    --add-repo \\\n    https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo  #国内的地址\n```\n\n## 4.4 更新yum软件包索引\n\n```shell\nyum makecache fast\n```\n\n## 4.5 安装docker相关配置\n\ndocker-ce 是社区版，docker-ee 企业版\n\n```shell\nyum install docker-ce docker-ce-cli containerd.io\n```\n\n出现了completed即安装成功。\n\n## 4.6启动docker\n\n```shell\nsystemctl start docker\n# 查看当前版本号，是否启动成功\ndocker version\n# 设置开机自启动\nsystemctl enable docker\n```\n\n结果：\n\n![2021071712515566.png](https://static.linhaojun.top/aurora/articles/386d662b1e8bdd3ffb4aa73dd0d52880.png)\n\n下载hello-world镜像进行测试\n\n![20210717125227931.png](https://static.linhaojun.top/aurora/articles/e7ed7744b2020bfa9c023f38cec17882.png)\n\n查看下载的hello world镜像\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z lib]# docker images\nREPOSITORY    TAG       IMAGE ID       CREATED         SIZE\nhello-world   latest    bf756fb1ae65   11 months ago   13.3kB\n```\n\n# 5.docker的卸载\n\n```shell\n# 1. 卸载依赖\nyum remove docker-ce docker-ce-cli containerd.io\n# 2. 删除资源  . /var/lib/docker是docker的默认工作路径\nrm -rf /var/lib/docker\n```\n\n# 6.配置阿里云镜像加速\n\n## 6.1 进入阿里云官网，搜索容器镜像服务\n\n![20210717125337690.png](https://static.linhaojun.top/aurora/articles/a6fe14af8199d829fec92b3fd9d50744.png)\n\n## 6.2 依次执行官方的这四条命令\n\n```shell\nsudo mkdir -p /etc/docker\nsudo tee /etc/docker/daemon.json <<-\'EOF\'\n{\n  \"registry-mirrors\": [\"https://axvfsf7e.mirror.aliyuncs.com\"]\n}\nEOF\nsudo systemctl daemon-reload\nsudo systemctl restart docker\n```\n\n# 7.Docker容器运行流程\n\n启动一个容器，Docker的运行流程如下图：\n\n![20210717125820781.png](https://static.linhaojun.top/aurora/articles/43cec2d25d563b83ce880150e1590901.png)\n\n# 8.底层原理\n\nDocker是一个Client-Server结构的系统，Docker的守护进程运行在主机上，通过Socker从客户端访问！Docker Server接收到Docker-Client的指令，就会执行这个指令！\n\n![20210717130715341.png](https://static.linhaojun.top/aurora/articles/0b87a663b1ff9f9502e51e6e0bb51e65.png)\n\nDocker为什么比VM Ware快？\n\n1.Docker比虚拟机更少的抽象层\n\n2.docker利用宿主机的内核，VM需要的是Guest OS\n\n![20210717130758965.png](https://static.linhaojun.top/aurora/articles/48a8b69b7b36b30220c80539e5d9f7f4.png)\n\nDocker新建一个容器的时候，不需要像虚拟机一样重新加载一个操作系统内核，直接利用宿主机的操作系统，而虚拟机是需要加载Guest OS。Docker和VM的对比如下：\n\n![20210717134556550.png](https://static.linhaojun.top/aurora/articles/bba1798a5df8d3c2c800b8bd40bddd3c.png)\n\n# 9.docker常用命令\n\n## 9.1 基础命令\n\n```shell\ndocker version          #查看docker的版本信息\ndocker info             #查看docker的系统信息,包括镜像和容器的数量\ndocker 命令 --help       #帮助命令(可查看可选的参数)\ndocker COMMAND --help\n```\n\n命令的帮助[文档地址](https://docs.docker.com/engine/reference/commandline/docker/)\n\n## 9.2 镜像命令\n\n###  **docker images** 查看本地主机的所有镜像\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker images\nREPOSITORY    TAG       IMAGE ID       CREATED         SIZE\nhello-world   latest    bf756fb1ae65   11 months ago   13.3kB\n\n#解释:\n1.REPOSITORY  镜像的仓库源\n\n2.TAG  镜像的标签\n\n3.IMAGE ID 镜像的id\n\n4.CREATED 镜像的创建时间\n\n5.SIZE 镜像的大小\n\n\n# 可选参数\n\n-a/--all 列出所有镜像\n\n-q/--quiet 只显示镜像的id\n```\n\n### **docker search** 搜索镜像\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker search mysql\nNAME                              DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED\nmysql                             MySQL is a widely used, open-source relation…   10308     [OK]\nmariadb                           MariaDB is a community-developed fork of MyS…   3819      [OK]\nmysql/mysql-server                Optimized MySQL Server Docker images. Create…   754                  [OK]\npercona                           Percona Server is a fork of the MySQL relati…   517       [OK]\ncentos/mysql-57-centos7           MySQL 5.7 SQL database server                   86\nmysql/mysql-cluster               Experimental MySQL Cluster Docker images. Cr…   79\ncenturylink/mysql                 Image containing mysql. Optimized to be link…   60                   [OK]\n\n\n#可选参数\n\nSearch the Docker Hub for images\n\nOptions:\n  -f, --filter filter   Filter output based on conditions provided\n      --format string   Pretty-print search using a Go template\n      --limit int       Max number of search results (default 25)\n      --no-trunc        Don\'t truncate output\n      \n      \n#搜索收藏数大于3000的镜像\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker search mysql --filter=STARS=3000\nNAME      DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED\nmysql     MySQL is a widely used, open-source relation…   10308     [OK]\nmariadb   MariaDB is a community-developed fordockerk of MyS…   3819      [OK]\n```\n\n### **docker pull 镜像名[:tag]** 下载镜像\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull mysql\nUsing default tag: latest            #如果不写tag默认就是latest\nlatest: Pulling from library/mysql\n6ec7b7d162b2: Pull complete          #分层下载,docker image的核心-联合文件系统\nfedd960d3481: Pull complete\n7ab947313861: Pull complete\n64f92f19e638: Pull complete\n3e80b17bff96: Pull complete\n014e976799f9: Pull complete\n59ae84fee1b3: Pull complete\nffe10de703ea: Pull complete\n657af6d90c83: Pull complete\n98bfb480322c: Pull complete\n6aa3859c4789: Pull complete\n1ed875d851ef: Pull complete\nDigest: shella256:78800e6d3f1b230e35275145e657b82c3fb02a27b2d8e76aac2f5e90c1c30873 #签名\nStatus: Downloaded newer image for mysql:latest\ndocker.io/library/mysql:latest  #下载来源的真实地址  #docker pull mysql等价于docker pull docker.io/library/mysql:latest\n```\n\n指定版本下载\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull mysql:5.7\n5.7: Pulling from library/mysql\n6ec7b7d162b2: Already exists\nfedd960d3481: Already exists\n7ab947313861: Already exists\n64f92f19e638: Already exists\n3e80b17bff96: Already exists\n014e976799f9: Already exists\n59ae84fee1b3: Already exists\n7d1da2a18e2e: Pull complete\n301a28b700b9: Pull complete\n529dc8dbeaf3: Pull complete\nbc9d021dc13f: Pull complete\nDigest: shella256:c3a567d3e3ad8b05dfce401ed08f0f6bf3f3b64cc17694979d5f2e5d78e10173\nStatus: Downloaded newer image for mysql:5.7\ndocker.io/library/mysql:5.7\n```\n\n### **docker rmi**删除镜像\n\n```shell\n#1.删除指定的镜像id\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker rmi -f  镜像id\n#2.删除多个镜像id\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker rmi -f  镜像id 镜像id 镜像id\n#3.删除全部的镜像id\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker rmi -f  $(docker images -aq)\n```\n\n## 9.3 容器命令\n\n### 如拉取一个centos镜像\n\n```shell\ndocker pull centos\n```\n\n### 运行容器的命令说明\n\n```shell\ndocker run [可选参数] image\n\n#参数说明\n--name=\"名字\"           指定容器名字\n-d                     后台方式运行\n-it                    使用交互方式运行,进入容器查看内容\n-p                     指定容器的端口\n(\n-p ip:主机端口:容器端口  配置主机端口映射到容器端口\n-p 主机端口:容器端口\n-p 容器端口\n)\n-P                     随机指定端口(大写的P)\n```\n\n### 运行并进入容器centos\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -it centos /bin/bashell\n[root@bd1b8900c547 /]# ls      \nbin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var\n```\n\n### 退出容器命令\n\n```shell\n#exit 停止并退出容器（后台方式运行则仅退出）\n#Ctrl+P+Q  不停止容器退出\n[root@bd1b8900c547 /]# exit\nexit\n[root@iZwz99sm8v95sckz8bd2c4Z ~]#\n```\n\n### 列出运行过的容器命令\n\n```shell\n#docker ps \n     # 列出当前正在运行的容器\n-a   # 列出所有容器的运行记录\n-n=? # 显示最近创建的n个容器\n-q   # 只显示容器的编号\n\n\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps -a\nCONTAINER ID   IMAGE          COMMAND       CREATED         STATUS                     PORTS     NAMES\nbca129320bb5   centos         \"/bin/bashell\"   4 minutes ago   Exited (0) 3 minutes ago             optimistic_shelltern\nbd1b8900c547   centos         \"/bin/bashell\"   6 minutes ago   Exited (0) 5 minutes ago             cool_tesla\ncf6adbf1b506   bf756fb1ae65   \"/hello\"      5 hours ago     Exited (0) 5 hours ago               optimistic_darwin\n```\n\n### 删除容器命令\n\n```shell\ndocker rm 容器id                 #删除指定的容器,不能删除正在运行的容器,强制删除使用 rm -f\ndocker rm -f $(docker ps -aq)   #删除所有的容器(慎用)\ndocker ps -a -q|xargs docker rm #删除所有的容器(慎用)\n```\n\n### 启动和停止容器命令\n\n```shell\ndocker start 容器id          #启动容器\ndocker restart 容器id        #重启容器\ndocker stop 容器id           #停止当前运行的容器\ndocker kill 容器id           #强制停止当前容器\n```\n\n### 退出容器命令\n\n```shell\n#exit 停止并退出容器（后台方式运行则仅退出）\n#Ctrl+P+Q  不停止容器退出\n[root@bd1b8900c547 /]# exit\nexit\n[root@iZwz99sm8v95sckz8bd2c4Z ~]#\n```\n\n### 列出运行过的容器命令\n\n```shell\n#docker ps \n     # 列出当前正在运行的容器\n-a   # 列出所有容器的运行记录\n-n=? # 显示最近创建的n个容器\n-q   # 只显示容器的编号\n\n\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps -a\nCONTAINER ID   IMAGE          COMMAND       CREATED         STATUS                     PORTS     NAMES\nbca129320bb5   centos         \"/bin/bashell\"   4 minutes ago   Exited (0) 3 minutes ago             optimistic_shelltern\nbd1b8900c547   centos         \"/bin/bashell\"   6 minutes ago   Exited (0) 5 minutes ago             cool_tesla\ncf6adbf1b506   bf756fb1ae65   \"/hello\"      5 hours ago     Exited (0) 5 hours ago               optimistic_darwin\n```\n\n### 列出运行过的容器命令\n\n```shell\n#docker ps \n     # 列出当前正在运行的容器\n-a   # 列出所有容器的运行记录\n-n=? # 显示最近创建的n个容器\n-q   # 只显示容器的编号\n\n\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps -a\nCONTAINER ID   IMAGE          COMMAND       CREATED         STATUS                     PORTS     NAMES\nbca129320bb5   centos         \"/bin/bashell\"   4 minutes ago   Exited (0) 3 minutes ago             optimistic_shelltern\nbd1b8900c547   centos         \"/bin/bashell\"   6 minutes ago   Exited (0) 5 minutes ago             cool_tesla\ncf6adbf1b506   bf756fb1ae65   \"/hello\"      5 hours ago     Exited (0) 5 hours ago               optimistic_darwin\n```\n\n### 删除容器命令\n\n```shell\ndocker rm 容器id                 #删除指定的容器,不能删除正在运行的容器,强制删除使用 rm -f\ndocker rm -f $(docker ps -aq)   #删除所有的容器\ndocker ps -a -q|xargs docker rm #删除所有的容器\n```\n\n### 启动和停止容器命令\n\n```shell\ndocker start 容器id          #启动容器\ndocker restart 容器id        #重启容器\ndocker stop 容器id           #停止当前运行的容器\ndocker kill 容器id           #强制停止当前容器\n```\n\n## 10.4其他命令的使用\n\n###  日志的查看\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker logs --help\n\nUsage:  docker logs [OPTIONS] CONTAINER\n\nFetch the logs of a container\n\nOptions:\n      --details        shellow extra details provided to logs\n  -f, --follow         Follow log output\n      --since string   shellow logs since timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)\n  -n, --tail string    Number of lines to shellow from the end of the logs (default \"all\")\n  -t, --timestamps     shellow timestamps\n      --until string   shellow logs before a timestamp (e.g. 2013-01-02T13:23:37Z) or relative (e.g. 42m for 42 minutes)\n\n常用：\ndocker logs -tf 容器id\ndocker logs --tail number 容器id #num为要显示的日志条数\n\n\n#docker容器后台运行，必须要有一个前台的进程，否则会自动停止\n#编写shellell脚本循环执行，使得centos容器保持运行状态\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -d centos /bin/shell -c \"while true;do echo hi;sleep 5;done\"\nc703b5b1911ff84d584390263a35707b6024816e1f46542b61918a6327a570dc\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES\nc703b5b1911f   centos    \"/bin/shell -c \'while t…\"   13 seconds ago   Up 10 seconds             pedantic_banach\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker logs -tf --tail 10 c703b5b1911f\n2020-12-27T03:34:07.255599560Z hi\n2020-12-27T03:34:12.257641517Z hi\n2020-12-27T03:34:17.259706294Z hi\n2020-12-27T03:34:22.261693707Z hi\n2020-12-27T03:34:27.262609289Z hi\n2020-12-27T03:34:32.267862677Z hi\n2020-12-27T03:34:37.270382873Z hi\n2020-12-27T03:34:42.272414182Z hi\n2020-12-27T03:34:47.274823243Z hi\n2020-12-27T03:34:52.277419274Z hi\n```\n\n### 查看容器中进程信息\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker top 容器ID\n```\n\n### 查看容器的元数据\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker inspect 容器ID\n```\n\n### 进入当前正在运行的容器\n\n因为通常我们的容器都是使用后台方式来运行的，有时需要进入容器修改配置\n\n方式一：\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it 容器ID /bin/bashell\n[root@c703b5b1911f /]# ls\nbin  dev  etc  home  lib  lib64  lost+found  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var\n[root@c703b5b1911f /]# ps -ef      \nUID        PID  PPID  C STIME TTY          TIME CMD\nroot         1     0  0 03:31 ?        00:00:00 /bin/shell -c while true;do echo hi;sleep 5;done\nroot       279     0  0 03:54 pts/0    00:00:00 /bin/bashell\nroot       315     1  0 03:56 ?        00:00:00 /usr/bin/coreutils --coreutils-prog-shellebang=sleep /usr/bin/sleep 5\nroot       316   279  0 03:56 pts/0    00:00:00 ps -ef\n```\n\n方式二：\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker attach 容器ID\n```\n\n### 拷贝操作\n\n```shell\n#拷贝容器的文件到主机中\ndocker cp 容器id:容器内路径  目的主机路径\n\n#拷贝宿主机的文件到容器中\ndocker cp 目的主机路径 容器id:容器内路径\n```\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it c703b5b1911f /bin/bashell\n[root@c703b5b1911f /]# cd home\n[root@c703b5b1911f home]# ls\n#touch 新建文件\n[root@c703b5b1911f home]# touch test.java\n[root@c703b5b1911f home]# ls\ntest.java\n[root@c703b5b1911f home]# exit\nexit\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS     NAMES\nc703b5b1911f   centos    \"/bin/shell -c \'while t…\"   35 minutes ago   Up 35 minutes             pedantic_banach\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker cp c703b5b1911f:/home/test.java /home\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# ls /home\nhai  pan  test.java\n```\n\n命令小节的图解如下：\n\n![20210717134852290.png](https://static.linhaojun.top/aurora/articles/e4c84e43240ac6c8fe80869c8b0f9b38.png)\n\n# 10.图形化管理工具Portaniner安装\n\nPortaniner是Docker的图形化管理工具，类似的工具还有Rancher(CI/CD再用)\n\n下载运行Portaniner镜像并运行，设置本机映射端口为8088\n\n```shell\n[root@localhost conf]# docker run -d -p 8088:9000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer\nUnable to find image \'portainer/portainer:latest\' locally\nlatest: Pulling from portainer/portainer\n94cfa856b2b1: Pull complete\n49d59ee0881a: Pull complete\na2300fd28637: Pull complete\nDigest: shella256:fb45b43738646048a0a0cc74fcee2865b69efde857e710126084ee5de9be0f3f\nStatus: Downloaded newer image for portainer/portainer:latest\n8c525a0137be22965bd1e3944da622a2c4248f8ad20883f4b3ea4f8a6b11e163\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE                 COMMAND        CREATED         STATUS         PORTS                    NAMES\n7789d4505a00   portainer/portainer   \"/portainer\"   6 seconds ago   Up 5 seconds   0.0.0.0:8088->9000/tcp   quirky_sinoussi\n```\n\n第一次登录设置admin用户的密码\n\n![20210718000547236.png](https://static.linhaojun.top/aurora/articles/0c3aa531443e1634cdde2192f74dad91.png)\n\n如果是阿里云服务器记得设置安全组，选择连接本地的Docker,整体界面预览如下图：\n\n![20210718000659945.png](https://static.linhaojun.top/aurora/articles/59217c0d0f480ccd19aff88c38aedda3.png)\n\n# 11. Docker镜像详解\n\n## 11.1 什么是镜像\n\n镜像是一种轻量级、可执行的独立软件包，用来打包软件运行环境和基于运行环境开发的软件，它包含运行某个软件所需要的所有内容，包括代码，运行时（一个程序在运行或者在被执行的依赖）、库，环境变量和配置文件。\n\n## 11.2 Docker镜像加载原理\n\nDocker的镜像实际上由一层一层的文件系统组成，这种层级的文件系统是UnionFS联合文件系统。\n\n![20210718123220152.png](https://static.linhaojun.top/aurora/articles/18ecd03b542e29101fc0b3afa0b6fdef.png)\n\n![20210718123416610.png](https://static.linhaojun.top/aurora/articles/5a0a8d3d61190745dfa493813e817b59.png)\n\n## 11.3 分层理解\n\n![20210718123512798.png](https://static.linhaojun.top/aurora/articles/7df73cc8000a2ae175a928f9294550a4.png)\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker image inspect nginx:latest\n[\n    {\n        \"Id\": \"shella256:ae2feff98a0cc5095d97c6c283dcd33090770c76d63877caa99aefbbe4343bdd\",\n        \"RepoTags\": [\n            \"nginx:latest\"\n        ],\n        \"RepoDigests\": [\n            \"nginx@shella256:4cf620a5c81390ee209398ecc18e5fb9dd0f5155cd82adcbae532fec94006fb9\"\n        ],\n        \"Parent\": \"\",\n        \"Comment\": \"\",\n        \"Created\": \"2020-12-15T20:21:00.007674532Z\",\n        \"Container\": \"4cc5da85f27ca0d200407f0593422676a3bab482227daee044d797d1798c96c9\",\n        \"ContainerConfig\": {\n            \"Hostname\": \"4cc5da85f27c\",\n            \"Domainname\": \"\",\n            \"User\": \"\",\n            \"AttachStdin\": false,\n            \"AttachStdout\": false,\n            \"AttachStderr\": false,\n            \"ExposedPorts\": {\n                \"80/tcp\": {}\n            },\n            \"Tty\": false,\n            \"OpenStdin\": false,\n            \"StdinOnce\": false,\n            \"Env\": [\n                \"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\",\n                \"NGINX_VERSION=1.19.6\",\n                \"NJS_VERSION=0.5.0\",\n                \"PKG_RELEASE=1~buster\"\n            ],\n            \"Cmd\": [\n                \"/bin/shell\",\n                \"-c\",\n                \"#(nop) \",\n                \"CMD [\\\"nginx\\\" \\\"-g\\\" \\\"daemon off;\\\"]\"\n            ],\n            \"Image\": \"shella256:13bffe371b56f4aeed88218ec17d0c6f653a83b49bd3e211fc8cfa2ca5d7a3d3\",\n            \"Volumes\": null,\n            \"WorkingDir\": \"\",\n            \"Entrypoint\": [\n                \"/docker-entrypoint.shell\"\n            ],\n            \"OnBuild\": null,\n            \"Labels\": {\n                \"maintainer\": \"NGINX Docker Maintainers <docker-maint@nginx.com>\"\n            },\n            \"StopSignal\": \"SIGQUIT\"\n        },\n        \"DockerVersion\": \"19.03.12\",\n        \"Author\": \"\",\n        \"Config\": {\n            \"Hostname\": \"\",\n            \"Domainname\": \"\",\n            \"User\": \"\",\n            \"AttachStdin\": false,\n            \"AttachStdout\": false,\n            \"AttachStderr\": false,\n            \"ExposedPorts\": {\n                \"80/tcp\": {}\n            },\n            \"Tty\": false,\n            \"OpenStdin\": false,\n            \"StdinOnce\": false,\n            \"Env\": [\n                \"PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\",\n                \"NGINX_VERSION=1.19.6\",\n                \"NJS_VERSION=0.5.0\",\n                \"PKG_RELEASE=1~buster\"\n            ],\n            \"Cmd\": [\n                \"nginx\",\n                \"-g\",\n                \"daemon off;\"\n            ],\n            \"Image\": \"shella256:13bffe371b56f4aeed88218ec17d0c6f653a83b49bd3e211fc8cfa2ca5d7a3d3\",\n            \"Volumes\": null,\n            \"WorkingDir\": \"\",\n            \"Entrypoint\": [\n                \"/docker-entrypoint.shell\"\n            ],\n            \"OnBuild\": null,\n            \"Labels\": {\n                \"maintainer\": \"NGINX Docker Maintainers <docker-maint@nginx.com>\"\n            },\n            \"StopSignal\": \"SIGQUIT\"\n        },\n        \"Architecture\": \"amd64\",\n        \"Os\": \"linux\",\n        \"Size\": 132935043,\n        \"VirtualSize\": 132935043,\n        \"GraphDriver\": {\n            \"Data\": {\n                \"LowerDir\": \"/var/lib/docker/overlay2/cb791e78a08db7091bf2ce1d78603f1758f52199e57f1805156fe30e39067aae/diff:/var/lib/docker/overlay2/1e73a72b25af68ee9abf4eb443f778d31226e12e9af428fcc14c7b044c83b258/diff:/var/lib/docker/overlay2/88c9c01762f2af8327db65d0b0d4a64785e87c9c2ab76c62e7d03619db03a985/diff:/var/lib/docker/overlay2/7304ab112ac4a9cb91fc6f74730be28fecbe19f042e92d321aa9181424cc4b2e/diff\",\n                \"MergedDir\": \"/var/lib/docker/overlay2/48b288740bbb2b07b41ed43a4d17a005c46b08d3357d2960b5ef7db4b2de6618/merged\",\n                \"UpperDir\": \"/var/lib/docker/overlay2/48b288740bbb2b07b41ed43a4d17a005c46b08d3357d2960b5ef7db4b2de6618/diff\",\n                \"WorkDir\": \"/var/lib/docker/overlay2/48b288740bbb2b07b41ed43a4d17a005c46b08d3357d2960b5ef7db4b2de6618/work\"\n            },\n            \"Name\": \"overlay2\"\n        },\n        \"RootFS\": {\n            \"Type\": \"layers\",\n            \"Layers\": [\n                \"shella256:87c8a1d8f54f3aa4e05569e8919397b65056aa71cdf48b7f061432c98475eee9\",\n                \"shella256:5c4e5adc71a82a96f02632433de31c998c5a9e2fccdcbaee780ae83158fac4fa\",\n                \"shella256:7d2b207c26790f693ab1942bbe26af8e2b6a14248969e542416155a912fec30d\",\n                \"shella256:2c7498eef94aef8c40d106f3e42f7da62b3eee8fd36012bf7379becc4cd639a2\",\n                \"shella256:4eaf0ea085df254fd5d2beba4e2c11db70a620dfa411a8ad44149e26428caee4\"\n            ]\n        },\n        \"Metadata\": {\n            \"LastTagTime\": \"0001-01-01T00:00:00Z\"\n        }\n    }\n]\n```\n\n这里指示了分层信息：\n\n```shell\n        \"RootFS\": {\n            \"Type\": \"layers\",\n            \"Layers\": [\n                \"shella256:87c8a1d8f54f3aa4e05569e8919397b65056aa71cdf48b7f061432c98475eee9\",\n                \"shella256:5c4e5adc71a82a96f02632433de31c998c5a9e2fccdcbaee780ae83158fac4fa\",\n                \"shella256:7d2b207c26790f693ab1942bbe26af8e2b6a14248969e542416155a912fec30d\",\n                \"shella256:2c7498eef94aef8c40d106f3e42f7da62b3eee8fd36012bf7379becc4cd639a2\",\n                \"shella256:4eaf0ea085df254fd5d2beba4e2c11db70a620dfa411a8ad44149e26428caee4\"\n            ]\n        },\n```\n\n![20210718123636415.png](https://static.linhaojun.top/aurora/articles/9d8fe9bae44994847e6f0048113b63e2.png)\n\n![2021071812372978.png](https://static.linhaojun.top/aurora/articles/f723353894c42cb0c79ef5d5e20acda7.png)\n\n![2021071812374035.png](https://static.linhaojun.top/aurora/articles/000d7691dd3348a07660dc2ce6d8b1c4.png)\n\n## 11.4 提交镜像\n\n```shell\n使用docker commit 命令提交容器成为一个新的版本\n\ndocker commit -m=“提交的描述信息”  -a=\"作者\" 容器id 目标镜像名:[TAG] \n```\n\n由于默认的Tomcat镜像的webapps文件夹中没有任何内容，需要从webapps.dist中拷贝文件到webapps文件夹。下面自行制作镜像：就是从webapps.dist中拷贝文件到webapps文件夹下，并提交该镜像作为一个新的镜像。使得该镜像默认的webapps文件夹下就有文件。具体命令如下：\n\n```shell\n#1.复制文件夹\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -it tomcat /bin/bashell\nroot@2a3bf3eaa2e4:/usr/local/tomcat# cd webapps\nroot@2a3bf3eaa2e4:/usr/local/tomcat/webapps# ls\nroot@2a3bf3eaa2e4:/usr/local/tomcat/webapps# cd ../\nroot@2a3bf3eaa2e4:/usr/local/tomcat# cp -r webapps.dist/* webapps\nroot@2a3bf3eaa2e4:/usr/local/tomcat# cd webapps\nroot@2a3bf3eaa2e4:/usr/local/tomcat/webapps# ls\nROOT  docs  examples  host-manager  manager\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE                 COMMAND        CREATED         STATUS         PORTS                    NAMES\n2a3bf3eaa2e4   tomcat                \"/bin/bashell\"    4 minutes ago   Up 4 minutes   8080/tcp                 competent_torvalds\n7789d4505a00   portainer/portainer   \"/portainer\"   24 hours ago    Up 24 hours    0.0.0.0:8088->9000/tcp   quirky_sinoussi\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it 2a3bf3eaa2e4 /bin/bashell\nroot@2a3bf3eaa2e4:/usr/local/tomcat# cd webapps\nroot@2a3bf3eaa2e4:/usr/local/tomcat/webapps# ls\nROOT  docs  examples  host-manager  manager\nroot@2a3bf3eaa2e4:/usr/local/tomcat/webapps# cd ../\nroot@2a3bf3eaa2e4:/usr/local/tomcat# read escape sequence\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE                 COMMAND        CREATED         STATUS         PORTS                    NAMES\n2a3bf3eaa2e4   tomcat                \"/bin/bashell\"    8 minutes ago   Up 8 minutes   8080/tcp                 competent_torvalds\n7789d4505a00   portainer/portainer   \"/portainer\"   24 hours ago    Up 24 hours    0.0.0.0:8088->9000/tcp   quirky_sinoussi\n#2.提交镜像作为一个新的镜像\n\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker commit -m=\"add webapps\" -a=\"Ethan\" 2a3bf3eaa2e4 mytomcat:1.0\nshella256:f189aac861de51087af5bc88a5f1de02d9574e7ee2d163c647dd7503a2d3982b\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker images\nREPOSITORY            TAG       IMAGE ID       CREATED         SIZE\nmytomcat              1.0       f189aac861de   7 seconds ago   653MB\nmysql                 5.7       f07dfa83b528   6 days ago      448MB\ntomcat                latest    feba8d001e3f   10 days ago     649MB\nnginx                 latest    ae2feff98a0c   12 days ago     133MB\ncentos                latest    300e315adb2f   2 weeks ago     209MB\nportainer/portainer   latest    62771b0b9b09   5 months ago    79.1MB\nelasticsearch         7.6.2     f29a1ee41030   9 months ago    791MB\n\n#3.运行容器\n\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -it mytomcat:1.0 /bin/bashell\nroot@1645774d4605:/usr/local/tomcat# cd webapps\nroot@1645774d4605:/usr/local/tomcat/webapps# ls\nROOT  docs  examples  host-manager  manager\nwz99sm8v95sckz8bd2c4Z ~]# docker images\nREPOSITORY            TAG       IMAGE ID       CREATED         SIZE\nmytomcat              1.0       f189aac861de   7 seconds ago   653MB\nmysql                 5.7       f07dfa83b528   6 days ago      448MB\ntomcat                latest    feba8d001e3f   10 days ago     649MB\nnginx                 latest    ae2feff98a0c   12 days ago     133MB\ncentos                latest    300e315adb2f   2 weeks ago     209MB\nportainer/portainer   latest    62771b0b9b09   5 months ago    79.1MB\nelasticsearch         7.6.2     f29a1ee41030   9 months ago    791MB\n```\n\n# 12.常用容器部署\n\n## 12.1 Nginx部署\n\n1. 搜索并下载镜像\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker search nginx\nNAME                               DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED\nnginx                              Official build of Nginx.                        14207     [OK]       \njwilder/nginx-proxy                Automated Nginx reverse proxy for docker con…   1932                 [OK]\nricharvey/nginx-php-fpm            Container running Nginx + PHP-FPM capable of…   797                  [OK]\nlinuxserver/nginx                  An Nginx container, brought to you by LinuxS…   137                  \njc21/nginx-proxy-manager           Docker container for managing Nginx proxy ho…   123                  \ntiangolo/nginx-rtmp                Docker image with Nginx using the nginx-rtmp…   107                  [OK]\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull nginx\nUsing default tag: latest\nlatest: Pulling from library/nginx\n6ec7b7d162b2: Already exists \ncb420a90068e: Pull complete \n2766c0bf2b07: Pull complete \ne05167b6a99d: Pull complete \n70ac9d795e79: Pull complete \nDigest: shella256:4cf620a5c81390ee209398ecc18e5fb9dd0f5155cd82adcbae532fec94006fb9\nStatus: Downloaded newer image for nginx:latest\ndocker.io/library/nginx:latest\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker images;\nREPOSITORY   TAG       IMAGE ID       CREATED       SIZE\nmysql        5.7       f07dfa83b528   5 days ago    448MB\nnginx        latest    ae2feff98a0c   11 days ago   133MB\ncentos       latest    300e315adb2f   2 weeks ago   209MB\n```\n\n可以到[dockerhub官网](https://hub.docker.com/_/nginx)查看Nginx的详细版本信息\n\n2. 运行测试\n\n```shell\ndocker run -d --name nginx01 -p 3334:80 nginx\n\n-d 后台运行\n--name 给容器命名\n-p 3334:80 将宿主机的端口3334映射到该容器的80端口\n```\n\n运行结果：\n\n```shell\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it nginx01 /bin/bashell\nError: No such container: nginx01\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -d --name nginx01 -p 3334:80 nginx\n20c896637ff5de8be835797109d62ee2465e28d9d716be5a8d550ef7d547fcf5\n[root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\nCONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                  NAMES\n20c896637ff5   nginx     \"/docker-entrypoint.…\"   7 seconds ago   Up 5 seconds   0.0.0.0:3334->80/tcp   nginx01\n```\n\n端口暴露的概念\n\n![20210718124656411.png](https://static.linhaojun.top/aurora/articles/fc0d205dbe5278bbcbbc63b15949f587.png)\n\n3. 配置文件\n   进入容器，自定义配置文件\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it nginx01 /bin/bashell\n   root@20c896637ff5:/# whereis nginx\n   nginx: /usr/sbin/nginx /usr/lib/nginx /etc/nginx /usr/shellare/nginx\n   root@20c896637ff5:/# cd /etc/nginx\n   root@20c896637ff5:/etc/nginx# ls\n   conf.d	fastcgi_params	koi-utf  koi-win  mime.types  modules  nginx.conf  scgi_params	uwsgi_params  win-utf\n   root@20c896637ff5:/# cd /etc/nginx\n   root@20c896637ff5:/etc/nginx# ls\n   conf.d	fastcgi_params	koi-utf  koi-win  mime.types  modules  nginx.conf  scgi_params	uwsgi_params  win-utf\n   ```\n\n4. 访问测试\n   本地主机访问测试，curl命令发起请求，如果使用阿里云服务器需要设置安全组。\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker ps\n   CONTAINER ID   IMAGE     COMMAND                  CREATED         STATUS         PORTS                  NAMES\n   20c896637ff5   nginx     \"/docker-entrypoint.…\"   7 minutes ago   Up 7 minutes   0.0.0.0:3334->80/tcp   nginx01\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# curl localhost:3334\n   <!DOCTYPE html>\n   <html>\n   <head>\n   <title>Welcome to nginx!</title>\n   <style>\n       body {\n           width: 35em;\n           margin: 0 auto;\n           font-family: Tahoma, Verdana, Arial, sans-serif;\n       }\n   </style>\n   </head>\n   <body>\n   <h1>Welcome to nginx!</h1>\n   <p>If you see this page, the nginx web server is successfully installed and\n   working. Further configuration is required.</p>\n   \n   <p>For online documentation and support please refer to\n   <a href=\"http://nginx.org/\">nginx.org</a>.<br/>\n   Commercial support is available at\n   <a href=\"http://nginx.com/\">nginx.com</a>.</p>\n   \n   <p><em>Thank you for using nginx.</em></p>\n   </body>\n   </html>\n   ```\n\n5. 安装vim\n\n   我们使用Nginx往往需要编写配置文件，但是Nginx官方镜像没有安装vim，需要我们手动进行安装。使用以下命令进行安装：\n\n   ```shell\n   #检查是否已安装\n   rpm -qa|grep vim\n   #如果已安装，会显示：\n   [root@localhost usr]# rpm -qa|grep vim\n   vim-minimal-7.4.629-6.el7.x86_64\n   vim-filesystem-7.4.629-6.el7.x86_64\n   vim-enhanced-7.4.629-6.el7.x86_64\n   vim-common-7.4.629-6.el7.x86_64\n   vim-X11-7.4.629-6.el7.x86_64\n   #安装\n   #如果缺少了其中某个，比如说： vim-enhanced这个包少了，则执行：\n   yum -y install vim-enhanced\n   #它会自动下载安装。如果上面三个包一个都没有显示，则直接输入命令：\n   yum -y install vim*\n   #配置\n   vim /etc/vimrc\n   #打开文件后，按 i 进入编辑模式，然后找一个位置添加如下代码\n   set nu          \" 设置显示行号\n   set shellowmode    \" 设置在命令行界面最下面显示当前模式等\n   set ruler       \" 在右下角显示光标所在的行数等信息\n   set autoindent  \" 设置每次单击Enter键后，光标移动到下一行时与上一行的起始字符对齐\n   syntax on       \" 即设置语法检测，当编辑C或者shellell脚本时，关键字会用特殊颜色显示\n   ```\n\n   ps: **由于到目前为止还没学到数据卷，具体的设置以及编写配置文件，你可以先到后面了解一下数据卷，再来编写配置文件**\n\n## 12.2 Tomcat的部署\n\n1. 下载并运行\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker pull tomcat\n   Using default tag: latest\n   latest: Pulling from library/tomcat\n   6c33745f49b4: Pull complete \n   ef072fc32a84: Pull complete \n   c0afb8e68e0b: Pull complete \n   d599c07d28e6: Pull complete \n   e8a829023b97: Pull complete \n   d04be46a31d1: Pull complete \n   db6007c69c35: Pull complete \n   e4ad4c894bce: Pull complete \n   248895fda357: Pull complete \n   277059b4cba2: Pull complete \n   Digest: shella256:57dae7dfb9b62a413cde65334c8a18893795cac70afc3be589c8336d8244655d\n   Status: Downloaded newer image for tomcat:latest\n   docker.io/library/tomcat:latest\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker run -d -p 3335:8080 --name tomcat01 tomcat\n   7136295a6082cb0f805b025a1471bde02ead4864be3e2c9dcd337b1dde0a3113\n   ```\n\n2. 进入容器\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# docker exec -it tomcat01 /bin/bashell\n   root@7136295a6082:/usr/local/tomcat# ls\n   BUILDING.txt  CONTRIBUTING.md  LICENSE	NOTICE	README.md  RELEASE-NOTES  RUNNING.txt  bin  conf  lib  logs  native-jni-lib  temp  webapps  webapps.dist  work\n   root@7136295a6082:/usr/local/tomcat# cd webapps.dist\n   root@7136295a6082:/usr/local/tomcat/webapps.dist# ls\n   ROOT  docs  examples  host-manager  manager\n   root@7136295a6082:/usr/local/tomcat/webapps.dist# cd ROOT\n   root@7136295a6082:/usr/local/tomcat/webapps.dist/ROOT# ls\n   RELEASE-NOTES.txt  WEB-INF  asf-logo-wide.svg  bg-button.png  bg-middle.png  bg-nav.png  bg-upper.png  favicon.ico  index.jsp  tomcat.css  tomcat.svg\n   root@7136295a6082:/usr/local/tomcat/webapps.dist/ROOT# cd ../../\n   root@7136295a6082:/usr/local/tomcat# cd webapps\n   root@7136295a6082:/usr/local/tomcat/webapps# ls\n   root@7136295a6082:/usr/local/tomcat/webapps# cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/\n   root@7136295a6082:/usr/local/tomcat/webapps# ls\n   ROOT  docs  examples  host-manager  manager\n   root@7136295a6082:/usr/local/tomcat/webapps# exit\n   exit\n   ```\n\n3. 访问测试\n\n   ```shell\n   [root@iZwz99sm8v95sckz8bd2c4Z ~]# curl localhost:3335\n   \n   <!DOCTYPE html>\n   <html lang=\"en\">\n       <head>\n           <meta charset=\"UTF-8\" />\n           <title>Apache Tomcat/9.0.41</title>\n           <link href=\"favicon.ico\" rel=\"icon\" type=\"image/x-icon\" />\n           <link href=\"tomcat.css\" rel=\"styleshelleet\" type=\"text/css\" />\n       </head>\n   \n       <body>\n           <div id=\"wrapper\">\n               <div id=\"navigation\" class=\"curved container\">\n                   <span id=\"nav-home\"><a href=\"https://tomcat.apache.org/\">Home</a></span>\n                   <span id=\"nav-hosts\"><a href=\"/docs/\">Documentation</a></span>\n                   <span id=\"nav-config\"><a href=\"/docs/config/\">Configuration</a></span>\n                   <span id=\"nav-examples\"><a href=\"/examples/\">Examples</a></span>\n                   <span id=\"nav-wiki\"><a href=\"https://wiki.apache.org/tomcat/FrontPage\">Wiki</a></span>\n                   <span id=\"nav-lists\"><a href=\"https://tomcat.apache.org/lists.html\">Mailing Lists</a></span>\n                   <span id=\"nav-help\"><a href=\"https://tomcat.apache.org/findhelp.html\">Find Help</a></span>\n                   <br class=\"separator\" />\n               </div>\n   ```\n\n   \n\n## 12.3ElasticSearch部署\n\n### 安装elasticsearch并部署\n\n1. 拉取Elasticsearch镜像\n\n   ```shell\n   docker pull elasticsearch:7.7.0\n   ```\n\n![21782a576ca644869ba50165184f056e.png](https://static.linhaojun.top/aurora/articles/c196fe08e838e2a0423b754d3dc684dc.png)\n\n查看镜像命令：docker images\n删除镜像命令：`docker rmi <镜像名:版本号>` or docker rmi <镜像id>\n![77d67f2c1f404c4286eefca7e5c8c5cd.png](https://static.linhaojun.top/aurora/articles/19ad83720725e1fa05abf01b81b50286.png)\n\n2. 启动前准备\n   创建存放数据及配置文件的文件夹，启动时挂载。\n\n   ```shell\n   mkdir -p  /home/elasticsearch/data/ \n   mkdir -p  /home/elasticsearch/config/\n   ```\n\n![962ad3c43cd24b75bdec7a75e971efdb.png](https://static.linhaojun.top/aurora/articles/b4bb3cc9d1071e8a8ea49d97bf842821.png)\n\n**解释**：\n\n- -p： 参数来创建多级文件夹\n- tree：以树形结构展示文件目录\n\n**编写配置文件**\n\n```shell\necho \'http.host: 0.0.0.0\nhttp.cors.enabled: true\nhttp.cors.allow-origin: \"*\" \'>>/home/elasticsearch/config/elasticsearch.yml\n```\n\n![c0bc056bc3764c0a8689691c25889aa5.png](https://static.linhaojun.top/aurora/articles/e7882a6612dedd91167a1a534c5c99e8.png)\n\n解释：\n\n- echo >> ：是利用了shellell编程语法，使用echo >>指令向文件追加内容，原内容将保存\n  - 使用 > 指令的话就是覆盖文件原内容并重新输入内容，若文件不存在则创建文件。\n\n- cat：展示文件内容。\n- `http.cors.enabled: true` 和`http.cors.allow-origin: \"*\"`配置是为了解决跨域问题，因为等下还要下载可视化工具查看。\n\n修改文件夹权限\n\n```shell\nchmod -R 777 /home/elasticsearch/\nls -l # 查看文件权限\n```\n\n![789f7ed4c5134540994ce1bfabcfd7b5.png](https://static.linhaojun.top/aurora/articles/3510ab8132ab856ec4d63a1dcdbd57a0.png)\n\n3. 启动elasticseach镜像\n\n   ```shell\n   docker run --name elasticsearch -p 9200:9200 \\\n    -p 9300:9300 \\\n    -e \"discovery.type=single-node\" \\\n    -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\" \\\n     -v /home/elasticsearch/config/elasticsearch.yml:/usr/shellare/elasticsearch/config/elasticsearch.yml \\\n    -v /home/elasticsearch/data:/usr/shellare/elasticsearch/data \\\n    -v /home/elasticsearch/plugins:/usr/shellare/elasticsearch/plugins \\\n    -d elasticsearch:7.7.0\n   ```\n\n   参数解释：\n\n   ```shell\n   --name elasticsearch：将容器命名为 elasticsearch\n   -p 9200:9200：将容器的9200端口映射到宿主机9200端口\n   -p 9300:9300：将容器的9300端口映射到宿主机9300端口，目的是集群互相通信\n   -e \"discovery.type=single-node\"：单例模式\n   -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\"：配置内存大小\n   -v /mydata/elasticsearch/config/elasticsearch.yml:/usr/shellare/elasticsearch/config/elasticsearch.yml：将配置文件挂载到宿主机\n   -v /mydata/elasticsearch/data:/usr/shellare/elasticsearch/data：将数据文件夹挂载到宿主机\n   -v /mydata/elasticsearch/plugins:/usr/shellare/elasticsearch/plugins：将插件目录挂载到宿主机(需重启)\n   -d elasticsearch:7.7.0：后台运行容器，并返回容器ID\n   ```\n\n   执行结果：\n\n![0051149a31544ce9bcc6dd0c609f951c.png](https://static.linhaojun.top/aurora/articles/f728bfec12bd9f2e239415169216a417.png)\n\n接下来我们就是拿浏览器访问啦。\n\n在浏览器上输入：`服务器IP地址:9200`\n\n4. 可能出现的问题\n\n   - 启动成功，但是访问失败的话，查看一下安全组中映射端口是否已经打开。如果是本地虚拟机，可能与防火墙相关（我用的云服务器，没有测试，如果有问题，还是需要大家自行去百度||谷歌一下）。\n\n   - -e ES_JAVA_OPTS=\"-Xms64m -Xmx128m\"：配置内存大小出现了问题。（可试着调一下，docker玩不坏的，莫慌）\n\n   - 最后就还有可能是配置文件中出现了问题。\n\n```shell\necho \'http.host: 0.0.0.0\nhttp.cors.enabled: true\nhttp.cors.allow-origin: \"*\" \'>>/home/elasticsearch/config/elasticsearch.yml\n```\n\n`http.host: 0.0.0.0` 在冒号后面有一个空格的，这里的配置文件是`yml`格式,所以一定要严格按照`yml`格式来书写。\n\n5. 为Elasticsearch安装ik分词器\n\n   分词:即把一段中文或者别的划分成一个个的关键字,我们在搜索时候会把自己的信息进行分词,会把数据库中或者索引库中的数据进行分词,然后进行一个匹配操作,默认的中文分词器是将每个字看成一个词,比如\"我爱技术\"会被分为\"我\",“爱”,“技”,“术”。\n\n![77f584371974494aa1cd13d571f4a814.png](https://static.linhaojun.top/aurora/articles/40aa7b6cb700eea549b5462705fec705.png)\n\n结果：\n\n```json\n{\n    \"tokens\": [\n        {\n            \"token\": \"我\",\n            \"start_offset\": 0,\n            \"end_offset\": 1,\n            \"type\": \"<IDEOGRAPHIC>\",\n            \"position\": 0\n        },\n        {\n            \"token\": \"爱\",\n            \"start_offset\": 1,\n            \"end_offset\": 2,\n            \"type\": \"<IDEOGRAPHIC>\",\n            \"position\": 1\n        },\n        {\n            \"token\": \"技\",\n            \"start_offset\": 2,\n            \"end_offset\": 3,\n            \"type\": \"<IDEOGRAPHIC>\",\n            \"position\": 2\n        },\n        {\n            \"token\": \"术\",\n            \"start_offset\": 3,\n            \"end_offset\": 4,\n            \"type\": \"<IDEOGRAPHIC>\",\n            \"position\": 3\n        }\n    ]\n}\n```\n\n这显然不符合要求,所以我们需要安装中文分词器IK来解决这个问题\n\nIK提供了两个分词算法:`ik_smart`和`ik_max_word`\n\n其中`ik_smart`为最少切分,`ik_max_word`为最细粒度划分\n\n### 安装ik分词器\n\n进入已经启动成功的elasticsearch容器。\n\n```shell\ndocker exec -it elasticsearch /bin/bashell\n```\n\n![6bb212d2660941619b6b47902d2fb3b5.png](https://static.linhaojun.top/aurora/articles/fdddc3ad8ddea2eb89591d714ee2389c.png)\n\n```shell\n./bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.7.0/elasticsearch-analysis-ik-7.7.0.zip\n```\n\nps: **安装的ik分词器的版本一定要与elasticsearch的版本保持一致**\n\n![57a832d36b07437098afc687112f8540.png](https://static.linhaojun.top/aurora/articles/8ecde9759a2191ce2b2511b2da79b6e8.png)\n\n下载过程中会出现这个问题，直接输入 y回车就可以了。\n![57ec3132e7084cc89d32d4a784fc9405.png](https://static.linhaojun.top/aurora/articles/8dc9db8717dec1c42ded2d5e0a497458.png)\n\n下载完成之后，退出去，重新启动elasticsearch容器。\n\n```shell\ndocker restart elasticsearch #  <容器名o容器id>   重启容器命令\n```\n\n![89c033d3379b4fbfb8191fc0385a8534.png](https://static.linhaojun.top/aurora/articles/72f7d9f1c437609e95d35bbd6e951357.png)\n\n测试ik分词器是否安装成功\n\n安装完成后，我们再来进行测试遍，看看有什么样的变化。\n\npostman post请求分词测试：`http://服务器IP地址:9200/_analyze`\n\n```json\n{\n	\"tokenizer\":\"ik_smart\",// 分词器不同，这个地方也会有变化 具体的可能还需要去学习。\n	\"text\":\"我爱技术\"\n}\n```\n\n![0e2bda8bee7440fe9911b786c9a29363.png](https://static.linhaojun.top/aurora/articles/aac3ae4c600f401b4ce1a25e733e4534.png)\n\n```json\n{\n    \"tokens\": [\n        {\n            \"token\": \"我\",\n            \"start_offset\": 0,\n            \"end_offset\": 1,\n            \"type\": \"CN_CHAR\",\n            \"position\": 0\n        },\n        {\n            \"token\": \"爱\",\n            \"start_offset\": 1,\n            \"end_offset\": 2,\n            \"type\": \"CN_CHAR\",\n            \"position\": 1\n        },\n        {\n            \"token\": \"技术\",\n            \"start_offset\": 2,\n            \"end_offset\": 4,\n            \"type\": \"CN_WORD\",\n            \"position\": 2\n        }\n    ]\n}\n```\n\n### 安装Elasticsearch可视化工具 | mobz/elasticsearch-head:5\n\n`Elasticsearch`可视化工具有多种，可以根据自己的喜好进行选择，我这里使用的是`mobz/elasticsearch-head:5`而已。\n\n1. 拉取镜像\n\n```shell\ndocker pull mobz/elasticsearch-head:5\n```\n![533b907f8094484e94e7ede928bc80d2.png](https://static.linhaojun.top/aurora/articles/303d9cc8fe674a831b4fcfc56748ee0a.png)\n\n2. 启动镜像\n\n   ```shell\n   docker run -d --name elasticsearch-head -p 9100:9100 mobz/elasticsearch-head:5\n   ```\n\n![3576fd4f048b46c5bdc241d09facd478.png](https://static.linhaojun.top/aurora/articles/1c03e5ca92c146fbc100b87a0db04745.png)\n\n3. 测试\n\n   我们在浏览器访问：http://服务器IP:9100/\n![746009504f2a4c9fb2c18e15095eec32.png](https://static.linhaojun.top/aurora/articles/59db93ca961f475d7478a84406ac6a6e.png)\n   \n   \n\n4. 可能出现的问题\n\n   elasticsearch配置文件elasticsearch.yml中 缺少了下列跨域配置\n\n   ```shell\n   http.cors.enabled: true \n   http.cors.allow-origin: \"*\"\n   ```\n\n   \n\n## 12.4MySQL的部署\n\n1. 下载并运行\n\n   ```shell\n   #拉取并运行容器\n   docker run -d --name mysql-5.7 -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\n   ```\n\n   参数说明：\n\n   ```shell\n   -p 3306:3306 ：映射容器服务的 3306 端口到宿主机的 3306 端口，外部主机可以直接通过 宿主机ip:3306 访问到 MySQL 的服务。\n   MYSQL_ROOT_PASSWORD=123456：设置 MySQL 服务 默认账号root 用户的密码。\n   ```\n\n2. 进入容器查看mysql服务\n\n   进入容器，并通过账号root查看MySQL服务能否正常连接\n\n   ```shell\n   docker exec -it 9b3aad6819ff /bin/bashell\n   mysql -h localhost -u root -p\n   ```\n\n![1063e7abc3b9453e8962e2c80de648d1.png](https://static.linhaojun.top/aurora/articles/889d00a12113ff244fd97022cc05959b.png)\n', 0, 0, 0, 1, 1, '123456', '\"\"', '2023-08-18 19:16:22', '2023-08-18 19:16:25');
COMMIT;

-- ----------------------------
-- Table structure for mellivorines_blog_article_category
-- ----------------------------
DROP TABLE IF EXISTS `mellivorines_blog_article_category`;
CREATE TABLE `mellivorines_blog_article_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `article_id` int NOT NULL COMMENT '文章id',
  `category_id` int NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_tag_1` (`article_id`) USING BTREE,
  KEY `fk_article_tag_2` (`category_id`) USING BTREE,
  CONSTRAINT `mellivorines_blog_article_category_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `mellivorines_blog_article` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `mellivorines_blog_article_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `mellivorines_blog_category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-文章标签';

-- ----------------------------
-- Records of mellivorines_blog_article_category
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_article_category` (`id`, `article_id`, `category_id`) VALUES (1, 1, 1);
INSERT INTO `mellivorines_blog_article_category` (`id`, `article_id`, `category_id`) VALUES (2, 2, 2);
INSERT INTO `mellivorines_blog_article_category` (`id`, `article_id`, `category_id`) VALUES (3, 135, 2);
INSERT INTO `mellivorines_blog_article_category` (`id`, `article_id`, `category_id`) VALUES (4, 136, 1);
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
INSERT INTO `mellivorines_blog_article_tag` (`id`, `article_id`, `tag_id`) VALUES (2, 2, 2);
INSERT INTO `mellivorines_blog_article_tag` (`id`, `article_id`, `tag_id`) VALUES (3, 1, 3);
INSERT INTO `mellivorines_blog_article_tag` (`id`, `article_id`, `tag_id`) VALUES (4, 2, 4);
INSERT INTO `mellivorines_blog_article_tag` (`id`, `article_id`, `tag_id`) VALUES (5, 135, 3);
INSERT INTO `mellivorines_blog_article_tag` (`id`, `article_id`, `tag_id`) VALUES (6, 136, 4);
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
INSERT INTO `mellivorines_blog_category` (`id`, `category_name`, `create_time`, `update_time`) VALUES (2, 'kotlin', '2023-12-02 16:58:13', '2023-12-02 16:58:17');
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
  CONSTRAINT `fk_comment_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `mellivorines_blog_comment` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_comment_user_id` FOREIGN KEY (`user_id`) REFERENCES `mellivorines_blog_user_info` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=1032 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-内容';

-- ----------------------------
-- Records of mellivorines_blog_comment
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_comment` (`id`, `user_id`, `topic_id`, `comment_content`, `reply_user_id`, `parent_id`, `type`, `is_delete`, `is_review`, `create_time`, `update_time`) VALUES (1, 1025, 68, '测试评论', 1, NULL, 5, 0, 1, '2023-12-03 20:12:05', '2023-12-03 20:12:08');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-友链';

-- ----------------------------
-- Records of mellivorines_blog_friend_link
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_friend_link` (`id`, `link_name`, `link_avatar`, `link_address`, `link_intro`, `create_time`, `update_time`) VALUES (49, '个人博客', 'https://www.ixinjiu.cn/img2.jpg', 'https://www.wuweijan.cn/', 'qweqw', '2023-09-16 22:45:43', '2023-09-16 22:45:43');
INSERT INTO `mellivorines_blog_friend_link` (`id`, `link_name`, `link_avatar`, `link_address`, `link_intro`, `create_time`, `update_time`) VALUES (51, '忻辰', 'https://www.ixinjiu.cn/img2.jpg', 'https://www.ixinjiu.cn', '心心念念，暮暮晨晨', '2023-09-18 04:13:05', '2023-09-18 04:13:05');
INSERT INTO `mellivorines_blog_friend_link` (`id`, `link_name`, `link_avatar`, `link_address`, `link_intro`, `create_time`, `update_time`) VALUES (52, 'LinYD', 'http://thirdqq.qlogo.cn/g?b=oidb&k=MZGdfr2siaeicUgib1JbicZWbQ&s=40&t=1653931352', 'http://linyyd.top/', 'LinYD的个人博客', '2023-09-18 04:13:41', '2023-09-18 04:13:41');
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
INSERT INTO `mellivorines_blog_photo` (`id`, `album_id`, `photo_name`, `photo_desc`, `photo_src`, `is_delete`, `create_time`, `update_time`) VALUES (1, 1, '我的', '大杀手', 'http://127.0.0.1:8080/local-plus/markdown/6532978126365f4187334e7f.jpeg', 0, '2023-10-20 23:08:42', '2023-10-20 23:08:47');
INSERT INTO `mellivorines_blog_photo` (`id`, `album_id`, `photo_name`, `photo_desc`, `photo_src`, `is_delete`, `create_time`, `update_time`) VALUES (2, 1, '阿是大叔', '大厦', 'http://127.0.0.1:8080/local-plus/photos/656a9324a2f42ab815604db5.jpg', 0, '2023-12-02 10:15:55', '2023-12-02 10:15:59');
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
INSERT INTO `mellivorines_blog_photo_album` (`id`, `album_name`, `album_desc`, `album_cover`, `is_delete`, `status`, `create_time`, `update_time`) VALUES (1, '我的', '个人相片', 'http://127.0.0.1:8080/local-plus/markdown/6532978126365f4187334e7f.jpeg', 0, 0, '2023-10-20 23:03:39', '2023-10-20 23:03:43');
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
INSERT INTO `mellivorines_blog_tag` (`id`, `tag_name`, `create_time`, `update_time`) VALUES (2, '测试', '2023-08-18 20:17:50', '2023-08-18 20:17:53');
INSERT INTO `mellivorines_blog_tag` (`id`, `tag_name`, `create_time`, `update_time`) VALUES (3, 'asdhgaas', '2023-12-07 19:30:34', '2023-12-07 19:30:37');
INSERT INTO `mellivorines_blog_tag` (`id`, `tag_name`, `create_time`, `update_time`) VALUES (4, 'asdjagsdadadwq', '2023-12-07 19:30:49', '2023-12-07 19:30:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-说说';

-- ----------------------------
-- Records of mellivorines_blog_talk
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_talk` (`id`, `user_id`, `content`, `images`, `is_top`, `status`, `create_time`, `update_time`) VALUES (68, 1025, '想要的东西就自己去获取,by 引入，绽放，辐射。', 'http://xinchen-blog123.oss-cn-shanghai.aliyuncs.com/avatar/7b6a50d7fa6c13053e34a8ff1942cb76.jpg', 0, 0, '2023-12-02 15:25:23', '2023-12-02 15:25:23');
INSERT INTO `mellivorines_blog_talk` (`id`, `user_id`, `content`, `images`, `is_top`, `status`, `create_time`, `update_time`) VALUES (69, 1025, '想要的东西就自己去获取,assjhkcgsdcsdavfdsa。', 'http://xinchen-blog123.oss-cn-shanghai.aliyuncs.com/avatar/7b6a50d7fa6c13053e34a8ff1942cb76.jpg', 0, 0, '2023-12-02 15:33:15', '2023-12-02 15:33:15');
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
INSERT INTO `mellivorines_blog_user_info` (`id`, `email`, `nickname`, `avatar`, `intro`, `website`, `is_subscribe`, `is_disable`, `create_time`, `update_time`) VALUES (1, 'meikaihong015@163.com', '演示账号', 'http://127.0.0.1:8080/local-plus/photos/656a9324a2f42ab815604db5.jpg', '演示账号的用户简介', 'http://localhost:5173/', 0, 0, '2022-08-19 21:42:04', '2022-08-24 17:11:35');
INSERT INTO `mellivorines_blog_user_info` (`id`, `email`, `nickname`, `avatar`, `intro`, `website`, `is_subscribe`, `is_disable`, `create_time`, `update_time`) VALUES (1025, 'lilinxi015@163.com', '用户', 'http://127.0.0.1:8080/local-plus/photos/656a9324a2f42ab815604db5.jpg', '阿萨德和v啊大', 'http://localhost:5173/', 0, 0, '2023-09-02 23:51:56', '2023-09-02 23:51:56');
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
  `config` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '配置信息',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_german2_ci ROW_FORMAT=DYNAMIC COMMENT='表-站点配置';

-- ----------------------------
-- Records of mellivorines_blog_website_config
-- ----------------------------
BEGIN;
INSERT INTO `mellivorines_blog_website_config` (`id`, `config`, `create_time`, `update_time`) VALUES (1, '{\n  \"alipayQRCode\": \"https://i.postimg.cc/N08FHz01/Hippopx.jpg\",\n  \"author\": \"南城\",\n  \"authorAvatar\": \"https://i.postimg.cc/N08FHz01/Hippopx.jpg\",\n  \"authorIntro\": \"轻舟已过万重山\",\n  \"beianNumber\": \"贵ICP备2023102376号\",\n  \"csdn\": \"\",\n  \"englishName\": \"mellivorines\",\n  \"gitee\": \"https://gitee.com/mellivorines\",\n  \"github\": \"https://github.com/mellivorines\",\n  \"isCommentReview\": 0,\n  \"isEmailNotice\": 1,\n  \"isReward\": 1,\n  \"juejin\": \"\",\n  \"logo\": \"https://i.postimg.cc/N08FHz01/Hippopx.jpg\",\n  \"multiLanguage\": 1,\n  \"name\": \"南城\",\n  \"notice\": \"爱在西元前\",\n  \"qq\": \"2320876857\",\n  \"qqLogin\": 1,\n  \"stackoverflow\": \"\",\n  \"touristAvatar\": \"https://i.postimg.cc/N08FHz01/Hippopx.jpg\",\n  \"twitter\": \"\",\n  \"userAvatar\": \"https://i.postimg.cc/N08FHz01/Hippopx.jpg\",\n  \"weChat\": \"\",\n  \"websiteCreateTime\": \"2029-10-19\",\n  \"weiXinQRCode\": \"https://i.postimg.cc/N08FHz01/Hippopx.jpg\"\"weibo\": \"\",\n  \"zhihu\": \"\"\n}', '2022-07-24 12:05:33', '2022-08-20 12:48:28');
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
