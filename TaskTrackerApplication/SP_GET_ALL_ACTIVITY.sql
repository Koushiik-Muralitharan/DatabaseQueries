CREATE PROCEDURE get_activities_by_usrId
    @UserId INT
AS
BEGIN
    SELECT 
        COUNT(*)
    FROM Activity a
    INNER JOIN Task t ON a.TaskId = t.TaskID
    INNER JOIN UserDetails u ON t.FUserId = u.UserId
    WHERE u.UserId = @UserId

	SELECT 
        SUM(a.ActivityHours) AS TotalActivityHours
    FROM Activity a
    INNER JOIN Task t ON a.TaskId = t.TaskID
    INNER JOIN UserDetails u ON t.FUserId = u.UserId
    WHERE u.UserId = @UserId;
END

EXEC GetActivitiesByUserId @UserId = 2003;
EXEC get_activities_by_user @UserId = 2003;
EXEC get_activities_by_uId @UserId = 2003;