-- Conectando ao BD:
-- use gabriel_miranda_biblioteca;

-- Selecionando a tabela de livros:
select * from livro;

-- Selecionando a tabela de emprestimos:
select * from emprestimo;

select *
from emprestimo
where dt_emprestimo >= '2023-01-01'
order by dt_emprestimo asc;

select *
from emprestimo
where dt_emprestimo >= '2023-01-01'
order by dt_emprestimo desc;

select *
from emprestimo
where dt_emprestimo >= '2023-01-01'
order by id_usuario desc;

select *
from emprestimo
where dt_emprestimo >= '2023-01-01'
order by id_usuario asc, dt_emprestimo desc;

-- Selecionando apenas algumas colunas:
select
	id_usuario,
    dt_emprestimo,
    dt_devolucao
from emprestimo
where dt_emprestimo >= '2023-01-01'
order by id_usuario asc, dt_emprestimo desc;

-- Trabalhando com datas:
-- Vamos calcular a diferença entre a data de devolução e de emprestimo.
select
	id_usuario,
    dt_emprestimo,
    dt_devolucao,
    -- Maneira incorreta:
    dt_devolucao - dt_emprestimo,
    -- Maneira correta:
    datediff(dt_devolucao, dt_emprestimo)
from emprestimo;

-- Renomeando as colunas e ordenando:
select
	id_usuario as 'ID Usuário',
    dt_emprestimo 'Data de Empréstimo',
    dt_devolucao 'Data de Devolução',
    datediff(dt_devolucao, dt_emprestimo) as 'Dias para Entrega'
from emprestimo
order by datediff(dt_devolucao, dt_emprestimo);
-- Também podemos ordenar pelo numero da coluna:
-- order by 5;

-- Separando a data:
select
	id_usuario,
    dt_emprestimo,
    year(dt_emprestimo) as ano,
    month(dt_emprestimo) as mes,
    day(dt_emprestimo) as dia
from emprestimo
order by dt_emprestimo, ano, mes, dia;
