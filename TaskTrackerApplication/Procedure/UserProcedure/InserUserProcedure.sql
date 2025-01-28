create procedure InsertUser
    @userName varchar(50),
	@userEmail varchar(50),
	@mobileNumber Char(10),
	@passcode varchar(15)
as
   BEGIN
	INSERT INTO UserDetails (userName, userEmail, mobileNumber, passcode)
		VALUES (@UserName, @UserEmail, @mobileNumber, @Passcode);
	END;

