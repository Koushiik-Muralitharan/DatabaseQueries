
create trigger addTransactions
 on Transactions 
 after insert

 as 

 BEGIN
	IF EXISTS (SELECT 1 FROM inserted i WHERE i.transactionType = 'Income')
	BEGIN
		UPDATE ubi
		SET ubi.Income = ubi.Income + inserted.amount
		FROM UserBalanceInfo ubi
		JOIN inserted ON ubi.UserID = inserted.userID
		WHERE ubi.UserID = inserted.userID
	End;
	IF EXISTS (SELECT * FROM inserted i where i.transactionType = 'Expense')
	BEGIN
	IF EXISTS (SELECT 1
			FROM UserBalanceInfo ubi
			JOIN inserted ON ubi.UserID = inserted.UserID
			WHERE ubi.Income > 0 AND (ubi.Expense + inserted.amount + ubi.Savings) <= ubi.Income)
	    BEGIN
		Update ubi 
		set  ubi.Expense = ubi.Expense + inserted.amount
		from UserBalanceInfo ubi
		Join inserted ON ubi.UserID = inserted.userID
		END;
	ELSE
	BEGIN 
	    PRINT('Insufficient income to process this expense transaction.');
			ROLLBACK TRANSACTION;
			RETURN;
		END
		
    End;
	
	Begin
	    Update ubi
		set ubi.Balance = ubi.Income - ubi.Expense - ubi.Savings
		from UserBalanceInfo ubi
		Join inserted on ubi.UserID = inserted.userID
		where  ubi.UserID = inserted.userID
	End
 END;