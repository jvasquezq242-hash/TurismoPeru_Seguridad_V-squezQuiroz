USE [TURISMOPERU_JDVQ];
GO

/* ---------------------------------------------------------------------
   1. Creación de la tabla de staging / temporal
   --------------------------------------------------------------------- */
IF OBJECT_ID(N'[JDVQ].[cliente_importacion_temp]', N'U') IS NOT NULL
    DROP TABLE [JDVQ].[cliente_importacion_temp];
GO

CREATE TABLE [JDVQ].[cliente_importacion_temp] (
    id_fila          INT IDENTITY(1,1) PRIMARY KEY,
    Documento        NVARCHAR(50)  NULL,
    Nombres          NVARCHAR(100) NULL,
    ApellidoPaterno  NVARCHAR(100) NULL,
    ApellidoMaterno  NVARCHAR(100) NULL,
    es_valido        BIT           NOT NULL DEFAULT 1,
    motivo_rechazo   NVARCHAR(200) NULL,
    fecha_carga      DATETIME2     NOT NULL DEFAULT SYSDATETIME()
);
GO

/* ---------------------------------------------------------------------
   2. Procedimiento de Importación (Comando BCP / Bulk Insert)
   ---------------------------------------------------------------------
   Sintaxis requerida para BCP desde línea de comandos (CMD):
   bcp "TURISMOPERU_JDVQ.JDVQ.cliente_importacion_temp" in "C:\datos\clientes.csv" -c -t, -S localhost -U JDVQ_admin -P Password123!
*/

-- Alternativa T-SQL:
/*
BULK INSERT [JDVQ].[cliente_importacion_temp]
FROM 'C:\datos\clientes.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
*/
GO

/* ---------------------------------------------------------------------
   3. Limpieza, Validación e Identificación de Duplicados
   --------------------------------------------------------------------- */
-- Limpieza de espacios en blanco y estandarización a mayúsculas
UPDATE [JDVQ].[cliente_importacion_temp]
SET Documento       = LTRIM(RTRIM(Documento)),
    Nombres         = UPPER(LTRIM(RTRIM(Nombres))),
    ApellidoPaterno = UPPER(LTRIM(RTRIM(ApellidoPaterno))),
    ApellidoMaterno = UPPER(LTRIM(RTRIM(ApellidoMaterno)));

-- Validación de estructura del documento (8 dígitos)
UPDATE [JDVQ].[cliente_importacion_temp]
SET es_valido = 0,
    motivo_rechazo = N'Documento o datos incompletos'
WHERE Documento IS NULL OR LEN(Documento) <> 8 OR Nombres IS NULL;

-- Detección de registros duplicados dentro del archivo
;WITH numerados AS (
    SELECT Documento, ROW_NUMBER() OVER (PARTITION BY Documento ORDER BY (SELECT NULL)) AS rn
    FROM [JDVQ].[cliente_importacion_temp]
    WHERE es_valido = 1
)
UPDATE s
SET es_valido = 0, motivo_rechazo = N'Duplicado en el CSV'
FROM [JDVQ].[cliente_importacion_temp] s
JOIN numerados n ON n.Documento = s.Documento
WHERE n.rn > 1;
GO

/* ---------------------------------------------------------------------
   4. Inserción de registros válidos en el esquema oficial
   --------------------------------------------------------------------- */
BEGIN TRY
    BEGIN TRAN;

    -- Inserción en la tabla persona
    INSERT INTO [JDVQ].[persona] (documento, nombres, apellido_paterno, apellido_materno)
    SELECT s.Documento, s.Nombres, s.ApellidoPaterno, s.ApellidoMaterno
    FROM [JDVQ].[cliente_importacion_temp] s
    WHERE s.es_valido = 1
      AND NOT EXISTS (SELECT 1 FROM [JDVQ].[persona] p WHERE p.documento = s.Documento);

    -- Inserción en la tabla cliente
    INSERT INTO [JDVQ].[cliente] (id_persona)
    SELECT p.id_persona
    FROM [JDVQ].[cliente_importacion_temp] s
    JOIN [JDVQ].[persona] p ON p.documento = s.Documento
    WHERE s.es_valido = 1;

    COMMIT;
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK;
    THROW;
END CATCH;
GO