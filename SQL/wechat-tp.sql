/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 5.7.23-log : Database - wechat-tp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `wts_admin` */

DROP TABLE IF EXISTS `wts_admin`;

CREATE TABLE `wts_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员 ID',
  `account` varchar(50) NOT NULL DEFAULT '' COMMENT '登录账户',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码 sha1',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `super_admin` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否是超级管理员(1是，0不是)',
  `crt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`account`) COMMENT '用户名'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='管理员用户表';

/*Data for the table `wts_admin` */

insert  into `wts_admin`(`id`,`account`,`password`,`name`,`super_admin`,`crt_time`,`upd_time`) values 
(1,'ADMIN','0937afa17f4dc08f3c0e5dc908158370ce64df86','ADMIN',1,'2018-10-26 15:13:16','2018-10-26 16:53:45'),
(2,'UID','0937afa17f4dc08f3c0e5dc908158370ce64df86','UID',1,'2018-10-26 15:13:16','2018-10-26 16:53:46');

/*Table structure for table `wts_article_list_detail` */

DROP TABLE IF EXISTS `wts_article_list_detail`;

CREATE TABLE `wts_article_list_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `list` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属文章列表的ID',
  `article` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `crt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_wts_article_list_detail_wts_articles_1` (`article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信文章列表和文章映射表';

/*Data for the table `wts_article_list_detail` */

/*Table structure for table `wts_article_lists` */

DROP TABLE IF EXISTS `wts_article_lists`;

CREATE TABLE `wts_article_lists` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '列表ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '列表名称',
  `crt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信文章列表';

/*Data for the table `wts_article_lists` */

/*Table structure for table `wts_articles` */

DROP TABLE IF EXISTS `wts_articles`;

CREATE TABLE `wts_articles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '文章类型(0 外链；1内容)',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '文章名称',
  `cover` varchar(255) NOT NULL DEFAULT '' COMMENT '文章封面大图',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '标题小图(用于多图文消息的右侧)',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '文章描述',
  `link` varchar(255) DEFAULT '' COMMENT '文章外链URL',
  `content` text COMMENT '文章内容',
  `publish_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章发布时间(可预设)',
  `crt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

/*Data for the table `wts_articles` */

/*Table structure for table `wts_menus` */

DROP TABLE IF EXISTS `wts_menus`;

CREATE TABLE `wts_menus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `ordering` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排列次序',
  `name` varchar(8) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '菜单类型(0 一级；1 链接；2 回复)',
  `view` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转网址',
  `reply` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '回复信息的ID',
  `parent` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级菜单ID(二级菜单需要)',
  `crt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `fk_wts_menus_wts_reply_1` (`reply`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信自定义菜单';

/*Data for the table `wts_menus` */

/*Table structure for table `wts_reply` */

DROP TABLE IF EXISTS `wts_reply`;

CREATE TABLE `wts_reply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '回复ID',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '回复类型(0 关注回复; 1 自动回复; 2 关键字回复；3 菜单点击回复)',
  `msg_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '消息类型(0 文本; 1 图片; 2 图文)',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '回复的文本内容或描述信息',
  `media_id` char(50) NOT NULL DEFAULT '' COMMENT '微信素材ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '消息标题',
  `music` varchar(255) NOT NULL DEFAULT '' COMMENT '音乐链接',
  `hq_music` varchar(255) NOT NULL DEFAULT '' COMMENT '高质量音乐链接',
  `thumb` char(50) NOT NULL DEFAULT '' COMMENT '缩略图的媒体素材ID',
  `news` varchar(255) NOT NULL DEFAULT '' COMMENT '图文消息的文章ID集合(英文逗号分隔)',
  `crt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信自动回复';

/*Data for the table `wts_reply` */

/*Table structure for table `wts_users` */

DROP TABLE IF EXISTS `wts_users`;

CREATE TABLE `wts_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户的 ID',
  `openid` char(28) NOT NULL DEFAULT '' COMMENT '微信openid',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `nickname` varchar(100) NOT NULL DEFAULT '' COMMENT '微信昵称',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户是否关注(0未关注，1关注)',
  `sex` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '用户性别(0未知，1男性，2女性)',
  `country` varchar(255) NOT NULL DEFAULT '' COMMENT '用户所在国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '用户所在省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(255) NOT NULL DEFAULT '' COMMENT '用户所用语言',
  `headimgurl` varchar(255) NOT NULL DEFAULT '' COMMENT '微信头像',
  `subscribe_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户关注的时间',
  `unionid` char(50) NOT NULL DEFAULT '' COMMENT '用户的 unionid',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号运营者对粉丝的备注',
  `groupid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户所在的分组ID',
  `tagid_list` varchar(255) NOT NULL DEFAULT '' COMMENT '用户被打上的标签ID列表',
  `privilege` varchar(255) NOT NULL DEFAULT '' COMMENT '用户特权信息(json数据)',
  `crt_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `upd_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

/*Data for the table `wts_users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
