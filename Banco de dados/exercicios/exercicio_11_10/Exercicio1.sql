CREATE DATABASE escola;
use escola;

CREATE TABLE aluno(
idaluno int primary key auto_increment,
nome varchar(45),
dtNasc date,
matricula char(8) unique
);

CREATE TABLE endereço(
idEndereço int auto_increment,
fkaluno int,
logradouro varchar(45),
numero int, 
bairro varchar(45),
cidade varchar(45),
estado char (2),
CEP char(8),

constraint fkEnderecoAluno foreign key (fkaluno) references aluno(idaluno),
constraint pkComposta primary key (idEndereço, fkaluno)
) auto_increment = 100;

INSERT INTO aluno (nome, dtNasc, matricula) VALUES
('Alice Silva', '2001-04-12', '20230001'),
('Bruno Costa', '1999-08-25', '20230002'),
('Carlos Pereira', '2000-06-10', '20230003'),
('Daniela Santos', '2002-02-14', '20230004'),
('Eduardo Souza', '2001-11-22', '20230005'),
('Fernanda Lima', '1998-03-30', '20230006'),
('Gabriel Ferreira', '2003-09-15', '20230007'),
('Helena Rocha', '1999-12-08', '20230008'),
('Igor Mendes', '2002-07-01', '20230009'),
('Juliana Alves', '2001-10-19', '20230010');

INSERT INTO endereço (fkaluno, logradouro, numero, bairro, cidade, estado, CEP) VALUES
(1, 'Rua das Flores', 123, 'Centro', 'São Paulo', 'SP', '01001000'),
(2, 'Avenida Brasil', 456, 'Jardim América', 'Rio de Janeiro', 'RJ', '20031000'),
(3, 'Praça da Liberdade', 789, 'Liberdade', 'Belo Horizonte', 'MG', '30140000'),
(4, 'Rua 7 de Setembro', 101, 'Vila Nova', 'Porto Alegre', 'RS', '90010100'),
(5, 'Rua das Palmeiras', 202, 'Bela Vista', 'Curitiba', 'PR', '80020200'),
(6, 'Avenida Paulista', 303, 'Cerqueira César', 'São Paulo', 'SP', '01311000'),
(7, 'Rua XV de Novembro', 404, 'Centro', 'Florianópolis', 'SC', '88015100'),
(8, 'Rua Rio Branco', 505, 'Centro', 'Recife', 'PE', '50030100'),
(9, 'Rua Independência', 606, 'Boa Vista', 'Manaus', 'AM', '69020100'),
(10, 'Rua das Acácias', 707, 'Centro', 'Brasília', 'DF', '70040900');

SELECT * FROM aluno;
select * from endereço;

-- Tópico 3
SELECT 
	aluno.nome as Aluno,
    endereço.logradouro as Logradouro,
    endereço.numero as Número,
    endereço.bairro as Bairro,
    endereço.cidade as Cidade,
    endereço.estado as Estado,
    endereço.CEP as CEP
FROM endereço join aluno on fkaluno = idaluno;

-- Tópico 4
UPDATE endereço set logradouro = 'Santa Terezinha', numero = 209
	where fkaluno = 7;

-- Tópico 5
SELECT
	aluno.nome as Aluno,
    endereço.logradouro as Logradouro,
    endereço.numero as Número,
    endereço.bairro as Bairro,
    endereço.cidade as Cidade,
    endereço.estado as Estado,
    endereço.CEP as CEP
FROM endereço join aluno on fkaluno = idaluno
	WHERE endereço.cidade like 'São Paulo';

-- Tópico 6
DELETE FROM endereço 
	where endereço.estado like 'RJ';
    
-- Tópico 7
ALTER TABLE endereço ADD COLUMN país varchar(50);

-- Tópico 8 
DELETE FROM endereço
	where bairro like '_a%';

-- Tópico 9
ALTER TABLE endereço RENAME COLUMN CEP TO codigoPostal;

-- Tópico 10
SELECT 
	aluno.nome as Aluno,
    endereço.logradouro as Logradouro,
    endereço.numero as Número,
    endereço.bairro as Bairro,
    endereço.cidade as Cidade,
    endereço.estado as Estado,
    endereço.codigoPostal as CEP
FROM endereço join aluno on fkaluno = idaluno
	ORDER BY aluno.nome;

-- Tópico 11
INSERT INTO aluno (nome, dtNasc, matricula) VALUES
('Mariana Oliveira', '2000-05-23', '20230011'),
('Pedro Martins', '1997-12-01', '20230012'),
('Lucas Andrade', '2001-09-14', '20230013');

SELECT 	
	aluno.nome as Aluno,
    endereço.logradouro as Logradouro,
    endereço.numero as Número,
    endereço.bairro as Bairro,
    endereço.cidade as Cidade,
    endereço.estado as Estado,
    endereço.codigoPostal as CEP
from endereço right join aluno on fkaluno = idaluno
	where endereço.fkaluno is null;

-- Tópico 12
SELECT 
	aluno.nome as nomeAluno,
    endereço.logradouro as logradouroEndereço
FROM endereço join aluno on fkaluno = idaluno;

-- Tópico 13
SELECT 
	aluno.idaluno as ID,
    aluno.nome as Aluno
FROM aluno 
	where idaluno in (1,2,3,4,5)
    order BY aluno.nome;
    
-- Tópico 14
SELECT * from aluno
	where nome not like '%A%' and nome not like '%a%';
    
-- Tópico 15
ALTER TABLE endereço drop foreign key fkEnderecoAluno;
TRUNCATE TABLE aluno;
    









