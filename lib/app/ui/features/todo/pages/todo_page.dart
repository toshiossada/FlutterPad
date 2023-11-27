import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo/pages/todo_view.dart';
import '../stores/todo_page_store.dart';

class TodoPage extends StatelessWidget {
  final TodoPageStore store;

  const TodoPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: store,
      builder: (context, _) {
        return TodoView(
          openTodoList: store.openTodoList,
          finishedTodoList: store.finishedTodoList,
          onPressedTodoItem: (todo) => store.onPressedTodoItem(todo, context),
          onTapCreateItemTodo: () => store.onTapCreateItemTodo(context),
        );
      },
    );
  }
}
