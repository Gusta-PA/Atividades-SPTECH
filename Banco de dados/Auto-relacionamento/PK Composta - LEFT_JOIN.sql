USE sprint2adsa;


/* Tipos de atributos
-- Identificador - PK
-- SIMPLES ou COMPOSTO
	-- bairro: simples
    -- Endereço Completo: composto (dividido em partes diferentes)
    
INSERT INTO pessoa VALUES 
(default, 'Aluno','Rua Haddock Lobo, 595, 4° Andar, 01414-905, São Paulo');

Endereço = cep, n°Endereço, Complemento, Bairro, Nome da Rua, Cidade, Estado, País;
Email = username e domínio
Telefone = DDI, DDD, Prefixo, Sufixo

--Monovalorado ou Multivalorado
INSERT INTO pessoa VALUES
(default, 'Aluno', '11-123456789, 11-987654321')

SELECT * from pessoa
	where Telefone like '%, ___9%'
		-- Telefone FIXO e Telefone CELULAR

-- Derivado = idade, deriva da data de nascimento	
*/


-- ENTIDADE FORTE
create table Funcionario(
idFuncionario int primary key auto_increment, -- identificador
Nome varchar(45), -- simples
emailPessoal varchar(45), -- + emailInstitucional = multivalorado
emailInstitucional varchar(45),
fkSupervisor int,

constraint fkFuncionarioSuper foreign key (fkSupervisor) references funcionario(idFuncionario)
);

INSERT INTO funcionario(nome, emailPessoal, fksupervisor) values
('Fernando Brandão', 'brandao@gmail.com',1),
('Vivian', 'Vivian@gmail.com', 1);

SELECT * FROM funcionario;

ALTER TABLE funcionario MODIFY COLUMN fksupervisor int not null;

select func.nome as Funcionário,
superv.nome as Supervisor
	FROM funcionario as func
    join funcionario as superv
    on func.fksupervisor = superv.idfuncionario;


-- ENTIDADE FRACA = Depende de outra tabela para existir
create table Dependente(
idDep int,
fkFunc int,
constraint pkComposta primary key (idDep, fkFunc),
	check(idDep <= 2),
Nome varchar(45),
Parentesco varchar(45),
dtNasc date,
cep char(9),
numEnd varchar(5),
complemento varchar(45),

foreign key(fkFunc) references funcionario(idfuncionario)
);

INSERT INTO Dependente VALUES
(1,1, 'Brandona', 'Esposa', '1983-12-30', '01414-905', '595', '11° Andar'),
(2,1, 'Brandinho', 'Filho', '2005-01-01', '01414-905', '595', '11° Andar'),
(1,2, 'Cintia', 'Namorada', '1988-10-23', '01414-905', '595', '12° Andar');

SELECT * FROM dependente;

SELECT
funcionario.nome as Funcionário,
supervisor.nome as Supervisor,
dep.nome as Dependende
	FROM funcionario 
		join Funcionario as Supervisor on funcionario.fksupervisor = supervisor.idfuncionario
		join dependente as dep on funcionario.idfuncionario = dep.fkfunc;
        
INSERT INTO funcionario(nome,fksupervisor) VALUES
('Fernando', 1);

SELECT * FROM funcionario;

SELECT * FROM funcionario LEFT JOIN dependente on idFuncionario = Fkfunc;





