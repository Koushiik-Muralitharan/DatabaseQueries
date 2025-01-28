CREATE PROCEDURE sp_to_get_single_activity
          @activityId int

AS

BEGIN
   SELECT * FROM Activity where ActivityId = @activityId;
END;