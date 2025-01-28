create procedure addTransaction
        @userId int,
		@transactionType varchar(50),
		@category varchar(50),
		@transactionDate date,
		@amount decimal(30,2)
as 
 Begin
     insert into Transactions (userID, transactionType, category, transactionDate, amount) values
	 (@userId, @transactionType, @category, @transactionDate, @amount);
end;