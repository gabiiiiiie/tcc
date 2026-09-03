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
    Foto TEXT
);

DROP TABLE IF EXISTS estoque;


Insert into estoque (Id, Nome, Quantidade, Estoque, Descricao, Preco, Categoria, Foto) VALUES
('1', 'Teclado Mecânico', 15, 5, 'Teclado com fio USB', 70, 'a', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-aidvEp1LNqovukNUgoGQyAasv3eAmhkVmRNIKhZOQg&s=10'),
('2', 'Monitor', 20, 5, 'Monitor DELL', 200 , 'b', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4o5vXJipEo3j0Ra006a9xaGm4CX0OXmBWCKmKrb-U1g&s=10'),
('3', 'Cabo USB', 22, 5, 'Cabo USB tipo A', 200 , 'c', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzpqbaUeP_m_dsQbAd3LPWZwGT8GBNlZHrzDGCTY-kIw&s=10'),
('4', 'Caneta', 120, 5, 'Caneta bic', 2 , 'f', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwuCuOgH09-MzcNV4bEkYSDUuh2l_7g6y3yqOu84mLGA&s=10'),
('5', 'Mouse', 30, 5, 'Mouse sem fio', 40 , 'g', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSlPn7_84TMx1fT3E0JJxyDiOtSDF_vGOuyyYVJQJzFw&s=10'),
('6', 'Cadeira', 16, 5, 'Cadeira de escritorio', 1000 , 'e', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjnZZbBggIaBaj4oN79a2DE90AM7Kql9_x5jyV3B8_MQ&s=10');



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





ALTER TABLE estoque MODIFY COLUMN Id INT AUTO_INCREMENT;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'
);




INSERT INTO usuarios (username, senha, role)
VALUES ('admin', 'scrypt:32768:8:1$cqggDDvEcPHxEdOf$6c150efad1bc7b29d19cfa94ff0b68a46bfb31e86de0ccd74dad1710b8cf3249b3e8bb9ad347df27fa9c9f496946029133aa3d1fb243b86bb73e8d7125341bb6', 'admin');

DROP TABLE IF EXISTS usuarios;

SELECT * FROM estoque;

atl :


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
    Foto TEXT
);

DROP TABLE IF EXISTS estoque;


Insert into estoque (Id, Nome, Quantidade, Estoque, Descricao, Preco, Categoria, Foto) VALUES
('1', 'Teclado Mecânico', 15, 5, 'Teclado com fio USB', 70, 'a', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-aidvEp1LNqovukNUgoGQyAasv3eAmhkVmRNIKhZOQg&s=10'),
('2', 'Monitor', 20, 5, 'Monitor DELL', 200 , 'b', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4o5vXJipEo3j0Ra006a9xaGm4CX0OXmBWCKmKrb-U1g&s=10'),
('3', 'Cabo USB', 22, 5, 'Cabo USB tipo A', 200 , 'c', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzpqbaUeP_m_dsQbAd3LPWZwGT8GBNlZHrzDGCTY-kIw&s=10'),
('4', 'Caneta', 120, 5, 'Caneta bic', 2 , 'f', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwuCuOgH09-MzcNV4bEkYSDUuh2l_7g6y3yqOu84mLGA&s=10'),
('5', 'Mouse', 30, 5, 'Mouse sem fio', 40 , 'g', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSlPn7_84TMx1fT3E0JJxyDiOtSDF_vGOuyyYVJQJzFw&s=10'),
('6', 'Cadeira', 16, 5, 'Cadeira de escritorio', 1000 , 'e', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjnZZbBggIaBaj4oN79a2DE90AM7Kql9_x5jyV3B8_MQ&s=10');



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

DROP TABLE IF EXISTS usuarios;





ALTER TABLE estoque MODIFY COLUMN Id INT AUTO_INCREMENT;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') NOT NULL DEFAULT 'user'
);




INSERT INTO usuarios (username, password, role)
VALUES ('admin', 'scrypt:32768:8:1$cqggDDvEcPHxEdOf$6c150efad1bc7b29d19cfa94ff0b68a46bfb31e86de0ccd74dad1710b8cf3249b3e8bb9ad347df27fa9c9f496946029133aa3d1fb243b86bb73e8d7125341bb6', 'admin');

DROP TABLE IF EXISTS usuarios;

SELECT * FROM estoque;



DESCRIBE usuarios;