Aula 8 - Subconsultas

Subconsulta de uma unica linha = retorna um só valor

Subconsulta de varias linhas = retorna 2 ou mais valores, não podemos usar somente opreadores relacionais, é necessario IN/ANY/ALL (um dos 3)

Subconsulta de varias linhas e colunas = retorna 2 ou mais valores para linha e coluna, necessario 2 paramentros

OPERADORES:
IN - Verifica se tem um valor igual 
ANY - Se existir algum valor igual ele retorna (qualquer valor) (compara o valor a cada valor retornado pela subconsulta)
ALL - Verifica todos os valores (compara todo valor a cada valor retornado pela subconsulta)


--a)     Listar a descrição da marca e a descrição do modelo de todos os veículos com data de fabricação acima da média de fabricação (ano) entre os veículos cadastrados;
select avg (veiculo.nr_ano_fab) as media
from veiculo
-- > mostra a media do ano dos veiculos (retorna 2013.5)


select marca.ds_marca marca, modelo.ds_modelo modelo, veiculo.nr_ano_fab veiculo
from veiculo, marca, modelo
where
	veiculo.cd_modelo = modelo.cd_modelo
and modelo.cd_marca = marca.cd_marca
-- > mostra todos os veiculos

select marca.ds_marca marca, modelo.ds_modelo modelo, veiculo.nr_ano_fab veiculo
from veiculo, marca, modelo
where
	veiculo.cd_modelo = modelo.cd_modelo
and modelo.cd_marca = marca.cd_marca
and veiculo.nr_ano_fab >= 2013.6
-- > mostra os que estão acima dessa media
-- > porem isso é estatico e ficaria obsoleto conforme novos veiculos são cadastrados, ja que a media é variavel

SELECT marca.ds_marca marca, modelo.ds_modelo modelo, veiculo.nr_ano_fab
FROM veiculo, marca, modelo
WHERE veiculo.cd_modelo = modelo.cd_modelo
and modelo.cd_marca = marca.cd_marca
AND veiculo.nr_ano_fab >= (SELECT AVG(veiculo.nr_ano_fab) AS media
FROM veiculo);

--> Aqui usa direto o primeiro comando, tirando a obsolcencia


-- b)     Listar a placa e a descrição do modelo do(s) veículo(s) mais novo(s) cadastrado(s) - considerar o ano modelo;
-- select max =  pega o maior
select v.nr_placa placa, mo.ds_modelo modelo
from veiculo v, modelo mo
where v.cd_modelo = mo.cd_modelo
and v.nr_ano_mod = (SELECT max(nr_ano_mod)
					from veiculo);
-- retorna o "Fiesta"


-- c) Listar dados dos veículos: placa, descrição da marca, descrição do modelo que são movidos por mais de um combustível;
SELECT v.nr_placa, ma.ds_marca, mo.ds_modelo, COUNT(*)
FROM Veiculo v, Modelo mo, Marca ma, Veiculo_combustivel vc, Combustivel c
WHERE v.cd_modelo = mo.cd_modelo
AND mo.cd_marca = ma.cd_marca
AND vc.nr_placa = v.nr_placa
AND vc.cd_combustivel = c.cd_combustivel
GROUP BY vc.cd_combustivel
HAVING COUNT(*) > 1;

-- com o IN
SELECT v.nr_placa, ma.ds_marca, mo.ds_modelo
FROM Veiculo v, Modelo mo, Marca ma
WHERE v.cd_modelo = mo.cd_modelo
	AND mo.cd_marca = ma.cd_marca
	AND v.nr_placa IN (SELECT v.nr_placa
							FROM veiculo v, Veiculo_combustivel vc, Combustivel c
							WHERE vc.nr_placa = v.nr_placa
								AND vc.cd_combustivel = c.cd_combustivel
							GROUP BY vc.cd_combustivel
							HAVING COUNT(*) > 1);
-- a adição do IN não muda o resultado, só tira a obsolecencia

-- d)     Listar a descrição da marca que possui o maior número de veículos cadastrado;
select ma.ds_marca, count(mo.cd_marca) qtde_marca
from veiculo v, modelo mo, marca ma
where v.cd_modelo = mo.cd_modelo
and ma.cd_marca = mo.cd_marca
group by ma.ds_marca
having COUNT(*) >= all (select count(*) qtde
					from veiculo v, modelo mo, marca ma
					where ma.cd_marca = mo.cd_marca
					and v.cd_modelo = mo.cd_modelo
					group by ma.cd_marca);

-- e) Listar a descrição do(s) modelo(s) que possui(em) o maior número de veículos cadastrado;

SELECT mo.ds_modelo, COUNT(v.cd_modelo) qtde_modelo
FROM veiculo v, modelo mo
WHERE mo.cd_modelo = v.cd_modelo
GROUP BY mo.ds_modelo
HAVING COUNT(*) >= ALL (SELECT COUNT(*) qtde
FROM veiculo v, modelo mo
WHERE mo.cd_modelo = v.cd_modelo
GROUP BY mo.ds_modelo)

-- f) Listar a descrição do acessório mais popular (que mais é encontrado) entre os veículos cadastrados
-- fabricados entre os anos de 2015 e 2018;

SELECT a.ds_acessorio AS acessorio_mais_popular
FROM veiculo v, veiculo_acessorio va, acessorio a
where va.cd_acessorio = a.cd_acessorio
AND v.nr_placa = va.nr_placa
and v.nr_ano_fab BETWEEN 2015 AND 2018
GROUP BY a.ds_acessorio
HAVING COUNT(va.cd_acessorio) >= ALL (SELECT COUNT(a.ds_acessorio)
FROM veiculo v, veiculo_acessorio va, acessorio a
where va.cd_acessorio = a.cd_acessorio
AND v.nr_placa = va.nr_placa
and v.nr_ano_fab BETWEEN 2015 AND 2018
GROUP BY a.ds_acessorio);

-- g)      Listar qual(is) acessórios não estão associados a veículos fabricados a partir do ano de 2010;

select a.ds_acessorio acesorio
from acessorio a
where a.cd_acessorio not in (select va.cd_acessorio
					from veiculo v, veiculo_acessorio va
					where v.nr_placa = va.nr_placa
					and 





































