CREATE PROCEDURE sp_get_activity_by_task
          @taskId int
AS
BEGIN
       SELECT * from Activity where TaskId = @taskId;
END;

select * from Activity