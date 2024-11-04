USE exercicios;

CREATE TABLE endereço(
idEndereço int primary key auto_increment,
Bairro varchar(45),
Rua varchar(45),
Numero int,
fkFarmacia int unique,

constraint FkEnderecoFarmacia foreign key (fkFarmacia) references Farmácia(idFarmacia)
) auto_increment = 1;

CREATE TABLE Farmácia(
idFarmacia int primary key auto_increment,
Nome varchar(45),
Movimento varchar(45) constraint chkMovimento CHECK(Movimento in ('Parado', 'Moderado', 'Lotado')),
Estado varchar(45) constraint chkEstado CHECK(Estado in ('Aberto', 'Fechado')),
fkFuncionario int,

constraint FkFarmaciaFuncionario foreign key (fkFuncionario) references Funcionario(idFuncionario)
) auto_increment = 1;

CREATE TABLE Funcionario(
idFuncionario int primary key auto_increment,
Nome varchar(45),
Idade int,
Funcao varchar(45)
) auto_increment = 1;

INSERT INTO Endereço (Bairro, Rua, Numero, fkFarmacia) VALUES 
('Centro', 'Avenida Brasil', 123, 1),
('Jardim das Flores', 'Rua das Margaridas', 456, 2),
('São Jorge', 'Rua das Acácias', 789, 3),
('Vila Nova', 'Rua das Palmeiras', 101, 4),
('Bairro Alto', 'Rua do Sol', 202, 5),
('Lagoa Verde', 'Rua das Laranjeiras', 303, 6);

select * from endereço;

INSERT INTO Farmácia (Nome, Movimento, Estado, fkFuncionario) VALUES 
('Farmácia do Centro', 'Moderado', 'Aberto', 1),
('Farmácia Saúde', 'Lotado', 'Aberto', 2),
('Farmácia Bem Estar', 'Parado', 'Fechado', 3),
('Farmácia Vida', 'Moderado', 'Aberto', 4),
('Farmácia Esperança', 'Lotado', 'Aberto', 5),
('Farmácia Natura', 'Parado', 'Fechado', 6);

select * from farmácia;

INSERT INTO Funcionario (Nome, Idade, Funcao) VALUES 
('Carlos Silva', 30, 'Farmacêutico'),
('Ana Souza', 28, 'Atendente'),
('João Pereira', 35, 'Gerente'),
('Mariana Oliveira', 25, 'Assistente'),
('Ricardo Lima', 40, 'Farmacêutico'),
('Fernanda Costa', 32, 'Atendente');

Select * from funcionario;


select * from funcionario join farmácia on fkfuncionario = idfuncionario
	join endereço on fkfarmacia = idfarmacia;
    
    
select 
funcionario.nome as 'Empregado',
funcionario.funcao as 'Função',
farmácia.nome as 'Farmácia',
endereço.bairro as 'Bairro',
endereço.rua as 'Rua',
endereço.rua as 'n°'
FROM Funcionario join farmácia on fkfuncionario = idfuncionario
		join endereço on fkfarmacia = idfarmacia;

select 
funcionario.nome as 'Empregado',
funcionario.funcao as 'Função',
farmácia.nome as 'Farmácia',
farmácia.movimento as 'Movimento',
farmácia.estado as 'Situação',
endereço.bairro as 'Bairro',
endereço.rua as 'Rua',
endereço.rua as 'n°',
case
	when estado = 'Fechado' and Movimento = 'Parado' then 'Entraram em Falência'
    else 'Farmácia em Atividade'
    end as EstadoAtual
FROM Funcionario join farmácia on fkfuncionario = idfuncionario
		join endereço on fkfarmacia = idfarmacia;
	
insert into funcionario(nome, idade, funcao) values
('Carlos Alberto', 29, 'Atendente');


select 
funcionario.nome as 'Empregado',
funcionario.funcao as 'Função',
ifnull(farmácia.nome, 'Farmácia Não informada') as 'Farmácia',
ifnull(farmácia.movimento, 'Movimento Não Localizado') as 'Movimento',
ifnull(farmácia.estado, 'Situação Atual não encontrada') as 'Situação',
endereço.bairro as 'Bairro',
endereço.rua as 'Rua',
endereço.rua as 'n°',
case
	when estado = 'Fechado' and Movimento = 'Parado' then 'Entraram em Falência'
    else 'Farmácia em Atividade'
    end as EstadoAtual
FROM Funcionario join farmácia on fkfuncionario = idfuncionario
		join endereço on fkfarmacia = idfarmacia;


    
    
    