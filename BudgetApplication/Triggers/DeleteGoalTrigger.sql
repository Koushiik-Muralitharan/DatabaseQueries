create Trigger DeleteGoalTrigger
on Goals
after delete
as

 
	   begin
	       update ubi
		   set ubi.GoalsSum = ubi.GoalsSum - d.GoalContribution
		   from UserBalanceInfo ubi 
		   join deleted d ON ubi.UserID = d.userID; 
	   end;
       
	   begin
	       update ubi 
		   set  ubi.Balance = ubi.Income - ubi.TransactionSum - ubi.GoalsSum
		   from UserBalanceInfo ubi
	   end;

        