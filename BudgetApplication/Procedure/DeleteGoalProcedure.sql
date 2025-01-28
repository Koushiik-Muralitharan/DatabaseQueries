create procedure DeleteGoal
@goalID int

as 
begin
 delete from Goals where GoalID = @goalID;
end;