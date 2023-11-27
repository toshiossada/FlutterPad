import 'package:flutterpad/domain/entities/todo_list_tile_store.dart';

abstract class ITodoRepository {
  Future<TodoItemEntity> getById(String id);

  Future<void> addTodoItem(TodoItemEntity todoItemEntity);

  Future<void> updateTodoItem(TodoItemEntity todoItemEntity);

  Future<void> deleteTodoItem(TodoItemEntity todoItemEntity);

  Future<List<TodoItemEntity>> getTodoList();
}
