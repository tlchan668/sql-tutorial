USE [PRS]
GO
/****** Object:  StoredProcedure [dbo].[GetAllRequests]    Script Date: 2/4/2020 10:08:43 AM ******/
--set through each one go back and fix 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[GetAllRequests]
AS
BEGIN
	SET NOCOUNT ON
	DECLARE cur cursor for 
		select distinct r.Id from Requests r
				join requestlines rl
					on r.id=rl.requestid;--result set by joining table will n
										--not return the null
	DECLARE @id int;
	OPEN cur;

	--to read the data, look at first row
		FETCH NEXT From cur Into @id;--if multiple pieces coming back 
									--then need to list in order listed
		WHILE @@FETCH_STATUS = 0--check status global variable at end of row or read
					--if read a row then 0, do this over and over as long as 0
		BEGIN
			--other statements go here
			PRINT 'Request id is ' + CAST(@id as nvarchar(10));
			EXEC UpdateRequestTotal @id;
			FETCH NEXT From cur Into @id;--read next row
		END
		
	CLOSE cur;
	DEALLOCATE cur;
END
Go
exec GetAllRequests;
go
/*select * from requestlines
select * from requests
select * from products*/