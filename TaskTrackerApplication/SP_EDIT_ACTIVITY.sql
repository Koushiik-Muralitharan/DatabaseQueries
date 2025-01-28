CREATE PROCEDURE sp_edit_activity
                 @activityId int,
				 @Title varchar(50),
				 @DescriptionField varchar(50),
				 @ActivityHours decimal(2,1)
AS
BEGIN
    UPDATE Activity
	SET 
    Title = @Title,
    DescriptionField = @DescriptionField,
    ActivityHours = @ActivityHours
	WHERE
	ActivityId = @activityId;
END;