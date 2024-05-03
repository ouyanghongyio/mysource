/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.197.3@scad
 Source Server Type    : MySQL
 Source Server Version : 80036 (8.0.36-0ubuntu0.22.04.1)
 Source Host           : 192.168.197.3:3306
 Source Schema         : spring_cloud_alibaba_demo

 Target Server Type    : MySQL
 Target Server Version : 80036 (8.0.36-0ubuntu0.22.04.1)
 File Encoding         : 65001

 Date: 03/05/2024 12:38:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `article_title` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '文章标题',
  `article_content` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '文章内容',
  `article_label` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '文章标签',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'spring-cloud-alibaba-demo', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/springCloudAlibabaDemo.md', 'spring-cloud-alibaba,nacos,mysql,jdk1.8', '2024-04-30 08:30:00', '2024-04-30 08:30:00');
INSERT INTO `article` VALUES (2, 'ubuntuInstallJdk', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallJdk.md', 'jdk1.8', '2024-05-01 08:30:00', '2024-05-01 08:30:00');
INSERT INTO `article` VALUES (3, 'ubuntuInstallMysql', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallMysql.md', 'Mysql', '2024-05-02 08:30:00', '2024-05-02 08:30:00');
INSERT INTO `article` VALUES (4, 'ubuntuInstallNacos', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallNacos.md', 'nacos', '2024-05-03 08:30:00', '2024-05-03 08:30:00');

-- ----------------------------
-- Table structure for article_association_comment
-- ----------------------------
DROP TABLE IF EXISTS `article_association_comment`;
CREATE TABLE `article_association_comment`  (
  `article_association_comment_id` bigint NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `article_id` bigint NOT NULL COMMENT '文章id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `comment` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '评论',
  `comment_time` timestamp NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`article_association_comment_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_association_comment
-- ----------------------------

-- ----------------------------
-- Table structure for article_association_thump_up
-- ----------------------------
DROP TABLE IF EXISTS `article_association_thump_up`;
CREATE TABLE `article_association_thump_up`  (
  `article_association_thump_up_id` bigint NOT NULL AUTO_INCREMENT COMMENT '点赞id',
  `article_id` bigint NOT NULL COMMENT '文章id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `thumb_up_time` timestamp NOT NULL COMMENT '点赞时间',
  PRIMARY KEY (`article_association_thump_up_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_association_thump_up
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_account` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户账号',
  `user_password` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户密码',
  `user_info` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '用户信息',
  `create_time` timestamp NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `user_account_unique_index`(`user_account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'testUser', 'testUser', '测试用户', '2024-05-03 08:30:00');
INSERT INTO `user` VALUES (2, 'visitor', 'visitor', '游客', '2024-05-03 10:30:00');

SET FOREIGN_KEY_CHECKS = 1;
