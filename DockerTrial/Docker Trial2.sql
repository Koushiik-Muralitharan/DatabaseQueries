use [TODOLISTAPP]; exec sp_changedbowner [sa];

USE [TODOLISTAPP];
SELECT name AS UserName, type_desc AS UserType
FROM sys.database_principals
WHERE name = 'sa';

SELECT name, is_disabled FROM sys.sql_logins WHERE name = 'sa';
ALTER LOGIN sa ENABLE;
SELECT name FROM sys.databases WHERE name = 'TODOLISTAPP';

USE [TODOLISTAPP];
ALTER AUTHORIZATION ON DATABASE::[TODOLISTAPP] TO [sa];


USE TODOLISTAPP;
SELECT dp.name AS RoleName, mp.name AS MemberName
FROM sys.database_role_members rm
JOIN sys.database_principals dp ON rm.role_principal_id = dp.principal_id
JOIN sys.database_principals mp ON rm.member_principal_id = mp.principal_id
WHERE dp.name = 'db_owner' AND mp.name = 'sa';

USE TODOLISTAPP;
ALTER ROLE db_owner ADD MEMBER sa;

EXEC sp_addsrvrolemember 'sa', 'sysadmin';

ALTER DATABASE [TODOLISTAPP] SET ONLINE;
