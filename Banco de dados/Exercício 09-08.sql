-- ISSO É UM COMENTÁRIO
-- TODO COMANDO TERMINA COM PONTO E VIRGULA;

-- CRIAR UM BANCO DE DADOS
CREATE DATABASE adsa;

-- SELECIONAR BANCO DE DADOS
USE adsa;

-- CRIAR A NOSSA PRIMEIRA TABELA
CREATE TABLE aluno(
-- TODA TABELA TEM UMA CHAVE PRIMÁRIA
-- PRIMARY KEY (PK)
-- id int primary key
ra char(8) primary key,
nome varchar(50),
email varchar(30)
);

-- char() - ele não varia a quantidade de caracteres
-- varchat() - varia a qnt de caracteres

-- DESCREVER OS CAMPOS DA TABELA
DESCRIBE aluno;
DESC aluno;

-- INSERIR DADOS
-- TUDO QUE É TEXTO FICA EM ASPAS SIMPLES
INSERT INTO aluno VALUES
('01241031', 'BEATRIZ', 'bia@sptech.school');

-- EXIBIR OS DADOS DA ALUNA
SELECT ra, nome, email FROM aluno;
SELECT ra FROM aluno;
SELECT * FROM aluno;

-- INSERINDO OS OUTROS ALUNOS
INSERT INTO aluno VALUES
('01242115', 'RENAN', 'renan@sptech.school'),
('01242045', 'DANIEL ALFACE', 'daniel@sptech.school'),
('01234567', 'NOME DA PESSOA', 'nome@sptech.school'),
('01242017', 'Edgard borges', 'edgard@sptech.school');

SELECT * FROM aluno;

-- EXIBIR APENAS O ALUNO CUJO O NOME É BEATRIZ
SELECT nome FROM aluno
	WHERE nome = 'BEATRIZ';

-- EXIBIR CUJO O NOME COMEÇA COM R
-- QUANDO SE COLOCAR %, OS CARACTERES APÓS O R NÃO IMPORTAM
SELECT nome FROM aluno
	WHERE nome like 'r%';
    
-- EXIBIR ALUNO CUJO NOME TERMINA COM N
SELECT nome FROM aluno
WHERE nome like '%n';

-- EXIBIR NOME DO ALUNO CUJA SEGUNDA LETRA DO NOME DO ALUNO É E
SELECT nome FROM aluno
WHERE nome like '_e%';

-- EXIBIR O NOME DO ALUNO QUE CONTÉM A LETRA A
SELECT nome FROM aluno
WHERE nome like '%a%';

-- O NOME QUE É DIFERENTE DE RENAN
SELECT nome FROM aluno
WHERE nome != 'RENAN';

-- EXIBIR OS ALUNOS EM ORDEM ALFABÉTICA
SELECT * FROM aluno ORDER BY nome;

-- ORDEM DECRESCENTE
SELECT * FROM aluno ORDER BY nome desc;
