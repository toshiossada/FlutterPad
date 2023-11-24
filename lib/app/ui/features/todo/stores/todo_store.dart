import 'todo_list_tile_store.dart';

abstract class TodoStore {
  Future<List<TodoListTileStore>> getTodoList();

  Future<void> navigateToAddTodoPage();

  Future<void> navigateToEditTodoPage(TodoListTileStore todoListTileStore);
}
