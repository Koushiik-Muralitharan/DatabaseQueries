CREATE PROCEDURE sp_get_task_by_taskId
        @taskId int
AS
BEGIN
  SELECT * FROM Task WHERE TaskID = @taskId;
END;

select * from Task;