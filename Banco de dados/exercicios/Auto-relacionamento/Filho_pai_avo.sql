CREATE DATABASE familia;
use familia;

create table avós(
idAvós int primary key auto_increment,
Nome varchar(45)
);

create table pais(
idpais int primary key auto_increment,
Nome varchar(45),
fkpai int,
fkmae int,

constraint fkPaisAvós foreign key (fkpai) references avós(idavós),
constraint fkMaeAvós foreign key (fkmae) references avós(idavós)
); 

create table filho(
idFilho int primary key auto_increment,
Nome varchar(45),
fkpai int,
fkmae int,

constraint fkFilhoPai foreign key (fkpai) references pais(idpais),
constraint fkFilhoMae foreign key (fkmae) references pais(idpais)
);

desc avós;
desc pais;
desc filho;

insert into Filho values 
(default, 'Pedro Leão', 1, 2),
(default, 'Guilherme Queiroz', 3, 4),
(default, 'Gustavo Pereira', 5, 6);


insert into pais values
(default,'Almir Albuquerque JR', 1, 2),
(default,'Simone Nascimento', 3, 4),

(default,'Alessandro Lima', 5, 6),
(default,'Maria Claudiana', 7, 8),

(default,'Edgard Borges', 9, 10),
(default,'Nalva Francisca', 11, 12);

insert into avós values
-- PAIS DO PAI - PEDRO
( default , 'Almir Albuquerque'),
( default , 'Ruth Medeiros'),
-- PAIS DO MAE  - PEDRO
( default , 'Daniel Leão'),
( default , 'Elba Nunes'),

-- PAIS DA PAI - GUILHERME
( default , 'Arnaldo Lima'),
( default , 'Francisca Sobrinha'),
-- PAIS DA MAE - GUILHERME
( default , 'José Araújo'),
( default , 'Maria Vanda'),

-- PAIS DO PAI - GUSTAVO
(default, 'Roberto Almeida'),
(default, 'Ivani XPTO'),
-- PAIS DA MAE - GUSTAVO
(default, 'XPTO'),
(default, 'Geralda Pereira');	

select 
	filho.nome as Nome,
	pais.Nome as Pai,
    pais.nome as Mae
	from filho join pais as pai
		on filho.fkpai = pai.idpais
	join pais as mae
		on filho.fkmae = mae.idpais;
        
SELECT 
    filho.Nome AS NomeFilho,
    pai.Nome AS NomePai,
    mae.Nome AS NomeMae,
    avoPaterno.Nome AS NomeAvoPaterno,
    avoMaternaPai.Nome AS NomeAvoMaternaPai,   -- Mãe do Pai (Avó Paterna)
    avoMaterno.Nome AS NomeAvoMaterno,
    avoPaternoMae.Nome AS NomeAvoPaternoMae    -- Pai da Mãe (Avô Materno)
FROM 
    filho
-- Pai do filho
JOIN 
    pais AS pai ON filho.fkpai = pai.idpais
-- Mãe do filho
JOIN 
    pais AS mae ON filho.fkmae = mae.idpais

-- Avô paterno (Pai do Pai)
JOIN 
    avós AS avoPaterno ON pai.fkpai = avoPaterno.idavós
-- Avó paterna (Mãe do Pai)
JOIN 
    avós AS avoMaternaPai ON pai.fkmae = avoMaternaPai.idavós

-- Avô materno (Pai da Mãe)
JOIN 
    avós AS avoPaternoMae ON mae.fkpai = avoPaternoMae.idavós
-- Avó materna (Mãe da Mãe)
JOIN 
    avós AS avoMaterno ON mae.fkmae = avoMaterno.idavós;
