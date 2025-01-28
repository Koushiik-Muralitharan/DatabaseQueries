CREATE PROCEDURE dbo.GetLoggedUserExpenses
@loggedUserID int
AS
BEGIN
     SELECT * 
	 FROM Transactions WHERE userID = @loggedUserID and transactionType = 'Expense';
END;