CREATE TABLE `wts_admin` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员 ID',
	`account` VARCHAR(255) NOT NULL COMMENT '登录账户',
	`password` VARCHAR(255) NOT NULL COMMENT '登录密码 sha1',
	`name` VARCHAR(255) NOT NULL COMMENT '用户姓名',
	`super_admin` TINYINT(1) UNSIGNED NOT NULL COMMENT '是否是超级管理员(1是，0不是)',
	`crt_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`upd_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY (`id`)
)
	COMMENT = '管理员用户表';

CREATE TABLE `wts_users` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户的 ID',
	`openid` CHAR(28) NOT NULL COMMENT '微信openid',
	`name` VARCHAR(255) NULL COMMENT '用户姓名',
	`phone` VARCHAR(20) NULL COMMENT '用户手机号码',
	`nickname` VARCHAR(255) NOT NULL COMMENT '微信昵称',
	`subscribe` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户是否关注(0未关注，1关注)',
	`sex` ENUM('0','1','2') NOT NULL COMMENT '用户性别(0未知，1男性，2女性)',
	`country` VARCHAR(255) NULL COMMENT '用户所在国家',
	`province` VARCHAR(255) NULL COMMENT '用户所在省份',
	`city` VARCHAR(255) NULL COMMENT '用户所在城市',
	`language` VARCHAR(255) NULL COMMENT '用户所用语言',
	`headimgurl` VARCHAR(255) NULL COMMENT '微信头像',
	`subscribe_time` INT(11) UNSIGNED NULL COMMENT '用户关注的时间',
	`unionid` CHAR(50) NULL COMMENT '用户的 unionid',
	`remark` VARCHAR(255) NULL COMMENT '公众号运营者对粉丝的备注',
	`groupid` INT(11) UNSIGNED NULL COMMENT '用户所在的分组ID',
	`tagid_list` VARCHAR(255) NULL COMMENT '用户被打上的标签ID列表',
	`privilege` VARCHAR(255) NULL COMMENT '用户特权信息(json数据)',
	`crt_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`upd_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY (`id`) ,
	UNIQUE INDEX `unique_index_users_openid` (`openid` ASC) COMMENT 'openid 保持唯一' ,
	UNIQUE INDEX `unique_index_users_phone` (`phone` ASC) COMMENT '用户手机号唯一索引'
)
	COMMENT = '用户表';

CREATE TABLE `wts_reply` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '回复ID',
	`type` TINYINT(3) UNSIGNED NOT NULL COMMENT '回复类型(0 关注回复; 1 自动回复; 2 关键字回复；3 菜单点击回复)',
	`msg_type` TINYINT(3) UNSIGNED NOT NULL COMMENT '消息类型(0 文本; 1 图片; 2 图文)',
	`keyword` VARCHAR(255) NULL COMMENT '关键字',
	`content` VARCHAR(255) NULL COMMENT '回复的文本内容或描述信息',
	`media_id` CHAR(50) NULL COMMENT '微信素材ID',
	`title` VARCHAR(255) NULL COMMENT '消息标题',
	`music` VARCHAR(255) NULL COMMENT '音乐链接',
	`hq_music` VARCHAR(255) NULL COMMENT '高质量音乐链接',
	`thumb` CHAR(50) NULL COMMENT '缩略图的媒体素材ID',
	`news` VARCHAR(255) NULL COMMENT '图文消息的文章ID集合(英文逗号分隔)',
	`crt_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`upd_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY (`id`) ,
	INDEX `index_wx_reply_type` (`type` ASC) COMMENT '回复类型索引'
)
	COMMENT = '微信自动回复';

CREATE TABLE `wts_menus` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
	`ordering` TINYINT(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排列次序',
	`name` VARCHAR(8) NOT NULL COMMENT '菜单名称',
	`type` TINYINT(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '菜单类型(0 一级；1 链接；2 回复)',
	`view` VARCHAR(255) NULL DEFAULT NULL COMMENT '跳转网址',
	`reply` INT(11) UNSIGNED NULL DEFAULT NULL COMMENT '回复信息的ID',
	`parent` INTEGER(11) UNSIGNED NULL DEFAULT NULL COMMENT '父级菜单ID(二级菜单需要)',
	`crt_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`upd_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY (`id`)
)
	COMMENT = '微信自定义菜单';

CREATE TABLE `wts_articles` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID',
	`type` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文章类型(0 外链；1内容)',
	`title` VARCHAR(255) NOT NULL COMMENT '文章名称',
	`cover` VARCHAR(255) NOT NULL COMMENT '文章封面大图',
	`thumb` VARCHAR(255) NULL COMMENT '标题小图(用于多图文消息的右侧)',
	`desc` VARCHAR(255) NOT NULL COMMENT '文章描述',
	`link` VARCHAR(255) NULL COMMENT '文章外链URL',
	`content` TEXT NULL COMMENT '文章内容',
	`publish_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '文章发布时间(可预设)',
	`crt_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`upd_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY (`id`)
)
	COMMENT = '文章表';

CREATE TABLE `wts_article_lists` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '列表ID',
	`name` VARCHAR(255) NOT NULL COMMENT '列表名称',
	`crt_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`upd_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY (`id`)
)
	COMMENT = '微信文章列表';

CREATE TABLE `wts_article_list_detail` (
	`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章ID',
	`list` INT(11) UNSIGNED NOT NULL COMMENT '所属文章列表的ID',
	`article` INT(11) UNSIGNED NOT NULL COMMENT '文章ID',
	`crt_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`upd_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
	PRIMARY KEY (`id`) ,
	UNIQUE INDEX `unique_index_article_list_detail_list_article` (`list` ASC, `article` ASC) COMMENT '文章列表ID与文章ID唯一索引'
)
	COMMENT = '微信文章列表和文章映射表';


ALTER TABLE `wts_menus` ADD CONSTRAINT `fk_wts_menus_wts_reply_1` FOREIGN KEY (`reply`) REFERENCES `wts_reply` (`id`);
ALTER TABLE `wts_article_list_detail` ADD CONSTRAINT `fk_wts_article_list_detail_wts_article_lists_1` FOREIGN KEY (`list`) REFERENCES `wts_article_lists` (`id`);
ALTER TABLE `wts_article_list_detail` ADD CONSTRAINT `fk_wts_article_list_detail_wts_articles_1` FOREIGN KEY (`article`) REFERENCES `wts_articles` (`id`);

ALTER TABLE `wts_menus` DROP FOREIGN KEY `fk_wts_menus_wts_reply_1`;
ALTER TABLE `wts_article_list_detail` DROP FOREIGN KEY `fk_wts_article_list_detail_wts_article_lists_1`;
ALTER TABLE `wts_article_list_detail` DROP FOREIGN KEY `fk_wts_article_list_detail_wts_articles_1`;

DROP INDEX `unique_index_users_openid` ON `wts_users`;
DROP INDEX `unique_index_users_phone` ON `wts_users`;
DROP INDEX `index_wx_reply_type` ON `wts_reply`;
DROP INDEX `unique_index_article_list_detail_list_article` ON `wts_article_list_detail`;
