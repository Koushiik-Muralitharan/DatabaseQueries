create procedure sp_delete_goal
@goalID int

as 
begin
 delete from Goals where GoalID = @goalID;
end;