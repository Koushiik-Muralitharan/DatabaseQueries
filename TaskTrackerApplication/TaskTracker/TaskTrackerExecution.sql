create database TaskTracker;

create table UserDetails(
  UserId INT IDENTITY(2001,1) PRIMARY KEY,
  UserName varchar(50),
  passcode varchar(50)
  CONSTRAINT U_name UNIQUE(UserName)
)

select * from Task;
select * from Activity;