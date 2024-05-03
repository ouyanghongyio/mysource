# Mysql 基本语法

### 1、系统指令(ubuntu)

```bash
# 启动mysql
sudo service mysql start
# 停止mysql
sudo service mysql stop
# 重启mysql
sudo service mysql restart
# 查看mysql 运行状态
sudo service mysql status
# 查看mysql 版本
mysql -V
```

### 2、分类

- DDL（Data Definition Language）：数据定义语言，用来定义数据库对象：库、表、列等；
- DML（Data Manipulation Language）:数据操作语言，用来定义数据库记录（数据）；
- DCL（Data Control Language）：数据控制语言，用来定义访问权限和安全级别；
- DQL（Data Query Language）：数据查询语言，用来查询记录（数据）

### 3、数据类型

DDL

```mysql
-- 查看所有数据库名称:
SHOW DATABASES;
-- 切换数据库:
USE mydb1;
-- 创建数据库 IF NOT EXISTS / IF EXISTS 判断只适用于 mysql5.7.1以上版本:
CREATE DATABASE IF NOT EXISTS mydb1;
-- 删除数据库：
DROP DATABASE IF EXISTS mydb1;
-- 修改数据库编码:
ALTER DATABASE mydb1 CHARACTER SET utf8;
-- 创建表
CREATE TABLE stu(
                    sid     CHAR(6),
                    sname   VARCHAR(20),
                    age     INT,
                    gender  VARCHAR(10)
);

CREATE TABLE emp(
                    eid     CHAR(6),
                    ename   VARCHAR(50),
                    age     INT,
                    gender  VARCHAR(6),
                    birthday    DATE,
                    hiredate    DATE,
                    salary  DECIMAL(7,2),
                    resume  VARCHAR(1000)
);
-- 查看当前数据库中所有表名称：
SHOW TABLES；
-- 查看指定表的创建语句：
SHOW CREATE TABLE emp;
-- 查看表结构：
DESC emp;
-- 删除表：
DROP TABLE emp;
-- 修改表：
-- 1.修改之添加列：给stu表添加classname列：
ALTER TABLE stu ADD (classname varchar(100));
-- 2.修改之修改列类型：修改stu表的gender列类型为CHAR(2)：
ALTER TABLE stu MODIFY gender CHAR(2);
-- 3.修改之修改列名：修改stu表的gender列名为sex：
ALTER TABLE stu change gender sex CHAR(2);
-- 4.修改之删除列：删除stu表的classname列：
ALTER TABLE stu DROP classname;
-- 5.修改之修改表名称：修改stu表名称为student：
ALTER TABLE stu RENAME TO student;
```

DML

```mysql
-- 插入数据
INSERT INTO stu(sid, sname) VALUES('s_1001', 'zhangSan');
INSERT INTO stu VALUES('s_1002', 'liSi', 32, 'female');
-- 修改数据
UPDATE stu SET sname=’liSi’, age=’20’ WHERE age>50 AND gender=’male’;
-- 删除数据
DELETE FROM stu WHERE sname=’chenQi’ OR age > 30;
DELETE FROM stu; 
-- truncate 是先DROP TABLE，再CREATE TABLE。而且TRUNCATE删除的记录是无  法回滚的，但DELETE删除的记录是可以回滚的
TRUNCATE TABLE stu;
```

DCL

```mysql
-- 创建用户: 
CREATE USER 用户名@ip地址 IDENTIFIED BY '密码';
CREATE USER user1@localhost IDENTIFIED BY ‘123’; 
CREATE USER user2@’%’ IDENTIFIED BY ‘123’; 
-- 给用户授权: GRANT 权限1, … , 权限n ON 数据库.* TO 用户名
GRANT CREATE,ALTER,DROP,INSERT,UPDATE,DELETE,SELECT ON mydb1.* TO user1@localhost;
GRANT ALL ON mydb1.* TO user2@localhost;
-- 撤销授权: REVOKE权限1, … , 权限n ON 数据库.* FORM 用户名
REVOKE CREATE,ALTER,DROP ON mydb1.* FROM user1@localhost;
-- 查看用户权限:SHOW GRANTS FOR 用户名
SHOW GRANTS FOR user1@localhost;
-- 删除用户:DROP USER 用户名
DROP USER user1@localhost;
-- 修改用户密码
USE mysql;
UPDATE USER SET PASSWORD=PASSWORD(‘密码’) WHERE User=’用户名’ and Host=’IP’;
-- 刷新缓存
FLUSH PRIVILEGES;
-- ------------------
UPDATE USER SET PASSWORD=PASSWORD('1234') WHERE User='user2' and Host=’localhost’;
-- 刷新缓存
FLUSH PRIVILEGES;
```

