create procedure AddContribution
@userID  int,
@goalID  int,
@contributionAmount int
as
begin

update UserBalanceInfo set GoalsSum = GoalsSum + @contributionAmount where UserID = @userID;

update Goals set GoalContribution = GoalContribution + @contributionAmount where GoalID = @goalID;

update UserBalanceInfo set Balance = Income - TransactionSum - GoalsSum where UserID = @userID; 

end;
