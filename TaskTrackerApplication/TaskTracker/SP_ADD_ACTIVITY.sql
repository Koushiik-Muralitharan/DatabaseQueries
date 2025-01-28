CREATE PROCEDURE sp_add_activities
         @taskId int,
		 @Title varchar(50),
		 @DescriptionField varchar(50),
		 @ActivityHours decimal(2,1)
AS

BEGIN
   INSERT INTO Activity (
   TaskId,
   Title,
   DescriptionField,
   ActivityHours) values (
         @taskId,
		 @Title ,
		 @DescriptionField,
		 @ActivityHours
   );
END;