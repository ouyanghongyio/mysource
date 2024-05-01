# ubuntu 安装 Nacos

### 1、Nacos介绍

Nacos 是阿里巴巴推出的一个新开源项目，它主要是一个更易于构建云原生应用的动态服务发现、配置管理和服务管理平台。

Nacos提供了一组简单易用的特性集，帮助用户快速实现动态服务发现、服务配置、服务元数据及流量管理。

Nacos 的关键特性包括：

- 服务发现和服务健康监测：支持基于 DNS 和基于 RPC 的服务发现，如 Kubernetes Service、gRPC & Dubbo RPC Service 以及Spring Cloud RESTful Service 等主流服务类型。Nacos 还提供实时的健康检查，以阻止向不健康的主机或服务实例发送请求。这包括传输层（如 PING 或 TCP）和应用层（如 HTTP、MySQL、用户自定义）的健康检查，以及针对复杂云环境和网络拓扑环境的两种健康检查模式：agent 上报模式和服务端主动检测。


- 动态配置服务：Nacos 允许用户以中心化、外部化和动态化的方式管理所有环境的配置，从而消除了配置变更时重新部署应用和服务的需要。配置中心化管理使实现无状态服务更简单，也使按需弹性扩展服务更容易。


- 动态 DNS 服务：通过支持权重路由，Nacos 能轻松实现中间层负载均衡、更灵活的路由策略、流量控制以及简单数据中心内网的 DNS 解析服务。

### 2、Nacos 

