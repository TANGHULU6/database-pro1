alter table data
    add column OrderId BIGSERIAL primary key ;
-- alter table data
-- add constraint MyPrimarykey
-- primary key ("Item Name");
--alter table data drop constraint MyPrimarykey;
-- alter table data
--  add constraint MyPrimarykey
--  primary key (OrderId);
drop table item,RetrievalCourier,DeliveryCourier,Export,PackingAndShipping;
drop table Import,Delivery,Retrieval;
drop table container;
create table item
as (
    select OrderId,"Item Name","Item Type","Item Price" from data
);
alter table item
add constraint Pitem primary key (OrderId);
create table RetrievalCourier
as(
    select OrderId,"Retrieval Courier","Retrieval Courier Gender","Retrieval Courier Phone Number","Retrieval Courier Age" from data
);
alter table  RetrievalCourier
add constraint PRetrievalCourier primary key (OrderId);
create table DeliveryCourier
    as(
select OrderId,"Delivery Courier","Delivery Courier Gender","Delivery Courier Phone Number","Delivery Courier Age" from data
);
alter table DeliveryCourier
add constraint PDeliveryCourier primary key (OrderId);
create table Export
    as(
select OrderId,"Item Export City","Item Export Tax","Item Export Time"  from data
);
alter table Export
add constraint PExport primary key (OrderId);
create table PackingAndShipping
    as(
select OrderId,"Ship Name","Container Code" from data
                                            where "Container Code" is not null
);--no connection between ship and container
alter table PackingAndShipping
add constraint PPackingAndShipping primary key (OrderId);
create table Container
as(
    select distinct "Container Code","Container Type" from data where "Container Code" is not null
);--有重复有空
select * from PackingAndShipping;
select "Container Code",count("Container Type") asd from Container group by "Container Code" having count("Container Type")=1;
alter table Container
add constraint cp primary key ("Container Code");
alter table Container
add constraint pcf
foreign key ("Container Code")references PackingAndShipping("Container Code");
create table Import
    as(
select OrderId,"Item Import City","Item Import Tax","Item Import Time" from data
);
alter table Import
add constraint PImport primary key (OrderId);
create table Delivery
    as(
select OrderId,"Delivery City","Delivery Finished Time","Delivery Courier" from data
);
alter table Delivery
add constraint PDelivery primary key (OrderId);
create table Retrieval
    as(
select OrderId,"Retrieval City","Retrieval Start Time","Retrieval Courier" from data
);
alter table Retrieval
add constraint PRetrieval primary key (OrderId);
-- alter table data
-- drop constraint RetrievalCourier;


alter table
add constraint RetrievalCourier
foreign key (OrderId)references data(OrderId);
alter table RetrievalCourier
add constraint RetrievalCourier
foreign key (OrderId)references data(OrderId);