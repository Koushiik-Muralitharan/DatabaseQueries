create function dbo.getUserGoals(@loggedUserID int)
returns table
as
return (select * from Goals where userID = @loggedUserID);