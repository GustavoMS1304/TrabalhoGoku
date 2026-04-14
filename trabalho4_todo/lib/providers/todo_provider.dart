import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void adicionarTodo(String titulo) {
    state = [
      ...state,
      Todo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        titulo: titulo,
      ),
    ];
  }

  void toggleConcluida(String id) {
    state = state.map((todo) {
      if (todo.id == id) {
        return Todo(id: todo.id, titulo: todo.titulo, concluida: !todo.concluida);
      }
      return todo;
    }).toList();
  }

  void removerTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoNotifier, List<Todo>>((ref) {
  return TodoNotifier();
});