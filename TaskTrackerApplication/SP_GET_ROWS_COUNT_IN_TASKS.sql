CREATE PROCEDURE sp_get_total_tasks
         @userId int
AS

BEGIN
     SELECT COUNT(*) FROM Task WHERE FUserId = @userId; 
END;

SELECT * FROM Task;