-- a)     Listar os nomes dos proprietários com a respectiva localidade (nome) em que residem;
select proprietario.nm_proprietario, localidade.nm_localidade
FROM proprietario p, localidade l
where p.cd_localidade = l.cd_localidade;
--        fk                 pk
-- ou utilizando a palavra reserva JOIN, assim

SELECT p.nm_proprietario, L.nm_localidade
FROM proprietario p JOIN localidade l ON p.cd_localidade = l.cd_localidade;

-- b)     Listar todos os modelos da marca "FIAT" ordenados pelo descrição do modelo;

SELECT ma.ds_marca, mo.ds_modelo
FROM marca ma, modelo mo
WHERE ma.cd_marca = mo.cd_marca
AND ma.ds_marca = "FIAT"
ORDER BY mo.ds_modelo;

-- adicionando a marca lifan
Insert into marca
values (13, 'Lifan');

select *
from marca;
-- executando o comando de antes ainda não mostra a marca lifan pq ela n tem modelos
--mas
SELECT ma.ds_marca, mo.ds_modelo
FROM marca ma left JOIN modelo mo on ma.cd_marca = mo.cd_marca
ORDER BY mo.ds_modelo;

-- o left lembra um modelo de conjuntos com 2 conjuntos
-- normalmente, o join mostra só a intersecção dos conjuntos A e B
-- left join mostra a intersecção e o resto do da esquerda (conjunto A)
-- right join mostra a intersecção e o resto do da direita (conjunto B)
-- full join mostra a união dos dois conjuntos :)

-- -- c)     Listar todas as marcas (descrição) disponíveis com o respetivo modelo (descrição), ordenando em ordem crescente de marca, seguida de modelo;
select ma.ds_marca, mo.ds_modelo
from marca ma, modelo mo
where ma.cd_marca = mo.cd_marca
order by ds_marca, ds_modelo;

---- d)     Listar a placa, o ano modelo e a descrição da cor de todos os veículos cadastrados, ordenando pelo ano modelo, seguido da descrição da cor;
select veiculo.nr_placa, veiculo.nr_ano_mod, cor.ds_cor
from veiculo, cor
where veiculo.cd_cor = cor.cd_cor
order by nr_ano_mod, ds_cor;

-- e)     Listar os seguintes dados do veículo: placa, nome do proprietário e nome da localidade que o mesmo reside, desde que sua UF seja "SC"
select v.nr_placa, p.nm_proprietario, l.nm_localidade
from veiculo v, proprietario p, localidade l
where v.cd_proprietario = p.cd_proprietario
and p.cd_localidade = l.cd_localidade
and p.sg_uf = 'SC';

--f)     Listar dados dos veículos: placa, descrição da marca, descrição do modelo, ano modelo, ano fabricação, quantidade de km rodado e quantidade de portas, ordenando pelo veículo mais novo;
select v.nr_placa, ma.ds_marca, mo.ds_modelo, v.nr_ano_mod, v.nr_ano_fab, v.qt_km_rodado, v.qt_portas
from veiculo v, marca ma, modelo mo
where v.cd_modelo = mo.cd_modelo
and ma.cd_marca = mo.cd_marca
order by v.nr_ano_fab

--g)      Listar os veículos com placa, descrição da marca, descrição do modelo, ano do modelo e a(s) respectiva(s) descrição(ões) do(s) combustível(is) que é movido;
select v.nr_placa, ma.ds_marca, mo.ds_modelo, v.nr_ano_mod, c.ds_combustivel
from veiculo v, marca ma, modelo mo, veiculo_combustivel vc, combustivel c
where v.cd_modelo = mo.cd_modelo
and mo.cd_marca = ma.cd_marca
and v.nr_placa = vc.nr_placa
and vc.cd_combustivel = c.cd_combustivel;

--h)     Listar os veículos (com placa, descrição da marca, descrição do modelo) que possuem como acessório "Direção hidráulica";
SELECT v.nr_placa, ma.ds_marca, mo.ds_modelo
FROM veiculo v, marca ma, modelo mo ,veiculo_acessorio va, acessorio a
WHERE v.cd_modelo = mo.cd_modelo
AND mo.cd_marca = ma.cd_marca
AND v.nr_placa = va.nr_placa 
AND va.cd_acessorio = a.cd_acessorio
AND ds_acessorio like "Dire%hidr%"

-- i)     Listar dados completos dos veículos: placa, descrição da marca, descrição do modelo, descrição da cor, ano modelo, ano fabricação, quantidade de km rodado, quantidade de portas, descrição dos acessórios e descrição do combustível que o move;
SELECT v.nr_placa, ma.ds_marca, mo.ds_modelo, c.ds_cor, v.nr_ano_mod, v.nr_ano_fab, v.qt_km_rodado, v.qt_portas, a.ds_acessorio, comb.ds_combustivel
FROM veiculo v, marca ma, modelo mo, cor c, acessorio a, combustivel comb, veiculo_acessorio va, veiculo_combustivel vc
WHERE v.cd_modelo = mo.cd_modelo 
AND mo.cd_marca = ma.cd_marca 
AND v.cd_cor = c.cd_cor 
AND v.nr_placa = va.nr_placa
AND va.cd_acessorio = a.cd_acessorio 
AND v.nr_placa = vc.nr_placa 
AND vc.cd_combustivel = comb.cd_combustivel;

-- j)      Listar os veículos (placa, descrição da marca, descrição do modelo) que cadastrados que apresentam cor "branco(a)", são movidos a diesel, e apresentam ano modelo superior a 2010;
SELECT v.nr_placa, ma.ds_marca, mo.ds_modelo
FROM veiculo v, marca ma, modelo mo, cor c, combustivel co, veiculo_combustivel vc
WHERE v.cd_modelo = mo.cd_modelo
AND mo.cd_marca = ma.cd_marca
AND v.cd_cor = c.cd_cor
AND v.nr_placa = vc.nr_placa
AND vc.cd_combustivel = co.cd_combustivel 
AND ds_combustivel = "diesel"
AND v.nr_ano_mod > 2010
AND c.ds_cor LIKE "BRANC%";








