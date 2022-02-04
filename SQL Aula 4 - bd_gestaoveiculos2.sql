CREATE TABLE marca
(cd_marca INTEGER,
ds_marca VARCHAR(30)
);

-- tabela modelo
CREATE TABLE modelo
(cd_modelo INTEGER,
cd_marca INTEGER,
ds_modelo VARCHAR(50)
);

-- tabela combustivel
CREATE TABLE combustivel
(cd_combustivel INTEGER,
ds_combustivel VARCHAR(30)
);
-- tabela veículo_combustível
CREATE TABLE veiculo_combustivel
( cd_combustivel INTEGER,
nr_placa CHAR(7)
);

-- tabela veículo
CREATE TABLE veiculo
(nr_placa CHAR(7),
cd_proprietario INTEGER,
cd_modelo INTEGER,
nr_ano_fab INTEGER,
nr_ano_mod INTEGER,
qt_km_rodado INTEGER,
qt_portas INTEGER,
ds_observacao VARCHAR(100)
);

-- tabela localidade
CREATE TABLE localidade
(cd_localidade INTEGER,
nm_localidade VARCHAR(50)
);

-- tabela proprietario
CREATE TABLE proprietario
(cd_proprietario INTEGER,
cd_localidade INTEGER,
nm_proprietario VARCHAR(50),
ds_logradouro VARCHAR(50),
ds_complemento VARCHAR(50),
ds_bairro VARCHAR(50),
nr_telefone VARCHAR(50),
ds_email VARCHAR(50),
sg_uf CHAR(2)
);

/* alterando as tabelas com indicação das PK */

ALTER TABLE localidade
ADD CONSTRAINT localidade_cd_localidade_pk
PRIMARY KEY (cd_localidade);

ALTER TABLE marca
ADD CONSTRAINT marca_cd_marca_pk
PRIMARY KEY (cd_marca);
ALTER TABLE combustivel
ADD CONSTRAINT combustivel_cd_combustivel_pk
PRIMARY KEY (cd_combustivel);

ALTER TABLE modelo
ADD CONSTRAINT modelo_cd_modelo_pk
PRIMARY KEY (cd_modelo);

ALTER TABLE proprietario
ADD CONSTRAINT proprietario_cd_proprietario_pk
PRIMARY KEY (cd_proprietario);

ALTER TABLE veiculo
ADD CONSTRAINT veiculo_nr_placa_pk
PRIMARY KEY (nr_placa);
ALTER TABLE veiculo_combustivel
ADD CONSTRAINT veic_comb_cd_comb_nr_placa_pk
PRIMARY KEY (cd_combustivel, nr_placa);

/* adicionando as FKs nas tabelas */

ALTER TABLE modelo
ADD CONSTRAINT modelo_cd_marca_fk
FOREIGN KEY (cd_marca) REFERENCES marca(cd_marca);

ALTER TABLE proprietario
ADD CONSTRAINT proprietario_cd_localidade_fk
FOREIGN KEY (cd_localidade) REFERENCES localidade(cd_localidade);

ALTER TABLE veiculo_combustivel
ADD CONSTRAINT veic_comb_cd_combustivel_fk
FOREIGN KEY (cd_combustivel) REFERENCES combustivel (cd_combustivel);
ALTER TABLE veiculo_combustivel
ADD CONSTRAINT veic_comb_nr_placa_fk
FOREIGN KEY (nr_placa) REFERENCES veiculo (nr_placa);
/* OU no mesmo comando de ALTER a adição das 2 FKs
ALTER TABLE veiculo_combustivel
ADD CONSTRAINT veic_comb_cd_combustivel_fk
FOREIGN KEY (cd_combustivel) REFERENCES combustivel (cd_combustivel),
ADD CONSTRAINT veic_comb_nr_placa_fk
FOREIGN KEY (nr_placa) REFERENCES veiculo (nr_placa);
*/
alter table veiculo
add constraint veiculo_cd_proprietario_fk
foreign key (cd_proprietario) references proprietario(cd_proprietario);

alter table veiculo
add constraint veiculo_cd_modelo_fk
foreign key (cd_modelo) references modelo (cd_modelo);

-- adicionando uma coluna na tabela veiculo

alter table veiculo
add cd_cor integer;
-- criando a tabela cor
create table cor
(cd_cor integer,
ds_cor varchar(30),
constraint cor_cd_cor_pk primary key (cd_cor)
);

-- alterando a tabela veiculo para adicionar a fk para a tabela cor
alter table veiculo
add constraint veiculo_cd_cor_fk
foreign key (cd_cor) references cor(cd_cor);
-- criando a tabela acessorio
create table acessorio
(cd_acessorio integer,
ds_acessorio varchar(50),
constraint acessorio_pk primary key (cd_acessorio)
);

create table veiculo_acessorio
(nr_placa char(7),
cd_acessorio integer,
constraint veic_acess_nr_placa_cd_acess_pk
primary key(nr_placa, cd_acessorio)
);

