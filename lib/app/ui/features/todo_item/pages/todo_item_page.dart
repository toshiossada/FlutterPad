import 'package:flutter/material.dart';

import '../widgets/todo_item_widget.dart';

class TodoItemPage extends StatefulWidget {
  const TodoItemPage({super.key, required this.title});

  final String title;

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
          const Padding(
            padding: EdgeInsets.all(16),
            child: TodoItemWidget(),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 0,
          //   right: 0,
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          //     child: FilledButton(
          //       onPressed: store.mainActionButtonOnPressed,
          //       child: Text(store.mainActionButtonLabel),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
