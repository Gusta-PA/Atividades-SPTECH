CREATE DATABASE desenho;
USE desenho;

create table Desenhos(
id int primary key auto_increment,
titulo varchar(50),
Data_lançamento date,
Emissora_Original varchar(50),
Classificação int,
Status_Desenho varchar(15),
Nota int,

constraint chkNota CHECK(Nota in (1,2,3,4,5))
) auto_increment = 10;

desc desenhos;

insert into Desenhos values
(default, 'O incrivel mundo de Gumball', '2010-09-28', 'Cartoon Network', 12, 'Encerrado', 5);

Select * from desenhos;

Insert into Desenhos values
(default, 'Apenas um Show', '2010-07-19', 'Cartoon Network', 12, 'Finalizado', 5),
(default, 'Hora de Aventura','2009-03-14', 'Cartoon Network', 14, 'Finalizado', 5 ),
(default, 'Dragon Ball Z', '2007-05-02', 'Cartoon Network', 12, 'Exibindo', 4); -- Havia colocado anteriormente 4.5

Insert into Desenhos values
(default, 'Danny Phantom', '2005-04-10', 'Nickelodeon', 10, 'Finalizado', 3),
(default, 'Bob Esponja', '2008-07-10', 'Nickelodeon', 8, 'Exibindo', 4),
(default, 'Gravity Falls', '2012-05-26', 'Disney XD', 12, 'Finalizado', 5);

Select * from desenhos;

UPDATE Desenhos set status_desenho = 'Finalizado'
	where id in (13,15);
    
Delete from Desenhos
	where id = 12;
    
Select * from desenhos
	where Titulo like 'G%';
    
Alter table Desenhos rename column Classificação to classificacaoIndicativa;
    
UPDATE desenhos set nota = 1 , Data_lançamento = '2018-04-01'
	Where id = 10;

UPDATE desenhos set Data_lançamento = '2020-01-10'
	Where id = 11;

Truncate Table Desenhos;

alter table desenhos drop constraint chkNota;