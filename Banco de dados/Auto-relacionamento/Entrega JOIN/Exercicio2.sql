CREATE DATABASE CAMPANHA;
USE CAMPANHA;

-- TABELA FORTE 
CREATE TABLE Organizador(
idOrg int primary key auto_increment,
Nome varchar(45),
Rua varchar(45),
Bairro varchar(45),
Email varchar(45),
fkVeterano int,

constraint fkOrganizadorVeterano foreign key (fkVeterano) references organizador(idOrg)
) auto_increment = 30;

-- TABELA FRACA 
CREATE TABLE Campanha(
idCampanha int primary key auto_increment,
Categoria varchar(45),
Instituicao1 varchar(45),
instituicao2 varchar(45),
dtFinal date,
fkOrganizador int,

constraint fkCampanhaOrganizador foreign key (fkOrganizador) references organizador(idorg)
) auto_increment = 500;

INSERT INTO Organizador VALUES
(default, 'Gustavo', 'Rua Tiradentes', 'Santa Terezinha', 'gustavo@gmail.com', null),
(default, 'Junior', 'Rua Maua', 'Mauaringa', 'junior@gmail.com', null),
(default, 'Thiago', 'Rua SC', 'Caetanagaem', 'thiago@gmail.com', null);

select * from organizador;

INSERT INTO organizador VALUES
(default, 'Mariana', 'Rua das Flores', 'Centro', 'mariana@gmail.com', 30),
(default, 'Carlos', 'Avenida Paulista', 'Bela Vista', 'carlos@gmail.com', 31),
(default, 'Fernanda', 'Rua XV de Novembro', 'Vila Nova', 'fernanda@gmail.com', 32),
(default, 'Paulo', 'Rua Amazonas', 'Jardim América', 'paulo@gmail.com', 30),
(default, 'Ana', 'Avenida Brasil', 'Centro', 'ana@gmail.com', 32),
(default, 'Roberto', 'Rua Rio Grande', 'Cidade Baixa', 'roberto@gmail.com', 30),
(default, 'Isabela', 'Rua das Acácias', 'São José', 'isabela@gmail.com', 31),
(default, 'João', 'Rua Independência', 'Centro', 'joao@gmail.com', 32);

INSERT INTO Campanha (Categoria, Instituicao1, Instituicao2, dtFinal, fkOrganizador) VALUES
('Educação', 'Escola ABC', 'Instituto Saber', '2024-12-15', 33),
('Saúde', 'Hospital Vida', 'Clínica Boa Saúde', '2024-11-20', 34),
('Meio Ambiente', 'Associação Verde', 'Fundação Terra', '2025-01-30', 31),
('Esportes', 'Clube Esportivo', 'Associação Atletas', '2024-10-05', 30),
('Cultura', 'Museu Nacional', 'Teatro Popular', '2024-09-25', 32),
('Assistência Social', 'Casa de Apoio', 'Fundação Solidariedade', '2024-12-01', 37),
('Alimentação', 'Banco de Alimentos', 'ONG Alimenta', '2024-11-10', 38),
('Tecnologia', 'Centro de Inovação', 'Fundação Tech', '2025-02-15', 36);

INSERT INTO Campanha (Categoria, Instituicao1, Instituicao2, dtFinal, fkOrganizador) VALUES
('Habitação', 'Associação Moradia', 'Fundação Casa Feliz', '2024-12-20', 39),
('Direitos Humanos', 'ONG Justiça e Paz', 'Instituto Cidadania', '2025-03-10', 40),
('Inclusão Social', 'Associação Todos Juntos', 'Fundação Acolher', '2024-11-30', 30),
('Educação Infantil', 'Escola do Futuro', 'Instituto Criança Feliz', '2025-01-25', 35);

select * from campanha;
SELECT * FROM organizador;


-- SELECIONANDO TODOS OS DADOS DOS ORGANIZADORES, ASSIM COMO SUAS CAMPANHAS E VETERANOS
SELECT 
organizador.nome as Organizador,
organizador.email as 'E-mail',
organizador.rua as Rua,
organizador.bairro as Bairro,
campanha.Categoria as Campanha,
campanha.Instituicao1 as '1° Instituição',
campanha.Instituicao2 as '2° Instituição',
veterano.nome as Veterano
From organizador
	LEFT join organizador as veterano on organizador.fkveterano = veterano.idorg
    join campanha on campanha.fkorganizador = organizador.idorg;

-- SELECIONANDO OS DADOS APENAS DA ORGANIZADORA ISABELA
SELECT 
organizador.nome as Organizador,
organizador.email as 'E-mail',
campanha.Categoria as Campanha,
campanha.instituicao1 as '1° instituição',
campanha.instituicao2 as '2° instituição'
FROM organizador
    JOIN campanha on campanha.fkOrganizador = organizador.idorg
		WHERE organizador.nome = 'Isabela';
	
-- EXIBINDO DADOS DOS ORGANIZADORES E VETERANOS
SELECT * FROM organizador join organizador as veterano
	on organizador.fkveterano = veterano.idorg;

-- SELECIONANDO OS ORGANIZADORES SOB SUPERVISÃO DO VETERANO GUSTAVO
SELECT 
organizador.nome as Organizador,
organizador.email as 'E-mail',
organizador.rua as Rua,
organizador.bairro as Bairro,
campanha.Categoria as Campanha,
campanha.Instituicao1 as '1° Instituição',
campanha.Instituicao2 as '2° Instituição',
veterano.nome as Veterano
From organizador
	LEFT join organizador as veterano on organizador.fkveterano = veterano.idorg
    join campanha on campanha.fkorganizador = organizador.idorg
    where veterano.nome = 'Gustavo';
    
-- EXIBINDO TODOS OS DADOS DE TODAS AS TABELAS COM JOIN
SELECT * FROM organizador
	LEFT join organizador as veterano on organizador.fkveterano = veterano.idorg
    join campanha on campanha.fkOrganizador = organizador.idorg;


-- SELECIONANDO OS DADOS DE UM ORGANIZADOR ESPECÍFICO
SELECT
organizador.nome as Organizador,
organizador.email as 'E-mail',
organizador.rua as Rua,
organizador.bairro as Bairro,
campanha.Categoria as Campanha,
campanha.Instituicao1 as '1° Instituição',
campanha.Instituicao2 as '2° Instituição',
veterano.nome as Veterano,
Veterano.email as 'E-mail Veterano',
Veterano.rua as 'Rua Veterano',
Veterano.bairro as 'Bairro Veterano'
	FROM organizador
    LEFT JOIN organizador as Veterano on organizador.fkveterano = veterano.idorg
    JOIN campanha on campanha.fkOrganizador = organizador.idorg
		Where organizador.nome = 'Paulo';