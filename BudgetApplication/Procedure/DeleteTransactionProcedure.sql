create procedure DeleteTransaction
@TransactionID int

as 

begin
   delete from Transactions where transactionID = @TransactionID;
end;