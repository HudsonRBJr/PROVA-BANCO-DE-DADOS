CREATE DATABASE PROVASQLHUDSON;
USE PROVASQLHUDSON;


CREATE TABLE Editora (
    EditoraID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Endereco NVARCHAR(255),
    Telefone NVARCHAR(20),
    Email NVARCHAR(100),
    Website NVARCHAR(255)
);


CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Descricao NVARCHAR(255) NOT NULL
);


CREATE TABLE Livro (
    LivroID INT PRIMARY KEY IDENTITY(1,1),
    Titulo NVARCHAR(255) NOT NULL,
    Autor NVARCHAR(100) NOT NULL,
    AnoPublicacao INT,
    EditoraID INT,
    CategoriaID INT,
    Preco DECIMAL(10, 2),
    ISBN NVARCHAR(20),
    QuantidadeEstoque INT,
    FOREIGN KEY (EditoraID) REFERENCES Editora(EditoraID),
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);


CREATE TABLE Usuario (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Endereco NVARCHAR(255),
    Telefone NVARCHAR(20),
    Email NVARCHAR(100),
    DataNascimento DATE,
    DataCadastro DATETIME DEFAULT GETDATE()
);


CREATE TABLE Emprestimo (
    EmprestimoID INT PRIMARY KEY IDENTITY(1,1),
    DataEmprestimo DATETIME NOT NULL,
    DataDevolucao DATETIME,
    UsuarioID INT,
    LivroID INT,
    Multa DECIMAL(10, 2),
    FOREIGN KEY (UsuarioID) REFERENCES Usuario(UsuarioID),
    FOREIGN KEY (LivroID) REFERENCES Livro(LivroID)
);

CREATE TABLE Biblioteca (
    BibliotecaID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);

CREATE TABLE Administrador (
    AdministradorID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    BibliotecaID INT UNIQUE,  -- Garantir relação 1:1
    FOREIGN KEY (BibliotecaID) REFERENCES Biblioteca(BibliotecaID)
);




--Inserindo Dados.

INSERT INTO Editora (Nome, Endereco, Telefone, Email, Website) VALUES
('Editora Alfa', 'Rua A, 100', '1111-1111', 'alfa@editora.com', 'http://www.alfa.com'),
('Editora Beta', 'Rua B, 200', '2222-2222', 'beta@editora.com', 'http://www.beta.com'),
('Editora Gama', 'Rua C, 300', '3333-3333', 'gama@editora.com', 'http://www.gama.com'),
('Editora Delta', 'Rua D, 400', '4444-4444', 'delta@editora.com', 'http://www.delta.com'),
('Editora Epsilon', 'Rua E, 500', '5555-5555', 'epsilon@editora.com', 'http://www.epsilon.com'),
('Editora Zeta', 'Rua F, 600', '6666-6666', 'zeta@editora.com', 'http://www.zeta.com'),
('Editora Eta', 'Rua G, 700', '7777-7777', 'eta@editora.com', 'http://www.eta.com'),
('Editora Theta', 'Rua H, 800', '8888-8888', 'theta@editora.com', 'http://www.theta.com'),
('Editora Iota', 'Rua I, 900', '9999-9999', 'iota@editora.com', 'http://www.iota.com'),
('Editora Kappa', 'Rua J, 1000', '1010-1010', 'kappa@editora.com', 'http://www.kappa.com'),
('Editora Lambda', 'Rua K, 1100', '1111-1112', 'lambda@editora.com', 'http://www.lambda.com'),
('Editora Mu', 'Rua L, 1200', '1212-1212', 'mu@editora.com', 'http://www.mu.com'),
('Editora Nu', 'Rua M, 1300', '1313-1313', 'nu@editora.com', 'http://www.nu.com'),
('Editora Xi', 'Rua N, 1400', '1414-1414', 'xi@editora.com', 'http://www.xi.com'),
('Editora Omicron', 'Rua O, 1500', '1515-1515', 'omicron@editora.com', 'http://www.omicron.com'),
('Editora Pi', 'Rua P, 1600', '1616-1616', 'pi@editora.com', 'http://www.pi.com'),
('Editora Rho', 'Rua Q, 1700', '1717-1717', 'rho@editora.com', 'http://www.rho.com'),
('Editora Sigma', 'Rua R, 1800', '1818-1818', 'sigma@editora.com', 'http://www.sigma.com'),
('Editora Tau', 'Rua S, 1900', '1919-1919', 'tau@editora.com', 'http://www.tau.com'),
('Editora Upsilon', 'Rua T, 2000', '2020-2020', 'upsilon@editora.com', 'http://www.upsilon.com');


