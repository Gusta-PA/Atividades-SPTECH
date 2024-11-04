USE adsa;

CREATE TABLE Dono(
idDono int primary key auto_increment,
Nome varchar(45) not null,
telFixo varchar(20),
telCelular varchar(20),
Rua varchar(45),
Bairro varchar(45)
) auto_increment = 1;

CREATE TABLE pets(
idPet int primary key auto_increment,
Tipo varchar(45),
Nome varchar(45),
Raca varchar(45),
dtNasc date,
fkDono int,

constraint fkDonoPet foreign key (fkDono) references Dono(idDono)
) auto_increment = 101;

desc Dono;
desc pets;


INSERT INTO Dono (Nome, telFixo, telCelular, Rua, Bairro) VALUES 
('Carlos Almeida', '11-3456-7890', '11-98765-4321', 'Rua das Flores', 'Centro'),
('Maria Souza', '21-2345-6789', '21-91234-5678', 'Av. Paulista', 'Bela Vista'),
('João Pereira', '31-4567-8901', '31-99876-5432', 'Rua da Liberdade', 'São Lucas'),
('Ana Silva', '51-1234-5678', '51-98765-1234', 'Rua dos Pássaros', 'Jardim das Laranjeiras'),
('Paulo Henrique', '61-4321-8765', '61-99987-6543', 'Rua das Árvores', 'Vila Verde');

INSERT INTO pets (Tipo, Nome, Raca, dtNasc, fkDono) VALUES 
('Cachorro', 'Rex', 'Labrador', '2020-05-10', 1),
('Gato', 'Mingau', 'Persa', '2019-03-21', 2),
('Cachorro', 'Toby', 'Beagle', '2021-07-15', 3),
('Pássaro', 'Blu', 'Arara', '2022-01-10', 4),
('Cachorro', 'Max', 'Golden Retriever', '2018-11-30', 1),
('Gato', 'Simba', 'Siamês', '2020-09-25', 5);

INSERT INTO Dono (Nome, telFixo, telCelular, Rua, Bairro) 
VALUES ('Fernanda Almeida', '11-5566-7788', '11-99887-7766', 'Rua das Margaridas', 'Centro');
INSERT INTO pets (Tipo, Nome, Raca, dtNasc, fkDono) 
VALUES ('Gato', 'Luna', 'Maine Coon', '2021-02-15', 6);

-- DANDO OS SELECTS SEPARADAMENTE
SELECT * FROM pets;
SELECT * FROM Dono;

-- ALTERANDO O TAMANHO DA COLUNA NOME
ALTER TABLE Dono MODIFY COLUMN Nome varchar(50);

-- SELECIONANDO APENAS OS CACHORROS DA TABELA
SELECT * FROM pets
	where tipo like 'Cachorro';

-- MOSTRANDO APENAS NOME E DATA DE NASCIMENTO DOS PETS
SELECT nome, dtNasc FROM pets;

-- MOSTRANDO TODOS OS PETS DE FORMA CRESCENTE DE ACORDO COM O NOME
SELECT * FROM pets ORDER BY nome;

-- MOSTRANDO TODOS OS CLIENTES E FORMA DECRESCENTE DE ACORDO COM O BAIRRO
SELECT * FROM Dono ORDER BY Bairro DESC;

-- MOSTRANDO OS CLIENTES QUE TEM O MESMO SOBRENOME
SELECT * FROM dono
	where nome like '%Almeida';

-- ATUALIZANDO O TELEFONE DO CLIENTE COM ID 1, E VERIFICANDO A ALTERAÇÃO
UPDATE Dono set telFixo = '11 6543-0987'
	where idDono = 1;
    
SELECT * FROM dono
	where idDono = 1;
    
-- MOSTRANDO TODOS OS PETS COM SEUS RESPECTIVOS DONOS
SELECT * from pets JOIN Dono
	on fkDono = idDono;
    
-- MOSTRANDO TODOS OS PETS DO CLIENTE CARLOS ALMEIDA
SELECT * FROM pets JOIN Dono
	on fkDono = idDono
		Where Dono.nome like 'Carlos Almeida';
        
-- EXCLUINDO UM PET
DELETE FROM Pets
	where idpet = 103;
    
SELECT * FROM pets;

-- EXCLUINDO AS TABLEAS
DROP TABLE Pets;
DROP TABLE Dono;