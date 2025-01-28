INSERT INTO UserDetails (userName, userEmail, mobileNumber, passcode, age)
VALUES ( 'Koushiik', 'koushiik@gmail.com', '9047615315', '123',21),
( 'Cholan', 'cholan@gmail.com', '9047615314', '123',21),
('Theveesh', 'theveesh@gmail.com', '9047615313', '123',21);

-- Using procedure
EXEC InsertUser @userName = 'Koushiik',
                @userEmail = 'koushiik@gmail.com',
				@mobileNumber = '9047615315',
				@passcode = '1234',
				@age = 21

EXEC InsertUser @userName = 'Akash',
                @userEmail = 'akash@gmail.com',
				@mobileNumber = '9047615315',
				@passcode = '1234',
				@age = 21

EXEC InsertUser @userName = 'Muralitharan',
                @userEmail = 'muralitharan@gmail.com',
				@mobileNumber = '9047615315',
				@passcode = '1234',
				@age = 51

EXEC addTransaction @userID = 1023,
                    @transactionType = 'Income',
		            @category = 'Investment123',
					@transactionDate = '2024-10-15',
		            @amount = 100000

EXEC addTransaction @userID = 1023,
                    @transactionType = 'Expense',
		            @category = 'Shopping',
					@transactionDate = '2024-10-15',
		            @amount = 10000

EXEC AddGoal @userID = 1021,
             @GoalName = 'Muralitharan',
             @GoalAmount = 10000,
             @GoalContribution = 2000

EXEC AddContribution @userID = 1021,
					 @goalID = 103,
                     @contributionAmount = 20

EXEC EditTransaction
    @userID =1023,
    @transactionID = 210,
	@transactionType = 'Income',
	@category = 'Salary',
	@transactionDate = '2024-10-16',
	@amount = 5000,
	@result = 1

EXEC EditTransaction
    @userID =1023,
    @transactionID = 207,
	@transactionType = 'Expense',
	@category = 'Shopping123',
	@transactionDate = '2024-10-16',
	@amount = 150000,
	@result = 1

 delete from Transactions;
-- delete from  UserBalanceInfo;
-- truncate table Goals;
-- delete from UserDetails;
select * from UserDetails;
select * from UserBalanceInfo;
select * from Transactions; 
select * from Goals;
select * from Transactionss;

EXEC ViewTransactions;
go
 update UserBalanceInfo set Income = 0 , Balance = 0 , TransactionSum = 0 where  UserID = 1023;
 go
CREATE FUNCTION getAmount(@price int)
RETURNS int
AS
BEGIN
    RETURN @price * 100;
END;
go

select transactionType,category, dbo.getAmount(amount) as Amount from Transactions
