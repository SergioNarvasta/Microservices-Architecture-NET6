
USE COPPER_V16
CREATE TABLE [dbo].[CCLAB_Instrucciones_Resultados] (
    [IdIM]            INT           NOT NULL,
    [IdTemporada]     TINYINT       NOT NULL,
    [NomResponsable]  VARCHAR (50)  NULL,
    [CodigoLab]       CHAR (10)     NULL,
    [FechaProgramado] SMALLDATETIME NULL,
    [FechaReporte]    SMALLDATETIME NULL,
    [Observa]         VARCHAR (200) NULL,
    [Tipo]            TINYINT       NULL,
    CONSTRAINT [PK_CCLAB_Instrucciones_Resultados] PRIMARY KEY CLUSTERED ([IdIM] ASC, [IdTemporada] ASC)
);

CREATE TABLE [dbo].[CCLAB_Instrucciones_Analisis] (
    [IdIM]        INT            NOT NULL,
    [CodLab]      INT            NULL,
    [Nombre_Cli]  VARCHAR (200)  NULL,
    [CodCli]      VARCHAR (30)   NULL,
    [por_h2o]     NUMERIC (8, 2) NULL,
    [por_cu]      NUMERIC (8, 2) NULL,
    [grt_au]      NUMERIC (8, 3) NULL,
    [ozt_au]      NUMERIC (8, 3) NULL,
    [grt_ag]      NUMERIC (8, 3) NULL,
    [ozt_ag]      NUMERIC (8, 3) NULL,
    [por_as]      NUMERIC (8, 2) NULL,
    [por_pb]      NUMERIC (8, 2) NULL,
    [por_pbox]    NUMERIC (8, 2) NULL,
    [por_zn]      NUMERIC (8, 2) NULL,
    [por_znox]    NUMERIC (8, 2) NULL,
    [por_sb]      NUMERIC (8, 2) NULL,
    [por_bi]      NUMERIC (8, 2) NULL,
    [por_cd]      NUMERIC (8, 2) NULL,
    [por_s]       NUMERIC (8, 2) NULL,
    [por_fe]      NUMERIC (8, 2) NULL,
    [glosa]       VARCHAR (200)  NULL,
    [ano_codano]  SMALLINT       NULL,
    [mes_codmes]  TINYINT        NULL,
    [flg_control] SMALLINT       NULL,
    [flg_cierre]  SMALLINT       NULL,
    PRIMARY KEY CLUSTERED ([IdIM] ASC)
);
