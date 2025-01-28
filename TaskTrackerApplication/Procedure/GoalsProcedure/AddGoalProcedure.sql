create procedure sp_add_goal 
      @userID int,
	  @GoalName varchar(50),
      @GoalAmount decimal(30,2),
      @GoalContribution decimal(30,2)

as 
Begin
 insert into Goals (userID,GoalName,GoalAmount,GoalContribution) values
        (@userID, @GoalName,@GoalAmount, @GoalContribution)
End;