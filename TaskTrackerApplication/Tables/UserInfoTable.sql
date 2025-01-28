IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserInfo')
BEGIN
create table UserBalanceInfo(
  UserID INT,
  Income decimal(30,2) default 0,
  Balance decimal(30,2) default 0,
  Expense decimal(30,2) default 0,
  Savings decimal(30,2) default 0,
  -- Constraint Fk_key Foreign key (UserID) REFERENCES UserDetails(userId)
);
END

ALTER TABLE UserBalanceInfo
DROP CONSTRAINT Fk_key;

ALTER TABLE UserBalanceInfo
ADD CONSTRAINT Fk_key FOREIGN KEY (UserID)
REFERENCES UserDetails(userId)
ON DELETE CASCADE;