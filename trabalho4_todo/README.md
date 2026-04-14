# Lista de Tarefas Flutter

## Descrição
Aplicativo de lista de tarefas desenvolvido em Flutter, com gerenciamento de estado utilizando Riverpod.
O usuário pode adicionar, concluir e remover tarefas.

## Gestão de Estado com Riverpod
A gestão de estado foi implementada utilizando:

- **StateNotifier**: controla a lista de tarefas e suas operações
- **StateNotifierProvider**: disponibiliza o estado para toda a aplicação
- **ConsumerWidget**: widgets que escutam e reagem às mudanças de estado
- **ProviderScope**: envolve toda a aplicação para habilitar o Riverpod

## Estrutura de Componentes

### models/todo.dart
Modelo da tarefa com atributos: id, titulo e concluida.

### providers/todo_provider.dart
Responsável pela lógica e estado da aplicação.
Contém os métodos adicionarTodo, toggleConcluida e removerTodo.

### widgets/todo_input.dart
Widget com campo de texto e botão para adicionar novas tarefas.

### widgets/todo_item.dart
Widget que representa cada tarefa na lista,
com checkbox para concluir e botão para remover.

### main.dart
Página principal que exibe a lista de tarefas utilizando ListView.builder.

## Funcionalidades
- Adicionar nova tarefa
- Marcar tarefa como concluída (riscada visualmente)
- Remover tarefa
- Lista atualizada em tempo real

## Como executar

1. Certifique-se de ter o Flutter SDK instalado
2. Clone o repositório:
   git clone https://github.com/GustavoMS1304/TrabalhoGoku.git
3. Acesse a pasta do projeto:
   cd trabalho4_todo
4. Instale as dependências:
   flutter pub get
5. Execute o projeto:
   flutter run