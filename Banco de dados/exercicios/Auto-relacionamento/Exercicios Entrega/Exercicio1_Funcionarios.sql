use sprint2adsa;

show tables;

create table funcionarios(
idPessoa int primary key auto_increment,
nome varchar(45),
fksupervisor int,
fkArea int,
fkSupervisionados int,

constraint fkFuncionarioSupervisor foreign key (fksupervisor) references funcionarios(idpessoa),
constraint fkFuncionariosArea foreign key (fkArea) references funcionarios(idpessoa),
constraint fkFuncionarioSupervisionados foreign key (fksupervisionados) references funcionarios(idPessoa)
);

create table área(
idArea int primary key auto_increment,
nome varchar(45),

constraint chkArea CHECK (nome in ('Marketing', 'Financeiro', 'TI', 'Dev')) 
) auto_increment = 1;

INSERT INTO funcionarios (nome) values
('Gustavo'),
('Filipe'),
('Andrei'),
('Guilherme'),
('Luana'),
('Giovana'),
('Samara');

select * from funcionarios;

INSERT INTO área (nome) values
('Marketing'),
('TI'),
('Financeiro'),
('Dev');

select * from área;


-- COLOCANDO AS FUNÇÕES DOS FUNCIONÁRIOS
-- Colocando funcionarios no Marketing
update funcionarios set fkarea = 1
	where idpessoa in (2,4);
-- Colocando funcionarios no TI
update funcionarios set fkarea = 2
	where idpessoa = 7;
-- Colocando funcionarios no Financeiro
update funcionarios set fkarea = 3
	where idpessoa in (3,5);
-- Colocando funcionarios no Dev
update funcionarios set fkarea = 4
	where idpessoa in (1,6);


SELECT funcionarios.idpessoa, 
funcionarios.nome as Funcionário,
	área.nome as Área,
    funcionarios.fksupervisor as supervisor
    from funcionarios join área
		on fkarea = idarea;
        
INSERT INTO funcionarios (nome,fkarea) values
('Pedro', 4),
('Gandim', 1),
('Rafael', 2),
('Leandro', 2),
('Giovanni', 3),
('Neto', 4);

select funcionarios.nome as Funcionário,
	área.nome as Área, 
    supervisor.nome as Supervisor
    from funcionarios as funcionarios
    join área on fkarea = idarea
		join funcionarios as Supervisor
			on funcionarios.fksupervisor = supervisor.idpessoa;
    
update funcionarios set fksupervisor = 1
	where idpessoa in (6,8,13);
    
    
update funcionarios set fksupervisor = 3
	where idpessoa in (12,5);

update funcionarios set fksupervisor = 14
	where idpessoa in (1,3);
    
alter table Área drop constraint chkArea;
alter table área add constraint chkArea CHECK(nome in ('Marketing', 'Financeiro', 'TI', 'Dev', 'CEO'));
alter table Funcionarios drop foreign key fkFuncionarioSupervisionados;

alter table funcionarios drop column fksupervisionados;

insert into área(nome) values
('CEO');

insert into funcionarios values
(default, 'Vivian', null, '5');

    
    
    
    