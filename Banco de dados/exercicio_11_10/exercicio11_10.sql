create database locadora;
use locadora;

create table clientes(
idCliente int primary key auto_increment,
Nome varchar(45),
Rua varchar(45),
complemento varchar(45),
bairro varchar(45),
cidade varchar(45),
uf varchar(45),
telefone char(11),
email varchar(45)
);

create table produto(
idProduto int primary key auto_increment,
titulo varchar(45),
anoLanc char(4),
tipo varchar(45),
genero varchar(45),
plataforma varchar(45),
preco decimal (10,2),
condicao varchar(45),

constraint chkTipoProduto check (tipo in ('Jogo', 'Filme')),
constraint chkCondicaoProduto check (condicao in ('Original', 'Filme'))
);


create table aluguel(
idAluguel int,
fkCliente int,
fkProduto int,
constraint pkComposta primary key (idAluguel, fkCliente, fkProduto),

dtRetirada date,
dtDevolucao date,

constraint fkAluguelCliente foreign key (fkCliente) references clientes(idCliente),
constraint fkAluguelProduto foreign key (fkProduto) references produto(idProduto)
);

INSERT INTO clientes (Nome, Rua, complemento, bairro, cidade, uf, telefone, email) VALUES 
('João Silva', 'Rua das Flores', 'Apto 101', 'Jardim Paulista', 'São Paulo', 'SP', '11987654321', 'joao.silva@email.com'),
('Maria Souza', 'Av. Brasil', 'Casa 12', 'Centro', 'Rio de Janeiro', 'RJ', '21987654321', 'maria.souza@email.com'),
('Carlos Pereira', 'Rua dos Lírios', 'Apto 302', 'Boa Vista', 'Porto Alegre', 'RS', '51987654321', 'carlos.pereira@email.com'),
('Ana Oliveira', 'Rua das Palmeiras', 'Bloco B', 'Copacabana', 'Rio de Janeiro', 'RJ', '21912345678', 'ana.oliveira@email.com'),
('Fernanda Costa', 'Rua dos Jacarandás', 'Casa 45', 'Vila Madalena', 'São Paulo', 'SP', '11912345678', 'fernanda.costa@email.com'),
('Pedro Lima', 'Av. das Nações', 'Apto 1102', 'Bela Vista', 'Brasília', 'DF', '61987654321', 'pedro.lima@email.com'),
('Lucas Rocha', 'Rua Amazonas', 'Casa 7', 'Savassi', 'Belo Horizonte', 'MG', '31987654321', 'lucas.rocha@email.com'),
('Carla Mendes', 'Rua Bahia', 'Apto 203', 'Centro', 'Curitiba', 'PR', '41987654321', 'carla.mendes@email.com'),
('Gabriel Torres', 'Av. Independência', 'Cobertura 4', 'Jardins', 'São Paulo', 'SP', '11923456789', 'gabriel.torres@email.com'),
('Juliana Alves', 'Rua Rio Branco', 'Casa 25', 'Leblon', 'Rio de Janeiro', 'RJ', '21923456789', 'juliana.alves@email.com');

INSERT INTO produto (titulo, anoLanc, tipo, genero, plataforma, preco, condicao) VALUES 
('The Last of Us Part II', '2020', 'Jogo', 'Ação/Aventura', 'PlayStation 4', 19.90, 'Original'),
('God of War', '2018', 'Jogo', 'Ação/Aventura', 'PlayStation 4', 14.90, 'Original'),
('Vingadores: Ultimato', '2019', 'Filme', 'Ação/Aventura', 'Blu-ray', 7.90, 'Original'),
('Red Dead Redemption 2', '2018', 'Jogo', 'Ação/Aventura', 'Xbox One', 18.90, 'Original'),
('O Rei Leão', '1994', 'Filme', 'Animação', 'DVD', 4.90, 'Original'),
('Cyberpunk 2077', '2020', 'Jogo', 'RPG', 'PC', 15.90, 'Original'),
('Star Wars: A Ascensão Skywalker', '2019', 'Filme', 'Ficção Científica', 'Blu-ray', 8.90, 'Original'),
('Spider-Man: Miles Morales', '2020', 'Jogo', 'Ação', 'PlayStation 5', 21.90, 'Original'),
('Matrix', '1999', 'Filme', 'Ficção Científica', 'Blu-ray', 6.90, 'Original'),
('GTA V', '2013', 'Jogo', 'Ação/Aventura', 'PC', 12.90, 'Original');


