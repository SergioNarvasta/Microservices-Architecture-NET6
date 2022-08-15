Select * From CEX_Documento
Select * From CEX_ImportacionENV
Select * From CEX_ImportacionREC

Select  a.*,b.documento   From  CEX_ImportacionRec a     
    left join CEX_Documento b on a.cia_codcia = b.cia_codcia and a.Id_Doc = b.iddocumento 
	Where a.cia_codcia = 1 and a.IdImportacion=2077	
	--2076 NO tiene registros	