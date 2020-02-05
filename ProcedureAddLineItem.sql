ALTER Procedure AddLineItem
--allows you to enter 3 params to give desc, prtnumber, and quantity (if no value then 1)
@RequestDescritption nvarchar(30), 
@ProductPartNbr nvarchar(30),
@Quantity int =1
AS
BEGIN
	SET NOCOUNT ON;
	--Decalre a request id and product id
	DECLARE @RequestId int, @ProductId int;
	--get request id
	select @requestId=id from requests where Descritption = @RequestDescritption
	select @ProductId=id from Products where Partnbr=@ProductPartNbr;

	insert into RequestLines (RequestId, ProductId, Quantity)
			values (@RequestId, @ProductId, @Quantity);
END 
GO
EXEC AddLineItem @RequestDescritption='1st request',@ProductPartNbr='Paper';
GO

select * from requestlines
select * from requests	