DQL

```mysql
SELECT selection_list /*要查询的列名称*/
FROM table_list /*要查询的表名称*/
WHERE condition /*行条件*/
GROUP BY grouping_columns /*对结果分组*/
HAVING condition /*分组后的行条件*/
ORDER BY sorting_columns /*对结果分组*/
LIMIT offset_start, row_count /*结果限定*/
```

条件查询

- =、 !=、 <>、 <、 <=、 >、 >=
- BETWEEN…AND
- IN(set)
- IS NULL
- AND
- OR
- NOT

```mysql
SELECT * FROM stu 
WHERE sid IN ('S_1001','S_1002','S_1003');
SELECT * FROM stu
WHERE sname IS NOT NULL;
```

模糊查询

- “_”:匹配任意一个字母，5个“”表示5个任意字母
- “%”:匹配0~n个任何字母 “

```mysql
-- 查询姓名中第2个字母为“i”的学生记录
SELECT * FROM stu
WHERE sname LIKE '_i%';
```

字段控制查询
- 去除重复记录 :distinct

```mysql
SELECT DISTINCT sal FROM emp;
```

- 给列名添加别名

```mysql
SELECT *, sal+IFNULL(comm,0) AS total FROM emp;
```

排序

- ASC:升序（默认）
- DESC:降序

```mysql
SELECT * FROM emp
ORDER BY sal DESC,empno ASC;
```

聚合函数

- COUNT()：统计指定列不为NULL的记录行数；
- MAX()：计算指定列的最大值，是字符串类型，那么使用字符串排序运算；
- MIN()：计算指定列的最小值，是字符串类型，那么使用字符串排序运算；
- SUM()：计算指定列的数值和，不是数值类型，计算结果为0；
- AVG()：计算指定列的平均值，不是数值类型，那么计算结果为0

分组(GROUP BY)查询

```mysql
SELECT deptno,COUNT(*)
FROM emp
WHERE sal>1500
GROUP BY deptno;
```

HAVING子句

```mysql
- 注：WHERE是对分组前记录的条件，如果某行记录没有满足WHERE子句的条件，那么这行记录不会参加分组；而HAVING是对分组后数据的约束
SELECT deptno, SUM(sal) FROM emp
GROUP BY deptno
HAVING SUM(sal) > 9000;
```

LIMIT

```mysql
-- limit 起始行,查询行数 
-- 起始行从0开始，为开区间
-- 查询从第四行开始的10行记录
SELECT * FROM emp LIMIT 3, 10;
```

### 4、完整性约束

4.1、主键 ：primary key

- 创建表：定义列时指定主键

```mysql
-- 定义列时指定主键
CREATE TABLE stu
(sid CHAR(9) PRIMARY KEY,
sname VARCHAR(20) NOT NULL,
gender CHAR(1) CHECK(gender IN('M','F')));
```

- 创建表：定义列之后独立指定主键

```mysql
-- 定义列之后独立指定主键
CREATE TABLE stu
(sid CHAR(9),
sname VARCHAR(20) NOT NULL,
gender CHAR(1) CHECK(gender IN('M','F')));
ALTER TABLE stu ADD PRIMARY KEY(sid);
```

- 修改表时指定主键

```mysql
ALTER TABLE stu ADD PRIMARY KEY(sid);
```

删除主键

```mysql
-- 删除主键
-- 先删除外键约束
ALTER TABLE stu DROP FOREIGN KEY fk_stu_dept;
-- 再删除主键
-- 注：删除主键时，需要先删除与该主键关联的外键约束
ALTER TABLE stu DROP PRIMARY KEY;
```

