do inicio:

create database almoxarifado;

use almoxarifado; 

CREATE TABLE estoque (
	Id INT PRIMARY KEY,
    Nome VARCHAR(100),
    Quantidade INT,
    Estoque INT,
    Descricao VARCHAR(255),
	Preço INT,
    Categoria VARCHAR(50),
    Foto VARCHAR(255)
);

Insert into estoque (Id, Nome, Quantidade, Estoque, Descricao, Preco, Categoria, Foto) VALUES
('1', 'Teclado Mecânico', 15, 5, 'Teclado com fio USB', 70, 'a', 'https://www.google.com/aclk?sa=L&ai=DChsSEwja4vfNq6WVAxVna0gAHVKnAJkYACICCAEQIxoCY2U&co=1&ase=2&gclid=Cj0KCQjwxvjRBhC2ARIsAI7KJa1VB6fr7-spHLvciiopMkW15p7VTaawmtnZOLzEGrTb6vrxD2yy1UYaAsmnEALw_wcB&cid=CAASugHkaFUQ_1hz2Pqlhf2XGR_aNgb2omPDPAoYRlw2oJmwCLvvwV-t0sPrYtdGIbKvvPEoCXxCEkEBcR5olxc-WsuapG9TIKWmluD5VPqGGxQAckBAqpVOUhFidwrIwGRoZFG0PxB4JWctXXfjSC45ZZ5Z7bLosWXIY7_jDN-OxU3EDTKlaMss8mafH5CSRAvtFzKrPY5DRoaIur3aYyA1VjkerP-CluHjloWQPG60AxVBcVsaoGNVpv6Xf_8&cce=2&category=acrcp_v1_32&sig=AOD64_2liiiQdRoZFx4awDAuwU5t3UaKdQ&ctype=5&q=&nis=4&ved=2ahUKEwiW_-_Nq6WVAxXslJUCHXkyBNIQ5bgDKAB6BAgMEAs&adurl='),
('2', 'Monitor', 20, 5, 'Monitor DELL', 200 , 'b', 'https://www.google.com/aclk?sa=L&ai=DChsSEwja4vfNq6WVAxVna0gAHVKnAJkYACICCAEQIxoCY2U&co=1&ase=2&gclid=Cj0KCQjwxvjRBhC2ARIsAI7KJa1VB6fr7-spHLvciiopMkW15p7VTaawmtnZOLzEGrTb6vrxD2yy1UYaAsmnEALw_wcB&cid=CAASugHkaFUQ_1hz2Pqlhf2XGR_aNgb2omPDPAoYRlw2oJmwCLvvwV-t0sPrYtdGIbKvvPEoCXxCEkEBcR5olxc-WsuapG9TIKWmluD5VPqGGxQAckBAqpVOUhFidwrIwGRoZFG0PxB4JWctXXfjSC45ZZ5Z7bLosWXIY7_jDN-OxU3EDTKlaMss8mafH5CSRAvtFzKrPY5DRoaIur3aYyA1VjkerP-CluHjloWQPG60AxVBcVsaoGNVpv6Xf_8&cce=2&category=acrcp_v1_32&sig=AOD64_2liiiQdRoZFx4awDAuwU5t3UaKdQ&ctype=5&q=&nis=4&ved=2ahUKEwiW_-_Nq6WVAxXslJUCHXkyBNIQ5bgDKAB6BAgMEAs&adurl='),
('3', 'Cabo USB', 22, 5, 'Cabo USB tipo A', 200 , 'c', 'https://www.google.com/aclk?sa=L&ai=DChsSEwie5J6wraWVAxWYXkgAHZrPAXoYACICCAEQFxoCY2U&co=1&ase=2&gclid=Cj0KCQjwxvjRBhC2ARIsAI7KJa2Jygkiu_rfE8J55C0921n0YpFjv3_mo3tyEIY6WulluEGC0TlBkiQaAtJUEALw_wcB&cid=CAASugHkaEXvtXy_0QzVR9cLgdtmcfH6JIH5qXFWKdtRODGk-eXld-eTwkFP1n9N8iaTrWzT46dIWS5eiHbq9h_ZZKrjpenGkQpfRY-69EV06XANIHi69lb69740MMV6GZ7HRZKu6EBdFA2dJFvg7EFPgcvPfQf12KPGzL6Pr8xr0uKjdeWaiEwx2rQ79v7TB_93-pUDUtftuvQBHvs_fLHGk8ofYYZl6fAvpwoSQ1JjuXQUXWd6984_jjZ1Fpk&cce=2&category=acrcp_v1_32&sig=AOD64_2eUfYUm4ICfrT6V6VQk87Q1UxJIw&ctype=5&q=&nis=4&ved=2ahUKEwjNzJewraWVAxUBMjUKHWgQHyUQ5bgDKAB6BAgOEAs&adurl=')


ALTER TABLE estoque CHANGE Preço Preco INT;



UPDATE estoque SET Foto = 'caboUSB.jpg' WHERE Id = 3;
UPDATE estoque SET Foto = 'monitor.jpg' WHERE Id = 2;
UPDATE estoque SET Foto = 'teclado.jpg' WHERE Id = 1;
UPDATE estoque SET Foto = 'teclado.jpg' WHERE Id = 1;


-- ATENÇÃO: Use este comando APENAS se puder apagar os itens de teste atuais
TRUNCATE TABLE estoque;

-- Agora aplique o comando do auto_increment com a tabela limpa
ALTER TABLE estoque MODIFY Id INT AUTO_INCREMENT;




create database almoxarifado;

use almoxarifado; 

CREATE TABLE estoque (
	Id INT PRIMARY KEY,
    Nome VARCHAR(100),
    Quantidade INT,
    Estoque INT,
    Descricao VARCHAR(255),
	Preco INT,
    Categoria VARCHAR(50),
    Foto VARCHAR(255)
);

DROP TABLE IF EXISTS estoque;


Insert into estoque (Id, Nome, Quantidade, Estoque, Descricao, Preco, Categoria, Foto) VALUES
('1', 'Teclado Mecânico', 15, 5, 'Teclado com fio USB', 70, 'a', 'teclado.jpg'),
('2', 'Monitor', 20, 5, 'Monitor DELL', 200 , 'b', 'monitor.jpg'),
('3', 'Cabo USB', 22, 5, 'Cabo USB tipo A', 200 , 'c', 'caboUSB.jpg'),
('4', 'Caneta', 120, 5, 'Caneta bic', 2 , 'f', 'caneta.webp'),
('5', 'Mouse', 30, 5, 'Mouse sem fio', 40 , 'g', 'mouse.webp'),
('6', 'Cadeira', 16, 5, 'Cadeira de escritorio', 1000 , 'e', 'cadeira.jpg');


-- 1. Altera a coluna Id para atualizar automaticamente e ser incremental
ALTER TABLE estoque MODIFY COLUMN Id INT AUTO_INCREMENT;

-- 2. Corrige o Ar Condicionado que ficou com valor 0 para o próximo ID correto (7)
update estoque set Id= 9 where Id = 24;
