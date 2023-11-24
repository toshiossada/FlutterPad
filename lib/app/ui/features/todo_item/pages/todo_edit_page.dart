import 'package:flutter/material.dart';

import '../widgets/todo_item_widget.dart';

class TodoEditPage extends StatefulWidget {
  const TodoEditPage({super.key});

  @override
  State<TodoEditPage> createState() => _TodoEditPageState();
}

class _TodoEditPageState extends State<TodoEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Tarefa'),
        centerTitle: true,
      ),
      body: Stack(
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
                onPressed: () {},
                child: const Text('Editar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
