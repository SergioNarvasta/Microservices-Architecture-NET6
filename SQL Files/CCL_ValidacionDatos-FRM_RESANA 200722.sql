
SELECT ltrim(rtrim((rtrim(cast(Codigo_IM as varchar))+cast(dia_coddia as varchar)+ cast(mes_codmes as varchar)))) AS CodigoLab,Nombre_CLI,Nombre_IM,
IdIM,CanceladoNum_Ins,CanceladoFec_Ins,Total_Ins,ano_codano,mes_codmes,dia_coddia,Fecha,FechaIns
FROM CCLAB_Instrucciones_C 
Where ano_codano in( '2021','2022') and mes_codmes in( '6','7')and  dia_coddia between '15' and '30'
--ano_codano = '2022' and mes_codmes = '7' and dia_coddia in ('7','')

Select A.*, rtrim(A.codigo_IM)+Left(A.fecha,2)+Right(A.Fecha,2) as Item,B.NomResponsable
    From CCLAB_Instrucciones_C  A
LEFT JOIN CCLAB_Instrucciones_Resultados B ON A.IdIM = B.IdIM


SELECT* FROM CCLAB_Instrucciones_Resultados
SELECT* FROM CCLAB_Instrucciones_Analisis


INSERT INTO CCLAB_Instrucciones_Resultados(IdIM, IdTemporada, NomResponsable, CodigoLab,  FechaProgramado, FechaReporte, Observa,Tipo)
 VALUES (9898,2,'PRUEBA','YYDHYXWW','2022-07-21 10:13:00','2022-07-21 10:13:00','Todo correcto',2)
GO

INSERT INTO CCLAB_Instrucciones_Analisis
        (IdIM,CodLab,Nombre_Cli,CodCli,por_h2o,por_cu,grt_au,ozt_au,grt_ag,ozt_ag,por_as,por_pb,por_pbox,por_zn,por_znox,por_sb,por_bi,por_cd,por_s,por_fe,glosa,ano_codano, mes_codmes,flg_control,flg_cierre)
 VALUES (848,77545,'PRUEBA','XJSXHSUSXXWS',2 ,2.5,4,5.6,2,2.5,4,5.6,2,2.5,4,5.6,2,2.5,4,3,'PRUEBA 22 07 22',22,7,2,1)

 UPDATE  CCLAB_Instrucciones_Analisis
 SET
  IdIM =          , 
  CodLab =  783167,
 Nombre_Cli =  'PRUEBA UPDATE',
 CodCli 	=  'XXYHYHSDY',
 por_h2o	=  1 ,
 por_cu		=  1 ,
 grt_au		=  0.000,
 ozt_au		=  1 ,
 grt_ag		=  1 ,
 ozt_ag		=  1 ,
 por_as		=  1 ,
 por_pb		=  1 ,
 por_pbox	=  0.00 ,
 por_zn		=  1 ,
 por_znox	=  1 ,
 por_sb		=  1 ,
 por_bi		=  1 ,
 por_cd		=  1 ,
 por_s		=  1 ,
 por_fe		=  1 ,
 glosa		=  '' ,
 ano_codano	=  1 ,
 mes_codmes	=  1 ,
 flg_control=  1 ,
 flg_cierre =  1 
  wHERE CodLab = 783167

	SELECT 
	ltrim(rtrim((rtrim(cast(Codigo_IM as varchar))+cast(dia_coddia as varchar)+ cast(mes_codmes as varchar)))) AS CodigoLab,
	Nombre_CLI, Nombre_IM,IdIM
FROM CCLAB_Instrucciones_C 


 CREATE TABLE [dbo].[CCLAB_Instrucciones_Analisis] (
    [IdIM]        INT  PRIMARY KEY           NOT NULL,
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
    [flg_cierre]  SMALLINT       NULL
);
  