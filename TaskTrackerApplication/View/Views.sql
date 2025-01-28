CREATE VIEW Transactionss AS
SELECT transactionType,category,amount 
FROM Transactions
WHERE userID = 1016;