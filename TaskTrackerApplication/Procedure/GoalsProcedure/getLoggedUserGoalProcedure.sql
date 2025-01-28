CREATE PROCEDURE getLoggedUserGoals
           @loggedUserID int
AS

BEGIN
     select * from Goals where userID = @loggedUserID
END;