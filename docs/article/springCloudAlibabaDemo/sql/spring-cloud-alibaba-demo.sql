/******************************************/
/*   表名称 = user              */
/******************************************/
CREATE TABLE `user` (
                        `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户id',
                        `user_account` varchar(32) NOT NULL COMMENT '用户账号',
                        `user_password` varchar(32) NOT NULL COMMENT '用户密码',
                        `user_info` varchar(32) NOT NULL COMMENT '用户信息',
                        `create_time` TIMESTAMP NOT NULL COMMENT '创建时间',
                        PRIMARY KEY (`user_id`),
-- 唯一性约束，用户账号必须唯一
                        UNIQUE KEY `user_account_unique_index` (`user_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';


/******************************************/
/*   表名称 = article              */
/******************************************/
CREATE TABLE `article` (
                           `article_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '文章id',
                           `article_title` varchar(32) NOT NULL COMMENT '文章标题',
                           `article_content` varchar(128) NOT NULL COMMENT '文章内容',
                           `article_label` varchar(64) NOT NULL COMMENT '文章标签',
                           `create_time` TIMESTAMP NOT NULL COMMENT '创建时间',
-- 更新时间，当使用update 更新数据时候自动更新数据为当前时间,文章新增sql INSERT 时指定更新时间为 创建时间的值
                           `update_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
                           PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章表';

/******************************************/
/*   表名称 = article_association_thump_up              */
/******************************************/
CREATE TABLE `article_association_thump_up` (
                                                `article_association_thump_up_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '点赞id',
                                                `article_id` bigint(20) NOT NULL COMMENT '文章id',
                                                `user_id` bigint(20) NOT NULL COMMENT '用户id',
                                                `thumb_up_time` TIMESTAMP  NOT NULL COMMENT '点赞时间',
                                                PRIMARY KEY (`article_association_thump_up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='点赞表';

/******************************************/
/*   表名称 = article_association_comment              */
/******************************************/
CREATE TABLE `article_association_comment` (
                                               `article_association_comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
                                               `article_id` bigint(20) NOT NULL COMMENT '文章id',
                                               `user_id` bigint(20) NOT NULL COMMENT '用户id',
                                               `comment` varchar(256) DEFAULT NULL COMMENT '评论',
                                               `comment_time` TIMESTAMP NOT NULL COMMENT '评论时间',
                                               PRIMARY KEY (`article_association_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';

/******************************************/
/*   新增用户2 文章4  初始数据       */
/******************************************/
INSERT INTO user (user_account, user_password, user_info, create_time) VALUES ('testUser', 'testUser','测试用户','2024-05-03 08:30:00');
INSERT INTO user (user_account, user_password, user_info, create_time) VALUES ('visitor', 'visitor','游客','2024-05-03 10:30:00');

INSERT INTO article (article_title, article_content, article_label, create_time, update_time) VALUES ('spring-cloud-alibaba-demo', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/springCloudAlibabaDemo.md','spring-cloud-alibaba,nacos,mysql,jdk1.8','2024-04-30 08:30:00','2024-04-30 08:30:00');
INSERT INTO article (article_title, article_content, article_label, create_time, update_time) VALUES ('ubuntuInstallJdk', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallJdk.md','jdk1.8','2024-05-01 08:30:00','2024-05-01 08:30:00');
INSERT INTO article (article_title, article_content, article_label, create_time, update_time) VALUES ('ubuntuInstallMysql', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallMysql.md','Mysql','2024-05-02 08:30:00','2024-05-02 08:30:00');
INSERT INTO article (article_title, article_content, article_label, create_time, update_time) VALUES ('ubuntuInstallNacos', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallNacos.md','nacos','2024-05-03 08:30:00','2024-05-03 08:30:00');
