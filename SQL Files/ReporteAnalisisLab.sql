SELECT 
     (A.Codigo_IM )CodMuestra ,    A.Nombre_Cli,                     A.Nombre_IM, (Space(10))Contacto,
	  C.NomResponsable,             (A.Nombre_Env)Presentacion,       (A.Nombre_Mat)Tipo,
	  (space(6))Caracteristicas,    A.FechaIns,                       A.HoraIns,
	  (B.CodMetodo +'      '+B.Elemento)Met,                       B.Resultado     
FROM CCLAB_Instrucciones_C A
left join CCLAB_Instrucciones_Recepcion C
ON A.IdIM = C.IdIM
left join CCLAB_Instrucciones_Metodos B
ON c.CodigoLab = B.CodigoLab

GO
--SELECT*FROM CCLAB_Instrucciones_C
Select A.*, rtrim(A.codigo_IM)+Left(A.fecha,2)+Right(A.Fecha,2) as Item, B.NomResponsable
    From CCLAB_Instrucciones_C  A
    LEFT JOIN CCLAB_Instrucciones_Recepcion B 
    ON A.IdIM = B.IdIM

	SELECT*FROM CCLAB_Instrucciones_C


	 --'2022/07/15 ' and '20222/08/01 '  
	 --a.ano_codano = '2022' and a.mes_codmes in('7','8') and  a.dia_coddia between '15' and '01'
	 --Where a.ano_codano='2022' and a.mes_codmes='7' and a.dia_coddia='15'

	 SELECT 
       (A.Codigo_IM )CodMuestra ,   
	   ISNULL((B.CodMetodo +'      '+B.Elemento),'')Met,              
	   ISNULL((B.Resultado ),0)Resultado     
     FROM CCLAB_Instrucciones_C A
     left join CCLAB_Instrucciones_Recepcion C
     ON A.IdIM = C.IdIM
     left join CCLAB_Instrucciones_Metodos B
     on c.CodigoLab = B.CodigoLab

	 SELECT 
      (A.Codigo_IM )CodMuestra ,    A.Nombre_Cli,                     A.Nombre_IM, (Space(10))Contacto,
	  Isnull(C.NomResponsable,'')NomResponsable,                      (A.Nombre_Env)Presentacion,       
	  (A.Nombre_Mat)Tipo, 	  (space(6))Caracteristicas,              A.FechaIns,        A.HoraIns
     FROM CCLAB_Instrucciones_C A
     left join CCLAB_Instrucciones_Recepcion C
     ON A.IdIM = C.IdIM
   --  left join CCLAB_Instrucciones_Metodos B
    -- on c.CodigoLab = B.CodigoLab
-- Isnull((B.CodMetodo +'      '+B.Elemento),'')Met,                ISNULL((B.Resultado ),0)Resultado    
 
	 SELECT*FROM CCLAB_Instrucciones_C
	 SELECT*FROM CCLAB_Instrucciones_Recepcion --Responsable
	 SELECT*FROM CCLAB_Instrucciones_Analisis  --Resultados de Analisis
	 SELECT*FROM CCLAB_Instrucciones_Metodos   --Metodos de Analisis
	 SELECT*FROM CCLAB_Metodos

	 SELECT ISNULL((CodMetodo +'      '+Elemento),'')Met,* FROM CCLAB_Instrucciones_Metodos WHERE CodigoLab = '12932507' Order By IdMetodo
	 -- 12932507  
	 Select A.*, 
	      rtrim(A.codigo_IM)+Left(A.fecha,2)+Right(A.Fecha,2) as CodigoLab, B.NomResponsable,
	      (Case when B.IdIM is null then 'NO' else 'SI' end) as OKRecepcion
    From CCLAB_Instrucciones_C  A
    LEFT JOIN CCLAB_Instrucciones_Recepcion B ON A.IdIM = B.IdIM

	/*****************************************************************/
	--VALIDAR EN GLOSA SI EL MINERAL PRESENTA ANALISIS NEWMONT
	-- Function At('Newmont',glosa) Detectar el caracter en el campo
	Select a.*,
	      rtrim(A.codigo_IM)+Left(A.fecha,2)+Right(A.Fecha,2) as CodigoLab, B.NomResponsable,
	      (Case when B.IdIM is null then 'NO' else 'SI' end) as OKRecepcion,C.glosa,Detalle_IM
    From CCLAB_Instrucciones_C  A
    LEFT JOIN CCLAB_Instrucciones_Recepcion B ON A.IdIM = B.IdIM
	LEFT JOIN CCLAB_Instrucciones_Analisis  C ON A.IdIM =C.IdIM 
	WHERE glosa IS NOT NULL and Detalle_IM LIKE '%AU%'
	--MINERA PARAISO SOCIEDAD ANONIMA CERRADA   
	/*****************************************************************/
	SELECT *FROM CCLAB_Instrucciones_C  A
    LEFT JOIN CCLAB_Instrucciones_D B ON A.IdIM = B.IdIM
	-Oro[N] Plata[N] 03400807  
	     
	Select A.*, 
	      rtrim(A.codigo_IM)+Left(A.fecha,2)+Right(A.Fecha,2) as CodigoLab, B.NomResponsable,
	      (Case when B.IdIM is null then 'NO' else 'SI' end) as OKRecepcion, Space(8)as Contacto
    From CCLAB_Instrucciones_C  A
    LEFT JOIN CCLAB_Instrucciones_Recepcion B ON A.IdIM = B.IdIM    
	                                                                                                                                                                             