4.2、主键自增长 ：auto_increment（主键必须是整型才可以自增长）

- 创建表时指定主键自增长

```mysql
CREATE TABLE stu(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname   VARCHAR(20),
    age     INT,
    gender  VARCHAR(10)
);
```

- 创建表时指定主键自增长，并指定起始值

```mysql
CREATE TABLE stu(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname   VARCHAR(20),
    age     INT,
    gender  VARCHAR(10)
)AUTO_INCREMENT=100;
```

- 修改表时设置主键自增长

```mysql
ALTER TABLE stu MODIFY sid INT PRIMARY KEY AUTO_INCREMENT;
```

- 修改表时删除主键自增长

```mysql
ALTER TABLE stu MODIFY sid INT;
```

4.3、非空：NOT NULL

字段设为非空后，插入记录时必须给值

4.4、唯一：unique

字段指定唯一约束后，字段的值必须是唯一的

4.5、外键：foreign key

外键用来让两个表的数据之间建立链接，保证数据的一致性和完整性。

外键是另一张表的主键 ！！

外键就是用来约束这一列的值必须是另一张表的主键值！!

- 创建表时设置外键

```mysql
CREATE TABLE t_section(
    sid INT PRIMARY KEY AUTO_INCREMENT,
    sname   VARCHAR(30),
    u_id    INT,
    CONSTRAINT fk_t_user FOREIGN KEY(u_id) REFERENCES t_user(uid)
);
```

- 修改表时设置外键

```mysql
ALTER TABLE t_section
ADD CONSTRAINT fk_t_user
FOREIGN KEY(u_id)
REFERENCES t_user(uid);
```

- 修改表时删除外键

```mysql
ALTER TABLE t_section
DROP FOREIGN KEY fk_t_user;
```

### 5、MySQL数据库备份与还原

5.1、生成SQL脚本 (备份)

```mysql
-- 导出整个数据库
mysqldump -u用户名 -p密码 数据库名 > 导出的SQL文件名.sql

-- 导出指定表
mysqldump -u用户名 -p密码 数据库名 表名> 导出的SQL文件名.sql

-- 导出多个表
mysqldump -u用户名 -p密码 数据库名 表1 表2 表3 > 导出的SQL文件名.sql
```

5.2、还原SQL脚本 (还原)

脚本文本中只包含数据库的内容，而不会存在创建数据库的语句!(即 导入还原过程需要先创建数据库 再在该数据库中执行 sql 脚本)

```bash
# 登录数据库
mysql -u用户名 -p密码 数据库名

# 执行SQL脚本
source 文件路径/文件名.sql

# 不登陆执行
mysql -u用户名 -p密码 数据库名 < 文件路径/文件名.sql
```

### 6、多表查询

6.1、合并结果集

- UNION：去除重复记录 

```mysql
SELECT * FROM t1 UNION SELECT * FROM t2;
```

- UNION ALL:不去除重复记录

```mysql
SELECT * FROM t1 UNION ALL SELECT * FROM t2;
```

6.2、连接查询

- 内连接：INNER JOIN

假设有两个表：

customers：此表存储客户信息，包括客户 ID、姓名和电子邮件地址。

orders：此表存储订单信息，包括订单 ID、客户 ID、订单日期和总金额。

```mysql
SELECT customers.name, customers.email, orders.order_id, orders.order_date, orders.total_amount
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;
```

返回下过订单的客户的客户信息和订单信息，即 订单表中存在该 客户id的记录才会返回（如上，返回 customers.name, customers.email, orders.order_id, orders.order_date, orders.total_amount）

- 左连接：LEFT JOIN

左连接包含来自左表（通常为主表）的所有行和来自右表的匹配行。如果右表中没有匹配的行，则右表中的相应列将具有 NULL 值。

```mysql
SELECT customers.name, customers.email, orders.order_id, orders.order_date, orders.total_amount
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
```

此查询将返回 customers 表中的所有行，对于每个客户，它将包含来自 orders 表的匹配订单信息（如果可用）。如果客户没有订单，则该行的 order_id、order_date 和 total_amount 列将为 NULL。

