create function getOldAmount(@transactionID int)
returns int

as

BEGIN
  DECLARE @oldAmount INT;
  select @oldAmount = amount from Transactions where transactionID = transactionID;
  return @oldAmount;
END;