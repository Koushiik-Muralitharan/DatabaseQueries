create trigger InitializeTrigger
on UserDetails
after insert

as 

Begin
   Insert into UserBalanceInfo (UserID) select usedId from inserted ;
end;