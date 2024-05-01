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
    <img src="./readmeImages/creat-model-common-zi-0.png" alt="creat-model-common-zi-0.png" />
  </span>
</rich-text>

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="./readmeImages/creat-model-common-zi-1.png" alt="creat-model-common-zi-1.png" />
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
                server-addr: 127.0.0.1:8848 # Nacos地址

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

### 6、