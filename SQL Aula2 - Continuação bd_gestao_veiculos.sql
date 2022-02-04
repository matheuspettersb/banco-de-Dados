create table Cor
(cd_cor int,
ds_cor varchar(30)
);

create table Veiculo_Acessorio
(nr_placa char(7),
cd_acessorio int
);

create table Acessorio
(cd_acessorio int,
ds_acessorio varchar(50)
);


--adicionando restrições
alter table Localidade
add constraint localidade_cd_localidade_pk
	primary key (cd_localidade);
	
alter table Marca
add constraint marca_cd_marca_pk
	primary key (cd_marca);
	
alter table Combustivel
add constraint combustivel_cd_combustivel_pk
	primary key (cd_combustivel);
	
alter table Modelo
add constraint modelo_cd_modelo_pk
	primary key (cd_modelo);
	
alter table Proprietario
add constraint proprietario_cd_proprietario_pk
	primary key (cd_proprietario);
	
alter table veiculo_combustivel
add constraint veic_comb_cd_comb_nr_placa_pk
	primary key (cd_combustivel, nr_placa);

alter table acessorio
add constraint acessorio_cd_acessorio_pk
	primary key (cd_acessorio);

alter table cor
add constraint cor_cd_cor_pk
	primary key (cd_cor);

alter table veiculo
add constraint veiculo_nr_placa_pk
	primary key (nr_placa);
	
alter table veiculo_acessorio
add constraint veic_acss_nr_placa_cd_aces_pk
	primary key (nr_placa, cd_acessorio);
	
--adicionando restrições de fk
--proprietario
alter table proprietario
add constraint proprietario_cd_localidade_fk
	foreign key (cd_localidade)
	references localidade(cd_localidade);

--veiculo	
alter table veiculo
add column cd_cor int;

alter table veiculo
add constraint veiculo_cd_cor_fk
	foreign key (cd_cor)
	references cor(cd_cor);
	
alter table veiculo
add constraint veic_cd_modelo_fk
	foreign key (cd_modelo)
	references modelo(cd_modelo)

alter table veiculo
add constraint veic_cd_proprietario_fk
	foreign key (cd_proprietario)
	references proprietario(cd_proprietario);

--veiculo_acessorio
alter table veiculo_acessorio
add constraint veic_aces_nr_placa_fk
foreign key (nr_placa)
references veiculo(nr_placa)
,
add constraint veic_aces_cd_acessorio_fk
foreign key (cd_acessorio)
references acessorio(cd_acessorio);

--veiculo_combustivel
alter table veiculo_combustivel
add constraint veic_comb_nr_placa_fk
foreign key (nr_placa)
references veiculo(nr_placa);

alter table veiculo_combustivel
add constraint veic_comb_cd_comb_fk
foreign key (cd_combustivel)
references combustivel(cd_combustivel);

--modelo
alter table modelo
add constraint modelo_cd_marca_fk
	foreign key (cd_marca)
	references marca(cd_marca);





























