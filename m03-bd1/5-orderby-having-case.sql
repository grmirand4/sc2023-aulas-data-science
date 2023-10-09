-- Selecionando a quantidade distintas de usuários que já fizeram emprestimo:
select
	distinct id_usuario as usuarios
from emprestimo;

-- Exibindo algumas informações relevantes da tabela
select count(id_emprestimo) as qtde_emprestimo,
       count(distinct id_usuario) as qtde_usuarios_disintos,
       min(dt_emprestimo) as primeiro_emprestimo,
       max(dt_emprestimo) as ultimo_emprestimo
from emprestimo;

-- Limitando a quantidade de registros a serem exibidos:
select *
from emprestimo
limit 3;

-- ORDER BY

-- Selecionando quantidade de emprestimo por usuario:
select
	id_usuario,
	count(id_emprestimo) as qtd_emprestimos
from emprestimo
group by id_usuario;

select
	id_usuario,
	count(id_emprestimo) as qtd_emprestimos
from emprestimo
where year(dt_emprestimo) = 2023
group by id_usuario;

-- Limitar uma quantidade usando orderby não pode ser feita assim (resulta em erro):
select
	id_usuario,
	count(id_emprestimo) as qtd_emprestimos
from emprestimo
where year(dt_emprestimo) = 2023 and qtd_emprestimos >= 2
group by id_usuario;

-- Funções de contagem junto com "order by" precisam de usar "having"
select
	id_usuario,
	count(id_emprestimo) as qtd_emprestimos
from emprestimo
where year(dt_emprestimo) = 2023
group by id_usuario
having qtd_emprestimos > 2
order by qtd_emprestimos;

-- Obtendo a média de dias que cada usuário levou para realizar as devoluções:
select
	id_usuario,
    count(id_emprestimo) as qtd_emprestimos,
	avg(datediff(dt_devolucao, dt_emprestimo)) as media_dias_devolucao,
    min(datediff(dt_devolucao, dt_emprestimo)) as devolucao_mais_rapida,
    max(datediff(dt_devolucao, dt_emprestimo)) as devolucao_mais_demorada
from emprestimo
group by id_usuario;

-- Adicionando uma condicional:
select id_usuario,
	avg(datediff(dt_devolucao, dt_emprestimo)) as media_dias_devolucao,
	min(datediff(dt_devolucao, dt_emprestimo)) as devolucao_mais_rapida,
	max(datediff(dt_devolucao, dt_emprestimo)) as devolucao_mais_demorada,
	count(id_emprestimo) as qtde_emprestimo,
	case
		when count(id_emprestimo) <=10 then 'Cliente Bronze' 
		when count(id_emprestimo) >= 11 and count(id_emprestimo) <= 15 then 'Cliente Prata'
		when count(id_emprestimo) >= 16 then 'Cliente Ouro'
		else 'Não há classificação' end as categoria
from emprestimo
group by id_usuario
order by categoria;