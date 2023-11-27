import 'dart:async';

import 'package:flutterpad/domain/entities/todo_list_tile_store.dart';
import 'package:flutterpad/external/models/todo_item_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../domain/todo_repository/i_todo_repository.dart';

const dbPath = 'flutter-pad-db';
const boxTodoItem = 'todo-item';

class TodoRepository implements ITodoRepository {
  final hiveCompleter = Completer();

  Box get box => Hive.box(boxTodoItem);

  TodoRepository() {
    initHive().then((value) => hiveCompleter.complete());
  }

  Future<void> initHive() async {
    await Hive.initFlutter(dbPath);
    await Hive.openBox(boxTodoItem);
  }

  @override
  Future<void> addTodoItem(TodoItemEntity todoItemEntity) async {
    await hiveCompleter.future;

    await box.put(todoItemEntity.id, todoItemEntity.toMap());
  }

  @override
  Future<void> deleteTodoItem(TodoItemEntity todoItemEntity) async {
    await hiveCompleter.future;

    await box.delete(todoItemEntity.id);
  }

  @override
  Future<TodoItemEntity> getById(String id) async {
    await hiveCompleter.future;

    final todoItemMap = await box.get(id);
    final todoItem = TodoItemModel.fromMap(map: todoItemMap);
    return todoItem;
  }

  @override
  Future<List<TodoItemEntity>> getTodoList() async {
    await hiveCompleter.future;

    Iterable values = box.values;
    List<TodoItemEntity> result = values.map((e) => TodoItemModel.fromMap(map: e)).toList();
    return result;
  }

  @override
  Future<void> updateTodoItem(TodoItemEntity todoItemEntity) async {
    await hiveCompleter.future;

    await box.put(todoItemEntity.id, todoItemEntity.toMap());
  }
}
