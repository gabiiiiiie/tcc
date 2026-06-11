CREATE TABLE estoque (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    qtde INT,
    categoria VARCHAR(50),
    descricao VARCHAR(255)
);








INsert into estoque (id, nome, qtde, categoria, descricao) VALUES
('1', 'Teclado Mecânico', 15, 'A', 'Teclado'),
('2', 'Mouse Sem Fio', 22, 'B', 'Mouse bluetooth'),
('3', 'Monitor 24 Polegadas', 8, 'C', 'Monitor')