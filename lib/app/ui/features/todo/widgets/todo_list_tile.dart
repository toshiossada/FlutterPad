import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';

import '../../../stores/todo_list_tile_store.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.store,
    required this.onPressed,
    required this.checkBox
  });

  final TodoItemEntity store;
  final VoidCallback onPressed;
  final Function(bool?) checkBox;

  @override
  Widget build(BuildContext context) {
    final alphaTransform = store.isFinished ? 128 : 255;

    return ListTile(
      enabled: !store.isFinished,
      leading: Material(
        shape: CircleBorder(
          side: BorderSide(
            color: context.colorScheme.surfaceVariant,
            width: 2,
          ),
        ),
        color: store.categoryColor.withAlpha(
          alphaTransform,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(
            store.categoryIcon,
            color: context.colorScheme.onSurface.withAlpha(
              alphaTransform,
            ),
          ),
        ),
      ),
      title: Text(
        store.title,
        style: context.textTheme.titleMedium?.copyWith(
          color: context.colorScheme.onSurface.withAlpha(
            alphaTransform,
          ),
          decoration: store.isFinished ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        store.subtitle,
        style: context.textTheme.labelLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant.withAlpha(
            alphaTransform,
          ),
          decoration: store.isFinished ? TextDecoration.lineThrough : null,
        ),
      ),
      onTap: onPressed,
      trailing: Transform.scale(
        scale: 4 / 3,
        child: Checkbox(
          fillColor: store.isFinished
              ? MaterialStateProperty.all(
                  context.colorScheme.onSurface,
                )
              : null,
          value: store.isFinished,
          onChanged: checkBox,
        ),
      ),
    );
  }
}
