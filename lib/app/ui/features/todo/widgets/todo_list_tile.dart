import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';

import '../stores/todo_list_tile_store.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.store,
    required this.onPressed,
  });

  final TodoListTileStore store;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        store.categoryIcon,
        color: context.colorScheme.onSurface,
      ),
      title: Text(
        store.title,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.colorScheme.onSurface,
          decoration: store.isFinished ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        store.subtitle,
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
          decoration: store.isFinished ? TextDecoration.lineThrough : null,
        ),
      ),
      onTap: onPressed,
      trailing: Checkbox(
        value: store.isFinished,
        onChanged: (bool? value) {},
      ),
    );
  }
}
