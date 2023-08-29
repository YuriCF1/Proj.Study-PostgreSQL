integer
real
serial
numeric

varchar(n)
char(n)
text

boolean

date
time
timestamp

CREATE TABLE aluno (
	id SERIAL,
	nome VARCHAR(255),
	cpf CHAR(11),
	observacao TEXT,
	idade INTEGER,
	dinheiro NUMERIC(10,2),
	altura REAL,
	ativo BOOLEAN, 
	data_nascimento DATE,
	hora_aula TIME,
	matriculado_em TIMESTAMP
);

SELECT 
	* FROM aluno;

INSERT INTO aluno (
	nome, 
	cpf, 
	observacao, 
	idade, 
	dinheiro,
	altura,
	ativo,
	data_nascimento,
	hora_aula,
	matriculado_em
) 

VALUES (
	'Denis', 
	'11111111111',
	'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sed dolor neque. Nulla dapibus arcu eu justo accumsan pharetra. Donec semper mauris vel ipsum finibus efficitur. Maecenas ac gravida erat, eget placerat nisi. Nunc libero tellus, porttitor ut libero sed, tincidunt efficitur dolor. Nulla eu lacinia felis. Mauris fringilla ante at purus pretium ultricies. Integer ornare enim tellus, et egestas augue feugiat a. Nulla laoreet, quam commodo mollis fermentum, tortor felis sodales sapien, vitae ultricies justo dolor at magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. Phasellus vitae leo sem. Mauris non pretium lorem. Vivamus eget hendrerit magna. Nulla orci risus, condimentum ut turpis tempor, fermentum venenatis nisi. Curabitur tristique, eros et varius ullamcorper, massa ante egestas leo, vel dapibus enim turpis quis augue.',
	35,
	100.50,
	1.88,
	TRUE,
	'1999-01-30',
	'17:30:00',
	'2020-02-08 12:32:45'
);

SELECT 
	* FROM aluno 
	WHERE id = 1
	
UPDATE aluno 
	SET nome = 'Cruz', 
	cpf = '12345678900', 
	observacao = 'Otimo aluno', 
	idade = 24, 
	dinheiro = 15.21,
	altura = 1.89,
	ativo = FALSE,
	data_nascimento = '1999-01-15',
	hora_aula = '13:00:00',
	matriculado_em = '2020-01-02 15:00:00'
	WHERE id = 1
	
SELECT 
	* FROM aluno 
	WHERE nome = 'Cruz';
	
DELETE 
	FROM aluno 
	WHERE nome = 'Cruz';
	
SELECT 
	nome AS "Nome do Aluno", 
	idade,
	matriculado_em AS quando_foi_matriculado
FROM aluno;
 
INSERT INTO aluno (nome) VALUES ('Vinicius Dias');
INSERT INTO aluno (nome) VALUES ('Nico Steppat');
INSERT INTO aluno (nome) VALUES ('Joao Roberto');
INSERT INTO aluno (nome) VALUES ('Diego');
INSERT INTO aluno (nome) VALUES ('Diogo');


-- Filtros
SELECT * 
	FROM aluno
	WHERE nome <> 'Yuri';
	
SELECT * 
	FROM aluno
	WHERE nome != 'Yuri';
	
-- O _ Retorna qualquer caractere 
SELECT * 
	FROM aluno
	WHERE nome LIKE 'Di_go'; -- Retorna Diego e Diogo
	
SELECT * 
	FROM aluno
	WHERE nome NOT LIKE 'Di_go'; -- Retorna tudo que não for a pesquisa
	
-- O % é tudo dali em diante	
SELECT * 
	FROM aluno
	WHERE nome LIKE 'D%'; -- Retorna alunos que começam com D
	
SELECT * 
	FROM aluno
	WHERE nome LIKE '%s'; -- Todos com letra S no final
	
SELECT * 
	FROM aluno
	WHERE nome LIKE '% %'; -- Qualquer coisa que tenha espaço
	
SELECT * 
	FROM aluno
	WHERE nome LIKE '%i%a%'; -- Tem que ter um I e um A

-- Valores preenchidos e não preenchidos
SELECT * 
	FROM aluno
	WHERE cpf IS NOT NULL

SELECT * 
	FROM aluno
	WHERE cpf IS NULL
	
-- Maior e menor ou igual
SELECT * 
	FROM aluno
	WHERE idade >= 22; -- <=, <, >

-- Filtro de entre. Serve para todos os números e datas
SELECT * 
	FROM aluno
	WHERE idade BETWEEN 10 AND 35;
	
-- Valores boolean só tem filtro e = e !=. IS NULL e IS NOT NULL
SELECT * 
	FROM aluno
	WHERE ativo != true;

-- Usando o AND
SELECT * 
	FROM aluno
	WHERE nome LIKE 'D%'
	AND cpf IS NOT NULL;

SELECT * 
	FROM aluno
	WHERE nome LIKE 'Diogo' 
	OR nome LIKE 'Rodrigo' --Inexistente
	OR nome LIKE 'Nico%';
	
SELECT * 
	FROM aluno
	WHERE nome LIKE '%Steppat'
	AND nome LIKE 'Nico%'; --Trazendo nome completo

SELECT * 
	FROM aluno
	WHERE nome LIKE 'Diego'
	OR nome LIKE 'Nico%';

