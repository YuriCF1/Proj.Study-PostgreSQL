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

-- CAP 4 ------------------------
-- PRIMARY KEYS

DROP TABLE curso;

CREATE TABLE curso (
	id INTEGER PRIMARY KEY, --  NOT NULL UNIQUE. Não pode ser NULO nem repetido
	nome VARCHAR(255) NOT NULL
);

INSERT INTO curso (id, nome) VALUES (NULL, NULL); -- Nenhuma opção é válida
INSERT INTO curso (id, nome) VALUES (1, NULL);
INSERT INTO curso (id, nome) VALUES (NULL, 'HTML');

INSERT INTO curso (id, nome) VALUES (1, 'HTML');
INSERT INTO curso (id, nome) VALUES (2, 'JAVASCRIPT'); -- Não vai, pois o ID tá duplicado
INSERT INTO curso (id, nome) VALUES (3, 'TYPESCRIPT');

SELECT * FROM curso;

-- FOREIGN KEY
CREATE TABLE student (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL
);

INSERT INTO student (nome) VALUES('Diogo');
INSERT INTO student (nome) VALUES('Vinicius');

SELECT * FROM student;
SELECT * FROM curso;

DROP TABLE student_curso;
CREATE TABLE student_curso (
	student_id INTEGER,
	curso_id INTEGER,
	PRIMARY KEY(student_id, curso_id), -- Chave primária composta
	
	FOREIGN KEY (student_id) --Pegando a chave da tabela
	REFERENCES student(id), -- Referenciando com a chave ID da tabela externa student
	
	FOREIGN KEY (curso_id)
	REFERENCES curso(id)
);

INSERT INTO student_curso (student_id, curso_id) VALUES(1,1);
INSERT INTO student_curso (student_id, curso_id) VALUES(2,2);

DELETE FROM student_curso WHERE student_id = 2 AND curso_id = 1;

INSERT INTO student_curso (student_id, curso_id) VALUES(3,1); --Nenhuma solução abaixo funciona, pois ou o aluno ou o curso 3 não existe
INSERT INTO student_curso (student_id, curso_id) VALUES(1,3);

SELECT * FROM student WHERE id= 1;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM student WHERE id= 2;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM student WHERE id= 3;
SELECT * FROM curso WHERE id = 1;

SELECT * FROM student_curso;

-- Consulta relacionadas, com duas tabelas
SELECT *
	FROM student_curso;

INSERT INTO student_curso (student_id, curso_id) VALUES(2,1);

SELECT 
	student.nome AS student_nome, -- Campos requisitados
	curso.nome AS curso_nome
	FROM student -- Tabela principal
	JOIN student_curso ON student_curso.student_id = student.id -- Da tabela secundária, quero o id registrado, igual o id da principal
	JOIN curso 		   ON curso.id 				   = student_curso.curso_id; -- E da tabela de curso geral, o id do curso que seja o mesmo do id do curso do estudante

-- Aula 7
INSERT INTO student (nome) VALUES ('Nico');
INSERT INTO student (nome) VALUES ('Joao');
INSERT INTO curso (id, nome) VALUES (4, 'CSS');

SELECT * FROM student;
SELECT * FROM curso;

--Priorizando a tabela da esquerda, a primeira. Do aluno
SELECT -- Porém o Nico não será achado aqui, pois ele não está matriculado em curso algum
	student.nome AS student_nome,
	curso.nome AS curso_nome
	FROM student
	LEFT JOIN student_curso ON student_curso.student_id = student.id -- Por isso, usa-se o LEFT para retornar mesmo que o dado de uma tabela seja NULL
	LEFT JOIN curso 		   ON curso.id 				   = student_curso.curso_id;

--Priorizando a tabela da direita, a segunda. Do curso
SELECT 
	student.nome AS student_nome,
	curso.nome AS curso_nome
	FROM student
	RIGHT JOIN student_curso ON student_curso.student_id = student.id
	RIGHT JOIN curso 		   ON curso.id 				   = student_curso.curso_id;
	
--Trazendo o dado de ambas as tabelas, independentemente se tiver NULL ou não
SELECT 
	student.nome AS student_nome,
	curso.nome AS curso_nome
	FROM student
	FULL JOIN student_curso ON student_curso.student_id = student.id
	FULL JOIN curso 		   ON curso.id 				   = student_curso.curso_id;

--Juntando todos os dados de todas as tabelas
SELECT 
	student.nome AS student_nome,
	curso.nome AS curso_nome
	FROM student
CROSS JOIN curso;