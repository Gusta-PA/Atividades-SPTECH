CREATE DATABASE Exercicios;
use Exercicios;

CREATE TABLE pessoa1(
idPessoa1 int primary key auto_increment,
Nome varchar(45),
dtNascimento date
);

CREATE TABLE pessoa2(
idPessoa2 int primary key auto_increment,
Nome varchar(45),
dtNascimento date,
fkPessoa1 int,
constraint fkPessoa1Pessoa2 foreign key (fkpessoa1) references pessoa1(idpessoa1)
) auto_increment = 1;

drop table pessoa2;

INSERT INTO pessoa1 Values
(default, 'Gustavo Pereira', '2005-09-28'),
(default, 'Daniel Mendonça', '2000-05-13'),
(default, 'Lionel Messi', '1987-09-21'),
(default, 'Cristiano Ronaldo ', '1983-12-07'),
(default, 'Endrick', '2006-04-30');

select * from pessoa1;

INSERT INTO pessoa2 VALUES
(default, 'Giovanna Ramos', '2004-07-10', 1),
(default, 'Maria Antonietta', '2000-02-11', 2),
(default, 'Antonella Rocuzzo', '1986-08-02', 3),
(default, 'Georgina', '1989-01-10', 4),
(default, 'Gabriely Miranda', '2002-03-11', 5);

select * from pessoa2 join pessoa1
	on fkpessoa1 = idpessoa1;
    
select pessoa2.nome, pessoa1.nome as 'Parceiro' from pessoa2 join pessoa1
	on fkpessoa1 = idpessoa1; 
    
select *, CASE
		WHEN YEAR(pessoa1.dtNascimento) < 2000 then 'Nascido no século XX'
        WHEN YEAR(pessoa1.dtNascimento) >= 2000 then 'Nascido no século XXI'
        END as DescricaoNascimento
from pessoa2 join pessoa1
	on fkpessoa1 = idpessoa1;

INSERT INTO pessoa1 values
(default,'Rodrigo Goes', '1985-04-10');

INSERT INTO pessoa2 (dtnascimento,fkpessoa1)values
('2010-10-04', 6);

select * from pessoa2;

select IFNULL(pessoa2.nome, 'Nome não Informado') as Nome, pessoa1.nome as 'Parceiro'
	from pessoa2 join pessoa1
		on fkpessoa1 = idpessoa1;