IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Transactions')
BEGIN
create table Transactions (
  userID int Foreign key (UserID) REFERENCES UserDetails(usedId),
  transactionID int identity(201,1) primary key,
  transactionType varchar(50),
  category varchar(50),
  transactionDate date,
  amount int
);
END;


