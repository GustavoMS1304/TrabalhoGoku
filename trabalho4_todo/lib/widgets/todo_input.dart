import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';

class TodoInput extends ConsumerStatefulWidget {
  const TodoInput({super.key});

  @override
  ConsumerState<TodoInput> createState() => _TodoInputState();
}

class _TodoInputState extends ConsumerState<TodoInput> {
  final _controller = TextEditingController();

  void _adicionar() {
    if (_controller.text.trim().isEmpty) return;
    ref.read(todoProvider.notifier).adicionarTodo(_controller.text.trim());
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Nova tarefa...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onSubmitted: (_) => _adicionar(),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: _adicionar,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}