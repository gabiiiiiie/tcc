do inicio:
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



ALTER TABLE estoque MODIFY COLUMN Id INT AUTO_INCREMENT;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);


INSERT INTO usuarios (username, password) VALUES 
('admin', '1232'),
('user', '4565');

DROP TABLE IF EXISTS usuarios;



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



ALTER TABLE estoque MODIFY COLUMN Id INT AUTO_INCREMENT;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);


INSERT INTO usuarios (username, password) VALUES 
('aluno', '123');

DROP TABLE IF EXISTS usuarios;

SELECT * FROM usuarios;