CREATE PROCEDURE sp_get_logged_user
          @userName varchar(50),
		  @password varchar(50)
AS

BEGIN
       IF EXISTS (SELECT 1 FROM UserDetails where UserName = @userName AND passcode = @password)
	   BEGIN
	           SELECT * FROM UserDetails where UserName = @userName AND passcode = @password;
	   END;
	   ELSE
	   BEGIN
	          SET XACT_ABORT ON
	          RAISERROR('There is no user present or Invalid userName or password.',16,1);
	   END;
END;


select * from UserDetails;