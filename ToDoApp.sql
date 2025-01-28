CREATE DATABASE TODOLISTAPP;

CREATE TABLE ToDoTask (
    Id INT IDENTITY(1,1) PRIMARY KEY,      
    TaskTitle NVARCHAR(255) NOT NULL,      
    TaskStatus NVARCHAR(255)  NOT NULL,                   
    EndDate DATE NOT NULL,                 
    StartAt DATE NOT NULL                  
);

go 

CREATE PROCEDURE SP_AddTask
    @TaskTitle NVARCHAR(255),
    @Status NVARCHAR(225),
    @EndDate DATE,
    @StartAt DATE
AS
BEGIN
    INSERT INTO ToDoTask (TaskTitle, TaskStatus, EndDate, StartAt)
    VALUES (@TaskTitle, @Status, @EndDate, @StartAt);

    SELECT SCOPE_IDENTITY() AS NewTaskId;
END;

go

CREATE PROCEDURE SP_DeleteTask
    @TaskId INT
AS
BEGIN
    DELETE FROM ToDoTask
    WHERE Id = @TaskId;

    SELECT @@ROWCOUNT AS RowsDeleted;
END;
go

CREATE PROCEDURE SP_UpdateTask
    @TaskId INT,
    @TaskTitle NVARCHAR(255),
    @Status NVARCHAR(225),
    @EndDate DATE,
    @StartAt DATE
AS
BEGIN
    
    UPDATE ToDoTask
    SET 
        TaskTitle = @TaskTitle,
        TaskStatus = @Status,
        EndDate = @EndDate,
        StartAt = @StartAt
    WHERE Id = @TaskId;

    SELECT @@ROWCOUNT AS RowsUpdated;
END;

go 

CREATE PROCEDURE SP_DisplayTasks
AS
BEGIN
   
    SELECT * FROM ToDoTask;
END;

go

CREATE PROCEDURE SP_GetSingleTask
  @TaskId INT
AS
BEGIN
   
    SELECT * FROM ToDoTask WHERE Id =@TaskId  ;
END;

Select * from ToDoTask;