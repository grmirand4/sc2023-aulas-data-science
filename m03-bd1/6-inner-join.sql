-- Inserindo um novo valor:

insert into usuario (cpf,
					 nome_usuario,
                     telefone_usuario,
                     dt_nascimento)
values ("123.456.777-00",
		"Gabriel Resende",
        "(71) 99987-5533",
        "1997-06-11");
        
select * from usuario;

-- ############## INNER JOIN
select
	u.nome_usuario,
    count(e.id_emprestimo) as qtd_emprestimo
from emprestimo e
inner join usuario u on e.id_usuario = u.id_usuario
group by u.nome_usuario
order by u.nome_usuario;
-- Observamos que o novo usuário adicionado, que não fez nenhum emprestimo, não aparece nessa tabela.

-- ############## LEFT JOIN

-- Nesse caso, "usuário" é nossa tabela da esquerda e "empréstimo" da direita
select
	u.nome_usuario,
    count(e.id_emprestimo) as qtd_emprestimo
from usuario u
left join emprestimo e on e.id_usuario = u.id_usuario
group by u.nome_usuario
order by u.nome_usuario;

-- Realizando o inner join de 3 tabelas.
-- Queremos agora encontrar quais os livros que cada usuário pegou emprestado.

select *
from usuario u
inner join emprestimo e on e.id_usuario = u.id_usuario
inner join livro_emprestimo le on le.id_emprestimo = e.id_emprestimo
inner join livro l on l.id_livro = le.id_livro;

-- Organizando:

select
	u.nome_usuario,
    -- Formatando a data:
    date_format(e.dt_emprestimo, "%d/%m/%Y") as dt_emprestimo,
    date_format(e.dt_devolucao, "%d/%m/%Y") as dt_devolucao,
    l.nome_livro,
    l.faixa_etaria
from usuario u
inner join emprestimo e on e.id_usuario = u.id_usuario
inner join livro_emprestimo le on le.id_emprestimo = e.id_emprestimo
inner join livro l on l.id_livro = le.id_livro;

-- Queremos agora organizar da seguinte forma:
-- . Fazer um inner join de usuário com emprestimo,
-- . Desse resultado, fazer um inner join com livro,
-- . Desse, fazer um inner join com autor.
-- Tentaremos, a partir disso, identificar os autores mais requisitados em empréstimos.
-- Outra forma de fazer inner join é utilizando WHERE:

select *
from
	usuario u,
	emprestimo e,
    livro_emprestimo le,
    livro l,
    livro_autor la,
    autor a,
    livro_genero lg,
    genero g
where
	u.id_usuario = e.id_usuario and
    e.id_emprestimo = le.id_emprestimo and
    le.id_livro - l.id_livro and
    l.id_livro = la.id_livro and
    la.id_autor = a.id_autor;
    
-- Organizando:

select
	u.nome_usuario,
    a.nome_autor,
    count(e.id_emprestimo) as qtd_vezes_autor_emprestado
from
	usuario u,
	emprestimo e,
    livro_emprestimo le,
    livro l,
    livro_autor la,
    autor a
where
	u.id_usuario = e.id_usuario and
    e.id_emprestimo = le.id_emprestimo and
    le.id_livro - l.id_livro and
    l.id_livro = la.id_livro and
    la.id_autor = a.id_autor
group by u.nome_usuario, a.nome_autor
order by u.nome_usuario, qtd_vezes_autor_emprestado;

-- Vamos verificar a quantidade de livros disponíveis por gênero:

select
    g.nome_genero,
    sum(l.qtde_disponivel) as qtd_diponivel_genero
from
	livro l,
    livro_genero lg,
    genero g
where
	g.id_genero = lg.id_genero
    and lg.id_livro = l.id_livro
group by g.nome_genero;

-- Outra forma, usando INNER JOIN:

select
	g.nome_genero,
    sum(l.qtde_disponivel) as qtd_diponivel_genero
from genero g
inner join livro_genero lg on lg.id_genero = g.id_genero
inner join livro l on l.id_livro = lg.id_livro
group by g.nome_genero;