USE [TURISMOPERU_JDVQ];
GO

/* =========================================================
   1. PERMISOS PARA ROL_VENDEDOR (ESQUEMA JDVQ)
   ========================================================= */
-- Otorga permisos SELECT e INSERT en el esquema JDVQ
GRANT SELECT, INSERT ON SCHEMA::[JDVQ] TO rol_vendedor;

-- Deniega explícitamente DELETE sobre el esquema
DENY DELETE ON SCHEMA::[JDVQ] TO rol_vendedor;

-- Deniega administración de seguridad y respaldos
DENY ALTER ANY USER   TO rol_vendedor;
DENY ALTER ANY ROLE   TO rol_vendedor;
DENY BACKUP DATABASE  TO rol_vendedor;
DENY BACKUP LOG       TO rol_vendedor;
GO

/* =========================================================
   2. PERMISOS PARA ROL_ANALISTA (ESQUEMA JDVQ)
   ========================================================= */
-- Otorga únicamente lectura en el esquema JDVQ
GRANT SELECT ON SCHEMA::[JDVQ] TO rol_analista;

-- Deniega rotundamente cualquier modificación de datos
DENY INSERT, UPDATE, DELETE ON SCHEMA::[JDVQ] TO rol_analista;

-- Deniega administración de seguridad y respaldos
DENY ALTER ANY USER  TO rol_analista;
DENY ALTER ANY ROLE  TO rol_analista;
DENY BACKUP DATABASE TO rol_analista;
DENY BACKUP LOG      TO rol_analista;
GO

/* =========================================================
   3. VERIFICACIÓN DE PERMISOS ASIGNADOS
   ========================================================= */
SELECT 
    pr.name AS rol, 
    dp.state_desc AS estado, 
    dp.permission_name AS permiso,
    dp.class_desc AS tipo_objeto,
    SCHEMA_NAME(dp.major_id) AS esquema
FROM sys.database_permissions dp
JOIN sys.database_principals pr ON pr.principal_id = dp.grantee_principal_id
WHERE pr.name IN (N'rol_vendedor', N'rol_analista')
ORDER BY pr.name, dp.state_desc, dp.permission_name;
GO