select * from requests;
select * from products;
select * from requestlines;
--what purchased
select * from products p
	join requestlines rl
	on rl.productid=p.id;
--find total sale of everything in requestlines
select sum(
		p.price*rl.quantity) as 'total price'
	from products p
	join requestlines rl
	on rl.productid=p.id
	join requests r
	on rl.requestid=r.id


--return just requests from 2
select sum(
		p.price*rl.quantity) as 'total price'
	from products p
	join requestlines rl
	on rl.productid=p.id
	join requests r
	on rl.requestid=r.id
	where r.id = 2;

select sum(
		p.price*rl.quantity) as 'total price'
	from products p
	join requestlines rl
	on rl.productid=p.id
	join requests r
	on rl.requestid=r.id
	where r.id = 1;

select r.total from requests r 
	where r.id=1

update requests  set 
	requests.total =(select sum(
		p.price*rl.quantity) 
		from products p
		join requestlines rl
		on rl.productid=p.id
		join requests r
		on rl.requestid=r.id
		where r.id = 1)
	where requests.id =1;
--above code inserts it into the database...everything is hard coded
--next try to come up with paramenters to do it

	