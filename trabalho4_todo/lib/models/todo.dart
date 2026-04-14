class Todo {
  final String id;
  String titulo;
  bool concluida;

  Todo({
    required this.id,
    required this.titulo,
    this.concluida = false,
  });
}