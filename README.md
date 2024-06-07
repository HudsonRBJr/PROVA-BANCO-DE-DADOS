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

<img src="./imagens/![Uploading brModelo 06_06_2024 21_09_34.png…]()
" width="100%" />



  






  


```sql

```
