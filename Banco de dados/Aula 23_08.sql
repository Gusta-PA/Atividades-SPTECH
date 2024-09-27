CREATE DATABASE continuada1;

USE continuada1;

CREATE TABLE historico (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
dataHora DATETIME DEFAULT current_timestamp,
url VARCHAR(250) NOT NULL,
navegador VARCHAR(100)
);

INSERT INTO historico (nome, url, navegador) VALUES
	('São Paulo Tech School', 'https://moodle.sptech.school/', 'Microsoft Edge'),
	('Página Inicial - Microsoft Azure', 'https://portal.azure.com/#home', 'Microsoft Edge'),
	('Ofertas e Promoções | Amazon.com.br',
    'https://www.amazon.com.br/deals?ref_=nav_cs_gb', 'Firefox Developer Edition'),
	('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Firefox Developer Edition'),
	('Working...', 'https://login.microsoftonline.com/kmsi', 'Firefox Developer Edition'),
	('Email - Usuario Aluno - Outlook', 'https://outlook.office.com/mail/', 'Firefox Developer Edition'),
	('Solicitações - Suporte - Digital Building', 'https://bandtec.sdpondemand.manageengine.com/app/itdesk/ui/requests', 'Firefox Developer Edition'),
	('Carrinho de compras da Amazon.com', 'https://www.amazon.com.br/gp/cart/view.html?ref_=nav_cart', 'Firefox Developer Edition'),
	('MySQL | Begin Your Download', 'https://dev.mysql.com/downloads/file/?id=516926', 'Firefox Developer Edition'),
	('MySQL | Download MySQL Installer', 'https://dev.mysql.com/downloads/installer/', 'Firefox Developer Edition');
    
    select * from historico;
    Drop table historico; 
   
   -- ALTER TABLE historico ADD CONSTRAINT ChkNavegador CHECK (navegador in ('Microsoft Edge', 'Firefox Developer Edition', 'Google Chrome'));
   -- ALTER TABLE historico ADD COLUMN sistOp varchar(30);
    
    /* SELECT navegador from historico
		Where navegador <> 'Microsoft Edge'; */
    
    /* Select * from historico 
		Where url like '%t_'; */

    
	 /* UPDATE historico set navegador = 'Google Chrome'
    Where id = 5;  -- -------------------------------------------------------------------------------------------------------------

     /*select * from historico
		Where nome like '%download%';
        
	Delete from historico 
		Where id = 10; */
	
     /*Select nome from historico
		Where navegador = 'Microsoft Edge';*/
    
 /*INSERT INTO historico (nome, url, navegador) Values
('404 Not Found', 'http://moodletech.azurewebsites.net/', 'Google Chrome' );

SELECT * FROM historico
	Where nome = '404 not found' and navegador = 'Google Chrome';*/
    
    
    /* ALTER TABLE historico DROP COLUMN navegador; */
    
    
 /*Select * from historico 
    where nome = 'Página Inicial - Microsoft Azure';
    
UPDATE historico set dataHora = '2023-02-31 08:00:00'
	Where id = 2; */
    
    /* SELECT * from historico
    where nome like 'M%';*/
    
     /*ALTER TABLE historico MODIFY COLUMN url varchar(500);
    desc historico; */
    
     /* INSERT into historico(nome, url, dataHora) values
		( 'Fazer login no Canvas (instructure.com)', 'https://awsacademy.instructure.com/login/canvas', '2023-02-16 10:36:00');*/
    
    
     /* ALTER TABLE historico RENAME COLUMN nome TO titulo;*/
    
    
     /* SELECT * FROM historico
		WHERE url like '%Amazon%';
    
    SELECT navegador FROM historico WHERE navegador != 'Microsoft Edge'; */