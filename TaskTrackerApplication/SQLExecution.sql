INSERT INTO UserDetails (userName, userEmail, mobileNumber, passcode)
VALUES ( 'Koushiik', 'koushiik@gmail.com', '9047615315', '123'),
( 'Cholan', 'cholan@gmail.com', '9047615314', '123'),
('Theveesh', 'theveesh@gmail.com', '9047615313', '123');

-- Using procedure
EXEC sp_insert_user @userName = 'Koushiik',
                @userEmail = 'koushiik@gmail.com',
				@mobileNumber = '9047615315',
				@passcode = '1234'
				

EXEC sp_insert_user @userName = 'Akash',
                @userEmail = 'akash@gmail.com',
				@mobileNumber = '9047615315',
				@passcode = '1234'

EXEC sp_insert_user @userName = 'Muralitharan',
                @userEmail = 'muralitharan@gmail.com',
				@mobileNumber = '9047615315',
				@passcode = '1234'

EXEC sp_add_transaction @userID = 1004,
                    @transactionType = 'Income',
		            @category = 'InvestmentAkash',
					@transactionDate = '2024-10-15',
		            @amount = 20000

EXEC sp_add_transaction @userID = 1004,
                    @transactionType = 'Expense',
		            @category = 'ShoppingAkash',
					@transactionDate = '2024-10-15',
		            @amount = 5000

EXEC sp_add_goal @userID = 1001,
             @GoalName = 'Muralitharan',
             @GoalAmount = 10000,
             @GoalContribution = 2000

EXEC sp_add_contribution @userID = 1021,
					 @goalID = 103,
                     @contributionAmount = 20

EXEC EditTransaction
    @userID =1004,
    @transactionID = 213,
	@transactionType = 'Expense',
	@category = 'ShoppingkEdited',
	@transactionDate = '2024-10-16',
	@amount = 30000,
	@result = 1

EXEC EditTransaction
    @userID =1001,
    @transactionID = 203,
	@transactionType = 'Income',
	@category = 'Shopping1024',
	@transactionDate = '2024-10-16',
	@amount = 20000,
	@result = 1

-- delete from Transactions;
-- delete from  UserBalanceInfo;
-- truncate table Goals;
-- delete from UserDetails;
select * from UserDetails;
select * from UserBalanceInfo;
select * from Transactions; 
select * from Goals;
select * from Categories;
EXEC sp_delete_category @categoryID = 319;
--EXEC sp_delete_transaction
select dbo.IsUserPresent('priya@gmail.com')