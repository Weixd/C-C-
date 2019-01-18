#### SQL教程

* SQL是一种标准
* RDBMS指关系型数据库管理系统



##### SQL语法

* **选择数据库**
  * use DB_name
* **设置使用的字符集**
  * set names utf8
* **读取数据表的信息**
  * SELECT * FROM table_name

* **返回唯一不同的值**

  * SELECT DISTINCT column_name FROM table_name

* **用于过滤记录**

  * SELECT * FROM table_name WHERE country='CN'	// 文本字段（字符串）

  * SELECT * FROM table_name WHERE id=1; 	// 数值字段

  * WHERE子句中的运算符

    | 运算符  | 描述                                                         |
    | ------- | ------------------------------------------------------------ |
    | =       | 等于                                                         |
    | <>      | 不等于。**注释**：在SQL的一些版本中，该操作符也可能被写成 != |
    | >       | 大于                                                         |
    | <       | 小于                                                         |
    | >=      | 大于等于                                                     |
    | <=      | 小于等于                                                     |
    | BETWEEN | 在某个范围内                                                 |
    | LIKE    | 搜索某种模式                                                 |
    | IN      | 指定的多个可能值                                             |

* **一个条件以上进行过滤**

  * SELECT * FROM table_name WHERE country='CN' AND alexa>50 	// AND
  * SELECT * FROM tabel_name WHERE country='USA' OR country='CN'	// OR

* **对结果集进行排序**

  * SELECT * FROM table_name ORDER BY column_name，column_name ASC(升序)|DESC(降序)	//对结果集按照一个列或者多个列进行默认升序排序

* **向表中插入新记录**

  * INSERT INTO table_name VALUES (value1,value2,value3,...) //插入所有字段
  * INSERT INTO table_name (column1,column2,column3,...) VALUES (value1,value2,value3,...)	// 插入指定字段

* **更新表中的记录**

  * UPDATE table_name SET column1=value1,column2=value2,... WHERE some_column=some_value; //更新WHERE条件指定字段
  * 执行没有WHERE条件的UPDATE的语句要慎重

* **删除表中的记录**

  * DELETE FROM *table_name* WHERE *some_column*=*some_value*;

* **规定要返回的记录的数目**

  * MySQL 支持 LIMIT 语句来选取指定的条数数据
  * SELECT *column_name(s)* FROM *table_name* LIMIT *number*;
  * SELECT * FROM Persons LIMIT 5;
  * Oracle 可以使用 ROWNUM 来选取
  * SELECT *column_name(s)* FROM *table_name* WHERE ROWNUM <= *number*;
  * SELECT * FROM Persons WHERE ROWNUM <=5;

* **搜索列中的指定模式**

  * SELECT *column_name(s)* FROM *table_name* WHERE *column_name* LIKE *pattern*;
  * SELECT * FROM Websites WHERE name LIKE 'G%'   // %通配 Gxxxxxx
  * SELECT * FROM Websites WHERE name LIKE '%k'    // %通配 xxxxxxK
  * SELECT * FROM Websites WHERE name LIKE '%oo%'  // 通配包含oo的项
  * SELECT * FROM Websites WHERE name NOT LIKE '%oo%'  // 通配不包含oo的项

* **替代字符串中的任何其他字符**

  | 通配符                                       | 描述                   |
  | -------------------------------------------- | ---------------------- |
  | %                                            | 代替0个或多个字符      |
  | _                                            | 下划线代替1个字符      |
  | RegExp ‘^[charlist]’                         | 字符列中的任何单一字符 |
  | RegExp ‘^[charlist]' 或RegExp ‘^[!charlist]' | 不在字符列中的单一字符 |

  * SELECT * FROM Websites WHERE name **REGEXP** '^[GFs]'  // 选取 name 以 "G"、"F" 或 "s" 开始的所有行
  * SELECT * FROM Websites WHERE name **RLIKE** '^[GFs]'  // 选取 name 以 "G"、"F" 或 "s" 开始的所有行
  * SELECT * FROM Websites WHERE name **REGEXP** '^[A-H]' // 以 A 到 H 字母开头的
  * SELECT * FROM Websites WHERE name REGEXP '^  [ ^A-H]'  // 不以 A 到 H 字母开头的

* **WHERE子句中规定多个值**
  * SELECT * FROM Websites WHERE name IN ('Google', '教程')
* **选取介于两个值之间的数据范围内的值**
  * SELECT * FROM Websites WHERE alexa BETWEEN 1 AND 20 // 介于1~20之间
  * SELECT * FROM Websites WHERE alexa NOT BETWEEN 1 AND 20 // 不在1~20之间
* **为表名称或列名称指定别名**
  * 