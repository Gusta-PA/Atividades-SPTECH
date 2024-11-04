CREATE DATABASE RockInRio;
USE RockInRio;

CREATE TABLE palco(
idPalco int primary key auto_increment,
nome varchar(45),
artista varchar(45),
qtdPessoas int,
preçoIngresso decimal(10,2)
);

CREATE TABLE participante(
idParticipante int primary key auto_increment,
nome varchar(45),
cpf char(11),
dtNasc date,
telefone char(11),
fkParticipanteMenor int,
fkPalco int not null,

constraint fkParticipanteMenor foreign key (fkParticipanteMenor) references participante(idParticipante),
constraint fkParticipantePalco foreign key (fkPalco) references palco(idPalco)
);

INSERT INTO palco (nome, artista, qtdPessoas, preçoIngresso) VALUES
('Palco Principal', 'Banda Alpha', 5000, 250.00),
('Palco Alternativo', 'DJ Beta', 3000, 180.00),
('Palco Indie', 'Cantor Gamma', 1500, 150.00),
('Palco Rock', 'Banda Delta', 4000, 220.00),
('Palco Eletrônico', 'DJ Épsilon', 3500, 200.00);

INSERT INTO participante (nome, cpf, dtNasc, telefone, fkParticipanteMenor, fkPalco) VALUES
('Lucas Souza', '12345678901', '1990-01-15', '11987654321', NULL, 1),
('Maria Fernandes', '23456789012', '1988-05-20', '21987654322', NULL, 2),
('João Lima', '34567890123', '1995-09-25', '31987654323', NULL, 3),
('Ana Costa', '45678901234', '1993-03-10', '41987654324', NULL, 1),
('Pedro Silva', '56789012345', '1999-12-30', '51987654325', NULL, 4),
('Juliana Alves', '67890123456', '2000-11-15', '61987654326', NULL, 2),
('Felipe Santos', '78901234567', '1992-06-05', '71987654327', NULL, 5),
('Bianca Oliveira', '89012345678', '1998-04-22', '81987654328', NULL, 1),
('Renato Carvalho', '90123456789', '1994-07-18', '91987654329', NULL, 3),
('Isabela Lima', '01234567890', '1997-02-07', '11987654330', NULL, 4),
('Mariana Gomes', '11234567890', '1996-08-12', '21987654331', NULL, 5),
('Bruno Martins', '21234567891', '1989-10-02', '31987654332', NULL, 2),
('Carla Pereira', '31234567892', '1991-12-01', '41987654333', NULL, 1),
('Gabriel Moreira', '41234567893', '1993-03-05', '51987654334', NULL, 4),
('Sofia Nunes', '51234567894', '2001-07-30', '61987654335', NULL, 5);

-- INSERINDO DEPENDENTES
INSERT INTO participante (nome, cpf, dtNasc, telefone, fkParticipanteMenor, fkPalco) VALUES
('João Oliveira', '56789012344', '2008-09-25', '21987654322', 4, 2),
('Mariana Oliveira', '67890123455', '2011-12-17', '21987654323', 4, 2),
('Julia Mendes', '23456789011', '2010-08-15', '11987654322', 1, 1),
('Rafael Mendes', '34567890122', '2012-11-05', '11987654323', 1, 1),
('Lucas Silva', '89012345677', '2007-05-10', '31987654325', 7, 3),
('Fernanda Silva', '90123456788', '2009-08-30', '31987654326', 7, 3);

-- Tópico 3
SELECT 
	palco.nome as Palco,
    participante.nome as Participante
FROM participante JOIN palco on fkpalco = idpalco;

-- Tópico 4 
UPDATE palco set preçoIngresso = 500.00
	where idPalco = 2;
    
-- Tópico 5
SELECT 
	palco.nome as Palco,
    participante.nome as Participante,
    palco.preçoIngresso as "Preço Ingresso"
FROM participante join palco on fkpalco = idpalco
	where preçoIngresso > 200;

-- Tópico 6
ALTER TABLE participante ADD COLUMN email varchar(255);

-- Tópico 7 
ALTER TABLE participante RENAME COLUMN telefone to contato;
DESC participante;

-- Tópico 8 
SELECT 
	participante.nome as Nome,
    dependente.nome as Dependente
From participante LEFT join participante as dependente
	on dependente.fkParticipanteMenor = participante.idParticipante;
    
-- Tópico 9
SELECT 
	participante.nome as Participante,
    dependente.nome as Dependente
from participante LEFT join participante as dependente
	on dependente.fkParticipanteMenor = participante.idParticipante
		where dependente.idParticipante is Null;
        
-- Tópico 10
SELECT 
	participante.nome as nomeParticipante,
    palco.nome as nomePalco
FROM participante join palco on fkpalco = idpalco;

-- Tópico 11
SELECT
	participante.nome as Participante,
    dependente.nome as Dependente
From participante join participante as dependente
	on dependente.idparticipante = participante.fkParticipanteMenor;

-- Tópico 12
SELECT
	palco.nome as Palco,
    palco.qtdPessoas as 'Quantidade Suportada'
 FROM palco
	where preçoIngresso <= 150;
    
-- Tópico 13
SELECT 
	participante.nome as Participante,
    palco.nome as Palco
from participante join palco on fkpalco = idpalco
	where palco.nome like 'Palco I%'; -- Começando pela letra I, pois não tem S
    
-- Tópico 14
SELECT 
	palco.nome as Palco,
	participante.nome as Participantes
FROM participante JOIN palco on fkPalco = idpalco;

-- Tópico 15
SELECT participante.nome from participante order by nome;
SELECT palco.nome from palco order by nome DESC;
    
    
