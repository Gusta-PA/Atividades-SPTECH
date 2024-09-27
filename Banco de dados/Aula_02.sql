CREATE DATABASE Correção;
use Correção;

-- Correção exercício 
-- Aula 2

CREATE TABLE revista(
id int primary key,
nome varchar(45),
categoria varchar(30)
);

desc revista;

INSERT INTO revista VALUES
(1,'Carros', 'Carros'),
(2,'Veja', 'Notícia');

select * from revista;

-- nome começa com c
select nome from revista
	Where nome like 'c%';

-- termina com s 
select nome from revista
	where nome like '%s';

-- segunda letra
select nome from revista
	where nome like '_a%';

-- penultima letra
select nome from revista
	where nome like '%o_';

SELECT nome, categoria from revista ORDER BY nome;

Select nome from revista
	Where nome <> 'Carros';

-- Novos conceitos 

-- Excluir a tabela inteira
-- DROP TABLE revista;

-- Alterar a tipagem do campo nome de varchar(45) par varchar(60)
ALTER TABLE revista MODIFY COLUMN nome varchar (60);

desc revista;

-- Alterar a minha tabela RENOMEAR UMA COLUNA
ALTER TABLE revista RENAME COLUMN categoria TO cat;

-- Alterar a tabela excluir um campo
ALTER TABLE revista DROP COLUMN cat;

SELECT * from revista;

ALTER TABLE revista ADD COLUMN categoria varchar(30);

desc revista;

-- ATUALIZAR UM DADO DA TABELA
-- NÃO EXISTE UPTADE SEM WHERE
UPDATE revista SET categoria  = 'carros'
	where id = 1;
    
select * from revista;

UPDATE revista SET nome = 'Revista Veja', categoria = 'Notícia'
	where id = 2;

-- alter table com add column
-- alter table com drop column
-- alter table com modify column
-- alter table com rename column
-- uptade 

-- AUTO_INCREMENT
ALTER TABLE revista MODIFY COLUMN id int auto_increment;

desc revista;

Select * from revista;

INSERT INTO revista VALUES 
(default, 'Recreio', 'Entretenimento');

INSERT INTO revista (nome, categoria) values
('Geo', 'Geografia');

ALTER TABLE revista auto_increment = 100;

INSERT INTO revista (nome) VALUES
('Caras');

Select * from revista;

INSERT INTO revista VALUES 
(default, 'Recreio 2', 'Curiosidade');

-- PARA EXCLUIR UMA LINHA INTEIRA 
DELETE FROM revista
	Where id = 101;

-- LIMPAR A TABELA INTEIRA 
-- TRUNCATE TABLE revista;

-- Quando um TRUNCATE é executado, ele elimina o Auto_increment, então é necessário alterar novamente o valor

-- Exbir o nome da revista que começa com C e o ID > 100
SELECT * from revista
	where nome like 'c%' and id >100;
    
    select * from revista
		where nome like 'c%' or id>100;

