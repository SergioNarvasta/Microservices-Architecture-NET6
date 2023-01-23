
-- Fechas ETD
  UPDATE CEX_Importacion 
 SET FechaETDIni = b.FechaETD
FROM  (
      SELECT miETD.fechaETD as FechaETD,A.IdImportacion as IdImp FROM CEX_Importacion A
	  LEFT JOIN (Select cia_codcia, idimportacion, max(nrosec) as maxsec,min(NroSec)as minsec from CEX_ImportacionETD group by cia_codcia, idimportacion ) dETD on (a.cia_codcia=dETD.cia_codcia and a.IdImportacion=dETD.IdImportacion)
      --Left Join CEX_ImportacionETD as maETD on a.cia_codcia=maETD.cia_codcia and a.IdImportacion=maETD.IdImportacion and dETD.maxsec=maETD.NroSec
      Left Join CEX_ImportacionETD as miETD on a.cia_codcia=miETD.cia_codcia and a.IdImportacion=miETD.IdImportacion and dETD.minsec= miETD.NroSec
 )AS B
 WHERE IdImportacion = B.IdImp and Año =2021 and FechaETDIni != b.FechaETD
 
 
 -- Fechas ETA
 UPDATE CEX_Importacion 
 SET FechaETAIni = b.FechaETA
FROM  (
     SELECT miETA.fechaETA as FechaETA,A.IdImportacion as IdImp FROM CEX_Importacion A
	 Left Join (Select cia_codcia, idimportacion, max(nrosec) as maxsec,min(NroSec)as minsec from CEX_ImportacionETA group by cia_codcia, idimportacion ) dETA on (a.cia_codcia=dETA.cia_codcia and a.IdImportacion=dETA.IdImportacion)
	 --Left Join CEX_ImportacionETA as maETA on a.cia_codcia=maETA.cia_codcia and a.IdImportacion=maETA.IdImportacion and dETA.maxsec=maETA.NroSec
	 Left Join CEX_ImportacionETA as miETA on a.cia_codcia=miETA.cia_codcia and a.IdImportacion=miETA.IdImportacion and dETA.minsec=miETA.NroSec
 )AS B
 WHERE IdImportacion = B.IdImp
 
--Verificar Data
 	 
 SELECT  IdImportacion,FechaETAIni,FechaETA,FechaETDIni,FechaETD
FROM CEX_Importacion A
GO
