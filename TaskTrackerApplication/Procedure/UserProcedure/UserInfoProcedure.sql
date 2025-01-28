create procedure sp_get_user_details
       @userEmail varchar(50),
	   @password varchar(50)
as

-- begin

    --DECLARE @UserID INT;
    --SELECT @UserID = userId
  --  FROM UserDetails
--    WHERE userEmail = @userEmail AND passcode = @password;

     --select * from UserDetails where userEmail= @userEmail;

	-- select * from Transactions join UserDetails on Transactions.userID = UserDetails.userId
--	 where UserDetails.userEmail = @userEmail; 

	 --select * from Goals join UserDetails on Goals.userID = UserDetails.userId
	-- where UserDetails.userEmail = @userEmail;
--end;

BEGIN
    
    DECLARE @UserID INT;

    SELECT @UserID = userId
    FROM UserDetails
    WHERE userEmail = @userEmail AND passcode = @password; 

   
    IF @UserID IS NOT NULL
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
        -- If no user is found, return an appropriate message
		SET XACT_ABORT ON
		RAISERROR('User not found or incorrect credentials',16,1);
    END
END;

-- select * from Goals join UserDetails on Goals.userID = UserDetails.userId
	-- where UserDetails.userEmail = 'priya@gmail.com';

-- select * from Transactions join UserDetails on Transactions.userID = UserDetails.userId
	-- where UserDetails.userEmail = 'priya@gmail.com';