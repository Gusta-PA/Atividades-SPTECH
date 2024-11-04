CREATE DATABASE pokemon;
use pokemon;

CREATE TABLE treinador (
idTreinador int primary key auto_increment,
nome varchar(45),
dtNasc date,
qtdMedalhas int,
cidadeOrigem varchar(45),
fkmentor int,

constraint fkMentorTreinador foreign key (fkmentor) references treinador(idTreinador)
);

CREATE TABLE pokemon(
idPokemon int primary key auto_increment,
nome varchar(45),
peso decimal(10,2),
altura decimal(10,2),
Raridade varchar(45),
tipo varchar(45),
fkTreinador int,

constraint fkTreinadorPokemon foreign key (fkTreinador) references treinador(idTreinador),
constraint chkTipo CHECK (Tipo in ('Fogo','Água','Fantasma','Pedra','Elétrico','Lutador')),
constraint chkRaridade CHECK (Raridade in ('Comum', 'Lendário'))
);

INSERT INTO treinador (nome, dtNasc, qtdMedalhas, cidadeOrigem, fkmentor) VALUES
('Ash Ketchum', '1990-05-22', 50, 'Pallet Town', NULL),
('Misty Waterflower', '1995-07-01', 10, 'Cerulean City', 1),
('Brock Harrison', '1992-01-15', 30, 'Pewter City', NULL),
('Gary Oak', '1988-10-10', 25, 'Pallet Town', 1),
('Erika Vines', '1993-09-08', 15, 'Celadon City', NULL);

INSERT INTO pokemon (nome, peso, altura, Raridade, tipo, fkTreinador) VALUES
('Pikachu', 6.00, 0.40, 'Comum', 'Elétrico', 1),
('Charmander', 8.50, 0.60, 'Comum', 'Fogo', 1),
('Squirtle', 9.00, 0.50, 'Comum', 'Água', 2),
('Gengar', 40.50, 1.50, 'Comum', 'Fantasma', NULL),
('Regirock', 230.00, 1.70, 'Lendário', 'Pedra', NULL),
('Eevee', NULL, 0.30, 'Comum', 'Lutador', 2), 
('Zapdos', 52.60, 1.60, 'Lendário', 'Elétrico', NULL),
('Geodude', 20.00, 0.40, 'Comum', 'Pedra', 3),
('Poliwrath', 54.00, 1.30, 'Comum', 'Água', 2),
('Machamp', 130.00, 1.60, 'Comum', 'Lutador', 4);

-- Tópico 3
SELECT 
	pokemon.nome as Pokemon,
    treinador.nome as Treinador
FROM pokemon join treinador on fktreinador = idTreinador;

-- Tópico 4
ALTER TABLE pokemon MODIFY COLUMN Raridade varchar(45) not null;

-- Tópico 5
SELECT 
    pokemon.nome as Pokemon,
    CASE
		when pokemon.peso is null then 'Muito Leve'
        else pokemon.peso
	END AS Peso,
    treinador.nome as Treinador
FROM pokemon join treinador on fktreinador = idTreinador;

-- Tópico 6
SELECT 
	treinador.nome as Treinador,
	pokemon.nome as Pokemon,
    pokemon.tipo as Tipo,
    CASE
		when pokemon.tipo = 'Fogo' Then 'Água'
        when pokemon.tipo = 'Água' then 'Elétrico'
        when pokemon.tipo = 'Elétrico' then 'Pedra'
        when pokemon.tipo = 'Pedra' then 'Água'
        when pokemon.tipo = 'Fantasma' then 'Nenhuma'
        when pokemon.tipo = 'Lutador' then 'Nenhuma'
	END AS Fraqueza
FROM pokemon join treinador on fkTreinador = idTreinador;

-- Tópico 7
-- Já existem pokemons sem serem vinculados a um treinador

-- Tópico 8
SELECT
	mentor.nome as Mentor,
    treinador.nome as Treinador,
    pokemon.nome as Pokemon
FROM treinador join treinador as mentor ON treinador.fkMentor = mentor.idTreinador
JOIN pokemon ON treinador.idtreinador = pokemon.fkTreinador
	where treinador.dtNasc < '2004-01-01';
    
-- Tópico 9
SELECT
	mentor.nome as Mentor,
	treinador.nome as Treinador,
    pokemon.nome as Pokemon
FROM treinador LEFT JOIN treinador as mentor ON treinador.fkmentor = mentor.idTreinador
RIGHT JOIN pokemon ON pokemon.fkTreinador = treinador.idTreinador;

-- Tópico 10
SELECT
	pokemon.nome as Pokemon,
	mentor.nome as Mentor,
	treinador.nome as Treinador
FROM pokemon JOIN treinador ON pokemon.fkTreinador = treinador.idTreinador
JOIN treinador as mentor on treinador.fkMentor = mentor.idTreinador
	Where pokemon.nome like '%e%';

-- Tópico 11
SELECT
	CONCAT(pokemon.nome, ' (Tipo: ', pokemon.tipo, ')') AS Pokemon,
    CONCAT(mentor.nome, ' (Mentor)') AS Mentor,
    CONCAT(treinador.nome, ' (Treinador)') AS Treinador
FROM pokemon JOIN treinador ON pokemon.fkTreinador = treinador.idTreinador
JOIN treinador as mentor on treinador.fkMentor = mentor.idTreinador
	where pokemon.tipo like 'Água';
    
-- Tópico 13
SELECT 
	treinador.nome as Treinador,
    pokemon.nome as Pokemon
FROM pokemon join treinador ON fkTreinador = idTreinador
	WHERE tipo = 'Fogo' or tipo = 'Àgua' and altura > 1.00;
    
-- Tópico 14
SELECT
	mentor.nome as Mentor,
	pokemon.nome as 'Pokemon do treinador iniciante'
FROM pokemon join treinador on pokemon.fkTreinador = treinador.idTreinador
join treinador as mentor on mentor.idTreinador = treinador.fkMentor;

-- Tópico 15 
UPDATE pokemon set pokemon.fkTreinador = 2
	where fkTreinador is null;

-- Tópico 16 
DROP DATABASE pokemon;



        
