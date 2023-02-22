/* created by Bilyalova Aigerim 
24/01/2021
*/

create database first_db --creating database named first_db 
use first_db --showing that from now on we will work with first_db database

--creating new table with the following columns in first_db
create table person(
id int, 
name varchar(64),
surname varchar(64),
birth_date date, 
)
--creating table clients with id as primary key that always has unique value 
create table clients(
id int not null primary key, --and rows in id cannot be empty
name varchar(64) not null,
surname varchar(64) not null,
birth_date date, 
address varchar(128)
)


create table orders(
order_id int not null primary key, --set order as primary key for orders table
order_desc text not null, 
client_id int foreign key references clients(id)--clients_id column takes values from table clients and column id 
)

Create table products(
Prod_id int not null primary key identity (1,1),  --first number = number to take off from and  second number it will increase 
Name varchar(200),
Price float, --prices are fractional values
Order_id int foreign key references orders(order_id) --
)
/*
inserts given data under columns menthod 1
*/
Insert into clients (id, name, surname, birth_date, address)
Values (1, 'Aigerim', 'Auken', '1994.04.30', 'Almaty, Taugul-2 25');

select * from clients --shows data in table clients 

/*
inserts given data with id 2 and 3 under given columns without 
writing each column's name menthod 2
*/
Insert into clients 
Values (2, 'Aigerim', 'Bilyalova', '1999.09.01', 'Almaty'),
(3, 'Kamila', 'Tursynova', '1995.02.12', 'Astana');

Insert into orders --insert values
Values(1, 'Iphone_xs', 2)

select * from orders --insert values
--client with id 2 ordered iphone and this operation was saved in table
--orders under id 1 for order id 

Insert into products 
Values('iphone', 1000.00, 1)\
--order 1 has prodcut iphone 
select *from products 

Alter table clients 
Add phone_number varchar(11);


Select * from clients 
-- added a new column with data type varchar 

Insert into clients 
Values (5, 'Aidana', 'Utemisova', '1990.02.23', 'Germany', '77012935953')
-- inserted new row with data

Alter table clients
Drop column birth_date
 -- got rid of birth date column in clients table 

Update clients 
Set phone_number = '1235678900'
Where id = 1; 

select * from clients

-- updated phone number for id 1 


Update clients
Set address = 'Korea, Seoul, 12', phone_number = '12312423423'
Where id = 2;
 -- updated table clients for id 2 and changed address and phone number

 
Delete from clients 
Where id = 4 
-- deletd user with id 4 deleted the whole row