import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo_item/widgets/todo_item_widget.dart';

class TodoAddPage extends StatelessWidget {
  const TodoAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
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
                child: const Text('Salvar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
