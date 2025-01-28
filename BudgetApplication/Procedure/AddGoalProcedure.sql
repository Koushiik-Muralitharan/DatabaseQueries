create procedure AddGoal 
      @userID int,
	  @GoalName varchar(50),
      @GoalAmount int,
      @GoalContribution int

as 
Begin
 insert into Goals (userID,GoalName,GoalAmount,GoalContribution) values
        (@userID, @GoalName,@GoalAmount, @GoalContribution)
End;