CREATE PROCEDURE sp_get_task_by_date
       @TaskDate date,
	   @userId int
AS
BEGIN
    SELECT 
	FUserId,
	TaskID,
	ClientName,
    ProjectName,
	title,
	ETA,
	TaskDate,
	AssignedTo,
	AssignedBy,
	SupportType,
	PriorityType,
	DescriptionField
	
	FROM TASK WHERE TaskDate = @TaskDate AND FUserId = @userId ;

END;