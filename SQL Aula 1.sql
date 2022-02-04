--Exemplo de comentarios

-- comentario de linha 

/*comentario de bloco
sas
ses
sis
*/

--CRIAÇÃO DAS TABELAS:
create table Marca
(cd_marca 	integer,
ds_marca 	varchar(30)
);

create table Modelo
(cd_modelo 	integer,
cd_marca 	integer,
ds_modelo 	varchar(50)
);

create table Localidade
(cd_localidade 	integer,
ds_localidade 	varchar(50)
);

create table Proprietario
(cd_proprietario 	integer,
cd_localidade 		integer,
nm_proprietario 	varchar(50),
ds_logradouro 		varchar(50),
ds_complemento 		varchar(50),
ds_bairro 			varchar(50),
nr_telefone 		varchar(15),
ds_email 			varchar(50),
sg_uf 				char(2)
);
-- E como adicionar um atributo a uma tabela que
-- já existe?
-- "alter table"
alter table Proprietario
add ds_telegram varchar(50);

-- E para alterar o tamanho da coluna? Modify
alter table Proprietario
modify ds_telegram varchar (30);

-- para remover uma coluna
alter table Proprietario
drop ds_telegram;


create table Veiculo
(nr_placa 		char(7),
cd_proprietario integer,
cd_modelo 		integer,
nr_ano_fab 		integer,
nr_ano_mod 		integer,
qt_km_rodado 	integer,
qt_portas 		integer,
ds_observacao 	varchar(100)
);

create table Combustivel
(cd_combustivel integer,
ds_combustivel	varchar(30)
);

create table Veiculo_Combustivel
(cd_combustivel integer,
nr_placa char(7)
);

create table novo_proprietario
as
	select *
	from Proprietario
-- Cria uma nova tabela, igual a proprietario

-- DESTRUIÇÃO DAS TABELAS:
  -- DROP TABLE deleta a tabela definitivamente,
  -- não tem como voltar atrás.
  
drop table Veiculo;
drop table Veiculo_Combustivel;
drop table Combustivel
drop table Proprietario
drop table Localidade
drop table Modelo;
drop table Marca;
delete table Marca;
	-- **lembrar de por ; no final** ;)
	
/* 	DROP TABLE = Exclui a tabela
	DELETE TABLE = Limpa/Reseta a tabela

	ALTER TABLE = Modifica a tabela
	UPDATE TABLE = Atualiza a tabela
	
	
	
*/