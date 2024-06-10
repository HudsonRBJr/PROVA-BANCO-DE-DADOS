# PROVA-BANCO-DE-DADOS.


## CENARIO

<p>A Biblioteca Comunitária "Biblioteca do Saber" foi criada para fornecer acesso gratuito a livros de diversas categorias para a comunidade local. A biblioteca é gerida por um sistema que controla editoras, categorias de livros, detalhes dos livros, informações dos usuários e registro de empréstimos,Vários editores e uma equipe de administradores dedicados.</p>

## Entidades e Atributos

<h4>Biblioteca:</h4>
<p>
Descrição: Cada biblioteca é uma unidade física com um nome, endereço, telefone e e-mail para contato. <br>
Atributos:<br>
BibliotecaID (INT): Identificador único da biblioteca.<br>
Nome (VARCHAR): Nome da biblioteca.<br>
Endereco (VARCHAR): Endereço da biblioteca.<br>
Telefone (VARCHAR): Número de telefone da biblioteca.<br>
Email (VARCHAR): Endereço de e-mail da biblioteca.<br> 
Relaçao(1,1).  
</p>

<h4>Administrador:</h4>
<p>
Descrição: Administradores são responsáveis pela gestão diária da biblioteca. Cada biblioteca tem um administrador. <br>
Atributos: <br>
AdministradorID (INT): Identificador único do administrador. <br>
Nome (VARCHAR): Nome do administrador.<br>
Endereco (VARCHAR): Endereço do administrador.<br>
Telefone (VARCHAR): Número de telefone do administrador.<br>
Email (VARCHAR): Endereço de e-mail do administrador.<br>
BibliotecaID (INT): Identificador da biblioteca que o administrador gerencia (relação 1:1).
</p>

<h4>Categoria:</h4>
<p>
Descrição: Livros são classificados em categorias para facilitar a organização e pesquisa.<br>
Atributos:<br>
CategoriaID (INT): Identificador único da categoria.<br>
Descricao (VARCHAR): Descrição da categoria (por exemplo, Ficção, Ciência, História).<br>
Relaçao(1,n).  
</p>

<h4>Livro:</h4>
<p>
Descrição: Livros disponíveis na biblioteca, cada um associado a uma categoria e editora.<br>
Atributos:<br>
LivroID (INT): Identificador único do livro.<br>
Titulo (VARCHAR): Título do livro.<br>
Autor (VARCHAR): Autor do livro.<br>
AnoPublicacao (YEAR): Ano de publicação do livro.<br>
EditoraID (INT): Identificador da editora que publicou o livro.<br>
CategoriaID (INT): Identificador da categoria do livro.<br>
Preco (DECIMAL): Preço do livro.<br>
ISBN (VARCHAR): Código ISBN do livro.<br>
QuantidadeEstoque (INT): Quantidade de exemplares do livro em estoque.<br>
Relaçoes(1,n).
</p>

<h4>Editora:</h4>
<p>
Descrição: Editoras são responsáveis pela publicação dos livros.<br>
Atributos:<br>
EditoraID (INT): Identificador único da editora.<br>
Nome (VARCHAR): Nome da editora.<br>
Endereco (VARCHAR): Endereço da editora.<br>
Telefone (VARCHAR): Número de telefone da editora.<br>
Email (VARCHAR): Endereço de e-mail da editora.<br>
Website (VARCHAR): Website da editora.<br>
Relaçoes(1,n).
</p>

<h4>Usuario:</h4>
<p>
Descrição: Usuários são membros da biblioteca que podem emprestar livros.<br>
Atributos:<br>
UsuarioID (INT): Identificador único do usuário.<br>
Nome (VARCHAR): Nome do usuário.<br>
Endereco (VARCHAR): Endereço do usuário.<br>
Telefone (VARCHAR): Número de telefone do usuário.<br>
Email (VARCHAR): Endereço de e-mail do usuário.<br>
DataNascimento (DATE): Data de nascimento do usuário.<br>
DataCadastro (TIMESTAMP): Data e hora de cadastro do usuário.<br>
Relaçoes(1,n)
</p>


