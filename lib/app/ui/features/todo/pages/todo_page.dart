import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterpad/app/extensions/context_extensions.dart';
import 'package:flutterpad/app/ui/features/todo/controller/items_controller.dart';
import 'package:flutterpad/app/ui/features/todo/controller/todo_controller.dart';
import 'package:flutterpad/app/ui/features/todo/pages/todo_item_page.dart';
import 'package:flutterpad/app/ui/features/todo/widgets/todo_list_widget.dart';

import '../widgets/todo_body.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage>
    with SingleTickerProviderStateMixin {
  ItemsController itemsController = ItemsController();
  TodoController todoController = TodoController();

  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Stack(
                children: [
                  Material(
                    color: context.colorScheme.primary,
                    clipBehavior: Clip.antiAlias,
                    child: const SizedBox(
                      height: 222,
                      child: TodoBody(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 170, 20, 100),
                    child: Column(
                      children: [
                        AnimatedBuilder(
                            animation: itemsController,
                            builder: (BuildContext context, Widget? child) {
                              return Column(
                                children: [
                                  itemsController.itemsInitList.isEmpty
                                      ? SizedBox(
                                          width: size.width,
                                          child: const Center(
                                              child: Text(
                                            "Sem itens novo",
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white),
                                          )))
                                      : Column(
                                          children: [
                                            TodoListWidget(
                                                itemsController:
                                                    itemsController),
                                          ],
                                        ),
                                  itemsController.itemsAdd.isEmpty
                                      ? const SizedBox()
                                      : Column(
                                          children: [
                                            const Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  0, 20, 0, 10),
                                              child: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Finalizadas",
                                                    style:
                                                        TextStyle(fontSize: 20),
                                                  )),
                                            ),
                                            TodoListItemWidget(
                                                itemsController:
                                                    itemsController),
                                          ],
                                        ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        const circleInRadians = 2 * pi;

                        debugPrint(
                            'Valor interpolado entre 0 - 1: ${_animationController.value}');

                        return Transform.rotate(
                          angle: _animationController.value * circleInRadians,
                          child: FilledButton(
                            onPressed: () async {
                              await _animationController.forward();
                              _animationController.reset();
                              if (!mounted) return;

                              todoController.naviTodoAddList(
                                context,
                                TodoItemPage(
                                  title: 'Nova tarefa',
                                  itemsController: itemsController,
                                  titleButton: 'Criar',
                                ),
                              );
                            },
                            child: const Text('Criar Todo'),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
