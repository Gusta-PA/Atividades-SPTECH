-- Aula 3
-- Novos Conceitos

use adsa;

SHOW TABLES;

Create table Funcionario(
id int primary key auto_increment,
nome varchar(45) not null,
Peso float,
Altura float,
Salario decimal(10,2), -- Só imaginar o salário do Neymar
dtNasc date);

/* 
Números  - INTEIROS E OS NÚMEROS DECIMAIS
INTEIROS - INT
TINYIINT - -127 ATÉ O 127

DECIMAIS 
FLOAT 7 CARACTERES- 12345,67
DOUBLE 15 CARACTERES 
DECIMAL() 32 CARACTERES
	DECIMAL(5,2) 234,56
    DECIMAL (6,3) 234,567
    DECIMAL (7,4) 123,4567 */
    
    
desc funcionario;

INSERT INTO funcionario VALUES
	(default, 'Batman', 95.400, 1.89, 99.99, '1960-01-01');

select * FROM funcionario;

INSERT INTO funcionario (nome) VALUES
	('Superman');

UPDATE funcionario SET salario = 19.99
	Where id = 2;

INSERT INTO funcionario (nome) values
	('Arlequina');

SELECT * from funcionario;

ALTER TABLE funcionario ADD COLUMN tipo varchar(45), 
	ADD CONSTRAINT chkTipo CHECK(tipo in ('Herói', 'Vilão'));

UPDATE funcionario SET tipo = 'Herói'
	Where id in (1,2);

UPDATE funcionario SET tipo = 'Vilão' 
	Where id = 3;

-- SELECT MANIPULA DADOS 
Select nome, dtNasc from funcionario 
	Where nome = 'Batman'; 

SELECT nome, timestampdiff(year, dtNasc, now()) from funcionario
	Where nome = 'Batman';
    
-- Apelidar - ALIASES

SELECT nome AS 'Nome Funcionario',
timestampdiff(year, dtNasc, now()) AS Idade
	from funcionario
	Where nome = 'Batman';

-- CONCATENAR CONCAT()
-- EXIBIR A SEGUINTE FRASE: O XPTO TEM Y ANOS.

SELECT concat('O ', nome, 'tem ', timestampdiff(year,dtNasc,now()), ' anos.') AS frase From funcionario
	Where nome = 'Batman';

SELECT nome, CASE 	-- SEMELHANTE AO IF DE JAVASCRIPT
	When tipo = 'Vilão' then 'Eu sou mal!'
	When tipo = 'Herói' then 'Eu sou o cara' END AS 'FRASE DE EFEITO'
    from funcionario;

-- ifnull
SELECT * FROM FUNCIONARIO;
Select nome, ifnull(peso, 'Está faltando o peso!') as peso
	From funcionario;



