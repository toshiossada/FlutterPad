import 'package:flutter/material.dart';

class TodoController{
  naviTodoAddList(BuildContext context, Widget widget){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
  }

  pop(BuildContext context){
    Navigator.pop(
      context,
    );
  }
}