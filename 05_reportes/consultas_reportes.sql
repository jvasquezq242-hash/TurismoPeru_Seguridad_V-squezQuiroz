/* =====================================================================
   UNIVERSIDAD NACIONAL DE CAJAMARCA
   Parte 5: Consultas Analíticas Adaptadas para Reportes / Dashboard
   ===================================================================== */

USE [TURISMOPERU_JDVQ];
GO

/* ---------------------------------------------------------------------
   1. KPI PRINCIPALES (Solares y Agregados)
   --------------------------------------------------------------------- */
-- Total de Clientes registrados
SELECT COUNT(*) AS total_clientes FROM [JDVQ].[cliente];

-- Total de Reservas registradas
SELECT COUNT(*) AS total_reservas FROM [JDVQ].[reserva];

-- Total de Ingresos recaudados
SELECT ISNULL(SUM(monto), 0) AS total_ingresos FROM [JDVQ].[pago];

-- Ticket Promedio general de Pagos
SELECT ISNULL(AVG(monto), 0) AS ticket_promedio FROM [JDVQ].[pago];
GO

/* ---------------------------------------------------------------------
   2. DESGLOSE DE DATOS PARA GRÁFICOS
   --------------------------------------------------------------------- */

-- A. Reporte General de Pagos por Registro
SELECT TOP 10 
    id_pago,
    id_reserva,
    monto
FROM [JDVQ].[pago]
ORDER BY monto DESC;

-- B. Histórico de Reservas por Fecha
SELECT 
    CAST(fecha_reserva AS DATE) AS fecha_reserva,
    COUNT(*) AS cantidad_reservas
FROM [JDVQ].[reserva]
GROUP BY CAST(fecha_reserva AS DATE)
ORDER BY fecha_reserva DESC;

-- C. Detalle General de Clientes y Personas
SELECT TOP 10 
    c.id_cliente,
    p.nombres,
    p.numero_documento
FROM [JDVQ].[cliente] c
INNER JOIN [JDVQ].[persona] p ON c.id_persona = p.id_persona;
GO