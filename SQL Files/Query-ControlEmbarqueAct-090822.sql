With DocRec(cia_codcia,IdImportacion,Docs)as (
		Select Distinct a.cia_codcia, a.IdImportacion,      
			   DocRec  = cast(sum(d.Cantidad)as char(2))+ ' / '+ cast(count(d.Total)as char(2))    
		From CEX_Importacion A
		Left join CEX_ImportacionREC B on (a.cia_codcia=b.cia_codcia and a.IdImportacion=b.IdImportacion)
		Left Join CEX_Documento C on (a.cia_codcia=c.cia_codcia and b.IdDocumento = c.iddocumento)
		Left join (Select a.cia_codcia,a.IdImportacion,a.IdDocumento,(count(a.IdDocumento)) as Total,
		                Cantidad = (Case When a.Mre_flgFisico =1 or a.Mre_flgVirtual = 1 Then 1 Else 0 End)
				   From  CEX_ImportacionREC a   Left Join CEX_Documento b on (a.cia_codcia=b.cia_codcia and a.IdDocumento = b.iddocumento) where  b.flgDocumentoRec = 1 
				   group by a.cia_codcia,a.IdImportacion,a.IdDocumento,a.Mre_flgFisico,a.Mre_flgVirtual )D on (a.cia_codcia=d.cia_codcia and a.IdImportacion = d.IdImportacion ) 
		group by a.IdImportacion,a.cia_codcia, c.iddocumento
		), DocEnv(cia_codcia,IdImportacion,Docs)as (
		Select Distinct a.cia_codcia, a.IdImportacion,      
			   DocEnv  = cast(sum(d.Cantidad)as char(2))+ ' / '+ cast(count(d.Total)as char(2))    
		From CEX_Importacion A
		Left join CEX_ImportacionENV B on (a.cia_codcia=b.cia_codcia and a.IdImportacion=b.IdImportacion)
		Left Join CEX_Documento C on (a.cia_codcia=c.cia_codcia and b.IdDocumento = c.iddocumento)
		Left join (Select a.cia_codcia,a.IdImportacion,a.IdDocumento,(count(a.IdDocumento)) as Total,
		                Cantidad = (Case When a.Mre_flgFisico =1 or a.Mre_flgVirtual = 1 Then 1 Else 0 End)
				   From  CEX_ImportacionENV a   Left Join CEX_Documento b on (a.cia_codcia=b.cia_codcia and a.IdDocumento = b.iddocumento) where  b.flgDocumentoEnv = 1 
				   group by a.cia_codcia,a.IdImportacion,a.IdDocumento,a.Mre_flgFisico,a.Mre_flgVirtual )D on (a.cia_codcia=d.cia_codcia and a.IdImportacion = d.IdImportacion ) 
		group by a.IdImportacion,a.cia_codcia, c.iddocumento
		)
			Select 
			 ISNULL(Convert(char(10),miETD.FechaETD,103),'')AS ETDInicial           ,ISNULL(Convert(char(12),maETD.FechaETD,103),'')AS ETDFinal,
			 ISNULL(Convert(char(10),miETA.fechaETA,103),'')AS ETAInicial           ,ISNULL(Convert(char(10),maETA.fechaETA,103),'')AS ETAFinal,
			 ISNULL(z6.Docs,'')as DocRec, (Case When cast(substring(z6.Docs,1,1)as int)<cast(substring(z6.Docs,6,2)as int) Then 'Pendiente'  
			                                     When cast(substring(z6.Docs,1,1)as int)=cast(substring(z6.Docs,6,2)as int) Then 'Completo'  Else '' End )EstatusDocRec,
			 ISNULL(z7.Docs,'')as DocEnv, (Case When cast(substring(z7.Docs,1,1)as int)<cast(substring(z7.Docs,6,2)as int) Then 'Pendiente'  
			                                     When cast(substring(z7.Docs,1,1)as int)=cast(substring(z7.Docs,6,2)as int) Then 'Completo'  Else '' End )EstatusDocEnv,
		      a.cia_codcia			   ,      a.IdImportacion		   ,      a.Año					   ,      a.TipoCodigo			   ,
		      a.Correlativo			   ,      a.Parcial01			   ,      a.Parcial02			   ,      a.CodigoImportacion	   ,
		      a.IdSeguimiento		   ,      a.IdProductoCEX		   ,      a.IdClasificacionCEX	   ,      a.IdFamiliaCEX		   ,
		      a.prd_codepk			   ,      a.prd_codprd			   ,      a.CodigoSG			   ,      a.IdProveedorCEX		   ,
		      a.Contrato			   ,      ISNULL(convert(char(10),a.FechaContrato,103),'')as FechaContrato,a.IdPlazoPago	   ,      a.IdDiasPlazo			   ,
		      a.Factura				   ,      ISNULL(convert(char(10),a.FechaFactura,103),'')FechaFactura,ISNULL(convert(char(10),a.FechaVenFactura,103),'')FechaVenFactura        ,      a.IdEstadoPago		   ,
		      a.IdIncoterm			   ,      a.IdFletamiento		   ,      
		      ( Isnull(a.CantidadTM,0) - Isnull(a.Ajuste,0) - Isnull(a.Distrib,0) ) as CantidadTM		   ,      
		      a.PrecioUSDTM			   ,
		      a.FleteUSDTM			   ,      a.FOBUSD				   ,      a.SeguroUSD			   ,      
		      ( Isnull(a.CantidadTM,0) - Isnull(a.Ajuste,0) - Isnull(a.Distrib,0) )*a.PrecioUSDTM as TotalUSD			   ,
		      a.CantidadCNT			   ,      a.IdTipoCarga			   ,      a.IdTipoCarga02		   ,      a.IdPresentacion		   ,
		      ISNULL(a.PesoBBTM,0)PesoBBTM,a.IdMarca				   ,      a.MesEmbProg			   ,      a.FechaEmbProgIni		   ,
		      a.FechaEmbProgFin		   ,      a.FechaBL				   ,      a.FechaETDIni			   ,      a.FechaETD			   ,
		      a.IdConfirmaETD		   ,      a.FechaETAIni			   ,      a.FechaETA			   ,      a.IdConfirmaETA		   ,
		      ISNULL(convert(char(10),a.FechaIngAlmIni,103),'')FechaIngAlmIni, ISNULL(convert(char(10),a.FechaIngAlm,103),'')FechaIngAlm,a.IdConfirmaAlm,              
		      a.IdPuertoOrigen		   ,      a.IdPuertoDestino		   ,      a.IdTerminalMar		   ,      a.IdAlmacenDestino	   ,
		      a.BL					   ,      ISNULL(convert(char(10),a.BLFecha,103),'')BLFecha,    a.IdEmisionBL			   ,      a.Almacen				   ,
		      a.NaveOrigen			   ,      a.NaveDestino			   ,      a.IdNaviera			   ,      a.IdAgenteMaritimo	   ,
		      a.IdDireccionamiento	   ,      a.Manifiesto			   ,      ISNULL(convert(char(10),a.FecIniDescarga,103),'')FecIniDescarga,ISNULL(convert(char(10),a.FecFinDescarga,103),'')FecFinDescarga,
		      ISNULL(convert(char(10),a.FechaVB,103),'')FechaVB, ISNULL(convert(char(10),a.FechaDLVenc,103),'')FechaDL, a.FechaADVenc			   ,a.NroExpediente		   ,
		      a.NroDAM				   ,      ISNULL(convert(char(10),a.FechaDAM,103),'')FechaDAM,  ISNULL(a.IdTipoDespacho,'')IdTipoDespacho ,      a.IdCanalCEX			   ,
		      ISNULL(convert(char(10),a.FechaDAMLevante,103),'')FechaDAMLevante,ISNULL(a.OKDocEntregados,'')OKDocEntregados  ,      a.NroLicencia			   ,      
		      a.NroSuce				   ,      a.IdEstatusSucamec	   ,      ISNULL(convert(char(10),a.FechaInsSucamec,103),'')FechaInsSucamec,ISNULL(convert(char(10),a.FechaResSucamec,103),'')FechaResSucamec,
		      a.Observa				   ,      a.MotivosDemora		   ,      a.Observa2			   ,      a.IdRegimen			   ,
		      a.AlmacenAduana		   ,      a.OKCertificadoInsp	   ,      a.FechaRecCertificadoInsp,      a.OKIncidenciaInsp	   ,
		      a.OKObservaInsp		   ,      a.ObservaInsp			   ,      a.OKDocRecibidos		   ,      a.Estado				   ,
		      a.aud_usuact			   ,      a.aud_fecact			   ,      a.aud_usucre			   ,      a.aud_feccre			   ,
		      a.Ajuste				   ,      a.Distrib				   ,      ISNULL(convert(char(10),a.FechaAforo,103),'')FechaAforo,a.SolPed			   ,
		      a.OCompraSG			   ,      a.OCFechaApr			   ,      a.OCFechaIng			   ,      a.OCFechaPro			   ,
		      a.OCEstatus			   ,      a.Criticidad			   ,      a.Pareto				   ,      a.CodAnt				   ,
		      Z5.EstadoOC as OCEstatus ,      a.NroUniTrans		       ,      ISNULL(convert(char(10),a.FechaIngAlmEst,103),'')FechaIngAlmEst                ,a.pai_codpai,
				ISNULL(convert(char(10),a.FechaContrato,103),'')as FechaContratoC,
				ISNULL(a.IdClasificacionCEX,'') + ' - ' +ISNULL(a.IdFamiliaCEX,'') AS FamiliaTipo,
				ISNULL(convert(char(10),a.FechaVenFactura,103),'')as FechaVenFacturaC,
				ISNULL(convert(char(10),a.FechaBL,103),'')as FechaBLC,
				ISNULL(a.OKDocEntregados,'') as OKDocEntregados,
				ISNULL(prd.prd_codprd,'')  as prd_codprd, 
				ISNULL(etd.CantFechaETD,0) as CantFechaETD,
				ISNULL(eta.CantFechaETA,0) as CantFechaETA,  D.Estatus02,
				ISNULL(CAST(Year(A.FechaETD)AS CHAR(4)),'' ) as AñoE,                                        D.Seguimiento,
				Month(A.FechaIngAlm)as IDMesIngAlm,         B.ProductoCEX,                                   B.IDClasificacionMitsui,
				ISNULL(MA.mes_nommes,'') as MesIngAlm,                  ISNULL(Mes.mes_nommes,'')as MesLlegada,          Month(A.FechaETA)as IDMesLlegada,
				ISNULL(Year(A.FechaIngAlm),'')as AñoA,      ISNULL(Year(A.FechaETA),'')as AñoLlegada,        C.ProveedorCEX,
				ISNULL(E.TipoCarga,'') as TipoCarga,
				ISNULL(f.PuertoOrigen,'') as PuertoOrigen,
				ISNULL(g.PuertoDestino,'') as PuertoDestino,
				Isnull(H.Direccionamiento,'') as Direccionamiento,
				Isnull(i.CanalCEX,'') as CanalCEX,
				ISNULL(j.Incoterm,'') as Incoterm,
				ISNULL(k.EmisionBL,'') as EmisionBL,
				ISNULL(l.Naviera,'') as Naviera,
				ISNULL(m.Regimen,'') as Regimen,
				ISNULL(n.PresentacionCEX,'') as PresentacionCEX,
				ISNULL(o.PlazoPago,'') as PlazoPago,
				ISNULL(p.DiasPlazo,'') as DiasPlazo,
				ISNULL(q.EstadoPago,'') as EstadoP,
				ISNULL(r.TipoCarga02,'') as TipoCarga02,
				Isnull(s.ClasificacionMitsui,'') as ClasificacionMitsui,
				Isnull(t.Marca,'') as Marca,
				Isnull(u.Fletamiento,'') as Fletamiento,
				Isnull(v.PAI_NOMCOR,'') as Pais,
				Isnull(w.TerminalMar,'') as TerminalMar,
				Isnull(x.AlmacenDestino,'') as AlmacenDestino,
				(Case when Isnull(a.Criticidad,0)=1 Then 'URGENTE'
				     when Isnull(a.Criticidad,0)=2 Then 'MEDIA'
					 when Isnull(a.Criticidad,0)=3 Then 'BAJA'
					 Else '' End) as CriticidadD,
				(Case When Isnull(a.IdConfirmaAlm,0)=1 Then 'ESTIMADA'
				      When Isnull(a.IdConfirmaAlm,0)=2 Then 'CONFIRMADA'
				      Else '' End) as ConfirmaALM,
		        Isnull(Y1.ConfirmaFecha,'') as ConfirmaETD, Isnull(Y2.ConfirmaFecha,'') as ConfirmaETA, 
				Isnull(z1.AgenteMaritimo,'') as AgenteMaritimo,
				Isnull(z2.EmisionBL,'') as EmisionBL,
				Isnull(z3.TipoDespacho,'') as TipoDespacho,
				Isnull(z4.EstatusSucamec,'') as EstatusSucamec,
				0 as RatioDesAlmREF, 0 as RatioDesAlmREA, space(20) as CodigoDespacho, space(2) as OkDocEnt, space(2) as OkDocEnv, Space(10) as KPI,
				Isnull((Select top 1 DetalleLog From CEX_LogImportacion Where cia_codcia=a.cia_codcia and IdImportacion=a.IdImportacion Order by IdLogImp Desc),'') as Bitacora,
				Space(15) as RefComex,Z5.IdEstadoOC,Isnull(Z5.EstadoOC,'PENDIENTE')as EstadoOC
			From CEX_Importacion A
			Left Join Cex_ProductoCEX B on A.IdProductoCEX=B.IdProductoCEX
			Left Join Cex_ProveedorCEX C on A.IdProveedorCEX=C.IdProveedorCEX
			Left Join Cex_Seguimiento D on a.IdSeguimiento=d.IdSeguimiento
			Left Join Cex_TipoCarga E on a.IdTipoCarga=e.IdTipoCarga
			Left Join Cex_PuertoOrigen F on a.IdPuertoOrigen=f.IdPuertoOrigen
			Left Join Cex_PuertoDestino G on a.IdPuertoDestino=G.IdPuertoDestino
			Left Join CEX_Direccionamiento H on a.IdDireccionamiento = h.IdDireccionamiento
			left join CEX_CanalCEX I on a.IdCanalCEX=i.IdCanalCex
			left join CEX_Incoterm J on a.IdIncoterm=j.IdIncoterm
			left join CEX_EmisionBL K on a.IdEmisionBL=k.IdEmisionBL
			left join CEX_Naviera L on a.IdNaviera=l.IdNaviera
			left join CEX_Regimen M on a.IdRegimen=m.IdRegimen
			left join CEX_PresentacionCEX N on a.IdPresentacion=N.IdPresentacionCEX
			left join CEX_PlazoPago O on a.IdPlazoPago=o.IdPlazoPago
			left join CEX_DiasPlazo P on a.IdDiasPlazo=p.IdDiasPlazo
			left join CEX_EstadoPago Q on a.IdEstadoPago=q.IdEstadoPago
			Left Join CEX_TipoCarga02 R on a.IdTipoCarga02=r.IdTipoCarga02
			left join PRODUCTOS_PRD prd on a.prd_codepk=prd.prd_codepk
		    Left Join CEX_ClasificacionMitsui S on b.IDClasificacionMitsui=s.IdClasificacionMitsui
			Left Join CEX_Marca T on a.IdMarca=t.IdMarca
			Left Join CEX_TerminoFletamiento U on a.IdFletamiento=U.IdFletamiento
			Left Join pais_pai V on a.pai_codpai=v.PAI_CODPAI
			Left Join CEX_TerminalMar W on a.IdTerminalMar=w.IdTerminalMar
			Left Join CEX_AlmacenDestino X on a.IdAlmacenDestino=x.IdAlmacenDestino
			Left Join CEX_ConfirmaFecha Y1 on a.IdConfirmaETD=y1.IdConfirmaFecha
			Left Join CEX_ConfirmaFecha Y2 on a.IdConfirmaETA=y2.IdConfirmaFecha
			Left Join CEX_AgenteMaritimo Z1 on a.IdAgenteMaritimo=z1.IdAgenteMaritimo
			Left Join CEX_EmisionBL Z2 on a.IdEmisionBL=z2.IdEmisionBL
			Left Join CEX_TipoDespacho Z3 on a.IdTipoDespacho=z3.IdTipoDespacho
			Left Join CEX_EstatusSucamec Z4 on a.IdEstatusSucamec=z4.IdEstatusSucamec
			left join( select cia_codcia,IdImportacion,
						COUNT(IdImportacion) as CantFechaETD
				  from CEX_ImportacionETD 
				  group by cia_codcia,IdImportacion
			)as etd on a.cia_codcia=etd.cia_codcia and a.IdImportacion=etd.IdImportacion
			left join (select cia_codcia,IdImportacion,
						COUNT(IdImportacion) as CantFechaETA
				  from CEX_ImportacionETA 
				  group by cia_codcia,IdImportacion
			)as eta on a.cia_codcia=eta.cia_codcia and a.IdImportacion=eta.IdImportacion
			Left Join MESES_MES Mes on Month(A.FechaETA)=Convert(int,Mes.mes_codmes)
			Left Join MESES_MES MA  on Month(A.FechaINGALM)=Convert(int,MA.mes_codmes)
			Left Join CEX_EstadoOC Z5 on a.IdEstadoOC = Z5.IdEstadoOC
			Left join DocRec z6 on (a.cia_codcia = z6.cia_codcia and a.idImportacion = z6.IdImportacion)
			Left join DocEnv z7 on (a.cia_codcia = z7.cia_codcia and a.idImportacion = z7.IdImportacion)
		    Left Join (Select cia_codcia, idimportacion, max(nrosec) as maxsec,min(NroSec)as minsec from CEX_ImportacionETD group by cia_codcia, idimportacion ) dETD on (a.cia_codcia=dETD.cia_codcia and a.IdImportacion=dETD.IdImportacion)
	        Left Join CEX_ImportacionETD as maETD on a.cia_codcia=maETD.cia_codcia and a.IdImportacion=maETD.IdImportacion and dETD.maxsec=maETD.NroSec
	        Left Join CEX_ImportacionETD as miETD on a.cia_codcia=miETD.cia_codcia and a.IdImportacion=miETD.IdImportacion and dETD.maxsec= miETD.NroSec

		    Left Join (Select cia_codcia, idimportacion, max(nrosec) as maxsec,min(NroSec)as minsec from CEX_ImportacionETA group by cia_codcia, idimportacion ) dETA on (a.cia_codcia=dETA.cia_codcia and a.IdImportacion=dETA.IdImportacion)
	        Left Join CEX_ImportacionETA as miETA on a.cia_codcia=miETA.cia_codcia and a.IdImportacion=miETA.IdImportacion and dETA.minsec=miETA.NroSec
	        Left Join CEX_ImportacionETA as maETA on a.cia_codcia=maETA.cia_codcia and a.IdImportacion=maETA.IdImportacion and dETA.maxsec=maETA.NroSec
		