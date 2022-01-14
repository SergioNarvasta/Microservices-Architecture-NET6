insert into Transaccion (FechaTransaccion,Monto,Nota,TipoTransaccionId,UsuarioId)
values ('2020-02-13',2900,'Borrar',1,'Pedro'),
('2020-09-18',1750,'Borrar',1,'Jose')

update Transaccion
set Nota ='Nota actualizada'
where Id=3

delete Transaccion
where Id=10

select*from Transaccion

select*from Transaccion
where UsuarioId in('Jose','Juan')

select*from Transaccion
where Monto in(2500,3500)

select*from Transaccion
where UsuarioId like '%j%' and Monto>1500
order by Monto desc

select*from Transaccion
where (Monto in(2500,3500)) or(UsuarioId='Juan')

select*from Transaccion
where FechaTransaccion between '2021-06-01' and '2021-11-01'

select*from Transaccion
where YEAR(FechaTransaccion) =2020

select*from Transaccion
where Month(FechaTransaccion) between 5 and 12

select top 5 *
from Transaccion

select top 50 Percent *
from Transaccion


select sum(Monto) as Suma,UsuarioId
from Transaccion 
group by UsuarioId

select sum(Monto) as Suma
from Transaccion 
where UsuarioId ='Juan'

select *from Transaccion
where UsuarioId ='Juan'

select sum(Monto)'Suma',UsuarioId,TipoTransaccionId
from Transaccion
group by UsuarioId,TipoTransaccionId
order by UsuarioId

select count(*)
from Transaccion

select count(*)'Cantidad',UsuarioId,AVG(Monto)as promedio
from Transaccion
group by UsuarioId
go

select t.UsuarioId,t.Monto,t.FechaTransaccion,TipoOperacion.Descripcion 
from
Transaccion t inner join TipoOperacion  ON
t.TipoOperacionId=TipoOperacion.Id

exec Transacciones_SelecttipoOperacion