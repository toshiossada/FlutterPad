import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo_item/stores/todo_item_page_store.dart';

class TodoEditItemPageStore extends TodoItemPageStore {
  final BuildContext context;

  TodoEditItemPageStore({required this.context});

  @override
  String get appBarTitle => 'Editar Tarefa';

  @override
  String get mainActionButtonLabel => 'Editar';

  @override
  void mainActionButtonOnPressed() {
    Navigator.of(context).pop();
  }
}
