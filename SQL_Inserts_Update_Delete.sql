--maintenance-change data within tables
/*key words select (read), insert (add),  update(change), delete(remove)
insert
inserting an entire row
has to have value that go into all columns that can not be null and doesn't have a default value
to see default value right click on date and click modify and if has a default value then it has a default
*/
select * from orders;

select * from customers;

--add an order for kroger
insert into orders --list all columns that giving data for
	(CustomerId, Date, Description)  --if using default value do not put column name in list if n list have to provide value
	values --list the value
	(1,'2020-02-01', 'my first inserted order'); --convert dates with strings year-month-day don't put time will be midnight
--can check by clicking on check next to execute and it will parse
--click execute should get message of how many records affected, if no message did not work

select * from orders where id=(select max(id) from orders);--view inserted order just entered with this function 

select top 2 * from orders	
	order by id desc;   --checks the last two orders inserted not compatable with other sql servers

--insert an orderline
insert into orderlines 
	(ordersid,product, description, quantity, price)
	values
	(27, 'echo', 'Amazon Echo', 3, 99.99);    --could use the max id function so does the last one for sales order)

select * from orderlines;
--another insert into the same order
insert into orderlines 
	(ordersid,product, description, quantity, price)
	values
	(27, 'echo_dot', 'Amazon Echo Dot', 5, 39.99); 

--create your own order and add 2-3 order lines
insert into orders 
	(CustomerId, Date, Description)  
	values --list the value
	(3,'2020-02-01', 'my first Covergys'); 
insert into orderlines
    (ordersid,product, description, quantity, price)
	values
	(28, 'router', 'Router', 1, 11.11); 
insert into orderlines
    (ordersid,product, description, quantity, price)
	values
	(28, 'DVR', 'DVR ', 2, 22.22); 
insert into orderlines
    (ordersid,product, description, quantity, price)
	values
	(28, 'TV', 'TV', 3, 33.33); 
--view my orderlines
select * from orderlines --where ordersid = 28;
--gregs way of doing
insert into customers(name, city, state, sales, active)
values('doud llc', 'loveland', 'oh', 0,1);

insert into orders(customerid, description)
values((select id from Customers
		where name ='doud llc'), 'an order');

insert into orderlines(ordersid, product, quantity, price)
    values(
		(Select id from orders where description = 'an order'), 'dell 5591', 1, 1500);

/*UPDATE to change the date.  can do on multiple records so there is a where clause
very few cases where would not use where clause.  
WARNING--if no where clause could be making big mistake
use where clause on select first and make sure what you want then do update
UPDATE tablename  SET
	columnname = value,
	columnname2 = value2,
	as many as need
WHERE bool-exp;
update employees set
	salary = salary*1.03  would be a 3% raise
*/
--write query to customer display order and lines (join those three tables together) 
select * 
	 from customers c
	 join  orders o
		on c.id = o.CustomerId
	join orderlines ol
		on o.id =ol.OrdersId
	where c.name = 'convergys';
--need to update sales for customer after making the order
--total for order could write a query to get sum total of order
--shows sales of customer
select * from orders o
	join customers c
		on c.id = o.CustomerId
	where o.id = 28;
--calculate value of our order add a column giving total (derived column) 
select *, ol.Quantity*ol.Price
	from OrderLines ol
	where ol.OrdersId = 28;

--add multiple rows by using sum gives total amount of sales for order $155.54
select sum(ol.Quantity*ol.Price)  
	from OrderLines ol
	where ol.OrdersId = 28;

--update the customer
update customers set 
	sales =(select sum(ol.Quantity*ol.Price)  
			from OrderLines ol
			where ol.OrdersId = 28) --to get all sales would have to get more orders and add complexity
	where name = 'convergys';
--gregs way
update customers set 
	sales =(select sum(ol.price * ol.Quantity)  
			from OrderLines ol
			join orders o
				on o.id = ol.OrdersId
			join Customers c
				on c.id=o.CustomerId
				where c.name = 'convergys') --this gets the old sales and adds to the sales just done !!! come back and try
		where name = 'convergys';

--increase the sales of all customers in columbus by 10%
select * from customers where city = 'columbus';
update customers set
	sales = sales *1.1
		where city='columbus';

select * from customers where city = 'columbus';--verify work...do initial query in one window and do here and look back

--price cut on echo from 99.99 to 69.99
update OrderLines set
	price= 69.99
	where product = 'echo';

select * from orderlines where product = 'echo';

--signed deal with best customers who spend most..get discount on everything they order by 10% but has to have over 90000 in sales
--find their orderlines and update the price across the board by 
--what will unique identify the line item== orderline id in update need to pull the orderlines id
update orderlines set
	price = price *.9
	where id in(
		select ol.id
			from customers c
			join  orders o
				on c.id = o.CustomerId
			join orderlines ol
				on o.id =ol.OrdersId
			where c.sales > 90000);	
--give me just price of those sales to use in update*
--need unique orderline items id 
--how to approact it 
--find all customer above 90000
select ol.id, ol.price
	from customers c
	join  orders o
		on c.id = o.CustomerId
	join orderlines ol
		on o.id =ol.OrdersId
	where c.sales > 90000;	
--to show as new price 
select ol.id, ol.price, (ol.price*.9) as 'new price'
	from customers c
	join  orders o
		on c.id = o.CustomerId
	join orderlines ol
		on o.id =ol.OrdersId
	where c.sales > 90000;	



/*after lunch 
talked about demo day
and working */

/*
after break
DELETE is simplist be sure to inclue where or else delete all rows
best to use primary key, ie id because reference only one record (will use subqueries).  becareful doing anyother column
try reading it first

delete from customer
	where bool-exp
*/
--here are all the unique products in table
select /*distinct*/ Description from orderlines
--delete timex where id is in collection of lineitems that have rolex
delete from orderlines
	where id in (select id from orderlines
	where description = 'timex');

select id from orderlines
	where description = 'timex';


--transactions group transactions together so all right to complete if not all true will fail





