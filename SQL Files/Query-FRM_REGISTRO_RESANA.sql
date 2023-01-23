Select 
       A.IdIM as IdIM_C, 
       rtrim(A.codigo_IM)+Left(A.fecha,2)+Right(A.Fecha,2) as CodigoLab_C, 
       A.Nombre_Cli as NOmbre_Cli_C, A.Nombre_IM as Nombre_IM_C, A.FechaIns,
       Space(10)as OKimp,
	   ISNULL(cast(B.por_h2o as char(12)),'')as por_h2o,
	   ISNULL(cast(B.por_cu as char(12)),'')as por_cu,
	   ISNULL(cast(B.por_cuo as char(12)),'')as por_cuo,
	   ISNULL(cast(B.por_cu as char(12)),'')as por_cu,
	   ISNULL(cast(B.por_cuo as char(12)),'')as por_cuo,
	   ISNULL(cast(B.grt_au as char(12)),'')as grt_au,
	   ISNULL(cast(B.ozt_au as char(12)),'')as ozt_au,
	   ISNULL(cast(B.grt_ag as char(12)),'')as grt_ag,
	   ISNULL(cast(B.ozt_ag as char(12)),'')as ozt_ag,
	   ISNULL(cast(B.por_as as char(12)),'')as por_as,
	   ISNULL(cast(B.por_pb as char(12)),'')as por_pb,
	   ISNULL(cast(B.por_pbox as char(12)),'')as por_pbox,
	   ISNULL(cast(B.por_zn as char(12)),'')as por_zn,
	   ISNULL(cast(B.por_znox as char(12)),'')as por_znox,
	   ISNULL(cast(B.por_sb as char(12)),'')as por_sb,
	   ISNULL(cast(B.por_bi as char(12)),'')as por_bi,
	   ISNULL(cast(B.por_cd as char(12)),'')as por_cd,
	   ISNULL(cast(B.por_s as char(12)),'')as por_s,
	   ISNULL(cast(B.por_fe as char(12)),'')as por_fe,
	   ISNULL(B.glosa,'')as glosa,B.ano_codano,B.mes_codmes,B.flg_cierre,B.flg_control,B.IdIM
	   From CCLAB_Instrucciones_C A
     Left Join CCLAB_Instrucciones_Analisis B ON A.IdIM = B.IdIM 
	   
	   