- 右连接：RIGHT JOIN

右连接包含来自右表（通常为主表）的所有行和来自左表的匹配行。如果左表中没有匹配的行，则左表中的相应列将具有 NULL 值。

```mysql
SELECT customers.name, customers.email, orders.order_id, orders.order_date, orders.total_amount
FROM customers
RIGHT JOIN orders ON customers.customer_id = orders.customer_id;
```

此查询将返回 orders 表中的所有行，对于每个订单，它将包含来自 customers 表的匹配客户信息（如果可用）。如果订单没有匹配的客户，则该行的 name 和 email 列将为 NULL。

- 全外连接

全外连接包含来自两个表的所有行，无论另一表中是否存在匹配行。如果找不到匹配的行，未匹配表中的相应列将具有 NULL 值。

```mysql
SELECT customers.name, customers.email, orders.order_id, orders.order_date, orders.total_amount
FROM customers
FULL OUTER JOIN orders ON customers.customer_id = orders.customer_id;
```

此查询将返回 customers 和 orders 表中的所有行。对于每个客户，它将包含来自 orders 表的匹配订单信息（如果可用）。如果客户没有订单，则该行的 order_id、order_date 和 total_amount 列将为 NULL。同样，对于每个订单，它将包含来自 customers 表的匹配客户信息（如果可用）。如果订单没有匹配的客户，则该行的 name 和 email 列将为 NULL。

- 自连接

一个 employees 表 (employee_id, name, manager_id)，其中 manager_id 引用另一个员工的 ID。

```mysql
SELECT e1.name AS employee_name, e2.name AS manager_name
FROM employees AS e1
LEFT JOIN employees AS e2 ON e1.manager_id = e2.employee_id;
```

此查询将返回每个员工的姓名及其经理的姓名。

- 自然连接 NATURAL JOIN

NATURAL JOIN 是一种特殊的内部连接类型，它根据两个表中的 匹配列名和数据类型 自动匹配列。它无需使用 ON 子句显式指定连接条件。

```mysql
SELECT *
FROM customers
NATURAL JOIN orders;
```

NATURAL JOIN 自动匹配这两个表中的 customer_id 列，因为它们具有相同的名称和数据类型 (INT)。

此查询将返回与使用显式 ON 子句的等效内部连接相同的结果：

```mysql
SELECT *
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;
```

NATURAL JOIN 的优点:

可读性: NATURAL JOIN 可以使连接查询更加简洁易读，尤其是在处理多个表和匹配列时。

减少错误: 通过消除显式指定连接条件的需要，NATURAL JOIN 可以帮助降低因列名拼写错误或不一致而导致的错误风险。

注意事项:

列歧义: 如果两个表中存在同名但数据类型不同的列，NATURAL JOIN 将失败。确保匹配列具有相同的数据类型。

复杂条件的显式连接: 对于涉及非匹配列名或其他筛选的更复杂连接条件，使用带有 ON 子句的显式内部连接更合适。

- 子查询

子查询（Subquery）是指嵌套在其他 SQL 语句（SELECT、INSERT、UPDATE、DELETE 等）中的查询语句。子查询也称为内查询（inner query），必须位于括号之中。外层查询有时也被称为主查询（main query）。

子查询的功能是为外层查询提供数据或过滤条件。子查询的结果可以是单个值、多个值或一组行。子查询可以嵌套在其他子查询中，形成更复杂的查询结构。

子查询类型：根据子查询在主查询中嵌入的位置和用法

1、WHERE 子查询：WHERE 子查询用于根据子查询的结果过滤主查询中的行。子查询的结果必须是一个布尔值（TRUE 或 FALSE）。如果子查询返回 TRUE，则主查询将包含该行。如果子查询返回 FALSE，则主查询将排除该行。

```mysql
SELECT * FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE order_amount > 100
);
```

该查询将返回所有 customer_id 属于具有订单金额超过 100 的订单的客户。

2、SELECT 子查询: SELECT 子查询用于将子查询的结果作为列或表达式包含在主查询中。子查询的结果可以是单个值、多个值或一组行。

