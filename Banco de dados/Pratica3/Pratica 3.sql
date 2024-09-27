create database Sprint2;
use Sprint2;

create table atleta(
idAtleta int primary key auto_increment,
Nome varchar(40),
Modalidade varchar(40),
qtdMedalhas int
);

desc atleta;

insert into atleta values 
(default, 'Michael Jordan', 'Basquete', '5'),
(default, 'Cristiano Ronaldo', 'Futebol', '9'),
(default, 'Anderson Silva', 'Boxe', '3'),
(default, 'Max Verstappen', 'Formula 1', '6'),
(default, 'Sung JinWoo', 'Tenis de Mesa', '1');

select * from atleta;

create table Pais(
idPais int primary key auto_increment,
Nome varchar(30),
Capital varchar (40),
fkidAtleta int,
constraint fkAtletaPais foreign key (fkidAtleta) references Atleta (idAtleta)
);

desc pais;
drop table pais;

Insert into Pais values 
(default,'Brasil', 'Brasilia', 3 ),
(default,'EUA', 'Washinton DC', 1 ),
(default,'Portugal', 'Lisboa', 2 ),
(default,'Coreia do Sul', 'Seoul', 5 );

select * from pais;

Select * from Pais join Atleta
	on fkidAtleta = idAtleta;
    
Select pais.nome, atleta.nome from Pais join Atleta
	on fkidAtleta = idAtleta;

select * from pais join atleta
	on fkidAtleta = idAtleta
    where capital like 'Lisboa';


create table musica(
idMusica int primary key auto_increment,
Titulo varchar(40),
Artista varchar(40),
Genero varchar (40),
fkidAlbum int,
constraint FkAlbumMusica foreign key (fkidAlbum) references album(idAlbum)
) auto_increment = 1;

drop table musica;
insert into musica values
(default,'Numb', 'Linkin Park', 'Rock', 1),
(default,'Faint', 'Linkin Park', 'Rock', 1),
(default,'The Hills', 'The weekend', 'POP',2),
(default,'Shameless', 'The weekend', 'POP',2),
(default,'Keep Up', 'Odetari', 'Eletrônica',3);

select * from musica;

create table album(
idAlbum int primary key auto_increment,
Nome varchar(40),
tipo varchar(15) check(tipo in ('digital','fisico')),
dtLançamento date
);

insert into album values
(default, 'Meteora', 'digital', '2009-10-22'),
(default, 'Beauty Behind the Madness', 'fisico', '2015-03-01'),
(default, 'KEEP UP // FROSTBITE', 'fisico', '2015-03-01');

select * from album;

select * from musica join album
	on fkidalbum = idalbum;

select * from musica join album
	on fkidalbum = idalbum
		where nome like 'Meteora';
	
select * from musica join album
	on fkidalbum = idalbum
		where nome like 'Beauty behind the madness';
        
select musica.titulo, album.nome from musica join album
	on fkidalbum = idalbum;

select * from musica join album
	on fkidalbum = idalbum
		where genero like 'Rock';
