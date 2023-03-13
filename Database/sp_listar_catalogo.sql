use EncuestaMacro
go

if object_id('sp_listar_catalogo') is not null
	drop procedure sp_listar_catalogo
go

/*====================================================================================
--autor:		  jsarango
--Fecha creacion: 11/03/2023
--Descripcionn:    Obtiene clientes.
--====================================================================================*/
create procedure sp_listar_catalogo
(
	@codigo			int,
	@tipo			varchar(45)
)
as

	if @tipo = 'provincias'
	begin 
	
		select 	IdProvincia as Codigo,
				Nombre 		as Descripcion
		from provincias
		
	end 


	if @tipo = 'cantones'
	begin
		select 	c.IdCanton 	as Codigo, 
				c.Nombre 	as Descripcion
		from cantones c
			join provincias p
				on (c.IdProvinciaFK=p.IdProvincia)
		where c.IdProvinciaFK = @codigo
	end

	if @tipo = 'sucursales'
	begin
	
		select 	su.IdSucursal 	as Codigo, 
				su.Sucursal 	as Descripcion
		from sucursales su
			 join cantones c
				on ( c.IdCanton = su.IdCantonFK )
		where su.IdCantonFK = @codigo

	end

    if @tipo = 'escala'
	begin
				
       select 	IdEscala as Codigo,
				ValorInicial 		as AFIRMATIVO,
				ValorFinal as NEGATIVO,
				IdCategoria as Categoria
		from escalas
	end

    if @tipo = 'categorias'
	begin
				
         select 	IdCategoria as Codigo,
					Categoria 	as Descripcion
		from categorias
	end

go




