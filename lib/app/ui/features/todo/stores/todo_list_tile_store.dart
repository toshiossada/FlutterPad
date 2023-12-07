import 'package:flutter/cupertino.dart';

abstract class TodoItemEntity {
  final String categoryId;
  final String id;
  final IconData categoryIcon;
  final Color categoryColor;
  final String title;
  final String subtitle;
  final String date;
  final String time;
  final String annotation;

  TodoItemEntity({
    required this.id,
    required this.categoryId,
    required this.categoryIcon,
    required this.categoryColor,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.time,
    required this.annotation,
  });

  bool get isFinished;
}
