USE [TURISMOPERU_JDVQ];
GO

/* =========================================================
   DEMOSTRACIÓN DE PRINCIPIO DE MÍNIMO PRIVILEGIO
   ========================================================= */

-- 1. Cambiar contexto al usuario analista
EXECUTE AS USER = 'JDVQ_analista';
GO

PRINT '--- Probando consulta (SELECT) como JDVQ_analista ---';
SELECT TOP 5 * FROM [JDVQ].[cliente];
GO

PRINT '--- Intentando modificar datos (INSERT) como JDVQ_analista ---';
-- Esta operación DEBE SER RECHAZADA por SQL Server
INSERT INTO [JDVQ].[pago] (id_reserva, monto, medio_pago, fecha_pago)
VALUES (1, 150.00, 'Efectivo', SYSDATETIME());
GO

-- Revertir el contexto al usuario administrador
REVERT;
GO