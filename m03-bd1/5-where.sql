select *
from usuario
-- Selecionando "Silva" em qualquer lugar da string:
-- where nome_usuario like '%Silva%'
-- Apenas string terminada em "Silva":
where nome_usuario like '%Silva';

select *
from usuario
where nome_usuario like '%a%';

select *
from usuario
where cpf is not null;

-- Filtrando diversas possibilidades:
select *
from usuario
where cpf not in (null, 'null', '', ' ', '-');

-- Se pensarmos que cpf pode vir como "       ", precisamos fazer o seguinte:
-- trim() elimina os espaços no início e no fim da palavra, por exemplo:
-- trim("     gabriel resende ") == "gabriel resende"
-- Assim, precisamos fazer:
select *
from usuario
where trim(cpf) not in (null, 'null', '', ' ', '-');

-- Selecionando o último sobrenome dos usuários:
select
	nome_usuario,
	substring_index(nome_usuario, ' ', -1) as sobrenome
from usuario