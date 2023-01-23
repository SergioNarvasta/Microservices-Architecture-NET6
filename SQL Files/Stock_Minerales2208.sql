
SELECT     0 As Seleccion,
	       B.prd_codprd As CodProducto,
	       B.prd_desprd As Producto,
	       C.alm_codalm As Almacen,
	       Isnull(D.lot_codlot,'')As Lote,
	       (A.slo_sinund + A.slo_ingund - A.slo_salund)As Cantidad,
		   Isnull(G.ume_codume,'') As UME,
		   Isnull(I.ubi_codubi,'') As Ubicacion,
		   ISNULL(Case When cast(D.lot_ley1cu as char(12))= '0.000' Then ''Else cast(D.lot_ley1cu as char(12)) End,'')As Ley1Cu, 
		   ISNULL(Case When cast(D.lot_ley2ag as char(12))= '0.000' Then ''Else cast(D.lot_ley2ag as char(12)) End,'')As Ley2Ag,
		   ISNULL(Case When cast(D.lot_ley3au as char(12))= '0.000' Then ''Else cast(D.lot_ley3au as char(12)) End,'')As Ley3Au,
		   ISNULL(Case When cast(D.lot_ley4pb as char(12))= '0.000' Then ''Else cast(D.lot_ley4pb as char(12)) End,'')As Ley4Pb,
		   ISNULL(Case When cast(D.lot_ley5zn as char(12))= '0.000' Then ''Else cast(D.lot_ley5zn as char(12)) End,'')As Ley5Zn,
		   ISNULL(Case When cast(D.lot_ley6as as char(12))= '0.000' Then ''Else cast(D.lot_ley6as as char(12)) End,'')As Ley6As,
		   ISNULL(Case When cast(D.lot_ley7sb as char(12))= '0.000' Then ''Else cast(D.lot_ley7sb as char(12)) End,'')As Ley7Sb,
           ISNULL(((A.slo_sinund + A.slo_ingund - A.slo_salund)*D.lot_ley1cu),0)As PropCu,
		   ISNULL(((A.slo_sinund + A.slo_ingund - A.slo_salund)*D.lot_ley2ag),0)As PropAg,
		   ISNULL(((A.slo_sinund + A.slo_ingund - A.slo_salund)*D.lot_ley3au),0)As PropAu,
		   ISNULL(((A.slo_sinund + A.slo_ingund - A.slo_salund)*D.lot_ley4pb),0)As PropPb,
		   ISNULL(((A.slo_sinund + A.slo_ingund - A.slo_salund)*D.lot_ley5zn),0)As PropZn,
		   ISNULL(((A.slo_sinund + A.slo_ingund - A.slo_salund)*D.lot_ley6as),0)As PropAs,
		   ISNULL(((A.slo_sinund + A.slo_ingund - A.slo_salund)*D.lot_ley7sb),0)As PropSb
		  
	FROM SALDOS_LOTE_PRODUCTO_SLO A
	LEFT JOIN PRODUCTOS_PRD B       ON (A.cia_codcia = B.cia_codcia AND A.prd_codepk = B.prd_codepk)
	LEFT JOIN ALMACENES_ALM C       ON (A.cia_codcia = C.cia_codcia AND A.alm_codepk = C.alm_codepk)
	LEFT JOIN LOTES_LOT D           ON (A.cia_codcia = D.cia_codcia AND A.suc_codsuc = D.suc_codsuc AND A.prd_codepk = D.prd_codepk and A.lot_codepk = D.lot_codepk)
	LEFT JOIN FAMILIAPROD_FPR E     ON (B.cia_codcia = E.cia_codcia AND B.fpr_codepk = E.fpr_codepk)
	LEFT JOIN SUBFAMILIAPROD_SFP F  ON (B.cia_codcia = F.cia_codcia AND B.sfp_codepk = F.sfp_codepk AND E.fpr_codepk = F.fpr_codepk)
	LEFT JOIN UMEDIDA_UME G         ON (B.cia_codcia = G.cia_codcia AND B.ume_codepk = G.ume_codepk)
	LEFT JOIN TIPOINVENTARIO_TIN H  ON (B.cia_codcia = H.cia_codcia AND B.tin_codtin = H.tin_codtin)
	LEFT JOIN UBICACIONES_UBI    I  ON (A.cia_codcia = I.cia_codcia AND A.alm_codepk = I.alm_codepk AND A.ubi_codepk = I.ubi_codepk)
	Where A.cia_codcia = 1 and A.ano_codano = 2022 and A.mes_cadena=7 
	   and (A.slo_sinund + A.slo_ingund - A.slo_salund) > 0
	--and (A.slo_sinund + A.slo_ingund - A.slo_salund) > 0
	-- B.prd_codprd = '020101003'
	
	--and C.alm_codalm = 101 and I.ubi_codubi ='GEN'
--and B.prd_codprd='020101003' and A.ano_codano = 2022 and A.mes_cadena=8
--SELECT*FROM PRODUCTOS_PRD
/*
SELECT*FROM SALDOS_LOTE_PRODUCTO_SLO
where prd_codepk = 1398 and ano_codano = 2022 and mes_cadena=8
SELECT*FROM ALMACENES_ALM
SELECT*FROM UBICACIONES_UBI
SELECT*FROM LOTES_LOT
SELECT*FROM UMEDIDA_UME
*/


--SELECT*FROM TIPOINVENTARIO_TIN