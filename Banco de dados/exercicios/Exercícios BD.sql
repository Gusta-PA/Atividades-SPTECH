Create database exercicio;
use exercicio;

-- EXERCICIO 1 ------------------------------------------------------------
CREATE TABLE Olimpiadas(
idAtleta char(3) primary key,
Nome varchar(40), 
Modalidade varchar(40), 
qntMedalhas char(3)
);

desc Olimpiadas;

INSERT INTO Olimpiadas VALUES -- ATLETAS DE FUTEBOL FEMININO
('110', 'Marta', 'Futebol Feminino', '1');

INSERT INTO olimpiadas Values
('111', 'Kate Markgraf','Futebol Feminino', '1');

INSERT INTO olimpiadas values
('112', 'Chris Rampone Pearce', 'Futebol Feminino', '1');

INSERT INTO olimpiadas values -- ATLETAS DE NATAÇÃO
('120', 'Léon Marchand', 'Natação', '5'),
('121', 'Torri Huske', 'Natação', '5'),
('122', 'Mollie O Callahan', 'Natação', '5');

INSERT INTO olimpiadas values -- ATLETAS DE GINASTICA
('130', 'Simone Biles', 'Ginastica', '4'),
('131', 'Rebeca Andrade', 'Ginastica','4'),
('132', 'Jordan Chiles', 'Ginastica', '2');

INSERT INTO olimpiadas values -- ATLETAS DE VOLEI
('140', 'Théo Faure', 'Voleibol', '1'),
('141', 'Wilfredo León', 'Voleibol', '1'),
('142', 'Thiery', 'Voleibol', '0');


Select * From olimpiadas; -- Mostrar todos os dados

Select nome, qntMedalhas from olimpiadas; -- Mostrar apenas Nome e medalhas

Select * from olimpiadas -- Mostrar atletas de uma determinada modalidade
	Where Modalidade = 'Natação';

Select * from olimpiadas ORDER BY modalidade; -- Mostrar atletas pela modalidade 

Select * from Olimpiadas ORDER BY qntMedalhas desc; -- Mostrar atletas pela qnt de Medalhas em ordem decrescente

Select * from Olimpiadas -- Atletas que tem S no nome
	Where nome like '%s%'; 

Select * from olimpiadas -- Atletas que começam com a letra T
	where nome like 'T%';

Select * from olimpiadas  -- Atletas que terminam com a letra O
	Where nome like '$o';
    
Select * from olimpiadas
	Where nome like '%r_';
    
-- EXERCÍCIO 2 ------------------------------------------------------------
CREATE TABLE Musica(
idMusica char(4) primary key,
Titulo varchar(40),
Artista varchar (40),
Genero varchar (40)
);

Desc musica;

INSERT INTO musica Values
('001','Numb', 'Linkin Park','Rock'),
('002','In the End', 'Linkin Park','Rock'),

('003','Feel invencible', 'Skillet','Rock'),
('004','Hero', 'Skillet','Rock'),

('005','True Friends', 'Bring me the Horizon','Rock'),
('006','Can You Feel My Heart', 'Bring me the Horizon','Rock'),
-- GENERO ROCK

('007', 'The Hills', 'The Weekend', 'POP'),
('008', 'One of the Girls', 'The Weekend', 'POP'),

('009', 'Hapier Than Never', 'Billie Eilish', 'POP'),
('010', 'CHIHIRO', 'Billie Eilish', 'POP'),

('011', 'Alone', 'Marshmello', 'POP'),
('012', 'Friends', 'Marshmello', 'POP'),
-- GENERO POP

('013', 'Chandelier', 'Will Paquin', 'Indie'),
('014', 'Satellite', 'Will Paquin', 'Indie'),

('015', 'VoiceMail', 'Lovesick', 'Indie'),
('016', 'Was I the Reason', 'Lovesick', 'Indie'),

('017', 'Black Out Days', 'Phantogram', 'Indie'),
('018', 'When Im Small', 'Phantogram', 'Indie');
-- GENERO INDIE

Select * from musica;
Select titulo, artista from musica;

Select * from musica
Where genero = 'Rock';

