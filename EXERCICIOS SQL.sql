Lista exercícios:

A) 	SELECT *
	FROM Modelo;
	
B) 	SELECT *
    FROM Marca;

C)	SELECT nm_proprietario 
	FROM Proprietario 
	WHERE sg_uf = "SC" OR sg_uf = "PR";
	
	-- ou com IN
	
	SELECT nm_proprietario 
	FROM Proprietario 
    WHERE sg_uf IN ("SC","PR");
	
D) 	SELECT cd_proprietario, nm_proprietario
    FROM Proprietario 
    WHERE nr_telefone IS NOT NULL 
		AND ds_email IS NULL;

	-- ou com teste de mesa (mostra os atributos pra conferir)
	SELECT cd_proprietario, nm_proprietario, nr_telefone, ds_email
    FROM Proprietario 
	WHERE nr_telefone IS NOT NULL AND ds_email IS NULL;
	
E)	SELECT cd_proprietario, nm_proprietario
    FROM Proprietario 
    WHERE nm_proprietario LIKE '%Silva%'
	
F) 	SELECT cd_proprietario, nm_proprietario
    FROM Proprietario 
    WHERE nr_ano_fab <> nr_ano_mod;
	
G)	SELECT nr_placa, nr_ano_mod, qt_km_rodado, qt_portas
    FROM Veiculo
    WHERE nr_ano_fab >= 2000;
	
H)	SELECT nr_placa
	FROM Veiculo
	WHERE ds_observacao IS NULL	

I)	SELECT *
	FROM veiculo
	WHERE qt_portas >= 4
	ORDER BY nr_ano_mod DESC;
	
J) 	SELECT ds_acessorio
	FROM acessorio
	ORDER BY ds_acessorio;
	
K)	SELECT nr_placa, nr_ano_fab, nr_ano_mod
	FROM veiculo
	WHERE nr_ano_fab >= 2010 AND
	qt_km_rodado < 10000 AND
	qt_portas >= 4 AND
	ds_observacao IS NULL;
	
L)	SELECT nm_proprietario
	FROM proprietario
	WHERE ds_bairro LIKE '%Novo%' or ds_bairro '%Nova%'
	AND sg_uf = "SC";