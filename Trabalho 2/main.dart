import 'dart:io';

class Livro {
  int id;
  String titulo;
  String autor;
  int anoPublicacao;
  String isbn;

  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.anoPublicacao,
    required this.isbn,
  });

  void exibir() {
    print('----------------------------');
    print('ID: $id');
    print('Título: $titulo');
    print('Autor: $autor');
    print('Ano: $anoPublicacao');
    print('ISBN: $isbn');
    print('----------------------------');
  }
}

class Biblioteca {
  List<Livro> livros = [];
  int _proximoId = 1;

  void cadastrarLivro() {
    print('\n-- Cadastrar Livro --');
    stdout.write('Título: ');
    String titulo = stdin.readLineSync()!;
    stdout.write('Autor: ');
    String autor = stdin.readLineSync()!;
    stdout.write('Ano de publicação: ');
    int ano = int.parse(stdin.readLineSync()!);
    stdout.write('ISBN: ');
    String isbn = stdin.readLineSync()!;

    livros.add(Livro(
      id: _proximoId++,
      titulo: titulo,
      autor: autor,
      anoPublicacao: ano,
      isbn: isbn,
    ));

    print('Livro cadastrado com sucesso!');
  }

  void listarLivros() {
    print('\n-- Lista de Livros --');
    if (livros.isEmpty) {
      print('Nenhum livro cadastrado.');
      return;
    }
    for (var livro in livros) {
      livro.exibir();
    }
  }

  void atualizarLivro() {
    print('\n-- Atualizar Livro --');
    stdout.write('Digite o ID do livro: ');
    int id = int.parse(stdin.readLineSync()!);

    var livro = livros.firstWhere(
      (l) => l.id == id,
      orElse: () => throw Exception('Livro não encontrado'),
    );

    print('Deixe em branco para manter o valor atual.');
    stdout.write('Novo título (${livro.titulo}): ');
    String titulo = stdin.readLineSync()!;
    stdout.write('Novo autor (${livro.autor}): ');
    String autor = stdin.readLineSync()!;
    stdout.write('Novo ano (${livro.anoPublicacao}): ');
    String ano = stdin.readLineSync()!;
    stdout.write('Novo ISBN (${livro.isbn}): ');
    String isbn = stdin.readLineSync()!;

    if (titulo.isNotEmpty) livro.titulo = titulo;
    if (autor.isNotEmpty) livro.autor = autor;
    if (ano.isNotEmpty) livro.anoPublicacao = int.parse(ano);
    if (isbn.isNotEmpty) livro.isbn = isbn;

    print('Livro atualizado com sucesso!');
  }

  void removerLivro() {
    print('\n-- Remover Livro --');
    stdout.write('Digite o ID do livro: ');
    int id = int.parse(stdin.readLineSync()!);

    int antes = livros.length;
    livros.removeWhere((l) => l.id == id);

    if (livros.length < antes) {
      print('Livro removido com sucesso!');
    } else {
      print('Livro não encontrado.');
    }
  }
}

void main() {
  Biblioteca biblioteca = Biblioteca();

  while (true) {
    print('\n===== SISTEMA DE BIBLIOTECA =====');
    print('1 - Cadastrar livro');
    print('2 - Listar livros');
    print('3 - Atualizar livro');
    print('4 - Remover livro');
    print('5 - Sair');
    stdout.write('Escolha uma opção: ');

    String opcao = stdin.readLineSync()!;

    switch (opcao) {
      case '1':
        biblioteca.cadastrarLivro();
        break;
      case '2':
        biblioteca.listarLivros();
        break;
      case '3':
        biblioteca.atualizarLivro();
        break;
      case '4':
        biblioteca.removerLivro();
        break;
      case '5':
        print('Encerrando o sistema...');
        exit(0);
      default:
        print('Opção inválida!');
    }
  }
}