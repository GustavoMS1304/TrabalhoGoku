# Sistema de Biblioteca em Dart

## Descrição
Sistema de gerenciamento de biblioteca desenvolvido em Dart,
executado no terminal, com operações de CRUD (Create, Read, Update, Delete).

## Classes utilizadas

### Livro
Representa um livro com os atributos:
- id (identificador único)
- titulo
- autor
- anoPublicacao
- isbn

### Biblioteca
Gerencia a lista de livros com os métodos:
- cadastrarLivro()
- listarLivros()
- atualizarLivro()
- removerLivro()

## Como executar

1. Certifique-se de ter o Dart SDK instalado
2. Clone o repositório:
   git clone https://github.com/GustavoMS1304/TrabalhoGoku.git
3. Acesse a pasta do projeto
4. Execute o comando:
   cd "Trabalho 2"
   dart run main.dart

## Exemplo de uso
===== SISTEMA DE BIBLIOTECA =====
1 - Cadastrar livro
2 - Listar livros
3 - Atualizar livro
4 - Remover livro
5 - Sair
Escolha uma opção: 1

-- Cadastrar Livro --
Título: Dom Casmurro
Autor: Machado de Assis
Ano de publicação: 1899
ISBN: 978-8535910661
Livro cadastrado com sucesso!