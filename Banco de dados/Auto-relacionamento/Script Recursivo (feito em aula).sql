use familia;

-- Aula de Recursividade , auto-relacionamento
create table pessoa(
idPessoa int primary key auto_increment,
nome varchar(45),
dtNasc DATE,
fkMae int, -- id pessoa é inteiro
fkPai int, -- id pessoa é inteiro

constraint fkFilhoDaMae foreign key (fkMae) references pessoa(idpessoa),
constraint fkFilhoDoPai foreign key (fkpai) references pessoa(idpessoa)
);

INSERT INTO pessoa (nome, dtNasc) values
('Vivian', '1983-10-13'),
('Betinha', '1957-05-05'),
('Jadir', '1954-10-10');

SELECT * FROM pessoa ;

update pessoa set fkmae = 2, fkpai = 3 
	where idpessoa = 1;
    
select filho.nome as Filho,
	mae.nome as Mãe,
    pai.nome as Pai
    from pessoa as filho
    join pessoa as mae
		on filho.fkmae = mae.idpessoa
	join pessoa as pai
		on filho.fkpai = pai.idpessoa;
    
INSERT INTO pessoa (nome, fkmae) values
('Eduardo', 1);


    


    
    