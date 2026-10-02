/* =====================================================================
   UNIVERSIDAD NACIONAL DE CAJAMARCA
   Parte 5: Consultas Analíticas para Reportes / Dashboard
   ===================================================================== */

USE [TURISMOPERU_JDVQ];
GO

/* ---------------------------------------------------------------------
   1. METRICAS / KPIS PRINCIPALES
   --------------------------------------------------------------------- */
-- Total Clientes
SELECT COUNT(*) AS total_clientes FROM [JDVQ].[cliente];

-- Total Reservas
SELECT COUNT(*) AS total_reservas FROM [JDVQ].[reserva];

-- Total Ingresos
SELECT ISNULL(SUM(monto), 0) AS total_ingresos FROM [JDVQ].[pago];

-- Ticket Promedio
SELECT 
    ISNULL(SUM(p.monto), 0) / NULLIF(COUNT(DISTINCT r.id_reserva), 0) AS ticket_promedio
FROM [JDVQ].[reserva] r
LEFT JOIN [JDVQ].[pago] p ON p.id_reserva = r.id_reserva;
GO

/* ---------------------------------------------------------------------
   2. AGRUPACIONES PARA GRAFICOS
   --------------------------------------------------------------------- */
-- A. Reservas por estado
SELECT estado, COUNT(*) AS cantidad
FROM [JDVQ].[reserva]
GROUP BY estado;

-- B. Ingresos por medio de pago
SELECT medio_pago, SUM(monto) AS total_ingresado
FROM [JDVQ].[pago]
GROUP BY medio_pago;

-- C. Reservas por fecha
SELECT CAST(fecha_reserva AS DATE) AS fecha, COUNT(*) AS total_reservas
FROM [JDVQ].[reserva]
GROUP BY CAST(fecha_reserva AS DATE)
ORDER BY fecha;

-- D. Top 10 clientes por cantidad de reservas
SELECT TOP 10 
    p.id_persona,
    p.nombres + ' ' + p.apellido_paterno AS cliente,
    COUNT(r.id_reserva) AS total_reservas
FROM [JDVQ].[cliente] c
JOIN [JDVQ].[persona] p ON p.id_persona = c.id_persona
JOIN [JDVQ].[reserva] r ON r.id_cliente = c.id_cliente
GROUP BY p.id_persona, p.nombres, p.apellido_paterno
ORDER BY total_reservas DESC;

-- E. Ingresos por cliente
SELECT 
    p.nombres + ' ' + p.apellido_paterno AS cliente,
    ISNULL(SUM(pg.monto), 0) AS total_gastado
FROM [JDVQ].[cliente] c
JOIN [JDVQ].[persona] p ON p.id_persona = c.id_persona
JOIN [JDVQ].[reserva] r ON r.id_cliente = c.id_cliente
JOIN [JDVQ].[pago] pg ON pg.id_reserva = r.id_reserva
GROUP BY p.nombres, p.apellido_paterno
ORDER BY total_gastado DESC;
GO