create trigger DeleteTransactionTrigger
on Transactions
after delete

as

begin 
  
  IF EXISTS (SELECT 1 FROM deleted d WHERE d.transactionType = 'Income')
  begin
         update ubi 
		 SET ubi.Income = ubi.Income - deleted.amount
		 from UserBalanceInfo ubi
		 join deleted on ubi.UserID = deleted.userID
  end;
  IF EXISTS (SELECT 1 FROM deleted d WHERE d.transactionType = 'Expense')
  begin
         update ubi 
		 SET ubi.Expense = ubi.Expense - deleted.amount
		 from UserBalanceInfo ubi
		 join deleted on ubi.UserID = deleted.userID
  end;

  begin
        update ubi
		SET ubi.Balance = ubi.Income - ubi.Expense - ubi.Savings
		from UserBalanceInfo ubi
		join deleted on ubi.UserID = deleted.userID
  end;

end;