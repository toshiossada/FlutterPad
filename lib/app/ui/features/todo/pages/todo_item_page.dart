import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo/controller/items_controller.dart';
import 'package:flutterpad/app/ui/features/todo/controller/todo_controller.dart';
import 'package:flutterpad/app/ui/features/todo/stores/todo_list_tile_store.dart';

import '../widgets/todo_item_widget.dart';

class TodoItemPage extends StatefulWidget {
  const TodoItemPage({super.key, required this.title, required this.itemsController, required this.titleButton, this.todo});

  final String title;
  final ItemsController itemsController;
  final String titleButton;
  final TodoItemEntity? todo;

  @override
  State<TodoItemPage> createState() => _TodoItemPageState();
}

class _TodoItemPageState extends State<TodoItemPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TodoItemWidget(itemsController: widget.itemsController),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: SizedBox(
                height: 50,
                child: FilledButton(
                  onPressed: (){
                    if(widget.todo == null){
                      widget.itemsController.addItemsInitList();
                    }else{
                      widget.itemsController.updateTodo(item: widget.todo!);
                    }
                    TodoController().pop(context);
                  },
                  child: Text(widget.titleButton),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
