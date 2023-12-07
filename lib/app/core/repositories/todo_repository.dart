import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

import '../../ui/stores/todo_list_tile_store.dart';
import 'todo_item_model.dart';

const dbPath = 'flutter-pad-db';
const boxTodoItem = 'todo-item';

class TodoRepository {
  final hiveCompleter = Completer();

  Box get box => Hive.box(boxTodoItem);

  TodoRepository() {
    _initHive().then((value) => hiveCompleter.complete());
  }

  Future<void> _initHive() async {
    await Hive.initFlutter(dbPath);
    await Hive.openBox(boxTodoItem);
  }

  Future<void> create(TodoItemModel todoItemEntity) async {
    await hiveCompleter.future;

    await box.put(todoItemEntity.id, todoItemEntity.toMap());
  }

  Future<TodoItemEntity> read(String id) async {
    await hiveCompleter.future;

    final todoItemMap = await box.get(id);
    final todoItem = TodoItemModel.fromMap(map: todoItemMap);
    return todoItem;
  }

  Future<void> update(TodoItemModel todoItemEntity) async {
    await hiveCompleter.future;

    await box.put(todoItemEntity.id, todoItemEntity.toMap());
  }

  Future<void> delete(TodoItemModel todoItemEntity) async {
    await hiveCompleter.future;

    await box.delete(todoItemEntity.id);
  }

  Future<List<TodoItemModel>> list() async {
    await hiveCompleter.future;

    Iterable values = box.values;
    List<TodoItemModel> result = values.map((e) => TodoItemModel.fromMap(map: e)).toList();
    return result;
  }

  Future<List<TodoItemModel>> finishedList() async {
    await hiveCompleter.future;

    Iterable values = box.values;
    List<TodoItemModel> result = values
        .map((e) => TodoItemModel.fromMap(map: e))
        .where(
          (element) => element.finished,
        )
        .toList();
    return result;
  }

  Future<List<TodoItemModel>> unfinishedList() async {
    await hiveCompleter.future;

    Iterable values = box.values;
    List<TodoItemModel> result = values
        .map((e) => TodoItemModel.fromMap(map: e))
        .where(
          (element) => element.finished == false,
        )
        .toList();
    return result;
  }
}
