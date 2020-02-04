--create procedure to update request line total
CREATE Procedure UpdateRequestTotal
	@RequestId int 
AS
BEGIN
	SET NOCOUNT ON
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
		where id= @RequestId;
END
GO
select * from Requests