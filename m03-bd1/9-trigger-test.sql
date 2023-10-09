select * from produto p
left join categoria c on c.id_categoria = p.id_categoria;

insert into produto (id_categoria, produto)
values
	(1, "pasta de dente"),
    (1, "amaciante");

update produto
set produto = "sabão em barra"
where id_produto = 9;

select * from log;