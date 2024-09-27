create database Estoque;
Use Estoque;

Create table MisteriosSA(
Id int primary key auto_increment,
Nome varchar(30),
dtCompra date,
Preço float,
Peso int,
dtRetirada date
);

desc misteriossa;

insert into misteriossa (id, nome, dtCompra, preço, peso) values
(default, 'Pão de forma', '2024-08-30', 7.99, 500);

insert into misteriossa (id, nome, dtcompra, preço, peso) values
(default, 'Presunto', '2024-07-28', 15.50, 700),
(default, 'Queijo', '2024-08-15', 18.99, 800),
(default, 'Maionese', '2024-06-22', 9.99, 500),
(default, 'Alface', '2024-08-28', 5.99, 200),
(default, 'Biscoito Scooby', '2024-06-28', 20.99, 1000);

SELECT * FROM Misteriossa;

Select id, nome, dtCompra, dtRetirada from misteriossa order by dtCompra;

Update misteriossa set dtRetirada = '2024-08-30'
	Where ID = 6;

Alter table misteriossa rename column id to idComida;

Update misteriossa set Nome = 'Biscoito Scooby'
	Where idComida in (2,4);
    
Update misteriossa set nome = 'Cachorro-Quente'
	Where idComida in (1,3,5);

alter table misteriossa add constraint chkComida CHECK(Nome in ('Biscoito Scooby', 'Cachorro-Quente'));

Select nome, dtCompra AS "Data da compra", dtretirada as "Data de retirada" from misteriossa;

Select * from misteriossa
	Where dtCompra < '2024-07-25';

Select * from misteriossa
	Where preço >= 30.50;
    
Truncate table misteriossa;

Select * from misteriossa;