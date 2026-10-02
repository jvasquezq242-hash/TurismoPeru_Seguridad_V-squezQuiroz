-- Ejecutar como sysadmin en SSMS
USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'JDVQ_admin')
    CREATE LOGIN [JDVQ_admin]
    WITH PASSWORD = N'Password123!', CHECK_POLICY = ON, CHECK_EXPIRATION = OFF,
         DEFAULT_DATABASE = [TURISMOPERU_JDVQ];

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'JDVQ_vendedor')
    CREATE LOGIN [JDVQ_vendedor]
    WITH PASSWORD = N'Password123!', CHECK_POLICY = ON, CHECK_EXPIRATION = OFF,
         DEFAULT_DATABASE = [TURISMOPERU_JDVQ];

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'JDVQ_analista')
    CREATE LOGIN [JDVQ_analista]
    WITH PASSWORD = N'Password123!', CHECK_POLICY = ON, CHECK_EXPIRATION = OFF,
         DEFAULT_DATABASE = [TURISMOPERU_JDVQ];
GO

SELECT name, type_desc, is_disabled, create_date
FROM sys.server_principals
WHERE name LIKE N'JDVQ[_]%';
GO