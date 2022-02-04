--a)     Criação de uma view para listar a descrição da marca e a descrição do modelo de todos os veículos cadastrados;
CREATE VIEW vw_veiculo_marca_modelo
as
SELECT ma.ds_marca marca, mo.ds_modelo modelo
FROM marca ma, modelo mo
WHERE
mo.cd_marca = ma.cd_marca;
SELECT *
FROM vw_veiculo_marca_modelo;


--b)     Criação de uma view para listar os dados dos veículos como: placa, descrição da marca, descrição do modelo, ano modelo, ano fabricação e quantidade de km rodado e quantidade de portas;
create view vw_veiculo_dados
as
select v.nr placa, ma.ds_marca, mo.ds_modelo, v.nr_ano_mod, v.nr_ano_fab, v.qt_km_rodado, v.qt_portas
from veiculo v, marca ma, modelo mo
where mo.cd_marca=ma.cd_marca
and v.cd_modelo = mo.cd_modelo;
select *
from vw_veiculo_dados;


--c)     Criação de uma view para listar dados completos dos veículos: placa, descrição da marca, descrição do modelo, descrição da cor, ano modelo, ano fabricação, quantidade de km rodado, quantidade de portas, descrição dos acessórios e descrição do combustível que o move;
create view vw_veiculos_completo
as
select v.nr_placa, ma.ds_marca, mo.ds_modelo, cor.ds_cor, v.nr_ano_mod, v.nr_ano_fab, v.qt_km_rodado, v.qt_portas, a.ds_acessorio, c.ds_combustivel
from veiculo v, marca ma, modelo mo, cor, acessorio a, combustivel c, veiculo_combustivel vc, veiculo_acessorio va
where ma.cd_marca = mo.cd_marca
and mo.cd_modelo = v.cd_modelo
and cor.cd_cor = v.cd_cor
and a.cd_acessorio = va.cd_acessorio
and v.nr_placa = va.nr_placa
and c.cd_combustivel = vc.cd_combustivel
and v.nr_placa=vc.nr_placa;
select *
from vw_veiculos_completo


--d)     Criação de uma view para listar a descrição da marca e a descrição do modelo com a respectiva quantidade de veículos cadastrados;

create view vw_ma_mo_v
as
select ma.ds_marca, mo.ds_modelo, count(v.cd_modelo)
from veiculo v, marca ma, modelo mo
where ma.cd_marca = mo.cd_marca
and mo.cd_modelo = v.cd_modelo
group by mo.ds_modelo;
select *
from vw_ma_mo_v;

--e)     Criação de uma view para listar o nome da localidade com a respectiva quantidade proprietários associada (que residem na respectiva localidade);

create view vw_e
as
select l.nm_localidade, count(p.cd_proprietario)
from  proprietario p, localidade l
where p.cd_localidade=l.cd_localidade
group by nm_localidade;
select *
from vw_e;


--f)      Criação de uma view para listar a descrição da cor com a respectiva quantidade de veículos associados a cada cor;

create view vw_f
as
select c.ds_cor, count(v.nr_placa)
from  veiculo v, cor c
where v.cd_cor=c.cd_cor
group by c.cd_cor;
select *
from vw_f;


--g)     Criação de uma view para listar quais veículos (número da placa, descrição da marca e modelo) que são movidos por mais de um combustível.

create view vw_g
as
select v.nr_placa, ds_marca, ds_modelo
from veiculo v, marca ma, modelo mo, veiculo_combustivel vc, combustivel c
where ma.cd_marca = mo.cd_marca
and mo.cd_modelo = v.cd_modelo
and c.cd_combustivel = vc.cd_combustivel
and v.nr_placa=vc.nr_placa
having count(ds_combustivel)>1;
select *
from vw_g;































