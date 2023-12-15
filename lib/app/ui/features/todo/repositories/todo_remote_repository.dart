import 'dart:async';

import 'package:dio/dio.dart';

import 'todo_item_model.dart';

const dbPath = 'flutter-pad-db';
const boxTodoItem = 'todo-item';

class TodoRemoteRepository {
  final Dio dio = Dio(
    BaseOptions(
        baseUrl: 'https://wzzjaayapmhmxqhxkpkm.supabase.co/rest/v1/',
        headers: {
          'apikey':
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind6emphYXlhcG1obXhxaHhrcGttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE2MjIyNjAsImV4cCI6MjAxNzE5ODI2MH0.E7arlxAi9gsm7Vt1fINpS1kTBjEK2QF_zuvTAmvqREE',
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind6emphYXlhcG1obXhxaHhrcGttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDE2MjIyNjAsImV4cCI6MjAxNzE5ODI2MH0.E7arlxAi9gsm7Vt1fINpS1kTBjEK2QF_zuvTAmvqREE',
        }),
  );

  Future<List<TodoItemModel>> list() async {
    final result = await dio.get('/todo');

    if (result.statusCode != 200) {
      throw Exception('Error on read todo item');
    }

    final todo = (result.data as List)
        .map((e) => TodoItemModel.fromMap(map: e))
        .toList();

    return todo;
  }

  Future<TodoItemModel> read(int id) async {
    final result = await dio.get('/todo?id=eq.$id');

    if (result.statusCode != 200) {
      throw Exception('Error on read todo item');
    }

    final todo = TodoItemModel.fromMap(map: result.data);

    return todo;
  }

  Future<List<TodoItemModel>> byStatus(bool finished) async {
    final result = await dio.get('/todo?finished=eq.$finished');

    if (result.statusCode != 200) {
      throw Exception('Error on read todo item');
    }
    final todo = (result.data as List)
        .map((e) => TodoItemModel.fromMap(map: e))
        .toList();

    return todo;
  }

  Future<void> create(TodoItemModel todoItemEntity) async {
    final result = await dio.post(
      '/todo',
      data: todoItemEntity.toMap(),
    );

    if (result.statusCode != 201) {
      throw Exception('Error on create todo item');
    }
  }

  Future<void> update(TodoItemModel todoItemEntity) async {
    final id = todoItemEntity.id;
    final result = await dio.put('/todo?id=eq.$id', data: {
      'id': todoItemEntity.id,
      ...todoItemEntity.toMap(),
    });

    if (result.statusCode != 204) {
      throw Exception('Error on pdate todo item');
    }
  }

  Future<void> updateDescription(TodoItemModel todoItemEntity) async {
    final id = todoItemEntity.id;
    final result = await dio.put('/todo?id=eq.$id', data: {
      'title': todoItemEntity.annotation,
    });

    if (result.statusCode != 204) {
      throw Exception('Error on create todo item');
    }
  }

  Future<void> delete(String id) async {
    final result = await dio.delete('/todo?id=eq.$id');

    if (result.statusCode != 204) {
      throw Exception('Error on create todo item');
    }
  }
}
