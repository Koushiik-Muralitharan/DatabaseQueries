CREATE PROCEDURE sp_edit_task
          @taskID int,
		  @clientName varchar(50),
		  @projectName varchar(50),
		  @Title varchar(50),
		  @ETa decimal(2,1),
		  @taskDate date,
		  @assignedTo varchar(50),
		  @assignedBy varchar(50),
		  @supportType varchar(50),
		  @priorityType varchar(50),
		  @descriptionField varchar(50)
AS
 BEGIN
      Update Task 
	  SET
		  ClientName =  @clientName,
		  ProjectName = @projectName ,
		  title = @Title ,
		  ETA =  @ETa,
		  TaskDate = @taskDate ,
		  AssignedTo = @assignedTo,
		  AssignedBy = @assignedBy,
		  SupportType = @supportType ,
		  PriorityType =@priorityType ,
		  DescriptionField = @descriptionField
	 WHERE
	      TaskID = @taskID;

 END;