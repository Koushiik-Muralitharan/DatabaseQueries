CREATE PROCEDURE dbo.GetLoggedUserTransactions
    @loggedUserID int
AS
BEGIN
    SELECT * 
    FROM Transactions 
    WHERE userID = @loggedUserID;
END;