github [项目地址](https://github.com/alibaba/nacos)

```
https://github.com/alibaba/nacos
```

[官网地址](https://nacos.io/docs/latest/what-is-nacos/)

```
https://nacos.io/docs/latest/what-is-nacos/
```

### 3、安装前准备

[mysql安装](https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallMysql.md)

[jdk1.8安装](https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/ubuntuInstallJdk.md)

### 4、下载对应架构的Nacos安装包

[下载地址](https://github.com/alibaba/nacos/releases)

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos0.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos0.png" />
  </span>
</rich-text>

### 5、上传文件到服务器的 /usr/local目录下

### 6、解压文件 nacos-server-2.3.2.tar.gz 到服务器的 /usr/local/nacos目录下

```bash
cd /usr/local
# 新建 nacos-server-2.3.2 nacos 文件目录
mkdir /usr/local/nacos
# 解压 nacos-server-2.3.2.tar.gz 到 /usr/local/nacos
tar -zxvf nacos-server-2.3.2.tar.gz -C /usr/local/nacos
# 为了以后升级方便 修改 /usr/local/nacos/nacos  /usr/local/nacos/nacos-server-2.3.2
mv /usr/local/nacos/nacos  /usr/local/nacos/nacos-server-2.3.2
```

### 7、单例模式启动 nacos

到启动命令(/usr/local/nacos/nacos-server-2.3.2/bin)目录下 启动 nacos 

即可在浏览器访问 http://192.168.197.3:8848/nacos/ 默认账号密码都是nacos

```bash
cd /usr/local/nacos/nacos-server-2.3.2/bin
# 启动 nacos
bash startup.sh -m standalone
```

启动成功 bash

```bash
root@ubuntu-server-01:/usr/local/nacos/nacos-server-2.3.2/bin# bash startup.sh -m standalone
/usr/local/java/bin/java -Djava.ext.dirs=/usr/local/java/jre/lib/ext:/usr/local/java/lib/ext  -Xms512m -Xmx512m -Xmn256m -Dnacos.standalone=true -Dnacos.member.list= -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:CMSInitiatingOccupancyFraction=70 -XX:+CMSParallelRemarkEnabled -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+CMSClassUnloadingEnabled -XX:SurvivorRatio=8  -Xloggc:/usr/local/nacos-server-2.3.2/nacos/logs/nacos_gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M -Dloader.path=/usr/local/nacos-server-2.3.2/nacos/plugins,/usr/local/nacos-server-2.3.2/nacos/plugins/health,/usr/local/nacos-server-2.3.2/nacos/plugins/cmdb,/usr/local/nacos-server-2.3.2/nacos/plugins/selector -Dnacos.home=/usr/local/nacos-server-2.3.2/nacos -jar /usr/local/nacos-server-2.3.2/nacos/target/nacos-server.jar  --spring.config.additional-location=file:/usr/local/nacos-server-2.3.2/nacos/conf/ --logging.config=/usr/local/nacos-server-2.3.2/nacos/conf/nacos-logback.xml --server.max-http-header-size=524288
nacos is starting with standalone
nacos is starting. you can check the /usr/local/nacos-server-2.3.2/nacos/logs/start.out
```

浏览器访问 http://192.168.197.3:8848/nacos/

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos1.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos1.png" />
  </span>
</rich-text>

### 8、监听 nacos 服务

```bash
ps -ef | grep nacos
```

监听 nacos bash

```bash
root@ubuntu-server-01:/usr/local/nacos/nacos-server-2.3.2/bin# ps -ef | grep nacos
root        4559       1  2 12:29 pts/0    00:00:40 /usr/local/java/bin/java -Djava.ext.dirs=/usr/local/java/jre/lib/ext:/usr/local/java/lib/ext -Xms512m -Xmx512m -Xmn256m -Dnacos.standalone=true -Dnacos.member.list= -XX:+UseConcMarkSweepGC -XX:+UseCMSCompactAtFullCollection -XX:CMSInitiatingOccupancyFraction=70 -XX:+CMSParallelRemarkEnabled -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+CMSClassUnloadingEnabled -XX:SurvivorRatio=8 -Xloggc:/usr/local/nacos-server-2.3.2/nacos/logs/nacos_gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M -Dloader.path=/usr/local/nacos-server-2.3.2/nacos/plugins,/usr/local/nacos-server-2.3.2/nacos/plugins/health,/usr/local/nacos-server-2.3.2/nacos/plugins/cmdb,/usr/local/nacos-server-2.3.2/nacos/plugins/selector -nacos.home=/usr/local/nacos-server-2.3.2/nacos -jar /usr/local/nacos-server-2.3.2/nacos/target/nacos-server.jar --spring.config.additional-location=file:/usr/local/nacos-server-2.3.2/nacos/conf/ --logging.config=/usr/local/nacos-server-2.3.2/nacos/conf/nacos-logback.xml --server.max-http-header-size=524288 nacos.nacos
root        4846    4327  0 12:54 pts/0    00:00:00 grep --color=auto nacos
```

### 9、关闭 nacos 服务

```bash
cd /usr/local/nacos/nacos-server-2.3.2/bin
# 启动 nacos
bash shutdown.sh
```

关闭 nacos bash

```bash
root@ubuntu-server-01:/usr/local/nacos/nacos-server-2.3.2/bin# bash shutdown.sh
The nacosServer(4559) is running...
Send shutdown request to nacosServer(4559) OK
```

### 10、配置 nacos 为系统服务 并且设置为 开机自启动

```bash
# /usr/local/nacos 目录下新建 nacos.service 文件
touch /usr/local/nacos/nacos.service

# 编辑 nacos.service 文件
vim /usr/local/nacos/nacos.service

# 内容如下
[Unit]
Description=nacos
After=network.target

[Service]
Type=forking

ExecStart=/usr/local/nacos/nacos-server-2.3.2/bin/startup.sh -m standalone
ExecReload=/usr/local/nacos/nacos-server-2.3.2/bin/shutdown.sh
ExecStop=/usr/local/nacos/nacos-server-2.3.2/bin/shutdown.sh

# Let systemd restart this service always
Restart=always

PrivateTmp=true

[Install]
WantedBy=multi-user.target
Alias=nacos.service

# 在/lib/systemd/system中创建nacos.service的软连接
sudo ln -s /usr/local/nacos/nacos.service  /lib/systemd/system/nacos.service

# 让服务生效
systemctl daemon-reload
systemctl enable nacos.service

# 启动nacos服务
systemctl start nacos

# 关闭nacos服务
systemctl stop nacos
```

设置开机启动以后 启动nacos服务出现问题

```bash
root@ubuntu-server-01:~# systemctl start nacos.service
Job for nacos.service failed because the control process exited with error code.
See "systemctl status nacos.service" and "journalctl -xeu nacos.service" for details
```

解决上述问题

```bash
# 编辑 startup.sh 文件
vim /usr/local/nacos/nacos-server-2.3.2/bin/startup.sh
# 注释后三项，并且修改第一项 JAVA_HOME 为自己的 jdk 路径
[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/usr/local/java
#[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/usr/java
#[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/opt/taobao/java
#[ ! -e "$JAVA_HOME/bin/java" ] && unset JAVA_HOME

# 修改后文件如下

#!/bin/bash

# Copyright 1999-2018 Alibaba Group Holding Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cygwin=false
# Copyright 1999-2018 Alibaba Group Holding Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cygwin=false
darwin=false
os400=false
case "`uname`" in
CYGWIN*) cygwin=true;;
Darwin*) darwin=true;;
OS400*) os400=true;;
esac
error_exit ()
{
    echo "ERROR: $1 !!"
    exit 1
}
[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/usr/local/java
#[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/usr/java
#[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/opt/taobao/java
#[ ! -e "$JAVA_HOME/bin/java" ] && unset JAVA_HOME

if [ -z "$JAVA_HOME" ]; then
  if $darwin; then

    if [ -x '/usr/libexec/java_home' ] ; then
      export JAVA_HOME=`/usr/libexec/java_home`

    elif [ -d "/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home" ]; then
      export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
    fi
  else
    JAVA_PATH=`dirname $(readlink -f $(which javac))`
    if [ "x$JAVA_PATH" != "x" ]; then
      export JAVA_HOME=`dirname $JAVA_PATH 2>/dev/null`
    fi
  fi
  if [ -z "$JAVA_HOME" ]; then
        JAVA_PATH=$(which java)
        if [ -z "$JAVA_PATH" ]; then
            error_exit "Please set the JAVA_HOME variable in your environment, We need java(x64)! jdk8 or later is better!"
        fi
        JAVA_HOME=$(dirname "$JAVA_PATH")/..
        export JAVA_HOME=$(cd "$JAVA_HOME" && pwd)
  fi
fi

export SERVER="nacos-server"
export MODE="cluster"
export FUNCTION_MODE="all"
export MEMBER_LIST=""
export EMBEDDED_STORAGE=""
while getopts ":m:f:s:c:p:" opt
do
    case $opt in
        m)
            MODE=$OPTARG;;
        f)
            SERVER=$OPTARG;;
        c)
            MEMBER_LIST=$OPTARG;;
        ?)
        echo "Unknown parameter"
        exit 1;;
    esac
done

export JAVA_HOME
export JAVA="$JAVA_HOME/bin/java"
export BASE_DIR=`cd $(dirname $0)/..; pwd`
export CUSTOM_SEARCH_LOCATIONS=file:${BASE_DIR}/conf/

#===========================================================================================
    if [[ "${EMBEDDED_STORAGE}" == "embedded" ]]; then
    JAVA_OPT="${JAVA_OPT} -server -Xms2g -Xmx2g -Xmn1g -XX:MetaspaceSize=128m -XX:MaxMetaspaceSize=320m"
    JAVA_OPT="${JAVA_OPT} -XX:-UseLargePages"

fi

if [[ "${FUNCTION_MODE}" == "config" ]]; then
    JAVA_OPT="${JAVA_OPT} -Dnacos.functionMode=config"
elif [[ "${FUNCTION_MODE}" == "naming" ]]; then
    JAVA_OPT="${JAVA_OPT} -Dnacos.functionMode=naming"
fi

JAVA_OPT="${JAVA_OPT} -Dnacos.member.list=${MEMBER_LIST}"

JAVA_MAJOR_VERSION=$($JAVA -version 2>&1 | sed -E -n 's/.* version "([0-9]*).*$/\1/p')
if [[ "$JAVA_MAJOR_VERSION" -ge "9" ]] ; then
  JAVA_OPT="${JAVA_OPT} -Xlog:gc*:file=${BASE_DIR}/logs/nacos_gc.log:time,tags:filecount=10,filesize=100m"
else
  JAVA_OPT_EXT_FIX="-Djava.ext.dirs=${JAVA_HOME}/jre/lib/ext:${JAVA_HOME}/lib/ext"
fi

JAVA_OPT="${JAVA_OPT} -Dloader.path=${BASE_DIR}/plugins,${BASE_DIR}/plugins/health,${BASE_DIR}/plugins/cmdb,${BASE_DIR}/plugins/selector"
JAVA_OPT="${JAVA_OPT} -Dnacos.home=${BASE_DIR}"
JAVA_OPT="${JAVA_OPT} -jar ${BASE_DIR}/target/${SERVER}.jar"
JAVA_OPT="${JAVA_OPT} ${JAVA_OPT_EXT}"
JAVA_OPT="${JAVA_OPT} --spring.config.additional-location=${CUSTOM_SEARCH_LOCATIONS}"
JAVA_OPT="${JAVA_OPT} --logging.config=${BASE_DIR}/conf/nacos-logback.xml"
JAVA_OPT="${JAVA_OPT} --server.max-http-header-size=524288"

if [ ! -d "${BASE_DIR}/logs" ]; then
  mkdir ${BASE_DIR}/logs
fi

echo "$JAVA $JAVA_OPT_EXT_FIX ${JAVA_OPT}"

if [[ "${MODE}" == "standalone" ]]; then
    echo "nacos is starting with standalone"
else
    echo "nacos is starting with cluster"
fi

# check the start.out log output file
if [ ! -f "${BASE_DIR}/logs/start.out" ]; then
  touch "${BASE_DIR}/logs/start.out"
fi
# start
echo "$JAVA $JAVA_OPT_EXT_FIX ${JAVA_OPT}" > ${BASE_DIR}/logs/start.out 2>&1 &

if [[ "$JAVA_OPT_EXT_FIX" == "" ]]; then
  nohup "$JAVA" ${JAVA_OPT} nacos.nacos >> ${BASE_DIR}/logs/start.out 2>&1 &
else
  nohup "$JAVA" "$JAVA_OPT_EXT_FIX" ${JAVA_OPT} nacos.nacos >> ${BASE_DIR}/logs/start.out 2>&1 &
fi

echo "nacos is starting. you can check the ${BASE_DIR}/logs/start.out"
```

再次启动 nacos 服务 不再报错，http://192.168.197.3:8848/nacos/ 也可以访问

```bash
root@ubuntu-server-01:~# systemctl start nacos
```

### 11、配置MySQL数据库

11.1、在Nacos集群中，必须采用MySQL数据库存储配置Nacos信息,且只能使用MySQL（其他数据库会忽略）。

```bash
# 登录mysql
mysql -uroot -proot
# MySQL中创建一个名称为nacos的schema
CREATE DATABASE  `nacos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# 创建用户 nacos
create user 'nacos'@'%' identified by 'nacos用户密码';
# nacos.* 表示nacos的所有表
grant all privileges on nacos.* to 'nacos'@'%';
# 刷新缓存
flush privileges;
```

配置mysql数据库 bash

```bash
root@ubuntu-server-01:~# mysql -uroot -proot
mysql: [Warning] Using a password on the command line interface can be insecure.
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.36-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE  `nacos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
Query OK, 1 row affected (0.01 sec)

mysql> create user 'nacos'@'%' identified by 'nacos';
Query OK, 0 rows affected (0.01 sec)

mysql> grant all privileges on nacos.* to 'nacos'@'%' identified by 'nacos' with grant option;
# 此种赋权方式 语法已经在 5.7以后版本已经被弃用，不需要再连接密码，先创建用户，密码，再赋权用户即可，如下方那种方式即可成功
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'identified by 'nacos' with grant option' at line 1
mysql> grant all privileges on nacos.* to 'nacos'@'%';
Query OK, 0 rows affected (0.00 sec)

mysql> flush privileges;
Query OK, 0 rows affected (0.01 sec)
```

11.2、导入 mysql-schema.sql

下载 /usr/local/nacos/nacos-server-2.3.2/conf目录下的 mysql-schema.sql 到本地，navicat 导入 nacos 数据库

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos2.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos2.png" />
  </span>
</rich-text>

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos3.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos3.png" />
  </span>
</rich-text>

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos4.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallNacos4.png" />
  </span>
</rich-text>

11.3、修改 nacos 配置文件

修改 /usr/local/nacos/nacos-server-2.3.2/conf/application.properties 文件

由于我们配置的 nacos mysql 数据库密码都是 nacos 和 配置文件默认一致，所以只需要取消 关于msyql的注释即可

修改位置：

```bash
#*************** Config Module Related Configurations ***************#
### If use MySQL as datasource:
### Deprecated configuration property, it is recommended to use `spring.sql.init.platform` replaced.
### spring.datasource.platform 这个配置已经被弃用，选择 spring.sql.init.platform=mysql 这个配置方式
# spring.datasource.platform=mysql
# spring.sql.init.platform=mysql

### Count of DB:
# db.num=1

### Connect URL of DB:
# db.url.0=jdbc:mysql://127.0.0.1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
# db.user.0=nacos
# db.password.0=nacos
```

原 application.properties

```bash
#
# Copyright 1999-2021 Alibaba Group Holding Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#*************** Spring Boot Related Configurations ***************#
### Default web context path:
server.servlet.contextPath=/nacos
### Include message field
server.error.include-message=ALWAYS
### Default web server port:
server.port=8848

#*************** Network Related Configurations ***************#
### If prefer hostname over ip for Nacos server addresses in cluster.conf:
# nacos.inetutils.prefer-hostname-over-ip=false

### Specify local server's IP:
# nacos.inetutils.ip-address=


#*************** Config Module Related Configurations ***************#
### If use MySQL as datasource:
### Deprecated configuration property, it is recommended to use `spring.sql.init.platform` replaced.
# spring.datasource.platform=mysql
# spring.sql.init.platform=mysql

### Count of DB:
# db.num=1

### Connect URL of DB:
# db.url.0=jdbc:mysql://127.0.0.1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
# db.user.0=nacos
# db.password.0=nacos

### Connection pool configuration: hikariCP
db.pool.config.connectionTimeout=30000
db.pool.config.validationTimeout=10000
db.pool.config.maximumPoolSize=20
db.pool.config.minimumIdle=2

### the maximum retry times for push
nacos.config.push.maxRetryTime=50

#*************** Naming Module Related Configurations ***************#

### If enable data warmup. If set to false, the server would accept request without local data preparation:
# nacos.naming.data.warmup=true

### If enable the instance auto expiration, kind like of health check of instance:
# nacos.naming.expireInstance=true

### Add in 2.0.0
### The interval to clean empty service, unit: milliseconds.
# nacos.naming.clean.empty-service.interval=60000

### The expired time to clean empty service, unit: milliseconds.
# nacos.naming.clean.empty-service.expired-time=60000

### The interval to clean expired metadata, unit: milliseconds.
# nacos.naming.clean.expired-metadata.interval=5000

### The expired time to clean metadata, unit: milliseconds.
# nacos.naming.clean.expired-metadata.expired-time=60000

### The delay time before push task to execute from service changed, unit: milliseconds.
# nacos.naming.push.pushTaskDelay=500

### The timeout for push task execute, unit: milliseconds.
# nacos.naming.push.pushTaskTimeout=5000

### The delay time for retrying failed push task, unit: milliseconds.
# nacos.naming.push.pushTaskRetryDelay=1000

### Since 2.0.3
### The expired time for inactive client, unit: milliseconds.
# nacos.naming.client.expired.time=180000

#*************** CMDB Module Related Configurations ***************#
### The interval to dump external CMDB in seconds:
# nacos.cmdb.dumpTaskInterval=3600

### The interval of polling data change event in seconds:
# nacos.cmdb.eventTaskInterval=10

### The interval of loading labels in seconds:
# nacos.cmdb.labelTaskInterval=300

### If turn on data loading task:
# nacos.cmdb.loadDataAtStart=false

#***********Metrics for tomcat **************************#
server.tomcat.mbeanregistry.enabled=true

#***********Expose prometheus and health **************************#
#management.endpoints.web.exposure.include=prometheus,health

### Metrics for elastic search
management.metrics.export.elastic.enabled=false
#management.metrics.export.elastic.host=http://localhost:9200

### Metrics for influx
management.metrics.export.influx.enabled=false
#management.metrics.export.influx.db=springboot
#management.metrics.export.influx.uri=http://localhost:8086
#management.metrics.export.influx.auto-create-db=true
#management.metrics.export.influx.consistency=one
#management.metrics.export.influx.compressed=true

#*************** Access Log Related Configurations ***************#
### If turn on the access log:
server.tomcat.accesslog.enabled=true

### file name pattern, one file per hour
server.tomcat.accesslog.rotate=true
server.tomcat.accesslog.file-date-format=.yyyy-MM-dd-HH
### The access log pattern:
server.tomcat.accesslog.pattern=%h %l %u %t "%r" %s %b %D %{User-Agent}i %{Request-Source}i

### The directory of access log:
server.tomcat.basedir=file:.

#*************** Access Control Related Configurations ***************#
### If enable spring security, this option is deprecated in 1.2.0:
#spring.security.enabled=false

### The ignore urls of auth
nacos.security.ignore.urls=/,/error,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.ico,/console-ui/public/**,/v1/auth/**,/v1/console/health/**,/actuator/**,/v1/console/server/**

### The auth system to use, currently only 'nacos' and 'ldap' is supported:
nacos.core.auth.system.type=nacos

### If turn on auth system:
nacos.core.auth.enabled=false

### Turn on/off caching of auth information. By turning on this switch, the update of auth information would have a 15 seconds delay.
nacos.core.auth.caching.enabled=true

### Since 1.4.1, Turn on/off white auth for user-agent: nacos-server, only for upgrade from old version.
nacos.core.auth.enable.userAgentAuthWhite=false

### Since 1.4.1, worked when nacos.core.auth.enabled=true and nacos.core.auth.enable.userAgentAuthWhite=false.
### The two properties is the white list for auth and used by identity the request from other server.
nacos.core.auth.server.identity.key=
nacos.core.auth.server.identity.value=

### worked when nacos.core.auth.system.type=nacos
### The token expiration in seconds:
nacos.core.auth.plugin.nacos.token.cache.enable=false
nacos.core.auth.plugin.nacos.token.expire.seconds=18000
### The default token (Base64 String):
nacos.core.auth.plugin.nacos.token.secret.key=

### worked when nacos.core.auth.system.type=ldap，{0} is Placeholder,replace login username
#nacos.core.auth.ldap.url=ldap://localhost:389
#nacos.core.auth.ldap.basedc=dc=example,dc=org
#nacos.core.auth.ldap.userDn=cn=admin,${nacos.core.auth.ldap.basedc}
#nacos.core.auth.ldap.password=admin
#nacos.core.auth.ldap.userdn=cn={0},dc=example,dc=org
#nacos.core.auth.ldap.filter.prefix=uid
#nacos.core.auth.ldap.case.sensitive=true
#nacos.core.auth.ldap.ignore.partial.result.exception=false

#*************** Control Plugin Related Configurations ***************#
# plugin type
#nacos.plugin.control.manager.type=nacos

# local control rule storage dir, default ${nacos.home}/data/connection and ${nacos.home}/data/tps
#nacos.plugin.control.rule.local.basedir=${nacos.home}

# external control rule storage type, if exist
#nacos.plugin.control.rule.external.storage=

#*************** Config Change Plugin Related Configurations ***************#
# webhook
#nacos.core.config.plugin.webhook.enabled=false
# It is recommended to use EB https://help.aliyun.com/document_detail/413974.html
#nacos.core.config.plugin.webhook.url=http://localhost:8080/webhook/send?token=***
# The content push max capacity ,byte
#nacos.core.config.plugin.webhook.contentMaxCapacity=102400

# whitelist
#nacos.core.config.plugin.whitelist.enabled=false
# The import file suffixs
#nacos.core.config.plugin.whitelist.suffixs=xml,text,properties,yaml,html
# fileformatcheck,which validate the import file of type and content
#nacos.core.config.plugin.fileformatcheck.enabled=false

#*************** Istio Related Configurations ***************#
### If turn on the MCP server:
nacos.istio.mcp.server.enabled=false

#*************** Core Related Configurations ***************#

### set the WorkerID manually
# nacos.core.snowflake.worker-id=

### Member-MetaData
# nacos.core.member.meta.site=
# nacos.core.member.meta.adweight=
# nacos.core.member.meta.weight=

### MemberLookup
### Addressing pattern category, If set, the priority is highest
# nacos.core.member.lookup.type=[file,address-server]
## Set the cluster list with a configuration file or command-line argument
# nacos.member.list=192.168.16.101:8847?raft_port=8807,192.168.16.101?raft_port=8808,192.168.16.101:8849?raft_port=8809
## for AddressServerMemberLookup
# Maximum number of retries to query the address server upon initialization
# nacos.core.address-server.retry=5
## Server domain name address of [address-server] mode
# address.server.domain=jmenv.tbsite.net
## Server port of [address-server] mode
# address.server.port=8080
## Request address of [address-server] mode
# address.server.url=/nacos/serverlist

#*************** JRaft Related Configurations ***************#

### Sets the Raft cluster election timeout, default value is 5 second
# nacos.core.protocol.raft.data.election_timeout_ms=5000
### Sets the amount of time the Raft snapshot will execute periodically, default is 30 minute
# nacos.core.protocol.raft.data.snapshot_interval_secs=30
### raft internal worker threads
# nacos.core.protocol.raft.data.core_thread_num=8
### Number of threads required for raft business request processing
# nacos.core.protocol.raft.data.cli_service_thread_num=4
### raft linear read strategy. Safe linear reads are used by default, that is, the Leader tenure is confirmed by heartbeat
# nacos.core.protocol.raft.data.read_index_type=ReadOnlySafe
### rpc request timeout, default 5 seconds
# nacos.core.protocol.raft.data.rpc_request_timeout_ms=5000

#*************** Distro Related Configurations ***************#

### Distro data sync delay time, when sync task delayed, task will be merged for same data key. Default 1 second.
# nacos.core.protocol.distro.data.sync.delayMs=1000

### Distro data sync timeout for one sync data, default 3 seconds.
# nacos.core.protocol.distro.data.sync.timeoutMs=3000

### Distro data sync retry delay time when sync data failed or timeout, same behavior with delayMs, default 3 seconds.
# nacos.core.protocol.distro.data.sync.retryDelayMs=3000

### Distro data verify interval time, verify synced data whether expired for a interval. Default 5 seconds.
# nacos.core.protocol.distro.data.verify.intervalMs=5000

### Distro data verify timeout for one verify, default 3 seconds.
# nacos.core.protocol.distro.data.verify.timeoutMs=3000

### Distro data load retry delay when load snapshot data failed, default 30 seconds.
# nacos.core.protocol.distro.data.load.retryDelayMs=30000

### enable to support prometheus service discovery
#nacos.prometheus.metrics.enabled=true

### Since 2.3
#*************** Grpc Configurations ***************#

## sdk grpc(between nacos server and client) configuration
## Sets the maximum message size allowed to be received on the server.
#nacos.remote.server.grpc.sdk.max-inbound-message-size=10485760

## Sets the time(milliseconds) without read activity before sending a keepalive ping. The typical default is two hours.
#nacos.remote.server.grpc.sdk.keep-alive-time=7200000

## Sets a time(milliseconds) waiting for read activity after sending a keepalive ping. Defaults to 20 seconds.
#nacos.remote.server.grpc.sdk.keep-alive-timeout=20000


## Sets a time(milliseconds) that specify the most aggressive keep-alive time clients are permitted to configure. The typical default is 5 minutes
#nacos.remote.server.grpc.sdk.permit-keep-alive-time=300000

## cluster grpc(inside the nacos server) configuration
#nacos.remote.server.grpc.cluster.max-inbound-message-size=10485760

## Sets the time(milliseconds) without read activity before sending a keepalive ping. The typical default is two hours.
#nacos.remote.server.grpc.cluster.keep-alive-time=7200000

## Sets a time(milliseconds) waiting for read activity after sending a keepalive ping. Defaults to 20 seconds.
#nacos.remote.server.grpc.cluster.keep-alive-timeout=20000

## Sets a time(milliseconds) that specify the most aggressive keep-alive time clients are permitted to configure. The typical default is 5 minutes
#nacos.remote.server.grpc.cluster.permit-keep-alive-time=300000

## open nacos default console ui
#nacos.console.ui.enabled=true
```

修改后的 文件

```bash
vim /usr/local/nacos/nacos-server-2.3.2/conf/application.properties

#
# Copyright 1999-2021 Alibaba Group Holding Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#*************** Spring Boot Related Configurations ***************#
### Default web context path:
server.servlet.contextPath=/nacos
### Include message field
server.error.include-message=ALWAYS
### Default web server port:
server.port=8848

#*************** Network Related Configurations ***************#
### If prefer hostname over ip for Nacos server addresses in cluster.conf:
# nacos.inetutils.prefer-hostname-over-ip=false

### Specify local server's IP:
# nacos.inetutils.ip-address=


#*************** Config Module Related Configurations ***************#
### If use MySQL as datasource:
### Deprecated configuration property, it is recommended to use `spring.sql.init.platform` replaced.
# spring.datasource.platform=mysql
spring.sql.init.platform=mysql

### Count of DB:
db.num=1

### Connect URL of DB:
db.url.0=jdbc:mysql://127.0.0.1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
db.user.0=nacos
db.password.0=nacos

### Connection pool configuration: hikariCP
db.pool.config.connectionTimeout=30000
db.pool.config.validationTimeout=10000
db.pool.config.maximumPoolSize=20
db.pool.config.minimumIdle=2

### the maximum retry times for push
nacos.config.push.maxRetryTime=50

#*************** Naming Module Related Configurations ***************#

### If enable data warmup. If set to false, the server would accept request without local data preparation:
# nacos.naming.data.warmup=true

### If enable the instance auto expiration, kind like of health check of instance:
# nacos.naming.expireInstance=true

### Add in 2.0.0
### The interval to clean empty service, unit: milliseconds.
# nacos.naming.clean.empty-service.interval=60000

### The expired time to clean empty service, unit: milliseconds.
# nacos.naming.clean.empty-service.expired-time=60000

### The interval to clean expired metadata, unit: milliseconds.
# nacos.naming.clean.expired-metadata.interval=5000

### The expired time to clean metadata, unit: milliseconds.
# nacos.naming.clean.expired-metadata.expired-time=60000

### The delay time before push task to execute from service changed, unit: milliseconds.
# nacos.naming.push.pushTaskDelay=500

### The timeout for push task execute, unit: milliseconds.
# nacos.naming.push.pushTaskTimeout=5000

### The delay time for retrying failed push task, unit: milliseconds.
# nacos.naming.push.pushTaskRetryDelay=1000

### Since 2.0.3
### The expired time for inactive client, unit: milliseconds.
# nacos.naming.client.expired.time=180000

#*************** CMDB Module Related Configurations ***************#
### The interval to dump external CMDB in seconds:
# nacos.cmdb.dumpTaskInterval=3600

### The interval of polling data change event in seconds:
# nacos.cmdb.eventTaskInterval=10

### The interval of loading labels in seconds:
# nacos.cmdb.labelTaskInterval=300

### If turn on data loading task:
# nacos.cmdb.loadDataAtStart=false

#***********Metrics for tomcat **************************#
server.tomcat.mbeanregistry.enabled=true

#***********Expose prometheus and health **************************#
#management.endpoints.web.exposure.include=prometheus,health

### Metrics for elastic search
management.metrics.export.elastic.enabled=false
#management.metrics.export.elastic.host=http://localhost:9200

### Metrics for influx
management.metrics.export.influx.enabled=false
#management.metrics.export.influx.db=springboot
#management.metrics.export.influx.uri=http://localhost:8086
#management.metrics.export.influx.auto-create-db=true
#management.metrics.export.influx.consistency=one
#management.metrics.export.influx.compressed=true

#*************** Access Log Related Configurations ***************#
### If turn on the access log:
server.tomcat.accesslog.enabled=true

### file name pattern, one file per hour
server.tomcat.accesslog.rotate=true
server.tomcat.accesslog.file-date-format=.yyyy-MM-dd-HH
### The access log pattern:
server.tomcat.accesslog.pattern=%h %l %u %t "%r" %s %b %D %{User-Agent}i %{Request-Source}i

### The directory of access log:
server.tomcat.basedir=file:.

#*************** Access Control Related Configurations ***************#
### If enable spring security, this option is deprecated in 1.2.0:
#spring.security.enabled=false

### The ignore urls of auth
nacos.security.ignore.urls=/,/error,/**/*.css,/**/*.js,/**/*.html,/**/*.map,/**/*.svg,/**/*.png,/**/*.ico,/console-ui/public/**,/v1/auth/**,/v1/console/health/**,/actuator/**,/v1/console/server/**

### The auth system to use, currently only 'nacos' and 'ldap' is supported:
nacos.core.auth.system.type=nacos

### If turn on auth system:
nacos.core.auth.enabled=false

### Turn on/off caching of auth information. By turning on this switch, the update of auth information would have a 15 seconds delay.
nacos.core.auth.caching.enabled=true

### Since 1.4.1, Turn on/off white auth for user-agent: nacos-server, only for upgrade from old version.
nacos.core.auth.enable.userAgentAuthWhite=false

### Since 1.4.1, worked when nacos.core.auth.enabled=true and nacos.core.auth.enable.userAgentAuthWhite=false.
### The two properties is the white list for auth and used by identity the request from other server.
nacos.core.auth.server.identity.key=
nacos.core.auth.server.identity.value=

### worked when nacos.core.auth.system.type=nacos
### The token expiration in seconds:
nacos.core.auth.plugin.nacos.token.cache.enable=false
nacos.core.auth.plugin.nacos.token.expire.seconds=18000
### The default token (Base64 String):
nacos.core.auth.plugin.nacos.token.secret.key=

### worked when nacos.core.auth.system.type=ldap，{0} is Placeholder,replace login username
#nacos.core.auth.ldap.url=ldap://localhost:389
#nacos.core.auth.ldap.basedc=dc=example,dc=org
#nacos.core.auth.ldap.userDn=cn=admin,${nacos.core.auth.ldap.basedc}
#nacos.core.auth.ldap.password=admin
#nacos.core.auth.ldap.userdn=cn={0},dc=example,dc=org
#nacos.core.auth.ldap.filter.prefix=uid
#nacos.core.auth.ldap.case.sensitive=true
#nacos.core.auth.ldap.ignore.partial.result.exception=false

#*************** Control Plugin Related Configurations ***************#
# plugin type
#nacos.plugin.control.manager.type=nacos

# local control rule storage dir, default ${nacos.home}/data/connection and ${nacos.home}/data/tps
#nacos.plugin.control.rule.local.basedir=${nacos.home}

# external control rule storage type, if exist
#nacos.plugin.control.rule.external.storage=

#*************** Config Change Plugin Related Configurations ***************#
# webhook
#nacos.core.config.plugin.webhook.enabled=false
# It is recommended to use EB https://help.aliyun.com/document_detail/413974.html
#nacos.core.config.plugin.webhook.url=http://localhost:8080/webhook/send?token=***
# The content push max capacity ,byte
#nacos.core.config.plugin.webhook.contentMaxCapacity=102400

# whitelist
#nacos.core.config.plugin.whitelist.enabled=false
# The import file suffixs
#nacos.core.config.plugin.whitelist.suffixs=xml,text,properties,yaml,html
# fileformatcheck,which validate the import file of type and content
#nacos.core.config.plugin.fileformatcheck.enabled=false

#*************** Istio Related Configurations ***************#
### If turn on the MCP server:
nacos.istio.mcp.server.enabled=false

#*************** Core Related Configurations ***************#

### set the WorkerID manually
# nacos.core.snowflake.worker-id=

### Member-MetaData
# nacos.core.member.meta.site=
# nacos.core.member.meta.adweight=
# nacos.core.member.meta.weight=

### MemberLookup
### Addressing pattern category, If set, the priority is highest
# nacos.core.member.lookup.type=[file,address-server]
## Set the cluster list with a configuration file or command-line argument
# nacos.member.list=192.168.16.101:8847?raft_port=8807,192.168.16.101?raft_port=8808,192.168.16.101:8849?raft_port=8809
## for AddressServerMemberLookup
# Maximum number of retries to query the address server upon initialization
# nacos.core.address-server.retry=5
## Server domain name address of [address-server] mode
# address.server.domain=jmenv.tbsite.net
## Server port of [address-server] mode
# address.server.port=8080
## Request address of [address-server] mode
# address.server.url=/nacos/serverlist

#*************** JRaft Related Configurations ***************#

### Sets the Raft cluster election timeout, default value is 5 second
# nacos.core.protocol.raft.data.election_timeout_ms=5000
### Sets the amount of time the Raft snapshot will execute periodically, default is 30 minute
# nacos.core.protocol.raft.data.snapshot_interval_secs=30
### raft internal worker threads
# nacos.core.protocol.raft.data.core_thread_num=8
### Number of threads required for raft business request processing
# nacos.core.protocol.raft.data.cli_service_thread_num=4
### raft linear read strategy. Safe linear reads are used by default, that is, the Leader tenure is confirmed by heartbeat
# nacos.core.protocol.raft.data.read_index_type=ReadOnlySafe
### rpc request timeout, default 5 seconds
# nacos.core.protocol.raft.data.rpc_request_timeout_ms=5000

#*************** Distro Related Configurations ***************#

### Distro data sync delay time, when sync task delayed, task will be merged for same data key. Default 1 second.
# nacos.core.protocol.distro.data.sync.delayMs=1000

### Distro data sync timeout for one sync data, default 3 seconds.
# nacos.core.protocol.distro.data.sync.timeoutMs=3000

### Distro data sync retry delay time when sync data failed or timeout, same behavior with delayMs, default 3 seconds.
# nacos.core.protocol.distro.data.sync.retryDelayMs=3000

### Distro data verify interval time, verify synced data whether expired for a interval. Default 5 seconds.
# nacos.core.protocol.distro.data.verify.intervalMs=5000

### Distro data verify timeout for one verify, default 3 seconds.
# nacos.core.protocol.distro.data.verify.timeoutMs=3000

### Distro data load retry delay when load snapshot data failed, default 30 seconds.
# nacos.core.protocol.distro.data.load.retryDelayMs=30000

### enable to support prometheus service discovery
#nacos.prometheus.metrics.enabled=true

### Since 2.3
#*************** Grpc Configurations ***************#

## sdk grpc(between nacos server and client) configuration
## Sets the maximum message size allowed to be received on the server.
#nacos.remote.server.grpc.sdk.max-inbound-message-size=10485760

## Sets the time(milliseconds) without read activity before sending a keepalive ping. The typical default is two hours.
#nacos.remote.server.grpc.sdk.keep-alive-time=7200000

## Sets a time(milliseconds) waiting for read activity after sending a keepalive ping. Defaults to 20 seconds.
#nacos.remote.server.grpc.sdk.keep-alive-timeout=20000


## Sets a time(milliseconds) that specify the most aggressive keep-alive time clients are permitted to configure. The typical default is 5 minutes
#nacos.remote.server.grpc.sdk.permit-keep-alive-time=300000

## cluster grpc(inside the nacos server) configuration
#nacos.remote.server.grpc.cluster.max-inbound-message-size=10485760

## Sets the time(milliseconds) without read activity before sending a keepalive ping. The typical default is two hours.
#nacos.remote.server.grpc.cluster.keep-alive-time=7200000

## Sets a time(milliseconds) waiting for read activity after sending a keepalive ping. Defaults to 20 seconds.
#nacos.remote.server.grpc.cluster.keep-alive-timeout=20000

## Sets a time(milliseconds) that specify the most aggressive keep-alive time clients are permitted to configure. The typical default is 5 minutes
#nacos.remote.server.grpc.cluster.permit-keep-alive-time=300000

## open nacos default console ui
#nacos.console.ui.enabled=true
```