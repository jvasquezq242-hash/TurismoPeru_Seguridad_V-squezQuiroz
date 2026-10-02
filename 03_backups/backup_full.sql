/* =====================================================================
   TERCERA EVALUACIÓN BASE DE DATOS II - PARTE 3: BACKUP FULL
   Base de Datos: TURISMOPERU_JDVQ
   ===================================================================== */

USE master;
GO

-- A) Respaldar base de datos (.bak)
BACKUP DATABASE [TURISMOPERU_JDVQ]
TO DISK = N'C:\Backups\TurismoPeru_JDVQ_Full.bak'
WITH FORMAT, INIT, CHECKSUM, STATS = 10,
     NAME = N'TURISMOPERU_JDVQ-Full', DESCRIPTION = N'Backup completo de seguridad';
GO

-- B) Verificar la integridad del respaldo
RESTORE VERIFYONLY
FROM DISK = N'C:\Backups\TurismoPeru_JDVQ_Full.bak' WITH CHECKSUM;
GO

/* =====================================================================
   C) Exportación .bacpac (Formato solicitado en la evaluación)
   
   Opción por interfaz en SSMS:
   1. Clic derecho sobre [TURISMOPERU_JDVQ] > Tasks > Export Data-tier Application...
   2. Guardar en: C:\Backups\TurismoPeru_JDVQ_Fullbacpac.bacpac
   
   Opción por Consola (SqlPackage):
   sqlpackage /Action:Export /SourceServerName:localhost /SourceDatabaseName:"TURISMOPERU_JDVQ" /TargetFile:"C:\Backups\TurismoPeru_JDVQ_Fullbacpac.bacpac" /SourceTrustServerCertificate:True
   ===================================================================== */