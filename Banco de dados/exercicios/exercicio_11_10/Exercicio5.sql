CREATE DATABASE hogwarts;
USE hogwarts;

CREATE TABLE hogwarts(
idCasa int primary key auto_increment,
nome varchar(45),
fundador varchar(45),
profResponsavel varchar(45)
);

CREATE TABLE alunos(
RA varchar(5) primary key,
nome varchar(45),
jogador varchar(3),
dtInicio date,
dtFim date,
fkAjudante varchar(5),
fkMonitor varchar(5),
fkCasa int,

constraint fkAjudante foreign key (fkAjudante) references alunos(RA),
constraint fkMonitor foreign key (fkMonitor) references alunos(RA),
constraint fkCasa foreign key (fkCasa) references hogwarts(idCasa),

constraint chkJogador CHECK (jogador in ('Sim', 'Não'))
);

INSERT INTO hogwarts (nome, fundador, profResponsavel) VALUES 
('Grifinória', 'Godric Gryffindor', 'Minerva McGonagall'),
('Sonserina', 'Salazar Slytherin', 'Severus Snape'),
('Corvinal', 'Rowena Ravenclaw', 'Filius Flitwick'),
('Lufa-Lufa', 'Helga Hufflepuff', 'Pomona Sprout');


INSERT INTO alunos (RA, nome, jogador, dtInicio, dtFim, fkAjudante, fkMonitor, fkCasa) VALUES 
('A001', 'Harry Potter', 'Sim', '2021-09-01', '2025-06-30', NULL, NULL, 1),  
('A002', 'Hermione Granger', 'Não', '2021-09-01', '2025-06-30', NULL, 'A001', 1),
('A003', 'Ron Weasley', 'Sim', '2021-09-01', '2025-06-30', NULL, 'A001', 1),  
('A004', 'Draco Malfoy', 'Não', '2021-09-01', '2025-06-30', NULL, 'A001', 2),  
('A005', 'Pansy Parkinson', 'Não', '2021-09-01', '2025-06-30', 'A004', NULL, 2), 
('A006', 'Luna Lovegood', 'Não', '2021-09-01', '2025-06-30', NULL, 'A001', 3), 
('A007', 'Cedric Diggory', 'Sim', '2021-09-01', '2025-06-30', NULL, 'A006', 4), 
('A008', 'Cho Chang', 'Não', '2021-09-01', '2025-06-30', 'A007', NULL, 3),
('A009', 'Neville Longbottom', 'Sim', '2021-09-01', '2025-06-30', NULL, 'A001', 1),
('A010', 'Ginny Weasley', 'Sim', '2021-09-01', '2025-06-30', 'A001', NULL, 1),
('A011', 'Vincent Crabbe', 'Não', '2021-09-01', '2025-06-30', 'A004', 'A008', 2), 
('A012', 'Teddy Lupin', 'Sim', '2021-09-01', '2025-06-30', NULL, NULL, 4);


-- Tópico 3
SELECT 
	alunos.nome as Aluno,
    alunos.jogador as 'Joga Quadribol?'
FROM alunos
	where jogador like 'sim';

-- Tópico 6
SELECT
	alunos.nome as nomeALuno,
    alunos.dtInicio as "Data Início",
    patrono.nome as Patrono
FROM alunos JOIN alunos as patrono ON alunos.RA = patrono.fkAjudante
join hogwarts on alunos.fkcasa = idcasa
	WHERE hogwarts.nome like 'Lufa-Lufa';
    
-- Tópico 7
SELECT
	alunos.nome as Aluno,
    pet.nome as Pet,
    hogwarts.nome as Casa
FROM alunos JOIN alunos as pet ON alunos.RA = pet.fkAjudante
join hogwarts on alunos.fkcasa = idcasa;

-- Tópico 9
SELECT
	monitor.nome as "Monitor Responsável",
    alunos.nome as "nome Aluno",
    hogwarts.nome as Casa
FROM alunos left join alunos as monitor on alunos.fkmonitor = monitor.ra
join hogwarts on alunos.fkcasa = hogwarts.idcasa;

-- Tópico 10
SELECT 
    alunos.nome AS "Nome do Aluno",
    alunos.jogador as "Joga Quadribol?",
    CASE 
        WHEN alunos.fkCasa IS NULL THEN 'aluno não alocado'
        ELSE hogwarts.nome
    END AS "Casa",
    CASE 
        WHEN alunos.fkAjudante IS NULL THEN 'Sem memórias felizes'
        ELSE patrono.nome
    END AS "Patrono"
FROM alunos LEFT JOIN hogwarts ON alunos.fkCasa = hogwarts.idCasa
JOIN alunos as patrono on alunos.fkAjudante = patrono.ra;

-- Tópico 11
SELECT
	alunos.nome as Aluno,
    alunos.dtFim as "Data de Encerramento",
    hogwarts.nome as Casa
from alunos join hogwarts on fkcasa = idcasa;

-- Tópico 13
SELECT
	alunos.nome as Aluno,
    CASE
		when alunos.fkmonitor is null then "Tem caroço nesse angu"
        else monitor.nome
	END as Monitor
FROM alunos LEFT join alunos as monitor on alunos.fkmonitor = monitor.ra;

-- Tópico 14
SELECT
	alunos.nome as Aluno,
    CASE
		when alunos.fkmonitor is null then "Aluno não começou o curso e Hogwarts"
        else monitor.nome
	END as Monitor
FROM alunos LEFT join alunos as monitor on alunos.fkmonitor = monitor.ra;

-- Tópico 15
DROP DATABASE hogwarts;

    
    
    
    
    
