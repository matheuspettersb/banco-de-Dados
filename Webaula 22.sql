-- funções de grupo
-- AVG > calcula valor médio (só numeros)(ignora linhas nulas)
-- COUNT > conta o numero de registros (linhas) de uma tabela.
-- se colocar o asterisco ele conta até oq for nulo, se declarar
-- um campo ele ignora
-- MAX > retorna o maior valor
-- MIN > retorna o menor valor
-- SUM > retorna a soma dos valores

exercícios:

--a)     Listar a média de km rodados entre os veículos cadastrados;
Select avg(qt_km_rodado)
from veiculo;

--msm exercício, mas mostrando as tabelas usadas para 
--teste de mesa
Select avg(qt_km_rodado) media, SUM(qt_km_rodado) "soma", 
COUNT(qt_km_rodado) "qtos veiculos", 
SUM(qt_km_rodado)/ COUNT(qt_km_rodado) "media"
from veiculo;

--b)     Listar o ano de fabricação do(s) veículo(s) mais novo e ano de fabricação do(s) veículo(s) mais antigo cadastrado na base de dados;
SELECT MAX(v.nr_ano_fab) "veiculo mais novo", 
MIN(v.nr_ano_fab) "veiculo_mais_antigo"
FROM veiculo v;

-- Diferença de truncamento (truncate) e arredondamento (round)
-- numero =  87,55
SELECT TRUNCATE(87.56,1), ROUND(87.55,1)
FROM veiculo

-- truncate vai cortar depois da primeira casa (87,5), enquanto
-- o round vai arredondar dps da primeira (87,6)

--c)     Listar o ano modelo do veículo com a respectiva quantidade de veículos correspondente ao respectivo ano;
SELECT nr_ano_mod, count(nr_ano_mod) total_de_veiculos
from veiculo
group by nr_ano_mod

--d)     Listar a descrição do combustível com a respectiva quantidade de veículos que apresentam o combustível, ordenando pelo maior número de veículos descendente;
SELECT c.ds_combustivel, COUNT(ds_combustivel)
FROM veiculo v, combustivel c, veiculo_combustivel vc
WHERE v.nr_placa = vc.nr_placa AND vc.cd_combustivel = c.cd_combustivel
GROUP BY c.ds_combustivel
ORDER BY COUNT(ds_combustivel) DESC;

--e) Listar a descrição do modelo com a respectiva quantidade de veículo(s) correspondente ao modelo listado;
select mo.ds_modelo modelo, count(v.cd_modelo) "total veiculos"
from veiculo v, modelo mo
where v.cd_modelo = mo.cd_modelo
group by mo.ds_modelo

-- f) Listar todas as marcas (descrição) disponíveis com o respetivo modelo (descrição), bem como a quantidade de veículo associada a marca e modelo listado;
SELECT ma.ds_marca marca, ds_modelo modelo, COUNT(v.cd_modelo) "total_veiculos"
FROM veiculo v, modelo mo, marca ma
WHERE
v.cd_modelo = mo.cd_modelo
AND mo.cd_marca = ma.cd_marca
GROUP BY ma.ds_marca, mo.ds_modelo;

--g)     Listar a descrição do acessório com a respectiva quantidade de veículo que possuem o referido acessório listado.
SELECT a.ds_acessorio,count(va.cd_acessorio)
FROM veiculo v, veiculo_acessorio va, acessorio a
WHERE v.nr_placa = va.nr_placa AND va.cd_acessorio = a.cd_acessorio
GROUP BY a.ds_acessorio;

-- h)
select l.nm_localidade localidade, count(p.cd_proprietario) proprietarios
from localidade l, proprietario p
where p.cd_localidade = l.cd_localidade
and p.sg_uf = 'SC'
group by l.nm_localidade;

-- i) Listar dados dos veículos: placa, descrição da marca, descrição do modelo e quantidade de acessórios associado a cada veículo listado, sendo que os veículos devem apresentar dois ou mais acessórios.
select v.nr_placa, ma.ds_marca, mo.ds_modelo, count(a.ds_acessorio) qtd_acessorios
from veiculo v, marca ma, modelo mo, acessorio a, veiculo_acessorio va
where v.cd_modelo = mo.cd_modelo
and mo.cd_marca = ma.cd_marca
and v.nr_placa = va.nr_placa
and va.cd_acessorio = a.cd_acessorio
group by v.nr_placa, ma.ds_marca, mo.ds_modelo
having count(a.ds_acessorio) >= 2;

--j)Listar dados dos veículos: placa, descrição da marca, descrição do modelo e quantidade de combustíveis associados a cada veículo listado.
select v.nr_placa, ma.ds_marca, mo.ds_modelo, count(c.ds_combustivel)
from, veiculo v, marca ma, modelo mo, combustivel c, veiculo_combustivel vc
where v.cd_modelo = mo.cd_modelo
and mo.cd_marca = ma.cd_marca
and c.cd_combustivel = vc.cd_combustivel
and vc.nr_placa = v.nr_placa
group by v.nr_placa, ma.ds_marca, mo.ds_modelo
















