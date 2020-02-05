ALTER Procedure SetRequestStatus
	@RequestId int,
	@IsApproved bit =1
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @status nvarchar(10);
	IF @IsApproved =1
	BEGIN
		Set @status = 'APPROVED';
	END
	IF @IsApproved =0
	BEGIN
		Set @status = 'REJECTED';
	END
	UPDATE Requests Set
		Status=@status
		where id =@RequestID;
END
GO
--two different ways to do the same thing
--do one procedure or do two procedures
Alter Procedure SetRequestApproved
	@RequestId int

AS
BEGIN
	SET NOCOUNT ON;
	--whats id of requested to set to approve
	UPDATE	Requests Set
		status='APPROVED'
		Where id = @RequestId;
END
GO
ALTER Procedure SetRequestRejected
	@RequestId int

AS
BEGIN
	SET NOCOUNT ON;
	--whats id of requested to set to approve
	UPDATE	Requests Set
		status='REJECTED'
		Where id = @RequestId;
END
GO
--show request and user
select * from requests 
exec SetRequestRejected 2
exec SetRequestStatus 3, 1
select * from users
--want to see 
select * from requests r	
	join users u	
		on u.id = r.userid
	order by u.id;

--show request and requestlines
select * from requests r	
	join users u	
		on u.id = r.userid
	join requestlines rl	
		on r.id=rl.requestid
	/*join products p
		p.id =r.productid
	join vendors v
		on v.id = p.vendorid */
	where r.id = 1
	order by u.id
	