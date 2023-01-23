
---********** ETD *********

Select a.NroSec , a.FechaETD ,ISNULL(b.IdConfirmaFecha,0)as Tipo,(miETD.FechaETD) as miETD, (maETD.FechaETD) as maETD
From CEX_ImportacionETD a
left join CEX_ConfirmaFecha b on a.IdConfirmaFecha = b.IdConfirmaFecha
Left Join (Select cia_codcia, idimportacion, max(nrosec) as masec,min(nrosec)as misec from CEX_ImportacionETD group by cia_codcia, idimportacion ) as maxETD on (a.cia_codcia=maxETD.cia_codcia and a.IdImportacion=maxETD.IdImportacion)
Left Join CEX_ImportacionETD as maETD on a.cia_codcia=maETD.cia_codcia and a.IdImportacion=maETD.IdImportacion and maxETD.masec=maETD.NroSec
Left Join CEX_ImportacionETD as miETD on a.cia_codcia=miETD.cia_codcia and a.IdImportacion=miETD.IdImportacion and maxETD.misec=miETD.NroSec
where a.cia_codcia = 1 and a.IdImportacion = 1880 
group by a.NroSec, a.FechaETD, b.IdConfirmaFecha ,maETD.FechaETD, miETD.FechaETD

--************* ETA ********

Select a.NroSec , a.fechaETA ,ISNULL(b.ConfirmaFecha,0)as Tipo,(miETA.FechaETA) as miETA, (maETA.FechaETA) as maETA
From CEX_ImportacionETA a
left join CEX_ConfirmaFecha b on a.IdConfirmaFecha = b.IdConfirmaFecha
Left Join (Select cia_codcia, idimportacion, max(nrosec) as masec,min(nrosec)as misec from CEX_ImportacionETA group by cia_codcia, idimportacion ) as dETA on (a.cia_codcia=dETA.cia_codcia and a.IdImportacion=dETA.IdImportacion)
Left Join CEX_ImportacionETA as maETA on a.cia_codcia=maETA.cia_codcia and a.IdImportacion=maETA.IdImportacion and dETA.masec=maETA.NroSec
Left Join CEX_ImportacionETA as miETA on a.cia_codcia=miETA.cia_codcia and a.IdImportacion=miETA.IdImportacion and dETA.misec=miETA.NroSec
where a.cia_codcia = 1 and a.IdImportacion = 1880 
group by a.NroSec, a.fechaETA, b.ConfirmaFecha ,maETA.FechaETA, miETA.FechaETA

--select *from CEX_ConfirmaFecha
select CodigoImportacion,FechaIngAlmEst from CEX_Importacion
GO
--*************** ING ALM ********
Select IdConfirmaFecha From CEX_ImportacionING

Select a.NroSec, a.fechaING,A.Cantidad,A.NroCntVia,ISNULL(A.NroBigBag,0)as NroBB, ISNULL(a.IdConfirmaFecha,0)as Tipo,(miING.FechaING) as miING, (maING.FechaING) as maING
From CEX_ImportacionING a
left join CEX_ConfirmaFecha b on a.IdConfirmaFecha = b.IdConfirmaFecha
Left Join (Select cia_codcia, idimportacion, max(nrosec) as masec,min(nrosec)as misec from CEX_ImportacionING group by cia_codcia, idimportacion ) as dING on (a.cia_codcia=dING.cia_codcia and a.IdImportacion=dING.IdImportacion)
Left Join CEX_ImportacionING as maING on a.cia_codcia=maING.cia_codcia and a.IdImportacion=maING.IdImportacion and dING.masec=maING.NroSec
Left Join CEX_ImportacionING as miING on a.cia_codcia=miING.cia_codcia and a.IdImportacion=miING.IdImportacion and dING.misec=miING.NroSec
where a.cia_codcia = 1 and a.IdImportacion = 1880 
group by a.NroSec, a.fechaING, a.IdConfirmaFecha ,maING.FechaING, miING.FechaING,A.Cantidad,A.NroCntVia,A.NroBigBag

