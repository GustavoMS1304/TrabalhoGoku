import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/todo_provider.dart';
import 'widgets/todo_input.dart';
import 'widgets/todo_item.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends ConsumerWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Tarefas'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const TodoInput(),
          Expanded(
            child: todos.isEmpty
                ? const Center(
                    child: Text('Nenhuma tarefa ainda!', style: TextStyle(color: Colors.grey)),
                  )
                : ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (context, index) => TodoItem(todo: todos[index]),
                  ),
          ),
        ],
      ),
    );
  }
}