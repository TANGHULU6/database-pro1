create table pro1.public.data_pro(
"Item Name" varchar(600),
"Item Type" varchar(600),
"Item Price" integer,
"Retrieval City"  varchar(600),
"Retrieval Start Time" time,
"Retrieval Courier"  varchar(600),
"Retrieval Courier Gender"  varchar(600),
"Retrieval Courier Phone Number"  varchar(600),
"Retrieval Courier Age" integer,
"Delivery Finished Time" time,
"Delivery City" varchar(600),
"Delivery Courier"  varchar(600),
"Delivery Courier Gender" varchar(600),
"Delivery Courier Phone Number"  varchar(600),
"Delivery Courier Age"int2,
"Item Export City"  varchar(600),
"Item Export Tax" decimal,
"Item Export Time" time,
"Item Import City" varchar(600),
"Item Import Tax"decimal,
"Item Import Time"time,
"Container Code"  varchar(600),
"Container Type" varchar(600),
"Ship Name" varchar(600),
"Company Name"  varchar(600),
"Log Time"time
);
--data_pro在ide里导入
alter table pro1.public.data_pro
owner to localhost;
create table pro1.public.main_order
(
OrderId serial not null
constraint main_order_pkey
primary key ,
"item id" integer,
"company id" integer,
"process id" integer
);
create table pro1.public.process
(
  id serial not null
constraint process_pkey
primary key ,
"retrieval id" integer,
"export id"integer,
"packing or shipping id"integer,
"import id"integer,
"delivery id"integer
);
create table pro1.public.Item(
      id serial not null
constraint Item_pkey
primary key,
"Item Name" varchar(600),
"Item Type" varchar(600),
"Item Price" integer
);
create table pro1.public.Retrieval
(
    id serial not null
constraint Retrieval_pkey
primary key,
    "Retrieval City"  varchar(600),
"Retrieval Start Time" time,
"RetrievalCourier id" integer
);
create table pro1.public.RetrievalCourier
(
    id serial not null
constraint RetrievalCourier_pkey
primary key ,
"Retrieval Courier"  varchar(600),
"Retrieval Courier Gender"  varchar(600),
"Retrieval Courier Phone Number"  varchar(600),
"Retrieval Courier Age" integer
);
create table pro1.public.Export
(
id serial not null
constraint Export_pkey
primary key ,
"Item Export City"  varchar(600),
"Item Export Tax" decimal,
"Item Export Time" time
);
create table pro1.public.PackingandShipping
(
id serial not null
constraint PackingandShipping_pkey
primary key ,
"Ship id" integer,
"Container id" integer
);
create table pro1.public.ship
(
id serial not null
constraint ship_pkey
primary key ,
"Ship Name" varchar(600)
);
create table pro1.public.Container
(
id serial not null
constraint Container_pkey
primary key ,
"Container Code"  varchar(600),
"Container Type" varchar(600)
);
create table pro1.public.Import
(
id serial not null
constraint Import_pkey
primary key ,
"Item Import City" varchar(600),
"Item Import Tax"decimal,
"Item Import Time"time
);
create table pro1.public.Delivery
(
id serial not null
constraint Delivery_pkey
primary key ,
"Delivery Finished Time" time,
"Delivery City" varchar(600),
"DeliveryCourier id" integer
);
create table pro1.public.DeliveryCourier
(
id serial not null
constraint DeliveryCourier_pkey
primary key ,
"Delivery Courier"  varchar(600),
"Delivery Courier Gender" varchar(600),
"Delivery Courier Phone Number"  varchar(600),
"Delivery Courier Age"int2
);
create table pro1.public.company
(
id serial not null
constraint company_pkey
primary key,
"Company Name"  varchar(600)
);
create table pro1.public.logtime
(
id serial not null
constraint logtime_pkey
primary key ,
"Log Time"time
);
