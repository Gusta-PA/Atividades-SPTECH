USE exercicios;

-- Tabela Forte
CREATE TABLE Projeto(
idProjeto int primary key auto_increment,
Titulo varchar(45),
Descricao varchar(300)
) auto_increment = 1;

-- Tabela Fraca
CREATE TABLE alunos(
RA int primary key auto_increment,
Nome varchar(45),
Telefone varchar(45),
fkRepresentante int,
fkProjeto int,

constraint fkAlunosRepresentante foreign key (fkrepresentante) references alunos(RA),
constraint fkAlunosProjeto foreign key(fkProjeto) references projeto(idProjeto)
) auto_increment = 1;

desc Projeto;
desc Aluno;

INSERT INTO projeto VALUES
(default,'Projeto 1 - Monitoramento Vagas', 'Monitoramento de vagas de estacionamento em oficinas concessionárias'),
(default,'Projeto 2 - Monitoramento Pneumático', 'Monitoramento de umidade e temperatura em sistemas pneumáticos'),
(default,'Projeto 3 - Monitoramento Café', 'Monitoramento Umidade no solo em plantações de café');

INSERT INTO alunos VALUES
(default, 'Gustavo Pereira', '11-967244467', 1, 1),
(default, 'Bruno Araújo', '11-939044363',2,2),
(default, 'Jusley Junior', '11-91234567',3,3);

INSERT INTO alunos VALUES
(default, 'Nicolas Brando', '11-987543211', 1, 1),
(default, 'Camila Souza', '21-912345678', 1, 1),
(default, 'Lucas Pereira', '31-998765432', 2, 2),
(default, 'Amanda Costa', '41-976543210', 1, 1),
(default, 'Felipe Lima', '51-934567890', 3, 3),
(default, 'Juliana Oliveira', '71-991234567', 3, 3),
(default, 'Rafael Martins', '61-987654321', 3, 3),
(default, 'Mariana Silva', '81-993456789', 1, 1),
(default, 'Bruno Alves', '91-986543210', 3, 3);


SELECT 
alunos.nome as Aluno,
projeto.titulo as Projeto
From alunos join projeto on alunos.fkprojeto = projeto.idprojeto;
    
SELECT alunos.ra,
alunos.nome as Aluno,
representante.nome as Representante
FROM alunos
	join alunos as representante on alunos.fkrepresentante = representante.ra
    order by representante.nome;

SELECT 
alunos.nome as Aluno,
representante.nome as Representante,
alunos.telefone as Telefone,
projeto.titulo as Projeto
	FROM alunos
    join alunos as representante on alunos.fkrepresentante = representante.RA
    join projeto on alunos.fkprojeto = projeto.idprojeto
    Where projeto.titulo like 'Projeto 1 %';

