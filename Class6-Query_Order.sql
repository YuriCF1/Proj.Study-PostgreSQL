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