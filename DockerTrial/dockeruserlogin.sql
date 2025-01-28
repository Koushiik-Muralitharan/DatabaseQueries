CREATE LOGIN myuser WITH PASSWORD = 'StrongPassword123!';
CREATE USER myuser FOR LOGIN myuser;
ALTER ROLE db_datareader ADD MEMBER myuser; -- Example: Read-only role
ALTER ROLE db_datawriter ADD MEMBER myuser; -- Example: Write access

go 

USE TODOLISTAPP

go

SELECT * FROM sys.database_principals WHERE name = 'myuser';

USE TODOLISTAPP;
GO

ALTER ROLE db_datareader ADD MEMBER myuser;
ALTER ROLE db_datawriter ADD MEMBER myuser;

SELECT * FROM sys.syslogins WHERE name = 'myuser';

ALTER ROLE db_owner ADD MEMBER myuser;

ALTER LOGIN myuser WITH CHECK_POLICY = OFF;
