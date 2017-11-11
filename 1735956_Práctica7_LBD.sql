create procedure Factura 
(@cliente varchar, @venta varchar, @producto varchar)

as begin 

select * from dbo.Cliente
where Id_cliente = @cliente

@producto = (select id_producto from Id_Venta_Producto where id_venta = @venta)}
select nombre_producto from producto where id_producto = @producto

select Cantidad, precio, subtotal, fecha from dbo.Id_Venta_Producto
where id_cliente = @venta

where (select id_producto from Venta_Producto where id_venta = @venta)

end

create procedure facturasdia 
(@dia date)

as begin

select count (Fecha) as CantidadFacturas
from factura

where Fecha = @dia
end
exec facturasdia

create procedure GananciasPorDia
(@dia date)
as
begin 
	select Fecha, SUM (total) as Ganancias 
	from VentaTotal
	where fecha = @dia
	group by fecha
end
exec GananciasPorDia '2017-09-23'

create function descuento
(@descuento money, @id_venta varchar(255))

returns money

as

begin

	declare @cantidad int;
	
declare @precio money;
	
select @precio = v.total from VentaTotal v where @id_venta = id

	select @cantidad = @precio * @descuento

	return @precio - @cantidad 

end

select dbo.descuento(.5, '78017a46-3d60-4d84-bab3-2bceb8bd3fb6') as TotalConDescuento

create trigger VentaAgregada
on Id_venta_empleado
after insert
as
begin
	select ID_venta from inserted
end

create trigger TotalDespuesDeAgregarProducto
on Id_venta_producto
after insert 
as
declare @id_venta varchar(255)
select @id_venta = id_venta from inserted
begin
	select * from VentaTotal
	where id = @id_venta
end


insert into ID_Venta_empleado
values (newID(), 'A6182096-27E4-46B0-9BCD-947A311CE397')
insert into ID_venta_producto
values ('D2F58BB1-C86B-462C-AFB0-077E0FD678FD', 'b26f53e8-620a-44f0-81a3-44121b81e245', 1, 110, '2017-09-22')
insert into ID_venta_producto
values ('D2F58BB1-C86B-462C-AFB0-077E0FD678FD', 'b12be46c-1734-48bf-afdf-73043b5750e1', 1, 160, '2017-09-22')
insert into ID_venta_producto
values ('D2F58BB1-C86B-462C-AFB0-077E0FD678FD', '210a66a9-0e71-45d3-b076-10502a970096', 1, 86, '2017-09-22')

insert into Id_venta_empleado 
values (newID(), 'A6182096-27E4-46B0-9BCD-947A311CE397')
insert into id_venta_producto
values('7DCAD951-750E-4C38-A4F5-8869A7B544A8', '3730d75d-bbac-42cd-8685-89c53a9f325e', 1, 320, '2017-09-21')