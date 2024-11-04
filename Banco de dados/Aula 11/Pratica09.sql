CREATE DATABASE Pratica09;
USE pratica09;

CREATE TABLE aluno(
ra int primary key,
nome varchar(45),
email varchar(45),
fkGrupo int,

constraint fkAlunoGrupo foreign key (fkGrupo) references grupo(idGrupo)
);


CREATE TABLE grupo(
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
);


CREATE TABLE professor(
idProfessores int primary key auto_increment,
nome varchar(45),
disciplina varchar(45)
) auto_increment = 10000;


CREATE TABLE avaliacao(
fkGrupo int,
fkProfessor int,
primary key (fkgrupo,fkProfessor),

dtAvaliacao datetime,
nota decimal(5,2)
);

-- Inserindo grupos
INSERT INTO grupo (nome, descricao) VALUES 
('Grupo A', 'Grupo de Estudos de Matemática'),
('Grupo B', 'Grupo de Estudos de Ciências'),
('Grupo C', 'Grupo de Estudos de História'),
('Grupo D', 'Grupo de Estudos de Física'),
('Grupo E', 'Grupo de Estudos de Literatura'),
('Grupo F', 'Grupo de Estudos de Química');

-- Inserindo professores
INSERT INTO professor (nome, disciplina) VALUES 
('Maria Silva', 'Matemática'),
('João Santos', 'Ciências'),
('Ana Oliveira', 'História'),
('Ricardo Almeida', 'Física'),
('Patrícia Gomes', 'Literatura'),
('Lucas Martins', 'Química');

-- Inserindo alunos
INSERT INTO aluno (ra, nome, email, fkGrupo) VALUES 
(1001, 'Carlos Pereira', 'carlos.pereira@email.com', 1), 
(1002, 'Fernanda Lima', 'fernanda.lima@email.com', 1), 
(1003, 'Pedro Souza', 'pedro.souza@email.com', 2), 
(1004, 'Lucia Costa', 'lucia.costa@email.com', 3),
(1005, 'Juliana Rocha', 'juliana.rocha@email.com', 4), 
(1006, 'André Mendes', 'andre.mendes@email.com', 4), 
(1007, 'Sofia Lima', 'sofia.lima@email.com', 5), 
(1008, 'Gabriel Almeida', 'gabriel.almeida@email.com', 6), 
(1009, 'Mariana Costa', 'mariana.costa@email.com', 6);

-- Inserindo avaliações
INSERT INTO avaliacao (fkGrupo, fkProfessor, dtAvaliacao, nota) VALUES 
(1, 10000, '2024-11-01 10:00:00', 9.5), 
(2, 10001, '2024-11-02 10:00:00', 8.0), 
(3, 10002, '2024-11-03 10:00:00', 7.5),
(4, 10003, '2024-11-04 10:00:00', 8.5), 
(5, 10004, '2024-11-05 10:00:00', 9.0), 
(6, 10005, '2024-11-06 10:00:00', 7.8),
(1, 10002, '2024-11-07 10:00:00', 6.5),
(2, 10000, '2024-11-08 10:00:00', 9.3),
(3, 10001, '2024-11-17 09:00:00', 7.9), 
(3, 10003, '2024-11-18 14:30:00', 8.3),
(4, 10004, '2024-11-19 11:00:00', 9.2),
(4, 10005, '2024-11-20 16:00:00', 8.7),
(5, 10002, '2024-11-21 10:00:00', 8.4), 
(5, 10003, '2024-11-22 13:45:00', 9.1),
(6, 10001, '2024-11-23 09:30:00', 8.0), 
(6, 10004, '2024-11-24 12:15:00', 8.9);

SELECT * FROM aluno;
SELECT * FROM grupo;
SELECT * FROM avaliacao;
SELECT * FROM professor;

-- TÓPICO 5
SELECT 
	aluno.nome as Aluno,
    grupo.nome as Grupo
FROM aluno JOIN grupo on fkGrupo = idGrupo;

