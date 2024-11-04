CREATE DATABASE sptech;
use sptech;

CREATE TABLE aluno(
idAluno int primary key auto_increment,
nome varchar(45),
email varchar(45)
);

CREATE TABLE curso(
idCurso int primary key auto_increment,
nome varchar(45),
cargaHoraria time
) auto_increment= 1000;

CREATE TABLE matricula(
idMatricula int,
fkaluno int,
fkcurso int,
nivel varchar(45),
dtMatricula date,

constraint fkAlunoMatricula foreign key (fkaluno) references aluno(idaluno),
constraint fkCursoMatricula foreign key (fkcurso) references curso(idcurso),
primary key (fkaluno,fkcurso,idMatricula)
);

INSERT INTO aluno (nome) VALUES
('Batman'),
('Robin');

INSERT INTO curso(nome) VALUES
('Inglês'),
('Espanhol'),
('Francês');

INSERT INTO Matricula VALUES
(1,1,1000, 'Avançado1', '2024-10-25'),
(2,1,1001, 'Intermediário1', '2024-10-24'),
(3,1,1002, 'Iniciante1', '2024-10-23'),

(4,2,1002, 'Avançado20', '2024-10-23');

SELECT 
	aluno.nome as Aluno,
    curso.nome as Curso,
    nivel,
		CASE
			when nivel like  'Avançado%' then 'Pikão'
			when nivel like 'Intermediário%' then 'Razoável'
			ELSE 'Brochinha'
		end as 'Nível Badass'
    FROM aluno 
    JOIN matricula ON fkaluno = idAluno
    JOIN curso ON fkcurso = idcurso;
	
    




