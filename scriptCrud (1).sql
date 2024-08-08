DROP DATABASE IF EXISTS crud;

CREATE DATABASE IF NOT EXISTS crud;

USE crud;

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    sexo ENUM('M', 'F'),
    email VARCHAR(150) NOT NULL
);

CREATE TABLE IF NOT EXISTS posts (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    post_date DATE NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) 
    REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS companies (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(128) NOT NULL,
    funcao VARCHAR(128) NOT NULL,
    inicio DATE NOT NULL,
    fim DATE,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id)
    REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS sellers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    telefone VARCHAR(15),
    company_id INT NOT NULL,
    FOREIGN KEY (company_id)
    REFERENCES companies(id)
);

CREATE TABLE IF NOT EXISTS seller_dependents (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    grau_parentesco VARCHAR(50) NOT NULL,
    escolaridade VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    seller_id INT NOT NULL,
    FOREIGN KEY (seller_id)
    REFERENCES sellers(id)
);

INSERT INTO users (nome, sexo, email) VALUES
('Emerson Carvalho', 'M', 'emerson@mail.com'),
('Luiza Carvalho', 'F', 'lu@mail.com'),
('Elenice Carvalho', 'F', 'le@mail.com'),
('Noé Carvalho', 'M', 'noe@mail.com'),
('Rosânia Carvalho', 'F', 'ro@mail.com');

INSERT INTO posts (content, post_date, user_id) VALUES
('Olá do Emerson', CURDATE(), 1),
('Olá da Luiza', CURDATE(), 2),
('Olá da Denise', CURDATE(), 3),
('Olá do Noé', CURDATE(), 4),
('Olá da Rosânia', CURDATE(), 5),
('Olá da Rosânia 1', CURDATE(), 5),
('Olá da Rosânia 2', CURDATE(), 5),
('Olá da Rosânia 3', CURDATE(), 5);

INSERT INTO companies (nome, funcao, inicio, fim, user_id) VALUES
('Nestlé', 'Desenvolvedor', '2022-01-01', NULL, 1),
('Ambev', 'Gerente', '2021-06-01', '2023-05-31', 2),
('Petrobras', 'Analista', '2020-03-15', NULL, 3);

INSERT INTO sellers (nome, email, telefone, company_id) VALUES
('Carlos Silva', 'carlos.silva@mail.com', '123456789', 1),
('Maria Souza', 'maria.souza@mail.com', '987654321', 2),
('João Lima', 'joao.lima@mail.com', '555123456', 3);

INSERT INTO seller_dependents (nome, data_nascimento, grau_parentesco, escolaridade, cidade, seller_id) VALUES
('Ana Silva', '2010-05-15', 'Filha', 'Ensino Fundamental', 'São Paulo', 1),
('Pedro Silva', '2012-08-22', 'Filho', 'Ensino Fundamental', 'São Paulo', 1),
('Lucas Souza', '2011-01-17', 'Filho', 'Ensino Fundamental', 'Rio de Janeiro', 2),
('Julia Lima', '2013-12-09', 'Filha', 'Ensino Fundamental', 'Belo Horizonte', 3);
