CREATE PROCEDURE sp_delete_task
        @taskID int
AS

BEGIN
    DELETE FROM Task where TaskID = @taskID;
END;