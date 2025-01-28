CREATE PROCEDURE DeleteCategory
             @categoryID int
AS
BEGIN
  SET XACT_ABORT ON
  IF EXISTS(SELECT 1 FROM Categories where categoryId = @categoryID )
  BEGIN
    DELETE FROM Categories where categoryId = @categoryID;
  END;
  ELSE
  BEGIN
   RAISERROR('There is no such category is present to be deleted.',16,1);
  END;
END;