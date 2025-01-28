CREATE TABLE Task 
(
  FUserId INT,
  TaskID int IDENTITY(101,1) PRIMARY KEY,
  ClientName varchar(50),
  ProjectName varchar(50),
  title varchar(50),
  ETA decimal(2,1),
  TaskDate date,
  AssignedTo varchar(50),
  AssignedBy varchar(50),
  SupportType varchar(50),
  PriorityType varchar(50),
  DescriptionField varchar(50),
  CONSTRAINT Fk_key FOREIGN KEY (FUserId) 
  REFERENCES UserDetails(UserId) ON DELETE CASCADE
 )
 select * from Task;
 select * from Activity;