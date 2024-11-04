CREATE DATABASE Sprint1_ex2;
USE Sprint1_ex2;

CREATE TABLE Atleta(
idAtleta int primary key,
Nome varchar(40), 
Modalidade varchar(40), 
qntMedalhas int
);

desc atleta;

INSERT INTO atleta values
(1, 'Marta', 'Futebol Feminino', 1),
(2, 'Kate Markgraf','Futebol Feminino', 1);

INSERT INTO atleta values
(3, 'Chris Rampone Pearce', 'Futebol Feminino', 1),
(4, 'Léon Marchand', 'Natação',5),
(5, 'Torri Huske', 'Natação',5),
(6, 'Mollie O Callahan', 'Natação', 5),
(7, 'Simone Biles', 'Ginastica', 4),
(8, 'Rebeca Andrade', 'Ginastica',4),
(9, 'Jordan Chiles', 'Ginastica', 2),
(10, 'Théo Faure', 'Voleibol',1),
(11, 'Wilfredo León', 'Voleibol', 1),
(12, 'Thiery', 'Voleibol', 0);

Select * from atleta;

UPDATE atleta SET qntMedalhas = 2
	Where idAtleta = 1;
    
UPDATE atleta SET qntMedalhas = 3
	Where idAtleta = 2;

UPDATE atleta SET qntMedalhas = 2
	Where idAtleta = 3;
    
UPDATE atleta SET nome = 'Bob Esponja'
	Where idAtleta = 4;
    
ALTER TABLE atleta ADD COLUMN dataNasc date;

desc atleta;
Select * from atleta;

UPDATE atleta SET dataNasc = '2000-01-01'
	Where idAtleta > 0;

UPDATE atleta set dataNasc = '2001-11-09'
	Where idAtleta > 0;
    
DELETE FROM atleta
	Where idAtleta = 5;

SELECT * FROM Atleta
	Where Modalidade <> 'Natação';

SELECT * FROM atleta
	Where qntMedalhas >= 3;
    
ALTER TABLE atleta MODIFY COLUMN modalidade varchar(60);
desc atleta;

-- TRUNCATE TABLE atleta;


-- EXERCÍCIO 2 -------------------------------------------------
CREATE TABLE Musica(
idMusica int primary key,
Titulo varchar(40),
Artista varchar (40),
Genero varchar (40)
);

desc musica;

INSERT INTO musica Values
(1,'Numb', 'Linkin Park','Rock'),
(2,'In the End', 'Linkin Park','Rock'),
(3,'Feel invencible', 'Skillet','Rock'),
(4,'Hero', 'Skillet','Rock'),
(5,'True Friends', 'Bring me the Horizon','Rock'),
(6,'Can You Feel My Heart', 'Bring me the Horizon','Rock'),
(7, 'The Hills', 'The Weekend', 'POP'),
(8, 'One of the Girls', 'The Weekend', 'POP'),
(9, 'Hapier Than Never', 'Billie Eilish', 'POP'),
(10, 'CHIHIRO', 'Billie Eilish', 'POP'),
(11, 'Alone', 'Marshmello', 'POP'),
(12, 'Friends', 'Marshmello', 'POP'),
(13, 'Chandelier', 'Will Paquin', 'Indie'),
(14, 'Satellite', 'Will Paquin', 'Indie'),
(15, 'VoiceMail', 'Lovesick', 'Indie'),
(16, 'Was I the Reason', 'Lovesick', 'Indie'),
(17, 'Black Out Days', 'Phantogram', 'Indie'),
(18, 'When Im Small', 'Phantogram', 'Indie');

select * from musica;

ALTER TABLE musica ADD COLUMN Curtidas int;
desc musica;

UPDATE musica set Curtidas = 20
	where idMusica <= 18;

UPDATE musica set CURTIDAS = 15
	Where idMusica <= 12; 
    
UPDATE musica SET Curtidas = 10
	where idMusica <= 5;

ALTER TABLE musica MODIFY COLUMN artista varchar(80);
desc musica;
    
UPDATE musica SET curtidas = 100 
	Where idMusica = 1;
    
UPDATE musica SET curtidas = 50
	Where IdMusica = 2;
    
UPDATE musica SET curtidas = 70
	Where IdMusica = 3;
    
SELECT * from musica;

