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


