use master;
Go
--create database 
drop database if exists TestCap;
go
create database TestCap;
GO
use TestCap;
GO
--create table user 
create table Users (
	Id int not null primary key identity (1,1),
	Username nvarchar(30) not null unique,--unique makes so unique 
	Password nvarchar(30) not null,
	Firstname  nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Phone nvarchar(12),
	Email nvarchar(255),
	IsAdmin bit not null default 0,
	IsReviewer bit not null default 0,
);
GO
--create table users
insert into Users 
	(Username, Password, Firstname, Lastname, phone, email, IsAdmin, IsReviewer)
	values
	('username1', 'password', 'Luke', 'Skywalker','859.111.1111' ,'iamluke',1,1),
	('username2', 'password', 'Hon', 'Solo','859.222.2222' ,'noodds',1,0),
	('username3', 'password', 'Leia', 'Organo','859.333.3333' ,'',0,0)
/*gregs way to check defaults
insert into Users 
	(Username, Password, Firstname, Lastname, phone, email, IsAdmin, IsReviewer)
	values
	('username1', 'password', 'Luke', 'Skywalker','859.111.1111' ,'iamluke',1,1),
	('username2', 'password', 'Hon', 'Solo','859.222.2222' ,'noodds','',0),
	('username3', 'password', 'Leia', 'Organo','859.333.3333' ,'','','')
*/
GO
--create table Vendors
create table Vendors (
	Id int not null primary key identity (1,1),
	Code nvarchar(30) not null unique,
	Name nvarchar(30) not null,
	Address nvarchar(30) not null,
	City nvarchar(30) not null,
	State nvarchar(2)not null,
	Zip nvarchar(5) not null,
	Phone nvarchar(12),
	Email nvarchar(100),
);
GO
--create table Vendors
insert into Vendors
	(Code, Name, Address, city, state, zip, phone, email)
	values
	('AMZ', 'Amazon', '100 World Way', 'Seattle','WA' ,'95334','100.100.1000','amazon'),
	('BBY', 'Best Buy', '100 Best Way', 'Cincinnati','OH' ,'45107','100.100.1001','bestbuy'),
	('TAR', 'Target', '100 Target Way', 'Seattle','WA' ,'95334','100.100.1111','target'),
	('WMT', 'Walmart', '100 Best Way', 'Cincinnati','OH' ,'45107','100.100.2222','walmart')
GO
/*select * from vendors;
select * from users;
update vendors set
	code = 'AMZ'
	where code =100;

update vendors set
	code = 'BBY'
	where name  ='best buy';
*/
--create products table
--unit pencils would be a box of 10
--photopath if want an image of the product in capstone
--foreignkey is vendor id

--create table Products
create table Products (
	Id int primary key identity (1,1),
	PartNbr nvarchar(30) unique,
	Name nvarchar(30) not null,
	Price decimal (11,2) not null,
	Unit nvarchar(30) not null,
	PhotoPath nvarchar(255) null,
	VendorId int not null foreign key references Vendors(id)

);
GO
--create table Products
insert into Products
	(PartNbr, Name, price,unit,Photopath,vendorId)
	values
	--('ECHO','Amazon Echo',2.00, 'Each','photo',(Select id from vendors where code ='Amaz')),
	('Paper','Papers', 5.00, '2','photo',1),
	('DELL','Computer', 1000.00, 'Each','photo',2),
	('HP','Ink', 22, '1','photo',2)
GO
--select * from vendors
--select * from Products
--to get the vedor id use a subselect to returns the id from vender 

--create requests
create table Requests (
	Id int primary key identity (1,1),
	Descritption nvarchar(80) not null,
	Justification nvarchar(80) not null,
	RejectReason nvarchar(80) null,
	DeliveryMode nvarchar(20) not null default 'Pickup',
	status nvarchar(10)not null default 'NEW',
	total decimal(11,2) not null default 0,
	UserId int not null foreign key references Users(Id)
);
GO
--create table request

insert into Requests
	(Descritption, Justification, UserId)
	values
	('1st request', 'none', 3),
	('2nd request', 'none', 3),
	('3rd request', 'none', 3),
	('1st request88', 'none', 2);
--select * from requests
--select * from Products
--create RequestLine
create table RequestLines (
	Id int primary key identity (1,1),
	RequestId int not null foreign key references Requests(Id),
	ProductId int not null foreign key references Products(Id),
	Quantity int not null default 1
);

GO
--create table Products
insert into RequestLines
	(RequestId, ProductId, Quantity)
	values
	(1,2,1),--dell computer,
	(1,1,1),--paper 
	(1,3,2),--2 papers
	(2,1,2)
GO	