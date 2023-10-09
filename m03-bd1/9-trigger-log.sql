create table log(
	id_log int auto_increment primary key,
    data_hora datetime,
    usuario varchar(200),
    acao varchar(200)
)