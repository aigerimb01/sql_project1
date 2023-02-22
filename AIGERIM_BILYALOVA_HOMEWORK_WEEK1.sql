create database HOMEWORK1
use HOMEWORK1

create table Employee (
id int not null primary key identity(1,1), 
first_name varchar(64),
last_name varchar(128), 
position varchar(128),
birth_date date, 
salary varchar(128)
);
alter table Employee 
alter column salary float;


create table Product(
maker varchar, 
model int  not null primary key, 
product_type varchar
);

Alter table Product
alter column maker varchar(64)

alter table Product 
alter column product_type varchar(64)

create table Computers (
id int not null primary key, 
computer_model int foreign key references product(model), 
speed varchar, 
ram varchar, 
hd varchar, 
cd varchar, 
price float
);

create table Laptops (
id int not null primary key, 
model int foreign key references product(model),
speed varchar, --как лучше обозначить этот тип данных для мегагерц?
ram varchar,
hd varchar,
price float
);
alter table Laptops 
alter column speed int

alter table Laptops
alter column hd int

create table Phones(
id int not null primary key, 
model int foreign key references product(model),
ram varchar, 
price float
);


insert into Product 
values ('Samsung', '0001', 'Computer'), 
('Samsung', '0002', 'Laptop'),
('Apple', '31213', 'Phone')

update Product
set model = 1 
where product_type = 'Computer';

update Product
set model = 2 
where product_type = 'laptop';

update Product
set model = 3 
where product_type = 'phone';


select * from Product

insert into Computers (id, computer_model, speed, ram, hd, cd, price)
values (1, 1, 123, 123, 123, 4, 12341.4),
/*(5, 5, 123, 123, 123, 4, 12341.4), 
(7, 7, 123, 123, 123, 4, 12341.4)
*/
-- у меня есть только один форэйн ки из зва этого я не могу добавить
-- еще две линии 
-- что мне нужно здесь поменять тогда если мы можем иметь в таблице 
-- продукт только три линии из каждой таблицы про комп ноут и телефон?

