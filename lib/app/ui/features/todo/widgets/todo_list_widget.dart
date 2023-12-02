import 'package:flutter/material.dart';
import 'package:flutterpad/app/core/shared/items_controller.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';
import 'package:flutterpad/app/ui/features/todo/controller/todo_controller.dart';
import 'package:flutterpad/app/ui/features/todo/widgets/todo_list_tile.dart';
import 'package:flutterpad/app/ui/features/todo_item/pages/todo_item_page.dart';

import '../../../stores/todo_list_tile_store.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key, required this.itemsController});

  final ItemsController itemsController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceVariant,
      borderRadius: BorderRadius.circular(8),
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemsController.itemsInitList.length,
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          final todo = itemsController.itemsInitList[index];
          return TodoListTile(
            store: todo,
            onPressed:  (){
              itemsController.editeTodo(item: todo);
              TodoController().naviTodoAddList(context, TodoItemPage(title: 'Nova tarefa', itemsController: itemsController, titleButton: 'Editar',todo: todo));
            }, 
            checkBox: (bool? v) {
              itemsController.updateItemsInitList(item: todo);
            },
          );
        },
      ),
    );
  }
}


class TodoListItemWidget extends StatelessWidget {
  const TodoListItemWidget({super.key, required this.itemsController});

  // final List<TodoItemEntity> openTodoList;
  final ItemsController itemsController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colorScheme.surfaceVariant,
      borderRadius: BorderRadius.circular(8),
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemsController.itemsAdd.length,
        separatorBuilder: (context, index) {
          return const Divider(
            height: 0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          final todo = itemsController.itemsAdd[index];
          return TodoListTile(
            store: todo,
            onPressed:  (){}, 
            checkBox: (bool? v) {
              itemsController.updateItemsAdd(item: todo);
            },
          );
        },
      ),
    );
  }
}