## MODELAGEM CONCEITUAL.

![image](https://github.com/HudsonRBJr/PROVA-BANCO-DE-DADOS/assets/162808613/b4802430-f668-4a59-8c26-65acb39081ca)


## MODELAGEM LOGICA.
![image](https://github.com/HudsonRBJr/PROVA-BANCO-DE-DADOS/assets/162808613/9c0fbdd4-ed78-402e-acf9-9c7c90f7cbd6)


## 4 Modelagem Fisica.
### Modelagem Fisica Editora
```sql
-- Criação da tabela Editora
CREATE TABLE Editora (
    EditoraID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Endereco NVARCHAR(255),
    Telefone NVARCHAR(20),
    Email NVARCHAR(100),
    Website NVARCHAR(255)
);
```
### Modelagem Fisica Categoria
```sql

-- Criação da tabela Categoria
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY IDENTITY(1,1),
    Descricao NVARCHAR(255) NOT NULL
);
```
### Modelagem Fisica Livro
```sql
-- Criação da tabela Livro
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
```
### Modelagem Fisica Usuario
```sql
-- Criação da tabela Usuario
CREATE TABLE Usuario (
    UsuarioID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Endereco NVARCHAR(255),
    Telefone NVARCHAR(20),
    Email NVARCHAR(100),
    DataNascimento DATE,
    DataCadastro DATETIME DEFAULT GETDATE()
);
```
### Modelagem Fisica Emprestimo
```sql
-- Criação da tabela Emprestimo
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
```
### Modelagem Fisica Administrador
```sql
CREATE TABLE Administrador (
    AdministradorID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100),
    BibliotecaID INT UNIQUE,  -- Relação 1:1
    FOREIGN KEY (BibliotecaID) REFERENCES Biblioteca(BibliotecaID)
);
```

### Modelagem Fisica Biblioteca
```sql 
CREATE TABLE Biblioteca (
    BibliotecaID INT PRIMARY KEY IDENTITY(1,1),
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    Email VARCHAR(100)
);


```
# 5 Inserçao De Dados.
### Inserçao De Dados Usuario
```sql
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
```
### Inserçao De Dados Livro
```sql
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
('História da Arte', 'E.H. Gombrich', 1950, 12, 12, 49.99, '9780714832470', 18),
('Os Lusíadas', 'Luís de Camões', 1572, 13, 13, 29.99, '9789723014603', 22),
('Dom Quixote', 'Miguel de Cervantes', 1605, 14, 14, 59.99, '9788491051068', 10),
('Crime e Castigo', 'Fiódor Dostoiévski', 1866, 15, 15, 39.99, '9780140449136', 15),
('1984', 'George Orwell', 1949, 16, 16, 49.99, '9780451524935', 20),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 17, 17, 19.99, '9782070612758', 35),
('O Hobbit', 'J.R.R. Tolkien', 1937, 18, 18, 49.99, '9780547928227', 25),
('Guerra e Paz', 'Liev Tolstói', 1869, 19, 19, 59.99, '9780199232765', 15),
('O Nome da Rosa', 'Umberto Eco', 1980, 20, 20, 39.99, '9780156032834', 20);
```
### Inserçao De Dados Emprestimo
```sql
INSERT INTO Emprestimo (DataEmprestimo, DataDevolucao, UsuarioID, LivroID, Multa)
VALUES 
('2024-06-01', '2024-06-15', 1, 1, 5.00),
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
```
### Inserçao De Dados Editora
```sql
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
```
### Inserçao De Dados Categoria
```sql
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
```
### Inserçao De Dados Biblioteca

```sql
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
```
### Inserçao De Dados ADMINISTRADOR
```sql
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

```


## 6 CRUD

### Selec Into Do 
