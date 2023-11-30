import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo_item/pages/todo_item_page.dart';

class TodoController{
  naviTodoAddList(BuildContext context){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TodoItemPage(title: 'Nova tarefa',),
      ),
    );
  }
}