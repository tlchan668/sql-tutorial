/*02/040/20
SQL session
Stored procedures
review of yesterday Gregs soluction calculate total for request*/
select p.name, rl.quantity, p.Price,(rl.quantity * p.Price) as 'line total'--line totatal
	from requests r
	join requestlines rl	
		on rl.requestid = r.id
	join products p
		on p.id=rl.ProductId
	where r.Descritption = '1st request'--check line total is correct amount 
--now lets get grand total using agregate function sum
select sum(rl.quantity * p.Price) as 'request total'--line totatal
	from requests r
	join requestlines rl	
		on rl.requestid = r.id
	join products p
		on p.id=rl.ProductId
	where r.Descritption = '1st request'
--now lets put total in the requests in the table
--update current requests that will update 
update requests set
	requests.total=( 
		select sum(rl.quantity * p.Price) as 'request total'--line totatal
			from requests r
			join requestlines rl	
				on rl.requestid = r.id
			join products p
				on p.id=rl.ProductId
			where r.Descritption = '1st request'
			)
	where Descritption = '1st request';
--GO  use the go when in script
select * from requests

/*STORED PROCEDURES
Under programmability/stored procedures
can give names, parameters,
in DB and stay in DB and execute
purpose:  
using above make parameter for description
*/
DECLARE @RequestId int = 1;
update requests set
	requests.total=( 
		select sum(rl.quantity * p.Price) as 'request total'--line totatal
			from requests r
			join requestlines rl	
				on rl.requestid = r.id
			join products p
				on p.id=rl.ProductId
			where r.id = @RequestId
			)
	where Descritption = @RequestId;

--update all requests how would you do it?
--this query won't do it by itself but if take out where clause would do for 
--create as a procedure and run a query that would run through all the requests?
--not possible with only sql...need to be done by request so inner run and then 
--do for each request
--create once...after that have to alter
--STORED PROCEDURE EXAMPLE--
CREATE Procedure GetAllRequests
AS
BEGIN
	SET NOCOUNT ON
END
--See it under programmbily/stored procedures
--then go click to modify and it will bring up more info
--where doing more of modifying
/*add these line to save it
Go
exec GetAllRequests;
go

then execute it.
can modify it then execute it and saves it

CURSOR
allows you to step through the rows on the table
and do somethine for each row

for each construct takes a collection of things and does to each one

can choose do in c#
read in all rows
call a stored procedure from program

get same result but happens faster in sql
if can do on server do it on there...so can do in c# do in SQL

CURSORS
use it then deallocate it because use alot of resources
given task to update all the requests use cursor stored procedure
so call each request then call stored procedure to get total

need lists of all the requests use a cursor
1.  decalre variable ie
DECLARE cur cursor for 
		select * from Requests; 
