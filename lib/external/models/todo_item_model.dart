import 'package:flutter/material.dart';

import '../../domain/entities/todo_list_tile_store.dart';

class TodoItemModel extends TodoItemEntity {
  TodoItemModel({
    required super.id,
    required super.categoryId,
    required super.categoryIcon,
    required super.categoryColor,
    required super.title,
    required super.subtitle,
    required super.date,
    required super.annotation,
  });

  @override
  bool get isFinished {
    return date.isBefore(DateTime.now());
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryId': categoryId,
      'categoryIconCodePoint': categoryIcon.codePoint,
      'categoryColorValue': categoryColor.value,
      'title': title,
      'subtitle': subtitle,
      'date': date.millisecondsSinceEpoch,
      'annotation': annotation,
    };
  }

  factory TodoItemModel.fromMap({required Map<String, dynamic> map}) {
    final categoryIcon = IconData(
      map['categoryIconCodePoint'],
      fontFamily: 'MaterialIcons',
    );

    final categoryColor = Color(map['categoryColorValue']);

    final date = DateTime.fromMillisecondsSinceEpoch(map['date']);

    return TodoItemModel(
      id: map['id'],
      categoryId: map['categoryId'],
      categoryIcon: categoryIcon,
      categoryColor: categoryColor,
      title: map['title'],
      subtitle: map['subtitle'],
      date: date,
      annotation: map['annotation'],
    );
  }
}
