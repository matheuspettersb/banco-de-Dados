--criação tabela "camara"
CREATE TABLE camara
(cd_camara 		INTEGER,
nm_municipio 	VARCHAR(50),
CONSTRAINT camara_pk PRIMARY KEY (cd_camara)
);

-- criação da tabela "partido"
CREATE TABLE partido
(nr_partido INTEGER,
sg_partido 	VARCHAR(10),
nm_partido 	VARCHAR(50),
cd_camara 	INTEGER,
CONSTRAINT partido_pk PRIMARY KEY (nr_partido)
);

ALTER TABLE partido
ADD CONSTRAINT partido_camara_fk FOREIGN KEY (cd_camara) REFERENCES camara(cd_camara);

--criação da tabela "vereador"
CREATE TABLE vereador
(cd_vereador 			 INTEGER,
nm_vereador 			 VARCHAR(50),
qt_proj_apresenteados INTEGER,
qt_proj_aprovados 	 INTEGER,
nr_partido 				 INTEGER,
CONSTRAINT vereador_pk PRIMARY KEY (cd_vereador)
);

ALTER TABLE vereador
ADD CONSTRAINT vereador_partido_fk FOREIGN KEY (nr_partido) REFERENCES partido(nr_partido);
