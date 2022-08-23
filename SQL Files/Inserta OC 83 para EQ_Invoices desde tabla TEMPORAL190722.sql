Select * From Equilibra_Invoices_EQ1
Where EQ1_Mes = 7 and EQ1_CodPrd = '700000%'
order by EQ1_Numero
--Where EQ1_Numero like '83 %'

--Insert Into Equilibra_Invoices_EQ1
	Select 
		Folio,'MIGRA20220701',Proveedor,d_producto,codigoproducto,'',Cantidad,'',Precio,Moneda,TotalVAL,FecEmision,TCEMision,d_bodega,FecIngAlmacen,Folio,TotalOC,TotalCosLog,TCIngAlmacen,ano_codano,mes_codmes,codigobodega,
		NULL,NULL,NULL
	from [HDVMW2012,7598].[HDSOFT_EXT].[dbo].[TMP_OrdenCompra_EQ91]
	Where ano_codano=2022 and mes_codmes = 7