INSERT INTO aluguel (idAluguel, fkCliente, fkProduto, dtRetirada, dtDevolucao) VALUES 
(1, 1, 1, '2024-10-01', '2024-10-07'),  -- João Silva alugou The Last of Us Part II
(2, 2, 3, '2024-10-02', '2024-10-05'),  -- Maria Souza alugou Vingadores: Ultimato
(3, 3, 4, '2024-10-03', '2024-10-10'),  -- Carlos Pereira alugou Red Dead Redemption 2
(4, 4, 5, '2024-10-04', '2024-10-08'),  -- Ana Oliveira alugou O Rei Leão
(5, 5, 2, '2024-10-05', '2024-10-12'),  -- Fernanda Costa alugou God of War
(6, 6, 7, '2024-10-06', '2024-10-09'),  -- Pedro Lima alugou Star Wars: A Ascensão Skywalker
(7, 7, 6, '2024-10-07', '2024-10-14'),  -- Lucas Rocha alugou Cyberpunk 2077
(8, 8, 8, '2024-10-08', '2024-10-11'),  -- Carla Mendes alugou Spider-Man: Miles Morales
(9, 9, 9, '2024-10-09', '2024-10-12'),  -- Gabriel Torres alugou Matrix
(10, 10, 10, '2024-10-10', '2024-10-17'); -- Juliana Alves alugou GTA V


SELECT 
	clientes.nome as Cliente,
	produto.titulo as Produto,
    aluguel.dtRetirada as 'Data de Retirada',
    aluguel.dtDevolucao as 'Data de Devolução'
FROM aluguel join clientes on fkCliente = idCliente
join produto on fkproduto = idproduto;

-- Tópico 4
update aluguel set dtDevolucao = null
	Where fkCliente in (3,5,1);

-- Tópico 5
SELECT 
	clientes.nome as Cliente,
	produto.titulo as Produto,
    produto.tipo as Tipo,
	produto.preco as Preço
    from aluguel 
	join clientes on fkCliente = idCLiente
    join produto on fkProduto = idProduto
		where preco > 15 and tipo = 'jogo';
        
-- Tópico 6
SELECT 
	clientes.nome as Cliente,
    aluguel.dtRetirada as Retirada,
    aluguel.dtDevolucao as Devolução
    from aluguel join clientes on fkCliente = idCliente
		where aluguel.dtDevolucao is null;
    
-- Tópico 7
Select 
	clientes.nome as Cliente,
    produto.titulo as Produto,
    produto.preco as Preço,
    aluguel.dtRetirada as Retirada,
    aluguel.dtDevolucao as Devolução,
		CASE 
			when aluguel.dtDevolucao is null then 'Em aberto'
            else 'Concluído'
            end as 'Situação'
FROM aluguel join clientes on fkCliente = Idcliente
join produto on fkproduto = idproduto;

-- Tópico 8
INSERT INTO clientes (Nome, Rua, complemento, bairro, cidade, uf, telefone, email) VALUES 
('Ricardo Nunes', 'Av. Paulista', 'Apto 202', 'Bela Vista', 'São Paulo', 'SP', '11999998888', 'ricardo.nunes@email.com'),
('Beatriz Almeida', 'Rua das Acácias', 'Casa 15', 'Jardim das Flores', 'Campinas', 'SP', '19988887777', 'beatriz.almeida@email.com'),
('Sérgio Lopes', 'Av. Santos Dumont', 'Bloco A', 'Centro', 'Salvador', 'BA', '71977776666', 'sergio.lopes@email.com');


SELECT 
	clientes.nome as Cliente,
    produto.titulo as Produto
from clientes LEFT JOIN aluguel on fkcliente = idcliente
LEFT JOIN produto on fkproduto = idproduto;

-- Tópico 9 
SELECT 
	clientes.nome as Cliente,
    produto.titulo as Produto,
    produto.genero as Gênero,
    produto.plataforma as Plataforma
FROM aluguel join clientes on fkcliente = idcliente
join produto on fkproduto = idproduto
	where genero like '%Aventura' and tipo = 'jogo';

-- Tópico 10
alter table produto drop constraint chkCondicaoProduto;
alter table produto rename column condicao to Condição;

-- Tópico 11
SELECT 
clientes.nome as Cliente,
produto.titulo as Produto
From aluguel join clientes on fkcliente = idcliente
join produto on fkproduto = idproduto
		where produto.titulo like 'G%' and clientes.nome like 'G%';