INSERT INTO Categoria (Descricao) VALUES
('Ficção Científica'),
('Fantasia'),
('Romance'),
('Aventura'),
('Biografia'),
('História'),
('Tecnologia'),
('Saúde'),
('Educação'),
('Autoajuda'),
('Negócios'),
('Arte'),
('Culinária'),
('Esportes'),
('Fotografia'),
('Viagem'),
('Religião'),
('Ciências Sociais'),
('Política'),
('Humor');



INSERT INTO Livro (Titulo, Autor, AnoPublicacao, EditoraID, CategoriaID, Preco, ISBN, QuantidadeEstoque) VALUES
('Odisseia Espacial', 'Arthur C. Clarke', 1968, 1, 1, 49.99, '9780451457998', 10),
('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 2, 2, 69.99, '9780544003415', 15),
('Orgulho e Preconceito', 'Jane Austen', 1813, 3, 3, 39.99, '9780553213102', 8),
('As Aventuras de Sherlock Holmes', 'Arthur Conan Doyle', 1892, 4, 4, 29.99, '9780141034336', 12),
('Steve Jobs', 'Walter Isaacson', 2011, 5, 5, 59.99, '9781451648539', 5),
('Sapiens', 'Yuval Noah Harari', 2014, 6, 6, 45.99, '9780062316097', 20),
('O Código Da Vinci', 'Dan Brown', 2003, 7, 7, 39.99, '9780307474278', 25),
('Como Fazer Amigos e Influenciar Pessoas', 'Dale Carnegie', 1936, 8, 8, 29.99, '9780671027032', 10),
('Pai Rico, Pai Pobre', 'Robert Kiyosaki', 1997, 9, 9, 34.99, '9781612680194', 30),
('A Arte da Guerra', 'Sun Tzu', -500, 10, 10, 19.99, '9780195015409', 40),
('O Poder do Hábito', 'Charles Duhigg', 2012, 11, 11, 39.99, '9780812981605', 15),
('História da Arte', 'E.H. Gombrich', 1950, 12, 12, 69.99, '9780714832470', 7),
('Cozinha Confidencial', 'Anthony Bourdain', 2000, 13, 13, 29.99, '9781582340821', 18),
('Biografia de Michael Jordan', 'Roland Lazenby', 2014, 14, 14, 39.99, '9780316228764', 20),
('Fotografia Digital', 'Scott Kelby', 2009, 15, 15, 49.99, '9780321580132', 12),
('1000 Lugares para Conhecer Antes de Morrer', 'Patricia Schultz', 2003, 16, 16, 59.99, '9780761104841', 8),
('A Bíblia Sagrada', 'Diversos Autores', -100, 17, 17, 29.99, '9788578603549', 50),
('O Príncipe', 'Nicolau Maquiavel', 1532, 18, 18, 19.99, '9780199535698', 35),
('Teoria Geral da Administração', 'Chiavenato', 2000, 19, 19, 69.99, '9788502052900', 20),
('Piadas Nerds', 'Diversos Autores', 2012, 20, 20, 14.99, '9788580572478', 100);



INSERT INTO Usuario (Nome, Endereco, Telefone, Email, DataNascimento) VALUES
('Alice Silva', 'Rua Z, 101', '9999-1111', 'alice@exemplo.com', '1985-01-15'),
('Bruno Costa', 'Rua Y, 102', '9999-2222', 'bruno@exemplo.com', '1990-02-20'),
('Carla Souza', 'Rua X, 103', '9999-3333', 'carla@exemplo.com', '1995-03-25'),
('Diego Santos', 'Rua W, 104', '9999-4444', 'diego@exemplo.com', '1988-04-30'),
('Elisa Pereira', 'Rua V, 105', '9999-5555', 'elisa@exemplo.com', '1975-05-10'),
('Fabio Rodrigues', 'Rua U, 106', '9999-6666', 'fabio@exemplo.com', '1982-06-15'),
('Gabriela Mendes', 'Rua T, 107', '9999-7777', 'gabriela@exemplo.com', '1997-07-20'),
('Hugo Oliveira', 'Rua S, 108', '9999-8888', 'hugo@exemplo.com', '2000-08-25'),
('Isabela Lima', 'Rua R, 109', '9999-9999', 'isabela@exemplo.com', '1980-09-30'),
('João Almeida', 'Rua Q, 110', '9999-1010', 'joao@exemplo.com', '1970-10-10'),
('Karina Matos', 'Rua P, 111', '9999-1112', 'karina@exemplo.com', '1985-11-15'),
('Lucas Nogueira', 'Rua O, 112', '9999-1212', 'lucas@exemplo.com', '1995-12-20'),
('Marina Silva', 'Rua N, 113', '9999-1313', 'marina@exemplo.com', '1980-01-25'),
('Nina Costa', 'Rua M, 114', '9999-1414', 'nina@exemplo.com', '1990-02-10'),
('Oscar Ribeiro', 'Rua L, 115', '9999-1515', 'oscar@exemplo.com', '1982-03-15'),
('Patrícia Campos', 'Rua K, 116', '9999-1616', 'patricia@exemplo.com', '1985-04-20'),
('Quintino Mendes', 'Rua J, 117', '9999-1717', 'quintino@exemplo.com', '1992-05-25'),
('Rafael Lopes', 'Rua I, 118', '9999-1818', 'rafael@exemplo.com', '1987-06-30'),
('Sara Dias', 'Rua H, 119', '9999-1919', 'sara@exemplo.com', '1975-07-15'),
('Túlio Costa', 'Rua G, 120', '9999-2020', 'tulio@exemplo.com', '2000-08-05');






INSERT INTO Emprestimo (DataEmprestimo, DataDevolucao, UsuarioID, LivroID, Multa)
VALUES ('2024-06-01', '2024-06-15', 1, 1, 5.00),
('2024-06-02', '2024-06-16', 2, 2, 4.00),
('2024-06-03', '2024-06-17', 3, 3, 3.50),
('2024-06-04', '2024-06-18', 4, 4, 2.50),
('2024-06-05', '2024-06-19', 5, 5, 1.00),
('2024-06-06', '2024-06-20', 6, 6, 2.00),
('2024-06-07', '2024-06-21', 7, 7, 1.50),
('2024-06-08', '2024-06-22', 8, 8, 3.00),
('2024-06-09', '2024-06-23', 9, 9, 2.75),
('2024-06-10', '2024-06-24', 10, 10, 5.00),
('2024-06-11', '2024-06-25', 11, 11, 3.25),
('2024-06-12', '2024-06-26', 12, 12, 4.75),
('2024-06-13', '2024-06-27', 13, 13, 1.25),
('2024-06-14', '2024-06-28', 14, 14, 2.50),
('2024-06-15', '2024-06-29', 15, 15, 3.00),
('2024-06-16', '2024-06-30', 16, 16, 4.00),
('2024-06-17', '2024-07-01', 17, 17, 2.00),
('2024-06-18', '2024-07-02', 18, 18, 1.75),
('2024-06-19', '2024-07-03', 19, 19, 2.25),
('2024-06-20', '2024-07-04', 20, 20, 5.00);

INSERT INTO Biblioteca (Nome, Endereco, Telefone, Email)
VALUES 
('Biblioteca Central', 'Rua Principal, 123', '1234567890', 'central@biblioteca.com'),
('Biblioteca Jardim', 'Av. das Flores, 45', '9876543210', 'jardim@biblioteca.com'),
('Biblioteca Estação', 'Rua da Estação, 78', '1029384756', 'estacao@biblioteca.com'),
('Biblioteca do Saber', 'Rua do Conhecimento, 101', '5647382910', 'saber@biblioteca.com'),
('Biblioteca do Parque', 'Av. dos Bosques, 25', '0192837465', 'parque@biblioteca.com'),
('Biblioteca Universitária', 'Campus Universitário, Bloco A', '2938475610', 'universitaria@biblioteca.com'),
('Biblioteca da Cidade', 'Praça Central, 89', '1239876540', 'cidade@biblioteca.com'),
('Biblioteca do Mar', 'Rua da Praia, 56', '9871234560', 'mar@biblioteca.com'),
('Biblioteca do Norte', 'Av. das Neves, 112', '5647389201', 'norte@biblioteca.com'),
('Biblioteca do Sul', 'Rua dos Pássaros, 74', '2938471056', 'sul@biblioteca.com'),
('Biblioteca Oeste', 'Av. dos Ventos, 53', '5678901234', 'oeste@biblioteca.com'),
('Biblioteca Leste', 'Rua do Sol, 44', '4567890123', 'leste@biblioteca.com'),
('Biblioteca da Montanha', 'Av. das Alturas, 99', '8901234567', 'montanha@biblioteca.com'),
('Biblioteca do Vale', 'Rua da Serra, 23', '9012345678', 'vale@biblioteca.com'),
('Biblioteca do Rio', 'Av. das Águas, 65', '6789012345', 'rio@biblioteca.com'),
('Biblioteca do Campo', 'Rua das Árvores, 88', '7890123456', 'campo@biblioteca.com'),
('Biblioteca da Vila', 'Av. da Paz, 37', '8905671234', 'vila@biblioteca.com'),
('Biblioteca do Lago', 'Rua das Ilhas, 18', '1234567891', 'lago@biblioteca.com'),
('Biblioteca da Floresta', 'Av. Verde, 72', '2345678910', 'floresta@biblioteca.com'),
('Biblioteca do Horizonte', 'Rua Azul, 54', '3456789101', 'horizonte@biblioteca.com');


INSERT INTO Administrador (Nome, Endereco, Telefone, Email, BibliotecaID)
VALUES 
('Carlos Silva', 'Rua Principal, 123', '1234567890', 'carlos@biblioteca.com', 1),
('Mariana Lima', 'Av. das Flores, 45', '9876543210', 'mariana@biblioteca.com', 2),
('João Souza', 'Rua da Estação, 78', '1029384756', 'joao@biblioteca.com', 3),
('Ana Paula', 'Rua do Conhecimento, 101', '5647382910', 'ana@biblioteca.com', 4),
('Ricardo Alves', 'Av. dos Bosques, 25', '0192837465', 'ricardo@biblioteca.com', 5),
('Fernanda Rocha', 'Campus Universitário, Bloco A', '2938475610', 'fernanda@biblioteca.com', 6),
('Luciana Mendes', 'Praça Central, 89', '1239876540', 'luciana@biblioteca.com', 7),
('Roberto Costa', 'Rua da Praia, 56', '9871234560', 'roberto@biblioteca.com', 8),
('Patrícia Fernandes', 'Av. das Neves, 112', '5647389201', 'patricia@biblioteca.com', 9),
('Pedro Henrique', 'Rua dos Pássaros, 74', '2938471056', 'pedro@biblioteca.com', 10),
('Juliana Vieira', 'Av. dos Ventos, 53', '5678901234', 'juliana@biblioteca.com', 11),
('André Martins', 'Rua do Sol, 44', '4567890123', 'andre@biblioteca.com', 12),
('Camila Santos', 'Av. das Alturas, 99', '8901234567', 'camila@biblioteca.com', 13),
('Rafael Almeida', 'Rua da Serra, 23', '9012345678', 'rafael@biblioteca.com', 14),
('Bianca Pereira', 'Av. das Águas, 65', '6789012345', 'bianca@biblioteca.com', 15),
('Gustavo Ramos', 'Rua das Árvores, 88', '7890123456', 'gustavo@biblioteca.com', 16),
('Renata Silva', 'Av. da Paz, 37', '8905671234', 'renata@biblioteca.com', 17),
('Leandro Oliveira', 'Rua das Ilhas, 18', '1234567891', 'leandro@biblioteca.com', 18),
('Tatiana Castro', 'Av. Verde, 72', '2345678910', 'tatiana@biblioteca.com', 19),
('Marcelo Antunes', 'Rua Azul, 54', '3456789101', 'marcelo@biblioteca.com', 20);









--Crud

--selecionar
SELECT * FROM Editora;

SELECT * FROM Categoria

SELECT * FROM Usuario

SELECT * FROM Livro

SELECT * FROM Emprestimo

SELECT * FROM Biblioteca

SELECT * FROM Administrador

--Atualizar
UPDATE Editora
SET Nome = 'Novo Nome',
    Endereco = 'Novo Endereço',
    Telefone = 'Novo Telefone',
    Email = 'Novo Email',
    Website = 'Novo Website'
WHERE EditoraID = 1;

UPDATE Categoria
SET Descricao = 'Nova Descrição'
WHERE CategoriaID = 1;


UPDATE Livro
SET Titulo = 'Novo Título',
    Autor = 'Novo Autor',
    AnoPublicacao = 2023,
    EditoraID = 2,
    CategoriaID = 2,
    Preco = 35.99,
    ISBN = 'Novo ISBN',
    QuantidadeEstoque = 50
WHERE LivroID = 1;


UPDATE Usuario
SET Nome = 'Novo Nome',
    Endereco = 'Novo Endereço',
    Telefone = 'Novo Telefone',
    Email = 'Novo Email',
    DataNascimento = '2001-01-01'
WHERE UsuarioID = 1;

UPDATE Emprestimo
SET DataEmprestimo = '2024-06-02',
    DataDevolucao = '2024-06-16',
    UsuarioID = 2,
    LivroID = 2,
    Multa = 10.00
WHERE EmprestimoID = 1;

UPDATE Biblioteca
SET Nome = 'Nova Biblioteca do Saber'
WHERE BibliotecaID = 1;

UPDATE Administrador
SET Endereco = 'Rua Nova, 456'
WHERE AdministradorID = 1;


-- Delete
DELETE FROM Editora WHERE EditoraID = 1;
DELETE FROM Categoria WHERE CategoriaID = 1;
DELETE FROM Livro WHERE LivroID = 1;
DELETE FROM Usuario WHERE UsuarioID = 1;
DELETE FROM Emprestimo WHERE EmprestimoID = 1;
DELETE FROM Biblioteca WHERE BibliotecaID = 1;
DELETE FROM Administrador WHERE AdministradorID = 1;




--AS 10 Consultas
--1
SELECT 
    b.BibliotecaID, 
    b.Nome AS BibliotecaNome, 
    a.AdministradorID, 
    a.Nome AS AdministradorNome 
FROM 
    Biblioteca b
JOIN 
    Administrador a ON b.BibliotecaID = a.BibliotecaID
WHERE 
    b.Telefone LIKE '9%' OR a.Telefone LIKE '9%';


--2
SELECT 
    BibliotecaID, 
    Nome, 
    Endereco, 
    Telefone, 
    Email 
FROM 
    Biblioteca
ORDER BY 
    Nome;


--3
SELECT 
    COUNT(*) AS TotalBibliotecas 
FROM 
    Biblioteca;

--4
SELECT TOP 1 
    b.BibliotecaID, 
    b.Nome AS BibliotecaNome, 
    a.AdministradorID, 
    a.Nome AS AdministradorNome 
FROM 
    Biblioteca b
JOIN 
    Administrador a ON b.BibliotecaID = a.BibliotecaID
ORDER BY 
    b.BibliotecaID DESC;




--5
SELECT U.Nome, U.Email, E.DataEmprestimo, E.DataDevolucao, E.Multa
FROM Usuario U
JOIN Emprestimo E ON U.UsuarioID = E.UsuarioID
WHERE E.Multa > 0;

--6
SELECT 
    AdministradorID, 
    Nome, 
    Endereco, 
    Telefone, 
    Email, 
    BibliotecaID 
FROM 
    Administrador
ORDER BY 
    Nome DESC;

--7
SELECT TOP 5 U.Nome, U.Email, COUNT(E.EmprestimoID) AS NumeroDeEmprestimos
FROM Usuario U
JOIN Emprestimo E ON U.UsuarioID = E.UsuarioID
GROUP BY U.Nome, U.Email
ORDER BY NumeroDeEmprestimos DESC;

--8
SELECT L.Titulo, L.Autor, L.Preco, L.QuantidadeEstoque
FROM Livro L
ORDER BY L.Preco DESC;


--9
SELECT E.EmprestimoID, U.Nome, L.Titulo, E.DataEmprestimo, E.DataDevolucao
FROM Emprestimo E
JOIN Usuario U ON E.UsuarioID = U.UsuarioID
JOIN Livro L ON E.LivroID = L.LivroID
WHERE MONTH(E.DataEmprestimo) = 6 AND YEAR(E.DataEmprestimo) = 2024
ORDER BY E.DataEmprestimo;


--10
SELECT 
    b.BibliotecaID, 
    b.Nome AS BibliotecaNome, 
    a.AdministradorID, 
    a.Nome AS AdministradorNome 
FROM 
    Biblioteca b
JOIN 
    Administrador a ON b.BibliotecaID = a.BibliotecaID;


--11
SELECT 
    b.BibliotecaID, 
    b.Nome AS BibliotecaNome, 
    a.AdministradorID, 
    a.Nome AS AdministradorNome 
FROM 
    Biblioteca b
JOIN 
    Administrador a ON b.BibliotecaID = a.BibliotecaID;