Select * from musica
Where artista = 'The Weekend';

Select * from musica ORDER BY titulo;
Select * from musica ORDER BY artista desc;

Select * from musica
	Where titulo like 'T%';
Select * From musica
	Where artista like '%N';
Select * from musica
	Where genero like '_O%';
Select * from musica 
	Where titulo like '%L_';

-- EXERCICIO 3 ---------------------------------------------------------------------------
CREATE TABLE Filme(
IdFilme char(3) primary key,
Nome varchar (40),
Genero varchar(40),
Diretor varchar (40)
);

desc filme;

INSERT INTO filme VALUES
('001','Batman: O Cavaleiro das Trevas', 'Ação','Christopher Nolan'),
('002','Vingadores Ultimato', 'Ação','Joe Russo, Antony Russo'),
('003','Vingadores Guerra Infinita', 'Ação','Joe Russo, Antony Russo'),

('004','Cinquenta Tons de Cinza', 'Romance','Sam Taylor-Johnson'),
('005','Amor de Redenção', 'Romance','D.J. Caruso'),
('006','Como Eu Era Antes de Você', 'Romance','Thea Sharrock'),

('007','Psicose', 'Terror','Alfred Hitchcock'),
('008','O Exorcista', 'Terror','William Friedkin'),
('009','Invocação do Mal', 'Terror','James Wan');

Select * from filme;
Select nome, diretor from filme;

Select * from filme
	Where genero = 'terror';
    
Select * from filme
where diretor = 'Joe Russo, Antony Russo';

Select * from filme ORDER BY nome;
Select * from filme ORDER BY diretor desc;

Select * from filme
	Where nome like 'V%';
    
Select * from filme
	Where diretor like '%n';
    
Select * from filme
	Where genero like '_O%';
    
Select * from filme 
	Where nome like '%A_';

-- EXERCICIO 4 -------------------------------------------------------------------------
CREATE TABLE Professor(
idProfessor char(3) primary key,
Nome varchar(40),
Especialidade varchar(40),
dtNasc date
);

desc professor;

INSERT INTO professor VALUES
('001', 'Vivian', 'Banco de Dados', '1981-10-13'),
('002', 'Caio','Algoritmo', '1990-02-17'), -- Eu não sei a data de aniversário dos professores a seguir, incluindo o Caio.
('003', 'Friza', 'PI', '1920-09-22'),
('004', 'Marcos Antonio', 'TI', '1973-04-22'),
('005', 'Matheus', 'Arq. Computacional', '2000-11-25'),
('006', 'Paula', 'Socioemocional', '1998-05-23'),
('007', 'Karine', 'Socioemocional', '1988-01-01');

INSERT INTO professor values
('008', 'Marcio', 'Introdução a SO', '1973-01-07');


Select * from professor;
Select nome, especialidade from professor;

Select * from professor
Where especialidade = 'socioemocional';

Select * from professor ORDER BY nome;
Select * from professor ORDER BY dtNasc desc;

Select * from professor
Where nome like 'M%';

Select * from professor 
Where nome like '%a';

Select * from professor
Where nome like '_a%';

Select * from professor 
Where nome like '%a_';

-- EXERCICIO 5 --------------------------------------------------------------------
CREATE TABLE CURSO(
idCurso int primary key,
Nome varchar(50),
Sigla varchar(3),
Coordenador varchar(50)
);

desc CURSO;

INSERT INTO curso values
('110', 'Análise e Desenvolvimento de Sistemas', 'ADS', 'Marcos Antonio'),
('120', 'Ciências da Computação', 'CCO', 'Vera'),
('130', 'Sistemas da Informação', 'SI', 'Marcio');

Select * from curso;
Select coordenador from curso;

Select * from curso
Where sigla = 'ADS';

Select * from curso ORDER BY nome;
Select * from curso ORDER BY coordenador desc;

Select * from curso
Where nome like 'A%';

Select * from curso
Where nome like '%O';

Select * from curso 
Where nome like '_i%';

Select * from curso
Where nome like '%a_';


-- FIM DOS EXERCICIOS -----------------------------------------------------------------