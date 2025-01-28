IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Goals')
Begin
create table Goals(
  userID int,
  GoalID int IDENTITY(101,1) PRIMARY KEY,
  GoalName varchar(50),
  GoalAmount decimal(30,2),
  GoalContribution decimal(30,2)

  CONSTRAINT FK_KeyUserID FOREIGN KEY (userID) 
  REFERENCES UserDetails(userID) 
  ON DELETE CASCADE
)
End;

