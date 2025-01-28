create procedure EditUserDetails
           @userID int,
		   @userName varchar(50),
		   @userEmail varchar(50),
		   @phoneNumber varchar(10)
as

begin   
      update u
	  set 
	  u.userName = @userName,
	  u.userEmail = @userEmail,
	  u.mobileNumber = @phoneNumber
	  from UserDetails u
	  where u.userId = @userID
	  AND NOT EXISTS (
        SELECT 1 
        FROM UserDetails 
        WHERE userEmail = @userEmail 
        AND userId <> @userID
    );
	  
end;