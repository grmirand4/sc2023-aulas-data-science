-- Exibindo algumas colunas da tabela empréstimo
-- Realizando um join com a tabela de usuário usando a chave estrangeira id_usuario
select
	nome_usuario,
    dt_emprestimo,
    dt_devolucao,
    datediff(dt_devolucao, dt_emprestimo) as dias_devolucao
from emprestimo
join usuario on usuario.id_usuario = emprestimo.id_usuario;

-- Caso queiramos exibir o valor de uma chave estrangeira que tem o mesmo nome em ambas as tabelas, precisamos especificar:
select
	usuario.id_usuario,
	nome_usuario,
    dt_emprestimo,
    dt_devolucao,
    datediff(dt_devolucao, dt_emprestimo) as dias_devolucao
from emprestimo
join usuario on usuario.id_usuario = emprestimo.id_usuario;

-- Podemos colocar aliases em tabelas:
select
	u.id_usuario,
	u.nome_usuario,
    e.dt_emprestimo,
    e.dt_devolucao,
    datediff(e.dt_devolucao, e.dt_emprestimo) as dias_devolucao
from emprestimo e
join usuario u on u.id_usuario = e.id_usuario
where year(e.dt_emprestimo) = 2023
-- Pegando pessoas cujo nome de usuário comecem com a letra "a"
and lower(u.nome_usuario) not like "a%"
order by dias_devolucao desc;

select
	u.id_usuario,
	u.nome_usuario,
    e.dt_emprestimo,
    e.dt_devolucao,
    datediff(e.dt_devolucao, e.dt_emprestimo) as dias_devolucao
from emprestimo e
join usuario u on u.id_usuario = e.id_usuario
where
	year(e.dt_emprestimo) = 2023
	-- Pegando pessoas cujo sobrenome seja "Silva"
	and substring_index(u.nome_usuario, ' ', -1) like "Silva"
order by dias_devolucao desc;

