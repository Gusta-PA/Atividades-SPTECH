CREATE DATABASE game_store;
USE game_store;

create table Jogo(
id int primary key auto_increment,
nome varchar(30),
Diretor varchar(30),
Genero varchar (30),
Lançamento date,
Nota int CHECK (Nota >= 1 AND nota <=10),
QtdDisponiveis int

-- constraint chkNota CHECK (nota >= 1 and nota <=10)
);

DESC jogo;

INSERT INTO jogo VALUES
(default, 'Hollow Knight', 'Team Cherry', 'Souls Like', '2016-08-10', 10, 10);

INSERT INTO jogo values
(default, 'Minecraft', 'Notch', 'SandBox', '2005-06-27', 10, 5),
(default, 'Cuphead', 'Caneco', 'SoulsLike', '2017-10-29', 9, 12),
(default, 'Assassins Creed 2', 'Ubisoft','História', '2012-13-05', 9, 5),
(default, 'League of Legends', 'Riot','MOBA' ,'2009-01-27', 2, 90),
(default, 'Fifa 24', 'Mbappe', 'Esportes', '2023-12-12', 6, 30);

SELECT * from jogo;

Alter table jogo add column Mídia varchar(30);

Alter table jogo add constraint chkMidia CHECK (Mídia in ('Digital', 'Físico'));

UPDATE jogo set Mídia = 'Físico' 
	Where Id in (2,4,6);

UPDATE jogo set Mídia = 'Digital'
	Where id in (1,3,5);

SELECT * from jogo where Lançamento >= '2015-01-01';

Select * from jogo 
	Where nome like '%a%' and mídia = 'Físico';

Select * from jogo
	Where diretor not like '%e%';

Select * from jogo
	Where qtdDisponiveis >= 1;
    
alter table Jogo rename column Diretor to Criador;

desc jogo;