-- Vamos criar uma view (salvando essa tabela na memória):

create view vw_qtd_diponivel_genero as
select
	g.nome_genero,
    sum(l.qtde_disponivel) as qtd_diponivel_genero
from genero g
inner join livro_genero lg on lg.id_genero = g.id_genero
inner join livro l on l.id_livro = lg.id_livro
group by g.nome_genero;

select * from vw_qtd_diponivel_genero;

-- É preciso verificar se as views são materializadas e atualizadas automaticamente.
-- Caso não forem, precisam ser dropadas e refeitas:
-- drop view vw_qtd_diponivel_genero
