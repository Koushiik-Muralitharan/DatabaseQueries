CREATE PROCEDURE sp_delete_activity
         @activityId int
AS
BEGIN
    DELETE FROM Activity where ActivityId = @activityId;
END;