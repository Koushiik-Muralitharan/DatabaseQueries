CREATE TABLE  Activity
(
   TaskId int,
   ActivityId int IDENTITY(201,1) PRIMARY KEY,
   Title varchar(50),
   DescriptionField varchar(50),
   ActivityHours decimal(2,1),
   CONSTRAINT Fk2_key FOREIGN KEY (TaskId) 
   REFERENCES Task(TaskID) ON DELETE CASCADE 
)