import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';

import '../../../stores/todo_list_tile_store.dart';
import '../stores/todo_page_store.dart';
import '../widgets/todo_list_widget.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key, required this.store});

  final TodoPageStore store;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
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
                    child: SizedBox(
                      height: 222,
                      child: Stack(
                        children: [
                          Positioned(
                            left: -191,
                            top: 78,
                            right: 239,
                            bottom: -198,
                            child: Material(
                              color: Colors.transparent,
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: context.colorScheme.secondary,
                                  // color: Colors.red,
                                  width: 44,
                                ),
                              ),
                              child: const SizedBox.square(
                                dimension: 348,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 327,
                            top: -27,
                            right: -82,
                            bottom: 104,
                            child: Material(
                              color: Colors.transparent,
                              shape: CircleBorder(
                                side: BorderSide(
                                  color: context.colorScheme.secondary,
                                  // color: Colors.red,
                                  width: 35,
                                ),
                              ),
                              child: const SizedBox.square(
                                dimension: 145,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Dezembro 16, 2023',
                                      style: context.textTheme.headlineMedium?.copyWith(
                                        color: context.colorScheme.onPrimary,
                                        fontSize: 16,
                                        height: 1.1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 31,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'FlutterPad',
                                      style: context.textTheme.headlineLarge?.copyWith(
                                        color: context.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                      ),
                                    ),
                                    Text(
                                      'Todo List',
                                      style: context.textTheme.headlineLarge?.copyWith(
                                        color: context.colorScheme.onPrimary,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 158, 16, 16),
                    child: FutureBuilder(
                      future: widget.store.getTodoList(),
                      builder: (context, snapshot) {
                        final List<TodoItemEntity> todoList = snapshot.data ?? [];

                        final openTodoList = todoList.where((element) => !element.isFinished).toList();
                        final finishedTodoList = todoList.where((element) => element.isFinished).toList();

                        return Column(
                          children: [
                            TodoListWidget(
                              openTodoList: openTodoList,
                              onPressed: (todo) => widget.store.navigateToEditTodoPage(todo),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Row(
                                children: [
                                  Text(
                                    'Finalizadas',
                                    style: context.textTheme.titleLarge,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            TodoListWidget(
                              openTodoList: finishedTodoList,
                              onPressed: (todo) => widget.store.navigateToEditTodoPage(todo),
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                child: FilledButton(
                  onPressed: widget.store.navigateToAddTodoPage,
                  child: const Text('Criar Todo'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
