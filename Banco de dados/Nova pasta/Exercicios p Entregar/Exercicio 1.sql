USE Exercicios;

CREATE TABLE pessoa(
idPessoa int primary key auto_increment,
Nome varchar(45),
CPF char(11)
);

CREATE TABLE reserva(
idReserva INT primary key auto_increment,
dtReserva DATETIME,
dtRetirada DATETIME,
dtDevolucao DATETIME,
fkpessoa int unique,

constraint FkpessoReserva foreign key (fkpessoa) references pessoa(idpessoa)
);

INSERT INTO pessoa VALUES
(default, 'Gustavo', '12345678909'),
(default, 'Larissa', '98765432100'),
(default, 'Gabriel', '11122233344'),
(default, 'Henrique', '55566677788'),
(default, 'Marina', '99988877766');

select * from pessoa;

INSERT INTO reserva VALUES
(default,'2024-09-01 10:30:00', '2024-09-02 09:00:00', '2024-09-10 15:00:00', 1),
(default,'2024-08-25 14:15:00', '2024-08-26 08:30:00', '2024-09-05 11:45:00', 2),
(default,'2024-09-05 12:00:00', '2024-09-06 10:00:00', '2024-09-12 16:00:00', 3),
(default,'2024-09-10 09:00:00', '2024-09-11 08:45:00', '2024-09-15 17:30:00', 4),
(default,'2024-09-18 08:00:00', '2024-09-19 09:30:00', '2024-09-25 14:20:00', 5);

select * from reserva join pessoa
	on idpessoa = fkpessoa;
    
Select 
	reserva.idreserva as 'Reserva',
	reserva.dtReserva as 'Data da Reserva',
    reserva.dtRetirada as 'Data da Retirada',
    reserva.dtDevolucao as 'Data de Devolução',
    pessoa.nome as 'Responsável',
    pessoa.cpf as 'CPF'
from Reserva JOIN pessoa
	on idpessoa = fkpessoa;
    
Select 
	reserva.idreserva as 'Reserva',
	reserva.dtReserva as 'Data da Reserva',
    reserva.dtRetirada as 'Data da Retirada',
    reserva.dtDevolucao as 'Data de Devolução',
    pessoa.nome as 'Responsável',
    pessoa.cpf as 'CPF',
    CASE
		when dtDevolucao > '2024-09-15 12:00:00' then 'Entrega Atrasada'
        ELSE 'Entrega em dia'
		END AS Devoluções
        
from Reserva JOIN pessoa
	on idpessoa = fkpessoa;  
    

INSERT INTO pessoa(nome) values
('Fernando');
INSERT INTO pessoa(cpf) values
('12345678909');
INSERT INTO reserva values
(default,'2024-09-18 08:00:00', '2024-09-19 09:30:00', '2024-09-25 14:20:00', 6),
(default,'2024-09-18 08:00:00', '2024-09-19 09:30:00', '2024-09-25 14:20:00', 7);

    
Select 
	reserva.idreserva as 'Reserva',
	reserva.dtReserva as 'Data da Reserva',
    reserva.dtRetirada as 'Data da Retirada',
    reserva.dtDevolucao as 'Data de Devolução',
    ifnull(pessoa.nome, 'Nome Não Cadastrado') as 'Responsável',
	ifnull(pessoa.cpf, 'CPF não Cadastrado') as 'CPF',
    CASE
		when dtDevolucao > '2024-09-15 12:00:00' then 'Entrega Atrasada'
        ELSE 'Entrega em dia'
		END AS Devoluções
from Reserva JOIN pessoa
	on idpessoa = fkpessoa;  