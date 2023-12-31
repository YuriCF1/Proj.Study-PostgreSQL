DROP TABLE funcionarios;

CREATE TABLE funcionarios (
	id SERIAL PRIMARY KEY,
	matricula VARCHAR(10),
	nome	  VARCHAR(255),
	sobrenome VARCHAR(255)
);

INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M002', 'Vinicius', 'Dias');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M003', 'Nico', 'Steppat');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M004', 'João', 'Roberto');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M005', 'Yuri', 'Cruz');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M006', 'Alberto', 'Martins');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M007', 'Diogo', 'Mascarenhas');
INSERT INTO funcionarios (matricula, nome, sobrenome) VALUES ('M001', 'Diogo', 'Oliveira');

SELECT * 
	FROM funcionarios
	ORDER BY nome DESC; --Ordernar por nome, em ordem decrescente;

SELECT * 
	FROM funcionarios
	ORDER BY nome, matricula DESC; -- Priorizando o nome, depois a matricula em decrescente;
	
SELECT * 
	FROM funcionarios
	ORDER BY 3,4,2; -- Ordenando pelo pelos campos 3,4,2. Nome, sobrenome, matrícula;
	
SELECT * 
	FROM funcionarios
	ORDER BY 4 DESC, nome DESC, 2 ASC; -- Sobrenome desc, nome desc, matricula crescente (ASC opcional)
	
	SELECT * 
	FROM funcionarios
	ORDER BY 4 DESC, funcionarios.nome DESC, 2 ASC; -- Caso aja colunas duplicadas
	
--Limitando o número de resultados
SELECT * 
	FROM funcionarios
	ORDER BY id
	LIMIT 3
	OFFSET 1; --Pulando linha, tirando o ID 1. A partir do 3, colocar OFFSET 2

--FUNÇÕES DE AGREGAÇÃO------------
--Funções de agregassão mais utilizadas
-- COUNT = Retorna a quantidade de registros
-- SUM = Retorna a soma dos registros
-- MAX = Retorna o maior valor dos registros
-- MIN = Retorna o menor valor dos registros
-- AVG = Retorna a média dos registros

SELECT COUNT (id), 
	SUM(id), -- Somando de 1 a 8 = 36
	MAX(id),
	MIN(id),
	ROUND(AVG(id), 2) -- Tirando a média dos ID's, e arredondando para 2 casas decimais
	FROM funcionarios;


--Agrupamento de consultas 
SELECT DISTINCT nome, sobrenome, --Tirando o nome e sobrenome duplicados
		-- COUNT(*) | Não posso usar aqui, pois tem o DISTINCT.Precisar estar num "GROUP BY"
		-- Distinct não funciona com funções de agregação
	FROM funcionarios
	ORDER BY nome;
	
SELECT
	nome, 
	sobrenome,
	COUNT(id) -- Contando os 2 'Diogo Mascarenhas'
	FROM funcionarios
	GROUP BY nome, sobrenome; -- Também funcion com campos 1,2 
	
	
	