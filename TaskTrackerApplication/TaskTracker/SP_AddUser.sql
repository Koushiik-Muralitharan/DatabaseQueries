CREATE PROCEDURE sp_add_user
            @userName varchar(50),
			@password varchar(50)
AS
BEGIN

 IF NOT EXISTS (SELECT 1 FROM UserDetails WHERE UserName = @userName )
 BEGIN
     INSERT INTO UserDetails (UserName, passcode) values (@userName,@password);
 END;
 ELSE
 BEGIN
     SET XACT_ABORT ON
	 RAISERROR('Already an user with this userName is existing.',16,1);
 END;
END;