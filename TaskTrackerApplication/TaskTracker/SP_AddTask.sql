CREATE PROCEDURE sp_add_tasks
          @fUserId INT,
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
      INSERT INTO Task (FUserId,
		  ClientName ,
		  ProjectName ,
		  title ,
		  ETA ,
		  TaskDate ,
		  AssignedTo,
		  AssignedBy,
		  SupportType,
		  PriorityType ,
		  DescriptionField) values
		  (
		      @fUserId,
		      @clientName,
			  @projectName,
			  @Title,
			  @ETa,
			  @taskDate ,
			  @assignedTo,
			  @assignedBy ,
			  @supportType ,
			  @priorityType ,
			  @descriptionField
		  )

		  SELECT SCOPE_IDENTITY() AS NewTaskID;

 END;

-- select * from Task;