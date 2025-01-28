IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Transactions')
BEGIN
create table Transactions (
  userID int,
  transactionID int identity(201,1) primary key,
  transactionType varchar(50),
  category varchar(50),
  transactionDate date,
  amount decimal(30,2)

  CONSTRAINT FK_UserID FOREIGN KEY (userID) 
  REFERENCES UserDetails(userID) 
  ON DELETE CASCADE
);
END;



