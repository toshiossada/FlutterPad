import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo/stores/todo_store_mock.dart';

import 'app/ui/features/todo/pages/todo_page.dart';
import 'app/ui/theme/flutter_pad_theme.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterPadTheme();




    return MaterialApp(
      title: 'FlutterPad',
      theme: theme.getLightThemeData(context),
      darkTheme: theme.getDarkThemeData(context),
      home: Builder(
        builder: (context) {
          return TodoPage(store: TodoStoreMock(context));
        },
      ),
    );
  }
}
