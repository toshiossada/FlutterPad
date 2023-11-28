import 'dart:math';

import 'package:flutterpad/app/ui/stores/todo_list_tile_store.dart';

class TodoItemStoreMock extends TodoItemEntity {
  final bool finished;

  TodoItemStoreMock({
    required super.categoryIcon,
    required super.categoryColor,
    required super.title,
    required super.subtitle,
    required super.date,
    required super.annotation,
    required this.finished,
  }) : super(id: (++_index).toString(), categoryId: _random.nextInt(3).toString());

  static final _random = Random();

  static int _index = 0;

  @override
  bool get isFinished => finished;
}
