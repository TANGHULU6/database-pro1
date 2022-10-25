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
alter table pro1.public.data_pro
owner to postgres;
--data_pro在ide里导入

--or import directly
 --table data as table data



create table pro1.public.Item(
      id serial not null
constraint Item_pkey
primary key,
"Item Name" varchar(600) not null ,
"Item Type" varchar(600) not null ,
"Item Price" integer not null
);

create table pro1.public.RetrievalCourier
(
    id serial not null
constraint RetrievalCourier_pkey
primary key ,
"Retrieval Courier"  varchar(600) not null ,
"Retrieval Courier Gender"  varchar(600) not null ,
"Retrieval Courier Phone Number"  varchar(600) not null ,
"Retrieval Courier Age" integer not null
);
create table pro1.public.Retrieval
(
    id serial not null
constraint Retrieval_pkey
primary key,
    "Retrieval City"  varchar(600) not null ,
"Retrieval Start Time" time not null ,
"RetrievalCourier id" integer not null
constraint RetrievalCourierid_fkey
references pro1.public.RetrievalCourier
);
create table pro1.public.Export
(
id serial not null
constraint Export_pkey
primary key ,
"Item Export City"  varchar(600) not null ,
"Item Export Tax" decimal not null ,
"Item Export Time" time not null
);

create table pro1.public.ship
(
id serial not null
constraint ship_pkey
primary key ,
"Ship Name" varchar(600) not null
);
create table pro1.public.Container
(
id serial not null
constraint Container_pkey
primary key ,
"Container Code"  varchar(600) not null ,
"Container Type" varchar(600) not null
);
create table pro1.public.PackingandShipping
(
id serial not null
constraint PackingandShipping_pkey
primary key ,
"Ship id" integer not null
constraint shipid_fkey
references pro1.public.ship,
"Container id" integer not null
constraint Containerid_fkey
references pro1.public.Container
);
create table pro1.public.Import
(
id serial not null
constraint Import_pkey
primary key ,
"Item Import City" varchar(600) not null ,
"Item Import Tax"decimal not null ,
"Item Import Time"time not null
);

create table pro1.public.DeliveryCourier
(
id serial not null
constraint DeliveryCourier_pkey
primary key ,
"Delivery Courier"  varchar(600) not null ,
"Delivery Courier Gender" varchar(600) not null ,
"Delivery Courier Phone Number"  varchar(600) not null ,
"Delivery Courier Age"int2 not null
);
create table pro1.public.Delivery
(
id serial not null
constraint Delivery_pkey
primary key ,
"Delivery Finished Time" time not null ,
"Delivery City" varchar(600) not null ,
"DeliveryCourier id" integer not null
constraint DeliveryCourierid_fkey
references pro1.public.DeliveryCourier
);
create table pro1.public.company
(
id serial not null
constraint company_pkey
primary key,
"Company Name"  varchar(600) not null
);

create table pro1.public.process
(
  id serial not null
constraint process_pkey
primary key ,
"retrieval id" integer not null
constraint Retrievalid_fkey
references pro1.public.Retrieval,
"export id" integer not null
constraint Exportid_fkey
references pro1.public.Export,
"packing or shipping id"integer not null
constraint PackingandShippingid_fkey
references pro1.public.PackingandShipping,
"import id"integer not null
constraint Importid_fkey
references pro1.public.Import,
"delivery id"integer not null
constraint Deliveryid_fkey
references pro1.public.Delivery
);
create table pro1.public.main_order
(
OrderId serial not null
constraint main_order_pkey
primary key ,
"item id" integer not null unique
constraint Itemid_fkey
references pro1.public.Item,
"company id" integer not null
constraint companyid_fkey
references pro1.public.company,
"process id" integer not null unique
constraint processid_fkey
references pro1.public.process
);
create table pro1.public.logtime
(
id serial not null
constraint main_orderid_fkey
references pro1.public.main_order ,
"Log Time"time not null
);