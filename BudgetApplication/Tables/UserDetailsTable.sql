

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserDetails')
BEGIN
    CREATE TABLE UserDetails(
        usedId INT IDENTITY(1001,1) PRIMARY KEY,
        userName VARCHAR(50),
        userEmail VARCHAR(50),
        mobileNumber CHAR(10),
        passcode VARCHAR(15),
        age INT
    );
END;

-- EXEC sp_rename 'dbo.UserDetails.mobileNUmber', 'mobileNumber', 'COLUMN';

-- alter table UserDetails add age int;
    
-- UPDATE UserDetails set age = 130 where userName='Koushiik';

-- insert into UserDetails ( userName, userEmail, mobileNumber, passcode, age) select userName, userEmail, mobileNumber, passcode, age from UserDetails;

-- truncate table UserDetails;