alter table veiculo_acessorio
add constraint veic_acess_nr_placa_fk
foreign key (nr_placa) references veiculo (nr_placa);

alter table veiculo_acessorio
add constraint veic_acess_cd_acessorio_fk
foreign key (cd_acessorio) references acessorio (cd_acessorio);
INSERT INTO localidade (cd_localidade, nm_localidade)
VALUES(1, 'Blumenau');
INSERT INTO localidade (cd_localidade, nm_localidade)
VALUES(2, 'Gaspar');
INSERT INTO localidade (cd_localidade, nm_localidade)
VALUES(3, 'Timbó');
INSERT INTO localidade (cd_localidade, nm_localidade)
VALUES(4, 'Indaial');
INSERT INTO localidade (cd_localidade, nm_localidade)
VALUES(5, 'Curitiba');

INSERT INTO cor (cd_cor, ds_cor)
VALUES(1, 'Prata');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(2, 'Preto');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(3, 'Branco');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(4, 'Vermelho');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(5, 'Grafite');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(6, 'Azul');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(7, 'Vermelho Metálico');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(8, 'Grafite Metálico');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(9, 'Branco Perolizado');
INSERT INTO cor (cd_cor, ds_cor)
VALUES(10, 'Verde');

INSERT INTO marca (cd_marca, ds_marca)
VALUES(1, 'Ford');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(2, 'Fiat');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(3, 'Volkswagen');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(4, 'Chevrolet');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(5, 'Toyota');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(6, 'Nissan');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(7, 'Citroen');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(8, 'Peugeot');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(9, 'JAC');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(10, 'Audi');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(11, 'Jeep');
INSERT INTO marca (cd_marca, ds_marca)
VALUES(12, 'Mitsubishi');

INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(1, 1, 'Fiesta');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(2, 1, 'Focus');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(3, 2, 'Pálio');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(4, 2, 'Uno');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(5, 3, 'Gol');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(6, 3, 'Tiguan');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(7, 4, 'Onix');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(8, 4, 'Prisma');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(9, 5, 'Etios');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(10, 6, 'Kicks');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(11, 7, 'C3');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(12, 7, 'C4');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(13, 7, 'C4 Pallas');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(14, 8, '307');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(15, 8, '308');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(16, 9, 'QQ');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(17, 10, 'Q3');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(18, 11, 'Renegade');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo)
VALUES(19, 12, 'Pajero');


INSERT INTO combustivel (cd_combustivel, ds_combustivel)
VALUES(1, 'Gasolina');
INSERT INTO combustivel (cd_combustivel, ds_combustivel)
VALUES(2, 'Etanol');
INSERT INTO combustivel (cd_combustivel, ds_combustivel)
VALUES(3, 'GNV');
INSERT INTO combustivel (cd_combustivel, ds_combustivel)
VALUES(4, 'Diesel');
INSERT INTO combustivel (cd_combustivel, ds_combustivel)
VALUES(5, 'Elétrico');

INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(1, 'Central Multimídia');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(2, 'Banco em Couro');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(3, 'Sistema de Alarme');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(4, 'Som + auto-falantes');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(5, 'Ar condicionado');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(6, 'Direção hidráulica');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(7, 'Câmera de ré');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(8, 'GPS');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(9, 'Teto Solar');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(10, 'Air bag');
INSERT INTO acessorio (cd_acessorio, ds_acessorio)
VALUES(11, 'Câmbio Automátivo');

INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(1, 1, 'Emanuel Silva Proprietário 1', 'Rua Victor Konder', '140', 'Victor Konder', '(47)99999-9999', 'email@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(2, 1, 'Proprietário 2', 'Rua das Laranjeiras', '140', 'Zona norte', '(47)99999-9999', 'email@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(3, 2, 'Antunes Ebrain Proprietário 3', 'Rua Amadeu da Luz', '4456', 'Baixada', '(47)99999-9999', 'email@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(4, 2, 'Proprietário 4', 'Rua das Oliveiras', '3454', 'Itoupava Rasa', '(47)99999-9999', 'email@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(5, 3, 'Carlos Antunes Proprietário 5', 'Rua Brasil', '876', 'Velha', '(47)99999-9999', 'email@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(6, 3, 'Proprietário 6', 'Rua Blumenau', '1240', 'Victor Konder', '(47)99999-9999', null, 'SC');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(7, 4, 'Proprietário 7', 'Avenida Quinze de Novembro', '40', 'Amizade', null, 'email@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(8, 4, 'Marcia do Carmo Proprietária 8', 'Rua Joinville', '222', 'Vila Nova', '(47)99999-9999', 'email@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(9, 5, 'Proprietário 9', 'Avenida Sete de Setembro', '111', 'Victor Konder', null, 'email@gmail.com', 'PR');
INSERT INTO proprietario (cd_proprietario,cd_localidade,nm_proprietario,ds_logradouro,ds_complemento,ds_bairro,nr_telefone,ds_email,sg_uf)
VALUES(10, 5, 'Antônio Souza Silva Proprietário 10', 'Rua Canários', '400', 'Centro', '(47)99999-9999', null, 'PR');

INSERT INTO veiculo VALUES('LBX9977', 3, 1, 2018, 2019, 10000, 4, 'Bom estado de conservação', 1);
INSERT INTO veiculo VALUES('MAE5521', 4, 2, 2017, 2018, 20000, 4, null, 2);
INSERT INTO veiculo VALUES('MAN7644', 1, 3, 2016, 2017, 30000, 2, null, 3);
INSERT INTO veiculo VALUES('LYL7572', 2, 4, 2015, 2016, 40000, 4, null, 4);
INSERT INTO veiculo VALUES('MNT3324', 5, 5, 2014, 2015, 50000, 4, null, 5);
INSERT INTO veiculo VALUES('QHG6477', 6, 6, 2013, 2014, 60000, 2, 'Passagem por leilão', 6);
INSERT INTO veiculo VALUES('MLJ6354', 7, 7, 2012, 2013, 70000, 4, null, 7);
INSERT INTO veiculo VALUES('KMF6532', 8, 8, 2011, 2012, 80000, 2, null, 8);
INSERT INTO veiculo VALUES('MKL1147', 9, 9, 2010, 2011, 90000, 4, null, 9);
INSERT INTO veiculo VALUES('MLK9663', 10, 10, 2009, 2010, 100000, 4, null, 10);

INSERT INTO veiculo_combustivel VALUES(1, 'LBX9977');
INSERT INTO veiculo_combustivel VALUES(2, 'LBX9977');
INSERT INTO veiculo_combustivel VALUES(1, 'MAE5521');
INSERT INTO veiculo_combustivel VALUES(3, 'MAN7644');
INSERT INTO veiculo_combustivel VALUES(1, 'LYL7572');
INSERT INTO veiculo_combustivel VALUES(4, 'LYL7572');
INSERT INTO veiculo_combustivel VALUES(5, 'MNT3324');
INSERT INTO veiculo_combustivel VALUES(1, 'QHG6477');
INSERT INTO veiculo_combustivel VALUES(1, 'MLJ6354');
INSERT INTO veiculo_combustivel VALUES(3, 'KMF6532');
INSERT INTO veiculo_combustivel VALUES(1, 'MKL1147');
INSERT INTO veiculo_combustivel VALUES(4, 'MKL1147');
INSERT INTO veiculo_combustivel VALUES(5, 'MLK9663');

INSERT INTO veiculo_acessorio VALUES('LBX9977', 1);
INSERT INTO veiculo_acessorio VALUES('LBX9977', 2);
INSERT INTO veiculo_acessorio VALUES('LBX9977', 8);
INSERT INTO veiculo_acessorio VALUES('MAE5521', 3);
INSERT INTO veiculo_acessorio VALUES('MAE5521', 4);
INSERT INTO veiculo_acessorio VALUES('MAE5521', 8);
INSERT INTO veiculo_acessorio VALUES('MAE5521', 9);
INSERT INTO veiculo_acessorio VALUES('MAE5521', 11);
INSERT INTO veiculo_acessorio VALUES('MAN7644', 10);
INSERT INTO veiculo_acessorio VALUES('MAN7644', 6);
INSERT INTO veiculo_acessorio VALUES('LYL7572', 7);
INSERT INTO veiculo_acessorio VALUES('LYL7572', 2);
INSERT INTO veiculo_acessorio VALUES('LYL7572', 5);
INSERT INTO veiculo_acessorio VALUES('LYL7572', 9);
INSERT INTO veiculo_acessorio VALUES('LYL7572', 8);
INSERT INTO veiculo_acessorio VALUES('LYL7572', 11);
INSERT INTO veiculo_acessorio VALUES('MNT3324', 2);
INSERT INTO veiculo_acessorio VALUES('MNT3324', 3);
INSERT INTO veiculo_acessorio VALUES('QHG6477', 4);
INSERT INTO veiculo_acessorio VALUES('QHG6477', 5);
INSERT INTO veiculo_acessorio VALUES('QHG6477', 7);
INSERT INTO veiculo_acessorio VALUES('MLJ6354', 4);
INSERT INTO veiculo_acessorio VALUES('MLJ6354', 9);
INSERT INTO veiculo_acessorio VALUES('MLJ6354', 7);
INSERT INTO veiculo_acessorio VALUES('MLJ6354', 8);
INSERT INTO veiculo_acessorio VALUES('KMF6532', 2);
INSERT INTO veiculo_acessorio VALUES('KMF6532', 3);
INSERT INTO veiculo_acessorio VALUES('KMF6532', 10);
INSERT INTO veiculo_acessorio VALUES('MKL1147', 4);
INSERT INTO veiculo_acessorio VALUES('MKL1147', 5);
INSERT INTO veiculo_acessorio VALUES('MLK9663', 6);
INSERT INTO veiculo_acessorio VALUES('MLK9663', 7);
INSERT INTO veiculo_acessorio VALUES('MLK9663', 10);
INSERT INTO veiculo_acessorio VALUES('MLK9663', 11);