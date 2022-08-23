USE MARANATHA_V21
Select 
     p.prd_codepk ,                           p.prd_codprd,                   ISNULL(p.prd_desprd,'')as Producto ,
	 t.tin_deslar,                            t.tin_codtin,
     f.fpr_codepk,                            f.fpr_deslar as Familia,        f.fpr_codfpr,                   
     s.sfp_codepk,                            s.sfp_codsfp,                   ISNULL(s.sfp_deslar,'')as SubFamilia,   
     l.lip_codepk,                            l.lip_codlip,                   ISNULL(l.lip_deslar,'')AS LineaProducto
from PRODUCTOS_PRD p 
left join TIPOINVENTARIO_TIN  t on (p.cia_codcia =t.cia_codcia and p.tin_codtin = t.tin_codtin)
left join LINEA_PRODUCTO_LIP l on (p.cia_codcia = l.cia_codcia and p.lip_codepk = l.lip_codepk )
left join FAMILIAPROD_FPR f on (p.cia_codcia = f.cia_codcia and p.fpr_codepk = f.fpr_codepk)
left join SUBFAMILIAPROD_SFP s on (p.cia_codcia = s.cia_codcia and p.sfp_codepk = s.sfp_codepk and f.fpr_codepk = s.fpr_codepk)

SELECT *FROM PRODUCTOS_PRD

SELECT *FROM KARDEX_PRODUCTOS_KAC
SELECT *FROM KARDEX_PRODUCTOS_KAD 
SELECT *FROM SALDOS_PRODUCTO_SPR
SELECT *FROM SALDOS_LOTE_PRODUCTO_SLO
SELECT *FROM KARDEX_PRODUCTOS_LOTE_KPL
SELECT*FROM MARCA_PRODUCTOS_MAP
SELECT*FROM GENERO_PRODUCTO_GEN
SELECT*FROM UBICACIONES_UBI
SELECT*FROM PARTIDA_ARANCELARIA_PAR
SELECT*FROM COLORES_COL
SELECT*FROM FORMA_PRODUCTO_FOP
SELECT*FROM PRODUCTOS_LOTES_TIPOS_PLT


