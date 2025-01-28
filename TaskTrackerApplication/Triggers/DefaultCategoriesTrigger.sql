create trigger DefaultCategories
on UserDetails
after insert

as

begin
Declare @userID int ;
    select @userID = userId from inserted;

    insert into Categories(userId, transactionType, category) values 
	    (@userID, 'Expense', 'Food'),
        (@userID, 'Expense', 'Transport'),
        (@userID, 'Expense', 'Healthcare'),
        (@userID, 'Expense', 'Entertainment'),
        (@userID, 'Expense', 'Education'),

        -- Income Categories
        (@userID, 'Income', 'Salary'),
        (@userID, 'Income', 'Bonus'),
        (@userID, 'Income', 'Freelance'),
        (@userID, 'Income', 'Investment Return');
end;