-- Matheus Petters Bevilaqua

-- QUESTÃO 1:

CREATE TABLE hotel
(cd_hotel 		INTEGER,
nm_hotel 		VARCHAR(50),
ds_website 		VARCHAR(50),
ds_email		VARCHAR(50),
CONSTRAINT hotel_pk PRIMARY KEY (cd_hotel));


CREATE TABLE categoria
(cd_categoria 	INTEGER,
ds_categoria	varchar(50),
CONSTRAINT categoria_pk PRIMARY KEY (cd_categoria));


CREATE TABLE funcionario
(cd_funcionario INTEGER,
cd_hotel 		INTEGER,
nm_funcionario	VARCHAR(50),
ds_email		VARCHAR(50),
CONSTRAINT funcionario_pk PRIMARY KEY (cd_funcionario));

ALTER TABLE funcionario
ADD CONSTRAINT funcionario_hotel_fk FOREIGN KEY (cd_hotel) REFERENCES hotel(cd_hotel);


CREATE TABLE quarto
(nr_quarto 		INTEGER,
cd_hotel		INTEGER,
cd_categoria	INTEGER,
ds_quarto		VARCHAR(50),
nr_ocupantes	INTEGER,
CONSTRAINT quarto_pk PRIMARY KEY (nr_quarto, cd_hotel));

ALTER TABLE quarto
ADD CONSTRAINT quarto_hotel_fk FOREIGN KEY (cd_hotel) REFERENCES hotel(cd_hotel);
ALTER TABLE quarto
ADD CONSTRAINT quarto_categoria_fk FOREIGN KEY (cd_categoria) REFERENCES categoria(cd_categoria);

-- QUESTÃO 2:
-- a) Alterar a coluna “DS_EMAIL” da tabela “FUNCIONARIO” para aceitar valores até 100 posições;
ALTER TABLE funcionario
MODIFY ds_email	VARCHAR(100);

--b) Criar uma restrição para a coluna “DS_CATEGORIA” da tabela “CATEGORIA” para que não permita a inclusão de valores repetidos;
ALTER TABLE categoria
ADD CONSTRAINT categoria_uk UNIQUE (ds_categoria);

-- QUESTÃO 3:
INSERT INTO hotel (cd_hotel, nm_hotel, ds_website, ds_email)
	VALUES (1, 'Hotel Bom Dia', 'hotelbomdia.com.br', 'hotelbomdia@hotel.com');
INSERT INTO hotel (cd_hotel, nm_hotel, ds_website, ds_email)
	VALUES (2, 'Hotel Noite Eterna', 'noiteeternahotel.com', 'hotelnoitee@hotel.com');
INSERT INTO hotel (cd_hotel, nm_hotel, ds_website, ds_email)
	VALUES (3, 'Hotel Estrelas', 'strlsHotel.com.br', 'hotelestrelas@hotel.com');
	
INSERT INTO categoria (cd_categoria, ds_categoria)
	VALUES (1, "Quarto solteiro");
INSERT INTO categoria (cd_categoria, ds_categoria)
	VALUES (2, "Quarto Casal");
INSERT INTO categoria (cd_categoria, ds_categoria)
	VALUES (3, "Suíte Família");
	
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (1001, 1, 'Cleiton Borba', 'cleitinho@gmail.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (1002, 1, 'Robson Caetano', 'peganobreu@gmail.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (1003, 1, 'Gabriel Rodrigues', 'ucasberto@gmail.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (2001, 2, 'Inaho Wildstar', 'inahowo@gmail.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (2002, 2, 'Derek Wildstar', 'estrelaselvagem@hotmail.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (2003, 2, 'Leonardo Cardoso', 'phant0ml0rd27@gmail.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (2004, 2, 'Gabriel Renato', 'gabnato@yahoo.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (3001, 3, 'Dominic Maha', 'omcmaha@gmail.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (3002, 3, 'Danyel Sena', 'monokarthus@gmail.com');
INSERT INTO funcionario (cd_funcionario, cd_hotel, nm_funcionario, ds_email)
	VALUES (3003, 3, 'Marlon Coelho da Silva', 'pozemc@gmail.com');
	
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (101, 1, 3, 'Suíte 4 pessoas com sacada', 4);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (102, 1, 3, 'Suíte 4 pessoas com sacada', 4);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (103, 1, 3, 'Suíte 5 pessoas com sacada', 5);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (110, 2, 1, 'Quarto simples 1 cama', 1);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (210, 2, 2, 'Quarto de casal com vista pro mar', 2);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (310, 2, 3, 'Quarto família', 4);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (101, 3, 1, 'Quarto simples 1 cama', 1);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (102, 3, 1, 'Quarto simples 1 cama', 1);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (201, 3, 3, 'Quarto família com varanda', 5);
INSERT INTO quarto (nr_quarto, cd_hotel, cd_categoria, ds_quarto, nr_ocupantes)
	VALUES (202, 3, 2, 'Quarto de casal com vista pro mar', 2);

-- QUESTÃO 4:
-- Listar o nome do hotel, a descrição da(s) categoria(s) de quarto que oferece;
SELECT h.nm_hotel Hotel, c.ds_categoria Categoria
FROM hotel h, categoria c, quarto q
WHERE h.cd_hotel = q.cd_hotel
AND q.cd_categoria = c.cd_categoria;

-- QUESTÃO 5:
-- Exibir o nome de todos os funcionários com o respectivo hotel em que está lotado, ordenados pelo nome do funcionário;
SELECT f.nm_funcionario Funcionário, h.nm_hotel Hotel
FROM funcionario f, hotel h
WHERE f.cd_hotel = h.cd_hotel
ORDER BY f.nm_funcionario;

-- QUESTÃO 6:
-- Recuperar a descrição da categoria com a respectiva quantidade de quartos associadados a mesma categoria listada;
SELECT c.ds_categoria "Descrição Categoria", COUNT(q.cd_categoria) "Total de quartos"
FROM quarto q, categoria c
WHERE q.cd_categoria = c.cd_categoria
GROUP BY c.ds_categoria;

-- QUESTÃO 7:
-- Exibir o nome de cada hotel com a respectiva quantidade de quartos associada a cada hotel listado, ordenando pelo maior número de quartos, seguido pelo nome do hotel;
SELECT COUNT(q.cd_hotel) "Quantidade de quartos", h.nm_hotel Hotel
FROM hotel h, quarto q
WHERE h.cd_hotel = q.cd_hotel
GROUP BY h.nm_hotel
ORDER BY COUNT(q.cd_hotel) DESC, h.nm_hotel;

-- QUESTÃO 8:
-- Exibir a descrição da(s) categoria(s) que possui(em) o maior número de quartos cadastrados em toda a rede.
SELECT c.ds_categoria Categoria, COUNT(q.cd_categoria) "Número de Quartos da categoria na rede"
FROM categoria c, quarto q
WHERE c.cd_categoria = q.cd_categoria
GROUP BY c.ds_categoria
HAVING COUNT(*) >= ALL (SELECT COUNT(*) qtde
						FROM categoria c, quarto q
						WHERE c.cd_categoria = q.cd_categoria
						GROUP BY c.ds_categoria);