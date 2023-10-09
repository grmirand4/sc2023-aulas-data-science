-- Criando index:
create index idx_dt_emprestimo on emprestimo (dt_emprestimo);

select * from emprestimo
where year(dt_emprestimo) = 2023;

-- Mostrar os processos:
show processlist;
-- Para encerrar um processo, basta dar kill id_processo:
kill 4245