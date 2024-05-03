# spring-cloud-alibaba-demo

### 1、spring-cloud-alibaba 版本支持对应的 spring-cloud , spring-boot, jdk 版本

[spring-cloud-alibaba版本wiki查看官网](https://sca.aliyun.com/docs/2023/overview/version-explain/?spm=5176.29160081.0.0.748065cbJjC5ND)

[spring-boot版本查看官网](https://spring.io/projects/spring-boot)

[spring-cloud版本查看官网](https://spring.io/projects/spring-cloud)

Spring Cloud Alibaba Version: 2023.0.1.0

Spring Cloud Version: 2023.0.1

Spring Boot Version: 3.2.5

jdk：17

由于spring-boot 3.2.x 版本兼容性差(兼容jdk20)，建议使用jdk 17,如果使用spring-boot 2.x版本,可以使用jdk 8 或者 11,3.x版本不再支持jdk8 和 11

[jdk17官网下载地址](https://www.oracle.com/cn/java/technologies/downloads/#jdk17-windows)

### 2、spring-cloud-alibaba 版本对应组件支持版本

Sentinel Version：1.8.6

Nacos Version：2.3.2

RocketMQ Version：5.1.4

Seata Version：2.0.0

### 3、maven 新建空项目 作为 父项目骨架

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo0.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo0.png" />
  </span>
</rich-text>

删除src 目录，pom.xml添加 spring-cloud-alibaba maven 依赖

pom.xml 原文件

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>org.example</groupId>
    <artifactId>spring-cloud-alibaba-demo</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

</project>
```

pox.xml 添加spring-alibaba依赖

```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>org.example</groupId>
    <artifactId>spring-cloud-alibaba-demo</artifactId>
    <version>1.0-SNAPSHOT</version>

    <!--集成springboot父项目-->
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.2.5</version>
    </parent>

    <properties>
        <java.version>17</java.version>
        <spring.cloud.alibaba.version>2023.0.1.0</spring.cloud.alibaba.version>
        <spring.cloud.version>2023.0.1</spring.cloud.version>
    </properties>

    <!--全局引入下载依赖地址，并不会引入依赖-->
    <dependencyManagement>
        <dependencies>
            <!--spring-cloud-alibaba下载仓库-->
            <dependency>
                <groupId>com.alibaba.cloud</groupId>
                <artifactId>spring-cloud-alibaba-dependencies</artifactId>
                <version>${spring.cloud.alibaba.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <!--spring-cloud下载仓库-->
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring.cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>
</project>
```
当前项目结构

```
📂spring-cloud-alibaba-demo
├── 📂.idea
├── 📄gitignore
├── 📄pom.xml
├── 📄README.md
```

### 4、新建模块（Module）-- common 以后主要是放置公共实体类以及公共工具类以及公共依赖

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo1.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo1.png" />
  </span>
</rich-text>

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo2.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo2.png" />
  </span>
</rich-text>

当前 common 的  pom.xml 原文件

```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.example</groupId>
        <artifactId>spring-cloud-alibaba-demo</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>

    <artifactId>common</artifactId>
    <packaging>jar</packaging>

    <name>common</name>
    <url>http://maven.apache.org</url>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>3.8.1</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
</project>

```

common 公共类 pom.xml 引入Nacos注册发现依赖 以及 springboot的web依赖

```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.example</groupId>
        <artifactId>spring-cloud-alibaba-demo</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>

    <artifactId>common</artifactId>
    <packaging>jar</packaging>

    <name>common</name>
    <url>http://maven.apache.org</url>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <!--spring-boot-starter-web-->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <!--nacos client-->
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
        </dependency>

    </dependencies>
</project>

```

当前项目结构

```
📂spring-cloud-alibaba-demo
├── 📂.idea
├── 📂common
│   ├── 📂src
│   ├── 📄pom.xml
├── 📄gitignore
├── 📄pom.xml
├── 📄README.md
```

### 5、新建模块（Module）-- admin article backend  frontend user 子服务项目 以下以admin为例，其他同样

当前 admin 的  pom.xml 原文件

```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.example</groupId>
        <artifactId>spring-cloud-alibaba-demo</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>

    <artifactId>admin</artifactId>
    <packaging>jar</packaging>

    <name>admin</name>
    <url>http://maven.apache.org</url>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>3.8.1</version>
            <scope>test</scope>
        </dependency>
    </dependencies>
</project>

```

引入common 公共类依赖 后的 admin pom.xml

```
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.example</groupId>
        <artifactId>spring-cloud-alibaba-demo</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>

    <artifactId>admin</artifactId>
    <packaging>jar</packaging>

    <name>admin</name>
    <url>http://maven.apache.org</url>

    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <dependencies>
        <!-- 公共模块common依赖 -->
        <dependency>
            <groupId>org.example</groupId>
            <artifactId>common</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>
</project>

```

新建resources目录 -- 启动配置文件 application.yaml application-test.yaml application-dev.yaml application-prod.yaml

application.yaml

```
spring:
  profiles:
    active: test # 设置活动的profile为"test"，这样在打包时会使用"application-test.yaml"配置文件
```

application-test.yaml

```
server:
    port: 8080 # 服务端口

spring:
    application:
        name: admin # 应用名称
    cloud:
        nacos:
            discovery:
                server-addr: 192.168.197.3:8848 # Nacos地址

```

删除生成的 App.java ,新建启动类 AdminApplication.java

```
package org.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @author XiaoBaiHacker
 * @version 1.0
 * @title AdminApplication
 * @description
 * @code 世间永无bug
 * @create 2024/4/30 16:55
 */
@SpringBootApplication
public class AdminApplication {
    public static void main(String[] args) {
        SpringApplication.run(AdminApplication.class, args);
    }
}

```

其中 backend frontend 模块为 后台和前台web项目，resources 目录下新建 template 目录，用于html，css,js等模板文件

当前目录结构为

```
📂spring-cloud-alibaba-demo
├── 📂.idea
├── 📂common
│   ├── 📂src
│   ├── 📄pom.xml
├── 📂admin
│   ├── 📂src
│   │   ├── 📂main
│   │   │   ├── 📂java
│   │   │   │   ├── 📂org.example
│   │   │   │   │   ├── 📄AdminApplication.java
│   │   │   ├── 📂resources
│   │   │   │   │   ├── 📄application.yaml
│   │   │   │   │   ├── 📄application-test.yaml
│   │   │   │   │   ├── 📄application-dev.yaml
│   │   │   │   │   ├── 📄application-prod.yaml
│   ├── 📄pom.xml
├── 📂article
│   ├── 📂src
│   │   ├── 📂main
│   │   │   ├── 📂java
│   │   │   │   ├── 📂org.example
│   │   │   │   │   ├── 📄ArticleApplication.java
│   │   │   ├── 📂resources
│   │   │   │   │   ├── 📄application.yaml
│   │   │   │   │   ├── 📄application-test.yaml
│   │   │   │   │   ├── 📄application-dev.yaml
│   │   │   │   │   ├── 📄application-prod.yaml
│   ├── 📄pom.xml
├── 📂user
│   ├── 📂src
│   │   ├── 📂main
│   │   │   ├── 📂java
│   │   │   │   ├── 📂org.example
│   │   │   │   │   ├── 📄UserApplication.java
│   │   │   ├── 📂resources
│   │   │   │   │   ├── 📄application.yaml
│   │   │   │   │   ├── 📄application-test.yaml
│   │   │   │   │   ├── 📄application-dev.yaml
│   │   │   │   │   ├── 📄application-prod.yaml
│   ├── 📄pom.xml
├── 📂backtend
│   ├── 📂src
│   │   ├── 📂main
│   │   │   ├── 📂java
│   │   │   │   ├── 📂org.example
│   │   │   │   │   ├── 📄BackendApplication.java
│   │   │   ├── 📂resources
│   │   │   │   │   ├── 📂template
│   │   │   │   │   │   ├── 📄index.html
│   ├── 📄pom.xml
├── 📂frontend
│   ├── 📂src
│   │   ├── 📂main
│   │   │   ├── 📂java
│   │   │   │   ├── 📂org.example
│   │   │   │   │   ├── 📄FrontendApplication.java
│   │   │   ├── 📂resources
│   │   │   │   │   ├── 📂template
│   │   │   │   │   │   ├── 📄index.html
│   ├── 📄pom.xml
├── 📄gitignore
├── 📄pom.xml
├── 📄README.md
```

### 6、测试 nacos 服务注册

启用服务器 nacos 服务 

```bash
root@ubuntu-server-01:~# ps -ef | grep nacos
root        5742       1 63 02:29 ?        00:00:22 /usr/local/java/bin/java -Djava.ext.dirs=/usr/local/java/jre/lib/ext:/usr/local/java/lib/ext -Xms512m -Xmx512m -Xmn256m -Dnacos.standalone=true -Dnacos.member.list= -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:CMSInitiatingOccupancyFraction=70 -XX:+CMSParallelRemarkEnabled -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+CMSClassUnloadingEnabled -XX:SurvivorRatio=8 -Xloggc:/usr/local/nacos/nacos-server-2.3.2/logs/nacos_gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M -Dloader.path=/usr/local/nacos/nacos-server-2.3.2/plugins,/usr/local/nacos/nacos-server-2.3.2/plugins/health,/usr/local/nacos/nacos-server-2.3.2/plugins/cmdb,/usr/local/nacos/nacos-server-2.3.2/plugins/selector -nacos.home=/usr/local/nacos/nacos-server-2.3.2 -jar /usr/local/nacos/nacos-server-2.3.2/target/nacos-server.jar --spring.config.additional-location=file:/usr/local/nacos/nacos-server-2.3.2/conf/ --logging.config=/usr/local/nacos/nacos-server-2.3.2/conf/nacos-logback.xml --server.max-http-header-size=524288 nacos.nacos
root        6065    2353  0 02:30 pts/0    00:00:00 grep --color=auto nacos
```

运行 AdminApplication UserApplication ArticleApplication 启动文件

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo3.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo3.png" />
  </span>
</rich-text>

访问 nacos http://192.168.197.3:8848/nacos/ 服务列表,即可看到 admin article  user 服务被注册到nacos

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo4.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/springCloudAlibabaDemo4.png" />
  </span>
</rich-text>

### 7、服务调用 openfeign 和 dubbo

OpenFeign 是一个声明式的、基于注解的轻量级 HTTP 客户端框架，由 Netflix 开发并集成到 Spring Cloud 中。它提供了一种简洁的方式来定义和使用 RESTful API 接口，在客户端代码中使用注解来描述服务接口，并自动处理请求和响应。OpenFeign 可以与服务注册与发现组件（如 Eureka、Consul）集成，自动实现负载均衡、服务发现和容错处理等功能。

Dubbo 是一个高性能的、面向 RPC（远程过程调用）的服务框架，由阿里巴巴开源并广泛使用。它基于 Java 的远程调用技术，提供了完整的分布式服务治理方案。Dubbo 支持多种协议（如 Dubbo 协议、HTTP 协议、REST 协议等）和负载均衡策略，具备较低的延迟和较高的吞吐量。Dubbo 集成了服务注册与发现、负载均衡、容错处理、服务监控等功能，可以支持大规模的分布式系统。

总结来说：

OpenFeign 更适合于构建基于 HTTP/REST 的微服务架构，它简化了接口定义和服务调用的过程，并与 Spring Cloud 生态系统紧密集成。

Dubbo 则是一个全功能的 RPC 框架，适合于构建高性能、分布式的服务架构，具备更丰富的服务治理和远程通信能力

本示例中 使用 OpenFeign 构建服务调用和远程通信

### 8、openfeign 服务调用实现

8.1、common 公共服务引入 openfeign 公共依赖

```xml
<!--openfeign-->
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-openfeign</artifactId>
</dependency>
```

8.2、数据设计

```bash
# 登录mysql
mysql -uroot -proot
# MySQL中创建一个名称为 spring_cloud_ alibaba_demo 的 database
CREATE DATABASE IF NOT EXISTS `spring_cloud_alibaba_demo`;
# 创建用户 scad 并指定密码 scad
create user 'scad'@'%' identified by 'scad';
# spring_cloud_alibaba_demo.* 表示 spring_cloud_alibaba_demo 的所有表* 赋权给 scad用户
grant all privileges on spring_cloud_alibaba_demo.* to 'scad'@'%';
# 刷新缓存
flush privileges;
# 查看 某个数据库是否存在
show databases like 'scad';
```

创建四个表 

user 

article 

article_association_thump_up 

article_association_comment

```mysql
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
```

```mysql
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
```

```mysql
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
```

```mysql
/******************************************/
/*   表名称 = article_association_comment              */
/******************************************/
CREATE TABLE `article_association_comment` (
  `article_association_comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `comment` varchar(256) NOT NULL COMMENT '评论',
  `comment_time` TIMESTAMP NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`article_association_comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';
```

```mysql
INSERT INTO user (user_account, user_password, user_info, create_time) VALUES ('testUser', 'testUser','测试用户','2024-05-03 08:30:00');
INSERT INTO user (user_account, user_password, user_info, create_time) VALUES ('visitor', 'visitor','游客','2024-05-03 10:30:00');
```

```mysql
INSERT INTO article (article_title, article_content, article_label, create_time, update_time) VALUES ('spring-cloud-alibaba-demo', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/springCloudAlibabaDemo.md','spring-cloud-alibaba,nacos,mysql,jdk1.8','2024-04-30 08:30:00','2024-04-30 08:30:00');
INSERT INTO article (article_title, article_content, article_label, create_time, update_time) VALUES ('ubuntuInstallJdk', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallJdk.md','jdk1.8','2024-05-01 08:30:00','2024-05-01 08:30:00');
INSERT INTO article (article_title, article_content, article_label, create_time, update_time) VALUES ('ubuntuInstallMysql', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallMysql.md','Mysql','2024-05-02 08:30:00','2024-05-02 08:30:00');
INSERT INTO article (article_title, article_content, article_label, create_time, update_time) VALUES ('ubuntuInstallNacos', 'https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallNacos.md','nacos','2024-05-03 08:30:00','2024-05-03 08:30:00');
```

8.3、程序设计


