CREATE PROCEDURE sp_get_activity
       @taskId int
AS

BEGIN
     SELECT * FROM Activity where TaskId = @taskId;
END;