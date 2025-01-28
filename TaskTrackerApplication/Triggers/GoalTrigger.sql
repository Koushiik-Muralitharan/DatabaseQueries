create trigger AddGoalTrigger
  on Goals
  after insert

  as
  Begin
	 begin
	    UPDATE ubi
		SET ubi.Savings = ubi.Savings+ inserted.GoalContribution
		FROM UserBalanceInfo ubi
		JOIN inserted ON ubi.UserID = inserted.userID
		WHERE ubi.UserID = inserted.userID
	 end;

	 begin
	   UPDATE ubi
		SET ubi.Balance = ubi.Income - ubi.Savings - ubi.Expense
		FROM UserBalanceInfo ubi
		JOIN inserted ON ubi.UserID = inserted.userID
		WHERE ubi.UserID = inserted.userID
	 end;

  End;