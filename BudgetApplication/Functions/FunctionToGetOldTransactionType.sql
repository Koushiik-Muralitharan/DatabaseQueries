create function getOldTransactionType(@transactionID int)
returns varchar(50)

as

BEGIN
    DECLARE @tType varchar(50);
	select @tType = transactionType from Transactions where transactionID = @transactionID;
	return @tType;

END;