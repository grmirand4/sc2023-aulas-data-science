-- INNER JOIN
select
	p.nome_produto,
    c.nome_categoria
from produto p
inner join categoria c on c.id_categoria = p.id_categoria;

-- LEFT JOIN
select
	p.nome_produto,
	c.nome_categoria
from categoria c
left join produto p on p.id_categoria = c.id_categoria;

-- RIGHT JOIN
select
	c.nome_categoria,
    p.nome_produto
from categoria c
right join produto p on p.id_categoria = c.id_categoria;

-- FULL JOIN
-- O mysql não tem um comando para full join no estilo dos outros.
-- Precisamos fazer uma união manual.
select
	c.nome_categoria,
	p.nome_produto
from categoria c
left join produto p on p.id_categoria = c.id_categoria

union all

select
	c.nome_categoria,
	p.nome_produto
from categoria c
right join produto p on p.id_categoria = c.id_categoria;

-- O comando UNION ALL pode ser usado também para outros comandos
-- Restricao: os comandos a serem unidos precisam ter a mesma quantidade de colunas
-- O aliás padrão será referente à primeira consulta.

select
	p.id_produto,
	p.nome_produto
from produto p
union all
select
	c.id_categoria,
	c.nome_categoria
from categoria c;

-- CROSS JOIN
select
	c.nome_categora,
	p.nome_produto
from categoria c
cross join produto p