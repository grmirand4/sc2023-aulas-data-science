-- Criando um novo delimitador
delimiter //

-- Criando um trigger que será acionado após algo ser inserido na tabela produto
create trigger atualiza_log_insercao_produto
after insert on produto
for each row begin
	insert into log (
		data_hora,
        usuario,
        acao
    )
    values (
		now(),
        user(),
        "novo produto inserido"
    );
end;
//

CREATE DEFINER = CURRENT_USER TRIGGER `gabriel_miranda_teste`.`produto_BEFORE_UPDATE` BEFORE UPDATE ON `produto` FOR EACH ROW
BEGIN
	insert into log (
		data_hora,
        usuario,
        acao
    )
    values (
		now(),
        user(),
        "tentativa de atualização de produto"
    );
END;
//

delimiter ;