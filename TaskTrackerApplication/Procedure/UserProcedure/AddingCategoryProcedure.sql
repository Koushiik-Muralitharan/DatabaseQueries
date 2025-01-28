CREATE PROCEDURE sp_addCategory
             @userID int,
			 @transactionType varchar(50),
			 @category varchar(50)
AS
BEGIN
     SET XACT_ABORT ON
     IF NOT EXISTS (SELECT 1 FROM Categories WHERE userId = @userID and LOWER(category) = LOWER(@category))
	 BEGIN
	   INSERT INTO Categories(userId, transactionType, category) VALUES 
	   (@userID,@transactionType,@category);
	 END; 
	 ELSE
	 BEGIN
	   RAISERROR('Already an category is present.',16,1);
	 END;
END;