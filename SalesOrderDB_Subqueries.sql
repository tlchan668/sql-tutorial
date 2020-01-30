--what the average sales for all customers
select avg(sales)
	from customers;

select * from customers
--want a list of customers with sales greater than that 56951 (average) 
select *
	from customers
	where sales > 56951;


select *
	from customers
	where sales > 97036;

select *
	from customers
	where sales > 59536;

--want to know sales greater than the average using a subquery
--subqurey is one select statement used by another query
--gregs favorite!!!!
--can do even more subqueries from it


 select *from customers
	where sales > (	select avg(sales)from customers);

--all customers where highest sales in cleveland that are greater than that 
select * from Customers 
	where sales > (
       select max(sales) from customers
			where city = 'cleveland');

--another clause having to do with where and subqueries
--display list of customers that have bank in their names
select * from customers
	where id=8 or id=11 or id=12;
--another way 
select * from customers
	where id in (8,11,12);

--another way to do this using function charindex
--SELECT CHARINDEX('t', 'Customer') AS MatchPosition; charindex(substring, column)
select * from customers
	where charindex('bank', name)>0;

--query to have lots of options
--more efficient
select * from customers
	where id in (8,11,12);

--use subquery for this 
select * from customers
	where id in (select id from customers
		where charindex('bank', name)>0);


--want any names with cardinal or eagle
select * from customers
	where id in (select id from customers
		where charindex('bank', name)>0)or CHARINDEX('eagle',name)>0 or CHARINDEX('cardinal',name)>0;


--joins and cross joins and unions
--never used in his profession career

--PARAMATERIZED QUERIES
--Takes parameters instead of hard coding
select * from customers;

--see all sales between n numbers
--a, b, c analysis lines 
--write a query that can change the analysis lines (a top 30% with b 40-70% and bottom 40% or certain ranges
--show customers in a city(cincy) in a range of sales(
select * from customers
	where sales between 40000 and 70000 
	and city = 'cincinnati';

--change using parameters
DECLARE @city varchar(25) = 'cincinnati'; 
DECLARE @lowsales decimal(8,2);
DECLARE @highsales decimal(8,2);

--pass data in would do
set @lowsales = 40000;
set @highsales = 70000;

select * from customers
	where sales between @lowsales and @highsales
	and city = @city;


--so columbus says 35000 and 80000
DECLARE @city varchar(25) = 'columbus'; 
DECLARE @lowsales decimal(8,2) =35000;
DECLARE @highsales decimal(8,2) =80000;

--pass data in would do
/*set @lowsales = 40000;
set @highsales = 70000;*/

select * from customers
	where sales between @lowsales and @highsales
	and city = @city;

--cleveland wants 30000 to 85000
DECLARE @city varchar(25) = 'cleveland'; 
DECLARE @lowsales decimal(8,2) =30000;
DECLARE @highsales decimal(8,2) =85000;

--pass data in would do
/*set @lowsales = 40000;
set @highsales = 70000;*/

select * from customers
	where sales between @lowsales and @highsales
	and city = @city;
--store in database and save it is called procedures
--STORED PROCEDURES---stored and executed by knowing name
--
alter procedure SalesRangeByCity 
--parameters want to pass into it, listed are the default values if none given
	@city varchar(25) = 'cleveland',
	@lowsales decimal(8,2) =30000,
	@highsales decimal(8,2) =85000
as
BEGIN
--PROCEDURE BODY
	select * from customers
		where sales between @lowsales and @highsales
			and city = @city;
end


