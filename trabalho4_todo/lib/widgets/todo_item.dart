import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';
import '../providers/todo_provider.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Checkbox(
          value: todo.concluida,
          activeColor: Colors.green,
          onChanged: (_) => ref.read(todoProvider.notifier).toggleConcluida(todo.id),
        ),
        title: Text(
          todo.titulo,
          style: TextStyle(
            fontSize: 16,
            decoration: todo.concluida ? TextDecoration.lineThrough : null,
            color: todo.concluida ? Colors.grey : Colors.black,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.redAccent),
          onPressed: () => ref.read(todoProvider.notifier).removerTodo(todo.id),
        ),
      ),
    );
  }
}