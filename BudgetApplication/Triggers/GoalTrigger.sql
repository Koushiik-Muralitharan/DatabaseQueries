create trigger AddGoalTrigger
  on Goals
  after insert

  as
  Begin
	 begin
	    UPDATE ubi
		SET ubi.GoalsSum = ubi.GoalsSum + inserted.GoalContribution
		FROM UserBalanceInfo ubi
		JOIN inserted ON ubi.UserID = inserted.userID
		WHERE ubi.UserID = inserted.userID
	 end;

	 begin
	   UPDATE ubi
		SET ubi.Balance = ubi.Income - ubi.GoalsSum - ubi.TransactionSum
		FROM UserBalanceInfo ubi
		JOIN inserted ON ubi.UserID = inserted.userID
		WHERE ubi.UserID = inserted.userID
	 end;

  End;