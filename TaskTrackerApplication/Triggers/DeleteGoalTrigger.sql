create Trigger DeleteGoalTrigger
on Goals
after delete
as

 
	   begin
	       update ubi
		   set ubi.Savings = ubi.Savings - d.GoalContribution
		   from UserBalanceInfo ubi 
		   join deleted d ON ubi.UserID = d.userID; 
	   end;
       
	   begin
	       update ubi 
		   set  ubi.Balance = ubi.Income - ubi.Expense- ubi.Savings
		   from UserBalanceInfo ubi
	   end;

        