CREATE DATABASE venda;
USE venda;

CREATE TABLE cliente(
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45),
endereço varchar(45),
fkIndicado int,

constraint fkClienteIndicado foreign key (fkIndicado) references cliente(idCliente)
);

CREATE TABLE produto(
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
preco decimal(10,2)
);

CREATE TABLE venda(
idVenda int auto_increment,
fkCliente int,
fkProduto int,
constraint pkComposta primary key (idVenda, fkCliente, fkProduto),

vendaTotal int,
dtVenda date,
desconto decimal(10,2),
qtdProdutos INT
);


desc cliente;
desc produto;
desc venda;

INSERT INTO cliente (nome, email, endereço, fkIndicado) VALUES
('João Silva', 'joao.silva@email.com', 'Rua A, 123', NULL),     
('Carlos Pereira', 'carlos.pereira@email.com', 'Rua C, 789', 1),
('Ana Costa', 'ana.costa@email.com', 'Rua D, 101', 2),          
('Bruno Lima', 'bruno.lima@email.com', 'Rua E, 202', 3);        

SELECT * from cliente;

INSERT INTO produto (nome, descricao, preco) VALUES
('Notebook', 'Notebook de última geração', 3500.00),
('Smartphone', 'Smartphone com câmera avançada', 2000.00),
('Tablet', 'Tablet de alta resolução', 1500.00),
('Monitor', 'Monitor Full HD', 600.00),
('Teclado', 'Teclado mecânico', 200.00);

SELECT * FROM produto;

INSERT INTO venda (fkCliente, fkProduto, vendaTotal, dtVenda, desconto, qtdProdutos) VALUES
(1, 1, 3500, '2024-10-01', 0, 1),   
(1, 2, 4000, '2024-10-03', 500, 2), 
(2, 3, 1500, '2024-10-02', 0, 1),  
(2, 4, 1800, '2024-10-04', 200, 3), 
(3, 1, 3500, '2024-10-02', 0, 1),   
(3, 5, 600, '2024-10-03', 50, 3),   
(4, 2, 2000, '2024-10-02', 0, 1),  
(4, 3, 1500, '2024-10-05', 100, 1), 
(5, 4, 1800, '2024-10-06', 300, 4),
(5, 1, 3500, '2024-10-08', 0, 1);  

SELECT * FROM venda;

-- TÓPICO G
SELECT
	cliente.nome as Cliente,
    produto.nome as Produto,
    venda.qtdProdutos as 'Vendas Realizadas',
    venda.vendaTotal as Total
FROM cliente
    JOIN venda ON fkcliente = idCliente
    JOIN produto on fkproduto = idproduto;

-- TÓPICO H
SELECT
	cliente.nome as Cliente,
    produto.nome as Produto,
    venda.qtdProdutos as 'Vendas Realizadas',
    venda.vendaTotal as Total
FROM cliente
    JOIN venda ON fkcliente = idCliente
    JOIN produto on fkproduto = idproduto
		WHERE cliente.nome like 'joão%';
	
-- TÓPICO I
SELECT
	cliente.nome as Cliente,
    cliente.email as Email,
    cliente.endereço as Endereço,
    indicador.nome as 'Indicado por:'
FROM cliente 
	JOIN cliente as Indicador ON cliente.fkindicador= Indicador.idcliente;

SELECT
	cliente.nome,
    cliente.email,
    cliente.endereço,
    indicados.nome as 'Indicado por:'
FROM cliente 
	JOIN cliente as Indicador ON cliente.fkindicador= Indicador.idcliente
		WHERE indicados.nome like 'joão%';

-- TÓPICO L
SELECT
	cliente.nome as Cliente,
    indicado.nome as 'Indicado por:',
    produto.nome as Produto,
    venda.qtdProdutos as Vendas,
    venda.vendaTotal as Total
FROM cliente
	LEFT JOIN cliente as indicado ON cliente.fkindicador = indicado.idCliente
    JOIN venda ON venda.fkCliente = cliente.idCliente
    JOIN produto ON produto.idProduto = venda.fkProduto;


-- TÓPICO M
SELECT
	venda.dtVenda as 'Data da Venda',
    produto.nome as Produto,
    venda.qtdProdutos as 'Vendas Realizadas'
FROM venda
	JOIN produto ON venda.fkproduto = idproduto
		WHERE idVenda = 2;
        
-- TÓPICO O
INSERT INTO cliente VALUES
(default, 'Bruno Guimarães', 'bruno.guimaraes@gmail.com', 'RUA AB', 2);

-- TÓPICO P
SELECT
	produto.nome as Produto,
    produto.preco 
    FROM produto ORDER BY produto.preco DESC;
    

-- FUNÇÕES MATERMÁCIAS

-- TAG distinct
SELECT distinct preco from produto;

-- TAG count - Quantidade por linha nos campos com valor
SELECT count(desconto) from venda;

-- TAG sum
SELECT sum(preco) as TotalProdutos from produto;

-- TAG avg
SELECT avg(preco) from produto;

-- TAG round (arredonda as casas decimais)
SELECT round(avg(preco), 2) from produto;

-- TAG truncate (ignora casas decimais depois do valor solicitado)
SELECT truncate(avg(preco), 2) from produto;

-- TAG group by
SELECT codNF, avg(preco) from produto
	join notafiscal on idProduto = fkproduto
        group by codNF;
        
-- TAG limit
SELECT * from produto LIMIT 2;












