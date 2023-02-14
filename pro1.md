# README.md

### ER图

![asssssad](C:\Users\86189\Desktop\asssssad.svg)

制图使用[Diagram Software and Flowchart Maker](https://www.diagrams.net/)。

### 数据库设计

#### 1.原始数据

Data.csv导入生成的总表

包含以下列：

Item Name,Item Type,Item Price,Retrieval City,Retrieval Start Time,Retrieval Courier,Retrieval Courier Gender,Retrieval Courier Phone Number,Retrieval Courier Age,Delivery Finished Time,Delivery City,Delivery Courier,Delivery Courier Gender,Delivery Courier Phone Number,Delivery Courier Age,Item Export City,Item Export Tax,Item Export Time,Item Import City,Item Import Tax,Item Import Time,Container Code,Container Type,Ship Name,Company Name,Log Time

 

####  2.数据分析

在现实生活中，邮寄往往以订单为唯一凭据。

因此我们抽象出订单这一实体，并且将订单号作为唯一主键的表作为project的主表。

可以找到以下关系：

1.订单与最近更新时间，流程号等直接相关，且不可再分，形成主表

2.当订单到了出口这一步，应该考虑装入集装箱，并且装上船：出口表包含船和集装箱两个实体（为了精简数据库结构，不另设运输过程表）。

3.检察表包含检察员的标识ID，通过此ID在检察员信息表里可以查到检察员的详细信息。这样也符合三大范式的要求，检察员的详细信息只和他本人有直接关系。

4.同理，抵达表包含送达快递员的标识ID，通过此ID在送达员信息表里可以查到送达员的详细信息。

5.对于公司，即管理此货物的公司的名称，该检索和送货的快递员和船只都是其中的一部分。

因此，认为是该公司负责此订单，并将公司作为属性加入订单主表中。

####  3.数据分表

***\*\main 订单表\****

<>OrderId 订单号 自增主键

<>item id 货物ID

<>retrieval id 检察流程号 外键 指向检察表

<>export id 出口流程号 外键 指向出口表

<>import id 进口流程号 外键 指向进口表

<>delivery id 抵达流程号 外键 指向抵达表

<>company name 负责此订单的公司名，订单检察和送货的快递员和船只都属于此公司

<>log time 记录最近更新时间

***\*\Item货物表\****

<>id  唯一标识符

<>name 货物名称

<>price 货物价值

<>type 货物类型

***\*\Retrieval 检察表\****

<>id 检察ID

<>city 检察城市

<>courier 检察员 外键 指向检察员信息表

<>start time 检察时间

***\*\Retrieval courier 检察员信息表\****

<>id 检察员标识符

自增主键

无实意义

<>name 检察员姓名

<>gender 检察员性别

<>age 检察员年龄

<>phone number 检察员电话，不考虑区号

***\*\Export 出口表\****

<>id 出口ID

<>time 出口时间

<>city 出口城市

<>tax 出口关税

***\*\Ship运输船表\****

<>id  运输船标识符ID

<>name 船注册名

***\*\Container 集装箱表\****

<>id 集装箱ID

<>code 集装箱编号

<>type 集装箱型号

***\*\Import进口表\****

<>id 进口ID

<>time 进口时间

<>city 进口城市

<>tax 进口关税

***\*\Delivery抵达表\****

<>id 抵达ID

<>city 抵达城市

<>courier 送达快递员 外键 指向送达员信息表

<>finish time 送达时间

***\*\Delivery courier 送达员信息表\****

<>id 送达员标识符 自增主键 无实意义

<>name 送达员姓名

<>gender 送达员性别

<>age 送达员年龄

<>phone number 送达员电话号码，不考虑区号

 

#### 4.数据库分析

我们的表设计满足以下的设计需求 

满足三大范式 

每个表都有主键 

每个表都有外键/有表的外键指向 

没有成环 

每个表都有 NOTNULL 列和 UNIQUE 列 

对数据使用了正确的类型 

 

#### 5.速度分析：

##### 1.采用了索引

建立索引主要有如下的优点：

· 大大加快数据的检索速度;

· 创建唯一性索引，保证数据库表中每一行数据的唯一性;

· 加速表和表之间的连接;

· 在使用分组和排序子句进行数据检索时，可以显著减少查询中分组和排序的时间。

当然有优点就有缺点，索引的缺点如下：

· 索引需要占用数据表以外的物理存储空间

· 创建索引和维护索引要花费一定的时间

· 当对表进行更新操作时，索引需要被重建，这样降低了数据的维护速度。

[数据库索引，你要了解的都在这里！ - 知乎 (zhihu.com)](https://zhuanlan.zhihu.com/p/138890537)

 

#####  2.字符类型

所有字符类型都选择varchar(60)，对于VARCHAR数据类型来说，硬盘上的存储空间虽然都是根据实际字符长度来分配存储空间的，但是对于内存来说，则不是。其时使用固定大小的内存块来保存值。简单的说，就是使用字符类型中定义的长度，即60个字符空间。显然，这对于排序或者临时表(这些内容都需要通过内存来实现)作业会产生比较大的不利影响。

[一篇文章看懂mysql中varchar能存多少汉字、数字，以及varchar(100)和varchar(10)的区别 - 那些年的代码 - 博客园 (cnblogs.com)](https://www.cnblogs.com/zhuyeshen/p/11642211.html)





