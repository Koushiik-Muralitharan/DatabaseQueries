

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'UserDetails')
BEGIN
    CREATE TABLE UserDetails(
        userId INT IDENTITY(1001,1) PRIMARY KEY,
        userName VARCHAR(50),
        userEmail VARCHAR(50),
        mobileNumber CHAR(10),
        passcode VARCHAR(15),
    );
END;

ALTER TABLE UserDetails
ADD CONSTRAINT UQ_userEmail UNIQUE (userEmail);

ALTER TABLE UserDetails
ADD CONSTRAINT UQ_mobileNumber UNIQUE (mobileNumber);