UPDATE musica SET titulo = 'Avalanche'
	Where idMusica = 5;
    
Delete from musica
	Where idmusica = 4;
    
Select * from musica 
	where genero <> 'Rock'; -- Minha playlist não tem Funk
    
Select * from musica
	Where curtidas > 20;
    
Desc musica;

-- TRUNCATE TABLE musica;

-- EXERCICIO 3 -------------------------------------------------------------------------
CREATE TABLE filme(
idFilme int primary key,
Titulo varchar(50),
Genero varchar(40),
Diretor varchar(40)
);

DESC filme;

INSERT INTO filme VALUES
(1,'Batman: O Cavaleiro das Trevas', 'Ação','Christopher Nolan'),
(2,'Vingadores Ultimato', 'Ação','Joe Russo, Antony Russo'),
(3,'Vingadores Guerra Infinita', 'Ação','Joe Russo, Antony Russo'),
(4,'Cinquenta Tons de Cinza', 'Romance','Sam Taylor-Johnson'),
(5,'Amor de Redenção', 'Romance','D.J. Caruso'),
(6,'Como Eu Era Antes de Você', 'Romance','Thea Sharrock'),
(7,'Psicose', 'Terror','Alfred Hitchcock'),
(8,'O Exorcista', 'Terror','William Friedkin'),
(9,'Invocação do Mal', 'Terror','James Wan');

Select * from filme;

ALTER TABLE filme ADD COLUMN Protagonista varchar(40);

UPDATE filme SET Protagonista = 'Relampago Mcqueen'
	Where idFilme > 0;

ALTER TABLE filme MODIFY COLUMN Diretor varchar(150);

UPDATE filme SET diretor = 'Cristiano Ronaldo'
	where idfilme = 5;

UPDATE filme SET diretor = 'Lionel Messi'
	where idfilme = 2;
    
UPDATE filme SET diretor = 'Neymar Jr.'
	where idfilme = 7;
    
UPDATE filme set titulo = 'Gigantes de Aço'
	Where idfilme = 6;

delete from filme 
	where idfilme = 3;
    
SELECT * FROM filme
	where genero <> 'Romance'; -- Minha lista não tem filmes de drama
    
Select * from filme
	where genero = 'ação'; -- Minha playlist não tem filmes de suspense
    
desc filme;

-- TRUNCATE TABLE filme;

-- EXERCÍCIO 4 -----------------------------------------
CREATE TABLE Professor(
idProfessor int primary key auto_increment,
nome varchar(50),
Especialidade varchar(50),
dtNasc date
)auto_increment = 1;

desc professor;

ALTER TABLE professor ADD COLUMN função varchar(60);

-- CHECK CONSTRAINT (REGRA)
-- ALTER TABLE ADD CONSTRAIN
ALTER TABLE Professor ADD CONSTRAINT chkFunção
	CHECK (função in ('Titular', 'Monitor', 'Assistente'));
    
INSERT INTO Professor(nome, especialidade,dtNasc, função) VALUES
	('Vivian', 'Banco de Dados', '1983-10-13', 'Titular'),
	('Caio', 'Algoritmo', '1999-10-13','Titular'),
	('Henrique', 'Algoritmo', '2003-05-18', 'Monitor'),
	('Julia', 'TI', '2004-09-23', 'Monitor'),
	('Batman', 'Banco de Dados', '1983-10-13', 'Assistente'),
	('Homem de Ferro', 'TI', '1993-12-25', 'Assistente');
    
Select * from professor;

-- ESSE COMANDO NÃO IRÁ SER ACEITO
INSERT INTO professor (nome, especialidade, dtnasc, função) values
	('RELAMPAGO', 'KATIAU', '0001-01-10', 'katiau');

UPDATE professor SET função = 'Assistente'
	Where idprofessor <= 2;

UPDATE professor SET função = 'Titular'
	where idprofessor >=5;

INSERT INTO professor values
	(default, 'Jorge', 'Inglês', '1980-03-20', 'Titular');
    
Delete from professor
	where idprofessor = 5;
    
SELECT * FROM professor
	Where função = 'titular';
    
Select especialidade, dtNasc from professor
where função = 'Monitor';

UPDATE professor SET dtNasc = '2001-11-09'
	Where idprofessor = 3;
    
-- TRUNCATE TABLE professor;