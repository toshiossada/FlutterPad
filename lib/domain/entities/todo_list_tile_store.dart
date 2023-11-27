import 'package:flutter/cupertino.dart';

import 'entity_base.dart';

abstract class TodoItemEntity extends EntityBase {
  final String categoryId;
  final IconData categoryIcon;
  final Color categoryColor;
  final String title;
  final String subtitle;
  final DateTime date;
  final String annotation;

  TodoItemEntity({
    required super.id,
    required this.categoryId,
    required this.categoryIcon,
    required this.categoryColor,
    required this.title,
    required this.subtitle,
    required this.date,
    required this.annotation,
  });

  bool get isFinished;
}
