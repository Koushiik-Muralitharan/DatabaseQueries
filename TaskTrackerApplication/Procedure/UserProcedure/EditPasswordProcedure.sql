create procedure EditPassword
         @userID int,
		 @oldPassword varchar(50),
		 @newPassword varchar(50)
as 
BEGIN
      IF EXISTS (
        SELECT 1 
        FROM UserDetails 
        WHERE userId = @userID 
        AND passcode = @oldPassword
    )
    BEGIN
       
        UPDATE UserDetails
        SET passcode = @newPassword
        WHERE userId = @userID;
    END
    ELSE
    BEGIN
        PRINT 'Error: The old password does not match the current password.';
    END
END;
