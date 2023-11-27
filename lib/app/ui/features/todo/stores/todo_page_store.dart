import 'package:flutter/cupertino.dart';

import '../../../../../domain/entities/todo_list_tile_store.dart';

abstract class TodoPageStore with ChangeNotifier {
  List<TodoItemEntity> get openTodoList;
  List<TodoItemEntity> get finishedTodoList;

  void onPressedTodoItem(TodoItemEntity todoListTileStore, BuildContext context);
  void onTapCreateItemTodo(BuildContext context);
}
