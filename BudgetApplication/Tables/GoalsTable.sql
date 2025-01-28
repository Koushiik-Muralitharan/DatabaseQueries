IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Goals')
Begin
create table Goals(
  userID int foreign key (userID) references UserDetails(usedId),
  GoalID int IDENTITY(101,1) PRIMARY KEY,
  GoalName varchar(50),
  GoalAmount int,
  GoalContribution int
)
End;