```mysql
SELECT customer_name,
       (SELECT order_amount
        FROM orders
        WHERE customer_id = customers.customer_id
        ORDER BY order_date DESC
        LIMIT 1) AS last_order_amount
FROM customers;
```

该查询将返回每个客户的名字以及他们的最新订单金额。

3、EXISTS 子查询：EXISTS 子查询用于检查子查询是否返回任何行。如果子查询返回任何行，则 EXISTS 子查询将返回 TRUE。否则，它将返回 FALSE。

```mysql
SELECT * FROM customers
WHERE EXISTS (
    SELECT 1
    FROM orders
    WHERE customer_id = customers.customer_id
);
```

该查询将返回所有已下过订单的客户。

4、ANY/ALL 子查询: ANY 和 ALL 子查询用于检查子查询中是否满足特定条件的行。ANY 子查询返回 TRUE，如果子查询中存在至少一行满足条件。ALL 子查询只有在子查询中的所有行都满足条件时才返回 TRUE。

```mysql
SELECT * FROM customers
WHERE ANY (
    SELECT order_status
    FROM orders
    WHERE customer_id = customers.customer_id
) = 'shipped';
```

该查询将返回所有至少有一个订单已发货的客户。

5、CORRELATED 子查询：相关子查询（Correlated Subquery）是指在子查询中引用外层查询列的子查询。相关子查询用于在子查询中使用外层查询的结果进行过滤或计算。

```mysql
SELECT customer_name,
       (SELECT order_amount
        FROM orders
        WHERE customer_id = customers.customer_id
        AND order_date > '2023-01-01') AS total_amount_since_2023
FROM customers;
```

该查询将返回每个客户的名字以及自 2023 年 1 月 1 日以来他们的订单总金额。

子查询的注意事项

使用子查询时，需要注意以下事项：

子查询必须包含在括号之中。

子查询的结果类型必须与主查询中相应位置的列数据类型兼容。

子查询可能会降低查询性能，应尽量避免使用不必要的子查询。

子查询的优点

使用子查询可以使 SQL 查询更加灵活和强大，具有以下优点：

可以将复杂查询分解为更小的、更容易理解的部分。

可以根据其他查询的结果进行过滤或排序。

可以用于计算复杂表达式或聚合数据。

子查询的缺点

过度使用子查询可能会降低查询性能，并使查询代码更加难以阅读和维护。因此，应谨慎使用子查询，并尽量选择其他更有效的查询方法。

### 7、MySQL数据库优化

7.1、优化表结构

- 创建表时，尽量使用 CHAR 代替 VARCHAR，因为 CHAR 存储空间固定，所以处理速度更快
- 表的字段顺序固定，可以提高检索速度
- 尽量使用 TINYINT、SMALLINT、MEDIUM_INT 来代替 INT
- 尽量使用 TIMESTAMP 代替 DATETIME，因为 TIMESTAMP 只使用 4 个字节
- 单表不要超过 500W 条数据，建议在 500W-2000W 之间，因为 MyISAM 引擎在数据达到 1000W 的时候会进行优化
- 库和表的字符集统一使用 UTF8

7.2、优化索引

- 索引并不是越多越好，索引可以提高检索速度，但会降低插入、更新、删除速度
- 不要对经常变动的数据加索引
- 单值索引，尽量选择区分度高的列作为索引
- 复合索引，选择区分度高的列作为前缀
- 索引的个数不能过多

7.3、优化查询语句

- 避免在 WHERE 子句中对字段进行 NULL 值判断
- 避免在 WHERE 子句中使用 != 或 <> 操作符，否则将引擎放弃使用索引而进行全表扫描
- 避免在 WHERE 子句中使用 or 来连接条件
- 避免在 WHERE 子句中对字段进行表达式操作
- 避免在 WHERE 子句中对字段进行函数操作
- 尽可能的使用覆盖索引，避免使用 select *
- 尽量使用 IN 代替 OR，在 IN 中使用索引
- 不使用 NOT IN 和 <>
- 使用 UNION ALL 替换 UNION
- 区分 IN 和 EXISTS，IN 的效率高于 EXISTS