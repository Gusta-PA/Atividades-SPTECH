Create database Vingadores;
use vingadores;

create table Herois(
idHeroi int primary key auto_increment,
Nome varchar (45),
Versão varchar(45),
Habilidade varchar(45),
Altura int
);

desc herois;

Insert into herois values
(default, 'Capitão América', 'Vingadores Ultimato', 'Super-Humano', 192);

Select * from herois;


Insert into herois values
(default, 'Homem de Ferro', 'Vingadores Ultimato', 'Inteligência', 185),
(default, 'Tocha Humana', 'Quarteto Fantastico', 'Combustão Humana', 180),
(default, 'Deadpool', 'Deadpool 2', 'Imortalidade', 183),
(default, 'Homem Aranha', 'Homem Aranha: Longe de casa', 'Aracnídeo', 178);

alter table herois add column Regeneração varchar(10);

alter table herois add constraint chkRegeneracao CHECK(regeneração in ('True', 'False'));

Update herois set regeneração = 'FALSE'
	Where idHeroi in (1,2,3,5);

Update herois set regeneração = 'TRUE'
	Where idHeroi = 4;
    
alter table herois modify column versão varchar(100);

Delete from herois 
	Where idHeroi = 3; -- Descanse em paz...

insert into herois values
(default, 'Doutor Estranho', 'Vingadores Ultimato', 'Magia', 190, 'FALSE');

Select * from herois 
	Where nome like 'c%' or nome like 'h%';


Select * from herois 
		Where nome not like '%a%';

Select nome from herois 
	Where altura > 190;
    
Select * from herois Order by altura > 180 desc;
    
TRUNCATE TABLE herois;



