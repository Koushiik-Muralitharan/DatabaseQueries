create function dbo.GetExpenses(@loggedUserId int)
returns table

as

return (select * from Transactions where userID = @loggedUserId and transactionType = 'Expense');