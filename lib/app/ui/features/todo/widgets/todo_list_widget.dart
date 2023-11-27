import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';
import 'package:flutterpad/app/ui/features/todo/widgets/todo_list_tile.dart';

import '../../../../../domain/entities/todo_list_tile_store.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key, required this.openTodoList, required this.onPressed});

  final List<TodoItemEntity> openTodoList;
  final void Function(TodoItemEntity) onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceVariant,
      borderRadius: BorderRadius.circular(8),
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: openTodoList.length,
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          final todo = openTodoList[index];
          return TodoListTile(
            store: todo,
            onPressed: () => onPressed(todo),
          );
        },
      ),
    );
  }
}
