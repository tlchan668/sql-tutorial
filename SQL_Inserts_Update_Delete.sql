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

insert into orderlines(orderid, product, quantity, price)
    values(
		(Select id from orders where description = 'an order'), 'dell 5591', 1, 1500);



