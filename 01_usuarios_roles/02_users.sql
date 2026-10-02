USE [TURISMOPERU_JDVQ];
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'JDVQ_admin')
    CREATE USER [JDVQ_admin] FOR LOGIN [JDVQ_admin];

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'JDVQ_vendedor')
    CREATE USER [JDVQ_vendedor] FOR LOGIN [JDVQ_vendedor];

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'JDVQ_analista')
    CREATE USER [JDVQ_analista] FOR LOGIN [JDVQ_analista];
GO

SELECT name, type_desc, default_schema_name
FROM sys.database_principals
WHERE name LIKE N'JDVQ[_]%';
GO