import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo/controller/items_controller.dart';
import 'package:flutterpad/app/extensions/context_extensions.dart';
import 'package:flutterpad/app/ui/features/todo/controller/todo_controller.dart';
import 'package:flutterpad/app/ui/features/todo/widgets/todo_list_tile.dart';
import 'package:flutterpad/app/ui/features/todo/pages/todo_item_page.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key, required this.itemsController});

  final ItemsController itemsController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
        return TweenAnimationBuilder(
          duration: const Duration(milliseconds: 600),
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          builder: (context, value, child) {
            debugPrint('Valor interpolado entre 0 - 1: $value');

            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: Material(
            color: context.colorScheme.surfaceVariant,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: index == 0 ? const Radius.circular(8) : Radius.zero,
              topStart: index == 0 ? const Radius.circular(8) : Radius.zero,
              bottomEnd: index == itemsController.itemsInitList.length - 1
                  ? const Radius.circular(8)
                  : Radius.zero,
              bottomStart: index == itemsController.itemsInitList.length - 1
                  ? const Radius.circular(8)
                  : Radius.zero,
            ),
            child: TodoListTile(
              store: todo,
              onPressed: () {
                itemsController.editeTodo(item: todo);
                TodoController().naviTodoAddList(
                    context,
                    TodoItemPage(
                        title: 'Nova tarefa',
                        itemsController: itemsController,
                        titleButton: 'Editar',
                        todo: todo));
              },
              checkBox: (bool? v) {
                itemsController.updateItemsInitList(item: todo);
              },
            ),
          ),
        );
      },
    );
  }
}

class TodoListItemWidget extends StatelessWidget {
  const TodoListItemWidget({super.key, required this.itemsController});

  // final List<TodoItemEntity> openTodoList;
  final ItemsController itemsController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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

        return TweenAnimationBuilder(
          duration: const Duration(
            milliseconds: 300,
          ),
          tween: Tween<double>(
            begin: 0,
            end: 1,
          ),
          builder: (context, value, child) {
            debugPrint('Valor interpolado entre 0 - 1: $value');
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: Material(
            color: context.colorScheme.surfaceVariant,
            borderRadius: BorderRadiusDirectional.only(
              topEnd: index == 0 ? const Radius.circular(8) : Radius.zero,
              topStart: index == 0 ? const Radius.circular(8) : Radius.zero,
              bottomEnd: index == itemsController.itemsAdd.length - 1
                  ? const Radius.circular(8)
                  : Radius.zero,
              bottomStart: index == itemsController.itemsAdd.length - 1
                  ? const Radius.circular(8)
                  : Radius.zero,
            ),
            child: TodoListTile(
              store: todo,
              onPressed: () {},
              checkBox: (bool? v) {
                itemsController.updateItemsAdd(item: todo);
              },
            ),
          ),
        );
      },
    );
  }
}
