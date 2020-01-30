--sales order DB

select * from customers;
select * from orders;
select * from OrderLines

--write a query to list all the customers including sales and sort sales in desc
select * 
	from customers
	order by sales desc;

--want all customers in desc but only in cincy or cleveland
select * 
	from customers 
	where City = 'Cincinnati'or city='cleveland'
	order by sales desc;

-- sort by sales then city
select * 
	from customers 
	where City = 'Cincinnati'or city='cleveland'
	order by sales desc, city;

--another way to write but be careful or adding more cities
select * 
	from customers 
	where City != 'columbus'
	order by sales desc, city;

--Dealing with functions
--know total sales of all in cincy and cleveland won't let you use order by
select sum(sales) as 'total sales for cincy and cleveland'
	from customers 
	where City = 'Cincinnati'or city='cleveland'
--	order by sales desc;

---what is the maximun sales there is a min too  MAIN FUNCTIONS
--count on major.id on student brings back 1
select sum(sales) as 'total sales for cincyd',
		max(sales) as 'highest sales',
		min(sales) as 'lowest sales',
		avg(sales) as 'average sales',
		count(*) as 'number of customers'
	from customers 
	where City = 'Cincinnati'or city='cleveland'


--sum of all of sales for cincy, cleveland, and columbus
select city, sum(sales) as 'total sales for cincyd',
		max(sales) as 'highest sales',
		min(sales) as 'lowest sales',
		avg(sales) as 'average sales',
		count(*) as 'number of customers'
	from customers 
	--where City = 'Cincinnati'or city='cleveland'
	group by city

--sum of all of sales for cincy, cleveland, and columbus only cleveland and columbus sales greater than 50,000
--change number because eliminate customer under 50000
--where clause operates on indivdual records
select city, sum(sales) as 'total sales for cincyd',
		max(sales) as 'highest sales',
		min(sales) as 'lowest sales',
		avg(sales) as 'average sales',
		count(*) as 'number of customers'
	from customers 
	where sales > 50000  --City = 'Cincinnati'or city='cleveland'
	group by city

--see all regions sales > 600000
select city, sum(sales) as 'total sales for cincyd',
		max(sales) as 'highest sales',
		min(sales) as 'lowest sales',
		avg(sales) as 'average sales',
		count(*) as 'number of customers'
	from customers 
	--where sales > 50000  --if put here would include individual
	group by city
	having sum(sales) > 600000;--summarizes group  and looks at the sum 
	--when using group by can not put anything in select but that and has to be an agregate function
