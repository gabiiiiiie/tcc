CREATE DATABASE almoxarifadoo;

USE almoxarifado;

CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    qtde INT NOT NULL,
    categoria VARCHAR(255) NOT NULL,
    descricao VARCHAR(255) NOT NULL
);

select * FROm estoque;

INSERT INTO estoque (id, nome, qtde, categoria, descricao) VALUES 
('1', 'Teclado Mecânico', 15, 'A', 'teclado'),
('2', 'Mouse Sem Fio', 22, 'b', 'mouse q n tem fio'),
('3', 'Monitor 24 Polegadas', 8, 'c','monitorr' );
