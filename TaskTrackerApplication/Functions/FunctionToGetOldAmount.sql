create function getOldAmount(@transactionID int)
returns int

as

BEGIN
  DECLARE @oldAmount decimal(30,2);
  select @oldAmount = amount from Transactions where transactionID = @transactionID;
  return @oldAmount;
END;