create function dbo.getUserTransactions(@loggedUserID int)
returns table
as
return (select * from Transactions where userID = @loggedUserID);
