create procedure EditTransaction
    @userID int,
    @transactionID int,
	@transactionType varchar(50),
	@category varchar(50),
	@transactionDate date,
	@amount int, 
	@result BIT OUTPUT
	as

 BEGIN
    DECLARE @oldAmount int;
	DECLARE @tType varchar(50);
	DECLARE @difference int;
	SET @oldAmount = dbo.getOldAmount(@transactionID);
	SET @tType = dbo.getOldTransactionType(@transactionID);
	Print('Old amt:'+ CAST(@oldAmount as varchar(50)) );
	Print('Old type:'+ CAST(@tType as varchar(50)) );
	Print('new amt:'+ CAST(@amount as varchar(50)) );
	Print('new type:'+ CAST(@transactionType as varchar(50)) );

	BEGIN
	BEGIN TRY
	   UPDATE Transactions
	SET
	   transactionType=@transactionType,
	   category = @category,
	   transactionDate = @transactionDate,
	   amount = @amount
	WHERE
	   transactionID = @transactionID;
	IF @@ROWCOUNT = 0
	  BEGIN
	      SET @result = 0;
	  END;
	ELSE
	  BEGIN
	      SET @result = 1;
	  END;
    END TRY
    BEGIN CATCH
	   SET @result = 0;
    END CATCH
	END;

	BEGIN
	   IF( @tType = 'Expense' and @transactionType = 'Expense')
	  
	   BEGIN
	    Print('Entered into expense');
	      IF(@oldAmount > @amount)
		  BEGIN
		    SET @difference = @oldAmount - @amount;
			update UserBalanceInfo 
			SET 
				TransactionSum = TransactionSum - @difference
			WHERE
			    UserID = @userID;
		  END;
		  ELSE IF (@oldAmount < @amount)
		  BEGIN
		    SET @difference = @amount -  @oldAmount;
			update UserBalanceInfo 
			SET 
				TransactionSum = TransactionSum + @difference
			WHERE
			    UserID = @userID;
		  END;
	   END;
	   ELSE IF ( @tType = 'Income' and @transactionType = 'Income')
	   BEGIN
	   PRINT('Entered into income');
	      IF(@oldAmount > @amount)
		  BEGIN
		    SET @difference = @oldAmount - @amount;
			update UserBalanceInfo 
			SET 
				Income = Income - @difference
			WHERE
			    UserID = @userID;
		  END;
		  ELSE IF (@oldAmount < @amount)
		  BEGIN
		    SET @difference = @amount -  @oldAmount;
			update UserBalanceInfo 
			SET 
				Income = Income + @difference
			WHERE
			    UserID = @userID;
		  END;
	   END;
	   ELSE IF ( @tType = 'Income' and @transactionType = 'Expense')
	   BEGIN
	    Print('Entered into income to expense');
		  BEGIN
			update UserBalanceInfo 
			SET 
				TransactionSum = TransactionSum + @amount,
				Income = Income - @oldAmount
			WHERE
			    UserID = @userID;
		  END;
	   END;

	    ELSE IF ( @tType = 'Expense' and @transactionType = 'Income')
	   BEGIN
	    Print('Entered into expense to income.');
	      update UserBalanceInfo 
			SET 
				TransactionSum = TransactionSum - @oldAmount,
				Income = Income + @amount
			WHERE
			    UserID = @userID; 
	   END;

	  
	END;
	 update UserBalanceInfo 
	   SET
	          Balance = Income - TransactionSum - GoalsSum
	   WHERE
	          UserID = @userID; 
END;
	
	     