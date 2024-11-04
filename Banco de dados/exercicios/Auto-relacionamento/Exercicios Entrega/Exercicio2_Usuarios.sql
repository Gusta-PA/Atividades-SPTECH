use sprint2adsa;

CREATE TABLE Usuarios(
idUser int primary key auto_increment,
Nome varchar(45), 
fkGerente int,

constraint fkGerenteUsuarios foreign key (fkgerente) references usuarios(iduser)
);


CREATE TABLE Email(
idEmail int primary key auto_increment,
email varchar(45),
fkUsuario int,

constraint fkEmailUsuario foreign key(fkusuario) references usuarios(iduser)
) auto_increment = 1;

INSERT INTO Usuarios(nome,fkgerente) VALUES 
('Vivian', null),
('Gustavo', 1),
('Matheus', 1),
('Batman', 2);

SELECT * FROM usuarios;

INSERT INTO Email (email, fkusuario) values
('vivian@company.com', 1),
('gustavo@company.com', 2),
('matheus@company.com', 3),
('batman@wayne.com', 4);

select * from email;

Select
usuarios.iduser as 'ID',
usuarios.nome as 'Usuário',
Email.email as 'E-mail',
gerente.nome as 'Usuário Gerente'
from usuarios join email on usuarios.iduser = email.fkusuario
join usuarios as gerente
	on usuarios.fkgerente = gerente.iduser;
    
SELECT
    usuarios.iduser AS 'ID',
    usuarios.nome AS 'Usuário',
    email.email AS 'E-mail',
    gerente.nome AS 'Usuário Gerente',
    CASE 
    when usuarios.fkGerente is null then 'Esse é um Usuário Gerente'
    End as OBS
FROM usuarios
JOIN email ON usuarios.iduser = email.fkusuario
LEFT JOIN usuarios AS gerente
    ON usuarios.fkgerente = gerente.iduser;
    
    SELECT
    usuarios.iduser AS 'ID',
    usuarios.nome AS 'Usuário',
    email.email AS 'E-mail',
    gerente.nome AS 'Usuário Gerente',
    CASE 
    when usuarios.fkGerente is null then 'Esse é um Usuário Gerente'
    End as OBS
FROM usuarios
JOIN email ON usuarios.iduser = email.fkusuario
LEFT JOIN usuarios AS gerente
    ON usuarios.fkgerente = gerente.iduser
		where usuarios.iduser in (1,3);
