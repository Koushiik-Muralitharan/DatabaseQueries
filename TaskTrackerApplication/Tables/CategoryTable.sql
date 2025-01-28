IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Categories')
begin
   create table Categories 
   (
     userId int,
	 categoryId int Identity(301,1) Primary key,
	 transactionType varchar(50),
	 category varchar(50),
	 constraint cat_key foreign key (userId) 
     references UserDetails(userID) 
     on delete cascade
   )
    
end;