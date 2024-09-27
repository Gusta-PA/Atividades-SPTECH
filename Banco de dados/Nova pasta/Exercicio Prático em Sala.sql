CREATE DATABASE Desafio;
USE Desafio;

create table Timee(
idTime int primary key auto_increment,
Nome varchar(45),
Estado char(2)
);

CREATE TABLE Tecnico(
idTecnico int primary key auto_increment,
Nome varchar(45),
fkTime int,

constraint fkTimeTecnico foreign key (fkTime) references Timee(idTime)
);

desc tecnico;

CREATE TABLE Escalacao (
idEscalacao int primary key auto_increment,
Num_jogador char(3),
Nome Varchar(45),
Posicao varchar(45),
tipo varchar(45),
dtJogo DATETIME,
fkTecnico int,

constraint fkTecnicoEscalacao foreign key (fkTecnico) references Tecnico(idTecnico)
) auto_increment = 1;

INSERT INTO TImee VALUES 
(default, 'São Paulo', 'SP' ),
(default, 'Corinthians', 'SP' ),
(default, 'Flamengo', 'RJ' ),
(default, 'Vasco da Gama', 'RJ' ),
(default, 'Cruzeiro', 'MG' ),
(default, 'Atlético Mineiro', 'MG' );

select * from timee;

INSERT INTO Tecnico Values
(default, 'Luis Zubeldia', 1),
(default, 'Ramon Díaz', 2),
(default, 'Tite', 3),
(default, 'Rafael Paiva', 4),
(default, 'Fernando Seabra', 5),
(default, 'Gabriel Milito', 6);

select * from Tecnico join Timee
	on fktime = idtime;

INSERT INTO Escalacao VALUES
(default, '9', 'Calleri', 'Centro-Avante', 'Titular', '2024-09-24', 1),
(default, '7', 'Lucas Moura', 'Meia-Atacante', 'Titular', '2024-09-24', 1),
(default, '1', 'Rafael', 'Goleiro', 'Titular', '2024-09-24',1 ),
(default, '9', 'Yuri Alberto', 'Centro-Avante', 'Reserva', '2024-09-30', 2),
(default, '10', 'Rodrigo Garro', 'Meio-Campista', 'Titular', '2024-09-30', 2),
(default, '4', 'Raniele', 'Zagueiro', 'Titular', '2024-09-30', 2),
(default, '10', 'Arrascaeta', 'Meio-Campista', 'Titular', '2024-09-19', 3),
(default, '99', 'Gabriel Barbosa', 'Centro-Avante', 'Reserva','2024-09-19', 3),
(default, '9', 'Pedro', 'Centro-Avante', 'Titular','2024-09-19', 3);

select * from escalacao join tecnico
	on fkTecnico = idtecnico;

INSERT INTO escalacao VALUES
(default,'11', 'Coutinho', 'Meio-Campista', 'Reserva', '2024-09-28', 4),
(default,'99', 'Vegetti', 'Centro-Avante', 'Titular', '2024-09-28', 4),
(default,'3', 'Léo Pereira', 'Zagueiro', 'Titular', '2024-09-28', 4),
(default, '1', 'Cássio', 'Goleiro', 'Titular', '2024-09-18', 5),
(default, '2', 'Wesley Gasolina', 'Zagueiro', 'Reserva', '2024-09-18', 5),
(default, '10', 'Matheus Pereira', 'Meia-Atacante', 'Titular', '2024-09-18', 5),
(default, '13', 'Guilherme Arana', 'Lateral-Esquerdo', 'Titular', '2024-09-16', 6),
(default, '7', 'Hulk', 'Centro-Avante', 'Titular', '2024-09-16', 6),
(default, '9', 'Deyverson', 'Centro-Avante', 'Reserva', '2024-09-16', 6);

select * from escalacao join tecnico 
	on fkTecnico = idtecnico  
    join timee
    on fktime = idtime;
    
select escalacao.dtJogo as 'Data de Jogo', tecnico.nome as 'Tecnico', timee.nome as 'Time' from escalacao join tecnico
	on fktecnico = idtecnico
		join Timee
		on fktime = idtime
			where timee.nome like 'São Paulo';
            
select escalacao.dtJogo as 'Data de Jogo', tecnico.nome as 'Tecnico', timee.nome as 'Time' from escalacao join tecnico
	on fktecnico = idtecnico
		join Timee
		on fktime = idtime