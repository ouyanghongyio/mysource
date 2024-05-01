# ubuntu 安装 mysql

### 1、介绍

MySQL [官网地址](https://www.mysql.com/)

`https://www.mysql.com/`

MySQL 是最流行的关系型数据库管理系统，在 WEB 应用方面 MySQL 是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一。

以下是一个以表格形式列出了不同Ubuntu版本和它们通常默认安装的MySQL版本：

|Ubuntu 版本	|默认 MySQL 版本|
|:---:|:---:|
|Ubuntu 22.04 LTS|	MySQL 8.0|
|Ubuntu 20.04 LTS|	MySQL 8.0|
|Ubuntu 18.04 LTS|	MySQL 5.7|
|Ubuntu 16.04 LTS|	MySQL 5.7|
|Ubuntu 14.04 LTS|	MySQL 5.5|
|Ubuntu 12.04 LTS|	MySQL 5.5|

### 2、在线安装 MySQL

1、在进行任何软件安装之前，请确保你的系统的软件包列表是最新的。打开终端并运行以下命令：

```bash
sudo apt-get update
```

2、在更新软件包列表后，这里我们可以查看一下可使用的MySQL安装包：

```bash
sudo apt search mysql-server
```

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql0.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql0.png" />
  </span>
</rich-text>

3、安装Mysql

```bash
#最新版本  
sudo apt install -y mysql-server 
#指定版本（常用版本5.7.1）  
sudo apt install -y mysql-server-5.7.1
```

注意：如果不加-y 会在安装过程中，系统将提示你设置MySQL的root密码。

4、启动MySQL

```bash
sudo service mysql start
```

5、设置MySQL开机自启动

```bash
sudo systemctl enable mysql
```

6、查看MySQL状态

```bash
sudo systemctl status mysql
```

7、修改密码，权限

```bash
# 登录mysql，在默认安装时如果没有让我们设置密码，则直接回车就能登录成功。
mysql -uroot -p

# 设置密码 mysql8.0
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '新密码';
# 设置密码 mysql5.7
set password=password('新密码');

# 配置IP 5.7
grant all privileges on *.* to root@"%" identified by "密码";
# 刷新缓存

flush privileges;
```
注意mysql8.0配置ip,上述5.7配置方式不可用，通过直接修改配置文件才实现的，MySQL8.0版本把配置文件 my.cnf 拆分成mysql.cnf 和mysqld.cnf，我们需要修改的是mysqld.cnf文件：

```bash
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
```

修改 bind-address

```bash
bind-address            = 0.0.0.0
```

重启msyql生效

```bash
sudo systemctl restart mysql
```

8、mysql_secure_installation

在安装 MySQL 后，特定的默认设置可能不符合安全标准，可能会让数据库容易受到入侵或利用。因此，安装后的一个关键步骤是加强 MySQL 实例的安全性。

MySQL 提供了一个名为 mysql_secure_installation 的安全脚本，它可以帮助加强数据库的安全性。这个脚本非常有用，建议运行它以确保数据库的安全性。

启动该脚本

```bash
sudo mysql_secure_installation
```

脚本交互

##### Password Settings for Root Accounts

在这里，可以重置 root 密码。如果在初始安装时已经设置了密码，可以选择跳过此步骤。脚本会要求您输入新密码两次以进行验证

```bash
New password: <---- 设置新密码
Re-enter new password: <---- 再次验证新密码
```
##### Removal of Anonymous Users

MySQL 默认情况下包含一个 Anonymous 匿名用户账户。该账户允许任何人在没有经过身份验证的情况下登录到 MySQL，可能造成重大安全风险。可以通过脚本删除匿名用户账户：

```bash
Remove anonymous users? (Press y|Y for Yes, any other key for No) : Y <---- 输入 Y 并按回车确认
```

##### Disallowing Root Login Remotely

在标准安全协议中，root 用户应仅允许从「localhost」连接。该协议可以减少远程尝试猜测 root 密码的风险。脚本要求您确认停用远程 root 登录：

```bash
Disallow root login remotely? (Press y|Y for Yes, any other key for No) : Y <---- 输入 Y 并按回车确认
```

##### Removal of Test Database

默认情况下，MySQL 安装包含一个名为「test」的测试数据库。这个数据库任何人都可以访问。在将设置移至生产环境之前，需要删除「test」 数据库并禁止访问它：

```bash
Remove test database and access to it? (Press y|Y for Yes, any other key for No) : Y <---- 输入 Y 并按回车确认
```

##### Reloading Privilege Tables

重新加载权限表，让所做的所有更改立即生效：

```bash
Reload privilege tables now? (Press y|Y for Yes, any other key for No) : Y <---- 输入 Y 并按回车确认
```

9、systemctl 命令能够直接与 MySQL 服务进行交互，以下是一些常用命令：

- 启动 MySQL 服务: `sudo systemctl start mysql`
- 停止 MySQL 服务: `sudo systemctl stop mysql`
- 重启 MySQL 服务: `sudo systemctl restart mysql`
- 查看 MySQL 服务状态: `sudo systemctl status mysql`
- 启用 MySQL 服务随系统自动启动: `sudo systemctl enable mysql`
- 禁用 MySQL 服务随系统自动启动: `sudo systemctl disable mysql`

10、卸载MySql服务

