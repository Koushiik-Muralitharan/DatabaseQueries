create procedure sp_add_contribution
@userID  int,
@goalID  int,
@contributionAmount decimal(30,2)
as
begin

update UserBalanceInfo set Savings = Savings + @contributionAmount where UserID = @userID;

update Goals set GoalContribution = GoalContribution + @contributionAmount where GoalID = @goalID;

update UserBalanceInfo set Balance = Income - Expense - Savings where UserID = @userID; 

end;
