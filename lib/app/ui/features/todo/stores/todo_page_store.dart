import '../../../stores/todo_list_tile_store.dart';

abstract class TodoPageStore {
  Future<List<TodoItemEntity>> getTodoList();

  Future<void> navigateToAddTodoPage();

  Future<void> navigateToEditTodoPage(TodoItemEntity todoListTileStore);
}
