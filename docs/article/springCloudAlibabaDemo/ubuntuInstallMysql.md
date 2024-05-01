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
#查看mysql版本
mysql -V
#指定版本（常用版本5.7.1）  
sudo apt install -y mysql-server-5.7.1
```

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql1.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql1.png" />
  </span>
</rich-text>

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

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql2.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql2.png" />
  </span>
</rich-text>

7、修改密码，权限(设置密码为root)

```bash
# 登录mysql，在默认安装时如果没有让我们设置密码，则直接回车就能登录成功。
mysql -uroot -p

# 设置密码 mysql8.0
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '新密码';
# 设置密码 mysql5.7
set password=password('新密码');

# 配置IP 8.0切换到 mysql 数据库
use mysql
# 设置root用户的连接权限 host = '%' 代表在任何ip都可以连接
update user set host = '%' where user ='root';
# 配置IP 5.7
grant all privileges on *.* to root@"%" identified by "密码";

# 刷新缓存
flush privileges;
```

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql3.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql3.png" />
  </span>
</rich-text>

测试root连接

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql4.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql4.png" />
  </span>
</rich-text>

注意mysql8.0配置ip,上述5.7配置方式不可用，通过直接修改配置文件才实现的，MySQL8.0版本把配置文件 my.cnf 拆分成mysql.cnf 和mysqld.cnf，我们需要修改的是mysqld.cnf文件：

```bash
sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf
```

修改 bind-address

```bash
bind-address            = 0.0.0.0
```

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql5.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql5.png" />
  </span>
</rich-text>

重启msyql生效

```bash
sudo systemctl restart mysql
```

再次测试root连接

<rich-text>
  <span style="text-align: center; clear: both; display: block;margin: auto;">
    <img src="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql6.png" alt="https://ouyanghongyio.github.io/mysource/docs/article/springCloudAlibabaDemo/image/ubuntuInstallMysql6.png" />
  </span>
</rich-text>

8、mysql_secure_installation

在安装 MySQL 后，特定的默认设置可能不符合安全标准，可能会让数据库容易受到入侵或利用。因此，安装后的一个关键步骤是加强 MySQL 实例的安全性。

MySQL 提供了一个名为 mysql_secure_installation 的安全脚本，它可以帮助加强数据库的安全性。这个脚本非常有用，建议运行它以确保数据库的安全性。

启动该脚本

```bash
sudo mysql_secure_installation
```

脚本交互

#### VALIDATE PASSWORD COMPONENT

一个提示，验证密码强度的效果，是否要设置 VALIDATE PASSWORD 组件，可以 ctrl + c 跳过退出

再次启动该脚本，进行接下来的交互

##### Password Settings for Root Accounts -no

在这里，可以重置 root 密码。如果在初始安装时已经设置了密码，可以选择跳过此步骤。脚本会要求您输入新密码两次以进行验证

```bash
Change the password for root ? ((Press y|Y for Yes, any other key for No) : no
```
##### Removal of Anonymous Users -y

MySQL 默认情况下包含一个 Anonymous 匿名用户账户。该账户允许任何人在没有经过身份验证的情况下登录到 MySQL，可能造成重大安全风险。可以通过脚本删除匿名用户账户：

```bash
Remove anonymous users? (Press y|Y for Yes, any other key for No) : y
```

##### Disallowing Root Login Remotely -no

在标准安全协议中，root 用户应仅允许从「localhost」连接。该协议可以减少远程尝试猜测 root 密码的风险。脚本要求您确认停用远程 root 登录：

```bash
Disallow root login remotely? (Press y|Y for Yes, any other key for No) : no
```

##### Removal of Test Database -y

默认情况下，MySQL 安装包含一个名为「test」的测试数据库。这个数据库任何人都可以访问。在将设置移至生产环境之前，需要删除「test」 数据库并禁止访问它：

```bash
Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
```

##### Reloading Privilege Tables -y

重新加载权限表，让所做的所有更改立即生效：

```bash
Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
```

所有交互代码

```bash
root@ubuntu-server-01:/etc/mysql/mysql.conf.d# sudo mysql_secure_installation

Securing the MySQL server deployment.

Enter password for user root: 
The 'validate_password' component is installed on the server.
The subsequent steps will run with the existing configuration
of the component.
Using existing password for root.

Estimated strength of the password: 0 
Change the password for root ? ((Press y|Y for Yes, any other key for No) : no

 ... skipping.
By default, a MySQL installation has an anonymous user,
allowing anyone to log into MySQL without having to have
a user account created for them. This is intended only for
testing, and to make the installation go a bit smoother.
You should remove them before moving into a production
environment.

Remove anonymous users? (Press y|Y for Yes, any other key for No) : y
Success.


Normally, root should only be allowed to connect from
'localhost'. This ensures that someone cannot guess at
the root password from the network.

Disallow root login remotely? (Press y|Y for Yes, any other key for No) : no

 ... skipping.
By default, MySQL comes with a database named 'test' that
anyone can access. This is also intended only for testing,
and should be removed before moving into a production
environment.


Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y
 - Dropping test database...
Success.

 - Removing privileges on test database...
Success.

Reloading the privilege tables will ensure that all changes
made so far will take effect immediately.

Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
Success.

All done!
```

9、systemctl 命令能够直接与 MySQL 服务进行交互，以下是一些常用命令：

- 启动 MySQL 服务: `sudo systemctl start mysql`
- 停止 MySQL 服务: `sudo systemctl stop mysql`
- 重启 MySQL 服务: `sudo systemctl restart mysql`
- 查看 MySQL 服务状态: `sudo systemctl status mysql`
- 启用 MySQL 服务随系统自动启动: `sudo systemctl enable mysql`
- 禁用 MySQL 服务随系统自动启动: `sudo systemctl disable mysql`

10、卸载MySql服务

停止 mysql 服务

```bash
sudo service mysql stop
```

查看 mysql 服务状态

```bash
root@ubuntu-server-01:/etc/mysql/mysql.conf.d# sudo systemctl status mysql
○ mysql.service - MySQL Community Server
     Loaded: loaded (/lib/systemd/system/mysql.service; enabled; vendor preset: enabled)
     Active: inactive (dead) since Wed 2024-05-01 07:27:22 UTC; 37s ago
    Process: 2600 ExecStartPre=/usr/share/mysql/mysql-systemd-start pre (code=exited, status=0/SUCCESS)
    Process: 2608 ExecStart=/usr/sbin/mysqld (code=exited, status=0/SUCCESS)
   Main PID: 2608 (code=exited, status=0/SUCCESS)
     Status: "Server shutdown complete"
        CPU: 20.168s

May 01 06:52:00 ubuntu-server-01 systemd[1]: Starting MySQL Community Server...
May 01 06:52:00 ubuntu-server-01 systemd[1]: Started MySQL Community Server.
May 01 07:27:21 ubuntu-server-01 systemd[1]: Stopping MySQL Community Server...
May 01 07:27:22 ubuntu-server-01 systemd[1]: mysql.service: Deactivated successfully.
May 01 07:27:22 ubuntu-server-01 systemd[1]: Stopped MySQL Community Server.
May 01 07:27:22 ubuntu-server-01 systemd[1]: mysql.service: Consumed 20.168s CPU time.
```

卸载 MySQL 服务器软件包

```bash
sudo apt-get purge mysql-server
```

删除 MySQL 配置文件和数据

```bash
root@ubuntu-server-01:/etc/mysql/mysql.conf.d# sudo apt-get purge mysql-server
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libcgi-fast-perl libcgi-pm-perl libclone-perl libencode-locale-perl libevent-core-2.1-7 libevent-pthreads-2.1-7 libfcgi-bin libfcgi
  libfcgi0ldbl libhtml-parser-perl libhtml-tagset-perl libhtml-template-perl libhttp-date-perl libhttp-message-perl libio-html-perl
  liblwp-mediatypes-perl libmecab2 libnuma1 libprotobuf-lite23 libtimedate-perl liburi-perl mecab-ipadic mecab-ipadic-utf8 mecab-util
  mysql-client-8.0 mysql-client-core-8.0 mysql-common mysql-server-8.0 mysql-server-core-8.0
Use 'sudo apt autoremove' to remove them.
The following packages will be REMOVED:
  mysql-server*
0 upgraded, 0 newly installed, 1 to remove and 39 not upgraded.
After this operation, 35.8 kB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 68360 files and directories currently installed.)
Removing mysql-server (8.0.36-0ubuntu0.22.04.1) ...
```

清理残留文件和目录

```bash
# 自动删除不再需要的依赖项
sudo apt-get autoremove
# 清理下载的软件包缓存
sudo apt-get autoclean
```

清理依赖项bash
```bash
root@ubuntu-server-01:/etc/mysql/mysql.conf.d# sudo apt-get autoremove
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages will be REMOVED:
  libcgi-fast-perl libcgi-pm-perl libclone-perl libencode-locale-perl libevent-core-2.1-7 libevent-pthreads-2.1-7 libfcgi-bin
  libfcgi-perl libfcgi0ldbl libhtml-parser-perl libhtml-tagset-perl libhtml-template-perl libhttp-date-perl libhttp-message-perl
  libio-html-perl liblwp-mediatypes-perl libmecab2 libnuma1 libprotobuf-lite23 libtimedate-perl liburi-perl mecab-ipadic
  mecab-ipadic-utf8 mecab-utils mysql-client-8.0 mysql-client-core-8.0 mysql-common mysql-server-8.0 mysql-server-core-8.0
0 upgraded, 0 newly installed, 29 to remove and 39 not upgraded.
After this operation, 243 MB disk space will be freed.
Do you want to continue? [Y/n] y
(Reading database ... 68358 files and directories currently installed.)
Removing libcgi-fast-perl (1:2.15-1) ...
Removing libhtml-template-perl (2.97-1.1) ...
Removing libcgi-pm-perl (4.54-1) ...
Removing libclone-perl (0.45-1build3) ...
Removing libhttp-message-perl (6.36-1) ...
Removing libencode-locale-perl (1.05-1.1) ...
Removing mysql-server-8.0 (8.0.36-0ubuntu0.22.04.1) ...
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
debconf: unable to initialize frontend: Dialog
debconf: (No usable dialog-like program is installed, so the dialog based frontend cannot be used. at /usr/share/perl5/Debconf/FrontEnd/Dialog.pm line 78.)
debconf: falling back to frontend: Readline
update-alternatives: using /etc/mysql/my.cnf.fallback to provide /etc/mysql/my.cnf (my.cnf) in auto mode
Removing mysql-server-core-8.0 (8.0.36-0ubuntu0.22.04.1) ...
Removing libevent-pthreads-2.1-7:amd64 (2.1.12-stable-1build3) ...
Removing libevent-core-2.1-7:amd64 (2.1.12-stable-1build3) ...
Removing libfcgi-bin (2.4.2-2build2) ...
Removing libfcgi-perl:amd64 (0.82+ds-1build1) ...
Removing libfcgi0ldbl:amd64 (2.4.2-2build2) ...
Removing libhtml-parser-perl:amd64 (3.76-1build2) ...
Removing libhtml-tagset-perl (3.20-4) ...
Removing libhttp-date-perl (6.05-1) ...
Removing libio-html-perl (1.004-2) ...
Removing liblwp-mediatypes-perl (6.04-1) ...
Removing mecab-ipadic-utf8 (2.7.0-20070801+main-3) ...
update-alternatives: using /var/lib/mecab/dic/ipadic to provide /var/lib/mecab/dic/debian (mecab-dictionary) in auto mode
Removing mecab-ipadic (2.7.0-20070801+main-3) ...
Removing mecab-utils (0.996-14build9) ...
Removing libmecab2:amd64 (0.996-14build9) ...
Removing libnuma1:amd64 (2.0.14-3ubuntu2) ...
Removing libprotobuf-lite23:amd64 (3.12.4-1ubuntu7.22.04.1) ...
Removing libtimedate-perl (2.3300-2) ...
Removing liburi-perl (5.10-1) ...
Removing mysql-client-8.0 (8.0.36-0ubuntu0.22.04.1) ...
Removing mysql-client-core-8.0 (8.0.36-0ubuntu0.22.04.1) ...
Removing mysql-common (5.8+1.0.8) ...
Processing triggers for libc-bin (2.35-0ubuntu3.6) ...

```

清理下载软件包缓存

```bash
root@ubuntu-server-01:/etc/mysql/mysql.conf.d# sudo apt-get autoclean
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
Del less 590-1ubuntu0.22.04.2 [143 kB]
```

验证是否卸载完成

```bash
root@ubuntu-server-01:/etc/mysql/mysql.conf.d# mysql -V
-bash: /usr/bin/mysql: No such file or directory
```
