use EncuestaMacro
go

if object_id('sp_listar_preguntas') is not null
	drop procedure sp_listar_preguntas
go

/*====================================================================================
--autor:		  jsarango
--Fecha creacion: 11/03/2023
--Descripcion:    Obtiene preguntas.
--====================================================================================*/
create procedure sp_listar_preguntas
(
	@codigo  int = -1
)
as
	select pre.IdPregunta	as IdPregunta,
			pre.Pregunta	as Pregunta,
			cat.IdCategoria as IdCategoria,
			cat.Categoria	as Categoria,
			es.ValorInicial	as ValorInicial,
			es.ValorFinal	as ValorFinal
	from preguntas pre
		join categorias cat
		on ( pre.IdCategoriaFK = cat.IdCategoria)
		join escalas es
		on (es.IdEscala=cat.IdEscalaFk)
	where ( pre.IdPregunta = @codigo or @codigo = -1 ) 
go