-- TÓPICO 6
SELECT 
	aluno.nome as Aluno,
    grupo.nome as Grupo,
    grupo.descricao as Descrição
FROM aluno JOIN grupo on fkGrupo = idGrupo
	WHERE fkGrupo = 1;
    
-- TÓPICO 7
SELECT
	grupo.nome as Grupo,
	truncate(avg(nota) , 2) as 'Nota média' 
from grupo JOIN avaliacao on idgrupo = fkgrupo
	group by grupo.nome;
    
-- TÓPICO 8
SELECT
	grupo.nome as Grupo,
	min(nota) as 'Nota Minima',
    max(nota) as 'Nota Máxima'
From avaliacao join grupo on fkgrupo = idgrupo
	group by fkgrupo;
    
-- TÓPICO 9
SELECT	
	grupo.nome as Grupo,
    sum(nota) as 'Soma total da nota'
FROM grupo JOIN avaliacao ON fkgrupo = idgrupo
	group by idgrupo;
    
-- TÓPICO 10
SELECT 
	professor.nome as Professor,
    professor.disciplina as Disciplina,
    grupo.*,
    avaliacao.dtAvaliacao as 'Horario da Avaliação',
    avaliacao.nota as Nota
FROM professor JOIN avaliacao on fkprofessor = idprofessores
	JOIN grupo ON fkgrupo = idgrupo;
    
-- TÓPICO 11
SELECT
	professor.nome as Nome,
    professor.disciplina as Disciplina,
    grupo.*,
    avaliacao.dtAvaliacao as 'Horario da Avaliação'
FROM avaliacao JOIN grupo ON fkgrupo = idGrupo
	JOIN professor ON fkprofessor = idprofessores
		where grupo.idgrupo = 1;
	
-- TÓPICO 12
SELECT 
	grupo.nome as "Grupos Avaliados",
    professor.nome as Professor
FROM avaliacao JOIN professor ON fkProfessor = idProfessores
	JOIN grupo ON fkGrupo = idGrupo
		WHERE idprofessores = 10002;
        
-- TÓPICO 13
SELECT
	grupo.nome as Grupo,
    grupo.descricao as Descrição,
    aluno.nome as Aluno,
    aluno.email as Email,
    professor.nome as Professor,
    professor.disciplina as Disciplina,
    avaliacao.dtAvaliacao as "Horario da avaliação"
FROM avaliacao JOIN grupo ON avaliacao.fkgrupo = idGrupo
	JOIN professor ON fkProfessor = idProfessores
	JOIN aluno ON aluno.fkGrupo = idGrupo;

-- TÓPICO 14
SELECT distinct
	nota
From avaliacao;

-- TÓPICO 15
SELECT
	professor.idProfessores as Identificação,
    professor.nome as Professor,
    truncate(avg(nota), 2) as "Média de notas aplicadas",
    sum(nota) as "Soma das notas aplicadas"
FROM professor JOIN avaliacao ON fkprofessor = idprofessores
	group by idprofessores;
    
-- TÓPICO 16 
SELECT
	grupo.idGrupo as Identificador,
    grupo.nome as Grupo,
    truncate(avg(nota), 2) as "Nota Média",
    sum(nota) as "Total de notas atribuidas"
FROM grupo JOIN avaliacao ON fkgrupo = idgrupo
	GROUP BY idgrupo;

-- TÓPICO 17 
SELECT
	professor.idProfessores as Identificação,
    professor.nome as Professor,
    min(nota) as 'Menor nota dada',
    max(nota) as 'Maior nota dada'
FROM professor JOIN avaliacao ON fkprofessor = idprofessores
	GROUP BY idprofessores;

-- TÓPICO 18 
SELECT 
	grupo.idgrupo as Identificador,
    grupo.nome as Grupo,
    min(nota) as 'Menor nota atribuída',
    max(nota) as 'Maior nota atribuída'
FROM grupo JOIN avaliacao ON fkgrupo = idGrupo
	GROUP BY idgrupo;