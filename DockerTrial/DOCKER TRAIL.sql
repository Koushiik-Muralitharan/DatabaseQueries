USE TODOLISTAPP;
ALTER AUTHORIZATION ON DATABASE::TODOLISTAPP TO sa;

SELECT dp.name AS DatabaseRole, p.name AS PrincipalName
FROM sys.database_role_members rm
JOIN sys.database_principals dp ON rm.role_principal_id = dp.principal_id
JOIN sys.database_principals p ON rm.member_principal_id = p.principal_id
WHERE p.name = 'sa';

SELECT dp.name AS RoleName, p.name AS PrincipalName
FROM sys.database_role_members rm
JOIN sys.database_principals dp ON rm.role_principal_id = dp.principal_id
JOIN sys.database_principals p ON rm.member_principal_id = p.principal_id
WHERE dp.name = 'db_owner';

USE TODOLISTAPP;
EXEC sp_addrolemember 'db_owner', 'sa';

CREATE USER sa FOR LOGIN sa;

EXEC sp_addrolemember 'db_owner', 'sa';

USE TODOLISTAPP;
EXEC sp_adduser 'sa', 'sa';
EXEC sp_addrolemember 'db_owner', 'sa';

EXEC sp_helprole 'db_owner';
