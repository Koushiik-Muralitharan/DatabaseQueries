create procedure Budget.InsertUser
    @userName varchar(50),
	@userEmail varchar(50),
	@mobileNumber Char(10),
	@passcode varchar(15),
	@age int
as
   BEGIN
	INSERT INTO UserDetails (userName, userEmail, mobileNumber, passcode, age)
		VALUES (@UserName, @UserEmail, @mobileNumber, @Passcode, @age);
	END;

