import 'package:flutter/cupertino.dart';

abstract class TodoListTileStore {
  final IconData categoryIcon;
  final String title;
  final String subtitle;
  final DateTime data;
  final String annotation;

  TodoListTileStore({
    required this.categoryIcon,
    required this.title,
    required this.subtitle,
    required this.data,
    required this.annotation,
  });

  bool get isFinished;
}
