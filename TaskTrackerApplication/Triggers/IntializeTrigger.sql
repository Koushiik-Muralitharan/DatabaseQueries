create trigger InitializeTrigger
on UserDetails
after insert

as 

Begin
   Insert into UserBalanceInfo (UserID) select userId from inserted ;
end;