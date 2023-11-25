import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo_item/stores/todo_item_page_store.dart';

import '../widgets/todo_item_widget.dart';

class TodoItemPage extends StatefulWidget {
  const TodoItemPage({super.key, required this.store});

  final TodoItemPageStore store;

  @override
  State<TodoItemPage> createState() => _TodoItemPageState();
}

class _TodoItemPageState extends State<TodoItemPage> {
  late final TodoItemPageStore store = widget.store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(store.appBarTitle),
        centerTitle: true,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: TodoItemWidget(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              child: FilledButton(
                onPressed: store.mainActionButtonOnPressed,
                child: Text(store.mainActionButtonLabel),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
