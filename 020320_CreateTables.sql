--query that lists all classes for required major
--task 1
select * from major m
	join majorclassrel mc
		on m.id=mc.majorid
	join class c
		on c.id=mc.classid
	where m.description = 'accounting';
		
--task2
--list all classes in instructor and class
select * from Instructor i
	join class c
		on c.InstructorId = i.id
--if do an aggregrate need a group by have to use a count for aggregate
select i.lastname, count(*) as 'classes'/* takes in all the columns, 
--count sum, min max average are aggregrate
--have to have a group by and can only list by those used in group by*/
from Instructor i
	join class c
		on c.InstructorId = i.id
		group by i.lastname
		order by classes

select i.Lastname, count(*) as classes
	from Instructor i
	join class c
		on	c.InstructorId=i.id
	group by i.Lastname
	order by classes;

--task 3 what majors are available for student with sat
--get biggs sat score 950 want the s.sat value
select * from student s
	where s.Lastname = 'biggs'
--get majors with score of 950 or less
select description, m.MinSAT 
	from major m
	where m.MinSAT <=950;
--pull together
select description, m.MinSAT 
	from major m
	where m.minsat <=
	(select s.sat
		from student s
		where s.Lastname = 'biggs')
	order by m.minsat;		

/*02/03/20
using master DB
CREATE TABLES
when create tables always be pointing to master DB
1.  create a db i.e. bootcamp
*/
create database Bootcamp;
-- execute and see "commands compledted" and time
--have to refresh to see it 
--no other attributes in it
--change our dropdown list to point to bootcamp can do be scripting or grab it from pull down
--to do in scripting
use Bootcamp;
--create our first table 
--tables are defining objects like students majors assignments classes 
--make names of your tables plural because prolly have more than one and see and capitalize it
--create a table called students
--need to define columns 
--conventinal to create DB table with primary keys 
--(if don't greg will hunt you down!!!)
--convention that columns with primary key come first in list
--let system generate your primary key that are int and don't have to worry about it
-- column name, type, (only required but if key need more info) allowed to be null 
--but if dont want to be null say not null)and key identity (every value has to be unique
--and sql will generate it has to have two numbers, where start and after that how to increment
--commas sepeate column definition
--boolean is bit
--you can give default values by default (value)
--datetime is common way one field has date and time (hour:min:sec:millisec)
create table Students (
	Id int not null primary key identity (1,1),--if dont put identity you will have to provide
	Firstname  nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Active bit not null default 1,
	Birthday datetime not null, 
	Loan decimal(8,2)
);
--click execute and now you have created table students
--insert some columns into students
insert into students
	(Firstname, Lastname, active, Birthday)
	values
	('Traci', 'Chan', 1, 02/10/73);
select * from students
	order by lastname,Firstname;
insert into students
	(Firstname, Lastname, active, Birthday, Loan)
	values
	('Dan','Rather', 0, '1965-6-15',0);
insert into students
	(Firstname, Lastname, active, Birthday, Loan)
	values
	('Stan','Lee', 1, '1965-6-15',888);	
insert into students
	(Firstname, Lastname, active, Birthday, Loan)
	values
	('Luke','Skywalker', 1, '1973-02-10',0),
	('Leia','Skywalker', 0, '1973-02-10',0);
--create another table
--max identifies with which bootcamp
create table Technology (
	Id int not null primary key identity (100,100),
	Name nvarchar(50) not null,
	PrimaryInstructor nvarchar(30) not null,
	);

insert into Technology(Name, PrimaryInstructor)
	values
	('DotNet', 'Greg'),
	('Java', 'Sean');
select * from Technology
--how to update from dotnet to .net???
update technology set
	name = '.Net'
	where id =100;
--create another table called cohort
--create foreign key that comes from technology.id
create table Cohort(
	Id int not null primary key identity (1,1),
	Starts datetime null,
	Capacity int not null default 0,
	Enrolled int not null default 0,
	TechnologyId int null foreign key references Technology(id)
			--has to be same time as primary key from technology
			--where is the primary key table and what column(s) is key 	
			--have to create primary table before the foreign keys 
			--(create all tables without foreign keys, then the foreign key tables.

);
select * from cohort
/*AFTER LUNCH
modifying an existing column in a table.  
want to have value of 0
make changes to column in table need to alter table
have to fix data before can alter...since have null in load
have to change that */
select * from students 
	where loan is null;
update Students set
	loan = 0
	where loan is null;
alter table students 
	alter  column loan  decimal(8,2) not null;
--default value is a constraint and would take another
--step to add here how to make default 0
alter table students
	add constraint  df_loan default 0 for loan;

--add acolumn to an existing table
--create a node field to keep misc info about cohort
alter table cohort
	add note nvarchar(80) not null;
	
select * from cohort
--create a script to add and change and delete and modify
--command in ssms call GO...that locks in everything before that go command


--drop a column deletes column and if there was any data
--unless it is a key
alter table cohort
	drop note;

--
--lets give it a try
--outline tables for capstone 
