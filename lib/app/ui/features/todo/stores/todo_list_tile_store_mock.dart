import 'package:flutterpad/app/ui/features/todo/stores/todo_list_tile_store.dart';

class TodoListTileStoreMock extends TodoListTileStore {
  final bool finished;

  TodoListTileStoreMock({
    required super.categoryIcon,
    required super.title,
    required super.subtitle,
    required super.data,
    required super.annotation,
    required this.finished,
  });

  @override
  bool get isFinished => finished;
}
