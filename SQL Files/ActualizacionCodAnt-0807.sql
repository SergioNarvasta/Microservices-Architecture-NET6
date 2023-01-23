Select CodAnt,CodigoImportacion,IdImportacion ,substring(CodigoImportacion,1,2)+'-'+substring(CodigoImportacion,3,3) +
Case When (substring(CodigoImportacion,6,1))!= '0' Then substring(CodigoImportacion,6,1) Else '' End +
Case When cast(substring(CodigoImportacion,7,2)as int) >0 Then '.'+ cast(cast(substring(CodigoImportacion,7,2)as int)as char(1)) Else '' End + '/'+    substring(cast(Año as char(4)),3,2)
from CEX_Importacion
WHERE CodAnt !=substring(CodigoImportacion,1,2)+'-'+substring(CodigoImportacion,3,3) +
Case When (substring(CodigoImportacion,6,1))!= '0' Then substring(CodigoImportacion,6,1) Else '' End +
Case When cast(substring(CodigoImportacion,7,2)as int) >0 Then '.'+ cast(cast(substring(CodigoImportacion,7,2)as int)as char(1)) Else '' End + '/'+    substring(cast(Año as char(4)),3,2)
order by CodigoImportacion, IdImportacion
GO


Update CEX_Importacion
SET CodAnt = substring(CodigoImportacion,1,2)+'-'+substring(CodigoImportacion,3,3) +
Case When (substring(CodigoImportacion,6,1))!= '0' Then substring(CodigoImportacion,6,1) Else '' End +
Case When cast(substring(CodigoImportacion,7,2)as int) >0 Then '.'+ cast(cast(substring(CodigoImportacion,7,2)as int)as char(1)) Else '' End + '/'+    substring(cast(Año as char(4)),3,2)
from CEX_Importacion
WHERE CodAnt !=substring(CodigoImportacion,1,2)+'-'+substring(CodigoImportacion,3,3) +
Case When (substring(CodigoImportacion,6,1))!= '0' Then substring(CodigoImportacion,6,1) Else '' End +
Case When cast(substring(CodigoImportacion,7,2)as int) >0 Then '.'+ cast(cast(substring(CodigoImportacion,7,2)as int)as char(1)) Else '' End + '/'+    substring(cast(Año as char(4)),3,2)