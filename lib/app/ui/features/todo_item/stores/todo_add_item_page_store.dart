import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo_item/stores/todo_item_page_store.dart';

class TodoAddItemPageStore extends TodoItemPageStore {
  final BuildContext context;

  TodoAddItemPageStore({required this.context});

  @override
  String get appBarTitle => 'Nova Tarefa';

  @override
  // TODO: implement mainActionButtonLabel
  String get mainActionButtonLabel => 'Salvar';

  @override
  void mainActionButtonOnPressed() {
    Navigator.of(context).pop();
  }
}
