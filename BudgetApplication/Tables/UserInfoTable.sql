IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserInfo')
BEGIN
create table UserBalanceInfo(
  UserID INT,
  Income INT default 0,
  Balance INT default 0,
  TransactionSum INT default 0,
  GoalsSum INT default 0,
  Constraint Fk_key Foreign key (UserID) REFERENCES UserDetails(usedId)
);
END


-- insert into UserBalanceInfo (UserID, Income, Balance, TransactionSum, GoalsSum) values (1004,0,0,0,0);
-- select * from UserBalanceInfo;
-- truncate table UserBalanceInfo;
-- drop table UserBalanceInfo;