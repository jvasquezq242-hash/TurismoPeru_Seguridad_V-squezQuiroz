USE [TURISMOPERU_JDVQ];
GO

IF DATABASE_PRINCIPAL_ID(N'rol_vendedor') IS NULL CREATE ROLE rol_vendedor;
IF DATABASE_PRINCIPAL_ID(N'rol_analista') IS NULL CREATE ROLE rol_analista;
GO

-- Asignar usuarios a roles
ALTER ROLE rol_vendedor ADD MEMBER [JDVQ_vendedor];
ALTER ROLE rol_analista ADD MEMBER [JDVQ_analista];

-- Administrador con permiso total de base de datos
ALTER ROLE db_owner ADD MEMBER [JDVQ_admin];
GO

SELECT r.name AS rol, m.name AS miembro
FROM sys.database_role_members drm
JOIN sys.database_principals r ON r.principal_id = drm.role_principal_id
JOIN sys.database_principals m ON m.principal_id = drm.member_principal_id
WHERE m.name LIKE N'JDVQ[_]%'
ORDER BY r.name;
GO