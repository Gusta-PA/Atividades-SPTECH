Create database Olimpiadas;
use olimpiadas;

Create table Esporte(
id int primary key auto_increment,
Nome varchar(40) not null,
Categoria varchar(20) check(categoria in ('Individual', 'Coletivo')) not null,
n°Jogadores int not null,
Estreia date not null,
PaísOrigem varchar(40) not null
);

desc esporte;

insert into Esporte values
(default, 'Futebol', 'Coletivo', 11, '1900-07-28', 'Inglaterra'); -- O mês e o dia não estão exatos.

insert into Esporte values
(default, 'Basquete', 'Coletivo', 5, '1904-06-01', 'EUA'),
(default, 'Natação', 'Individual', 1, '1896-03-29', 'França'),
(default, 'Tênis', 'Individual', 1 ,'1896-10-07', 'Holanda');

insert into Esporte values
(default, 'Salto Olimpico', 'Individual', 1, '1904-08-20', 'Alemanha');

Insert into Esporte values
(default, 'Skate', 'Individual', 1, '2020-08-21', 'Brasil', 6.5);

alter table Esporte add column Popularidade float;

UPDATE Esporte set Popularidade = 10
	Where id = 1;

UPDATE Esporte set Popularidade = 9.1
	Where id = 2;

UPDATE Esporte set Popularidade = 5
	Where id = 3;

UPDATE Esporte set Popularidade = 4.5
	Where id = 4;

UPDATE Esporte set Popularidade = 5.4
	Where id = 5;

SELECT * FROM Esporte;

Select * from esporte order by popularidade;

Select * from Esporte 
	Where Estreia >= '2020-01-01';

Alter table Esporte add constraint chkEstreia CHECK (Estreia >= '1896-04-06' and Estreia < '2024-08-28' );

alter table esporte drop constraint esporte_chk_1;

Select * from esporte
	Where nome like '_a%';
    
Select * from esporte
	where n°Jogadores > 4 and n°Jogadores <=11;

Delete from Esporte
where id in (1,3,5);