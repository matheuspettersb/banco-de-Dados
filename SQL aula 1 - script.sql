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