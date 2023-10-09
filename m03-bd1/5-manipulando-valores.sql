-- Manipulando valores:
select
	cpf,
    replace(cpf, '.', '') as cpf_sem_pontos,
    replace(replace(cpf, '.', ''), '-', '') as cpf_numeros,
    nome_usuario,
    upper(nome_usuario) as nome_caixa_alta,
    lower(nome_usuario) as nome_caixa_baixa,
    dt_nascimento
from usuario;

select
	cpf,
    nome_usuario,
    -- Data atual
    curdate(),
    -- Data atual com horas
    now(),
    -- Calculando idade (em dias):
    datediff(curdate(), dt_nascimento) as idade_dias,
    -- Calculando idade (em anos):
    round(datediff(curdate(), dt_nascimento)/365) as idade_anos
from usuario
where year(dt_nascimento) >= '2000';

select
	cpf,
    nome_usuario,
    dt_nascimento
from usuario
where month(dt_nascimento) in (9,10,11)
-- where month(dt_nascimento) >=9 and month(dt_nascimento) <= 11
-- where month(dt_nascimento) between 9 and 11
-- where month(dt_nascimento) between 9 and 11
order by dt_nascimento;

select
	cpf,
    nome_usuario,
    dt_nascimento
from usuario
where month(dt_nascimento) = 1 or month(dt_nascimento) = 11;

select
	cpf,
    nome_usuario,
    dt_nascimento
from usuario
where month(dt_nascimento) <> 1