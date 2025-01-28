CREATE PROCEDURE sp_get_updated_user_info
             @userId int
as

BEGIN
IF @userID IS NOT NULL
    BEGIN
        SELECT *
        FROM UserDetails
        WHERE userId = @UserID;
        
        SELECT *
        FROM Transactions
        WHERE userID = @UserID;
        
        SELECT *
        FROM Goals
        WHERE userID = @UserID;

		SELECT Balance
		FROM UserBalanceInfo
		WHERE userID = @UserID;

		SELECT Expense
		FROM UserBalanceInfo
		WHERE userID = @UserID;

		SELECT Savings
		FROM UserBalanceInfo
		WHERE userID = @UserID;

		SELECT Income
		FROM UserBalanceInfo
		WHERE userID = @UserID;
    END
    ELSE
    BEGIN
		SET XACT_ABORT ON
		RAISERROR('Cannot get this user information.',16,1);
    END
END;