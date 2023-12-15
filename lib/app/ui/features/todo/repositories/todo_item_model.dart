import 'package:flutter/material.dart';

import '../stores/todo_list_tile_store.dart';

class TodoItemModel extends TodoItemEntity {
  final bool finished;

  TodoItemModel({
    required super.id,
    required super.categoryId,
    required super.categoryIcon,
    required super.categoryColor,
    required super.title,
    required super.subtitle,
    required super.date,
    required super.annotation,
    required super.time,
    required this.finished,
  });

  @override
  bool get isFinished {
    return finished;
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryId': categoryId,
      'categoryIconCodePoint': categoryIcon.codePoint,
      'categoryColorValue': categoryColor.value,
      'title': title,
      'subtitle': subtitle,
      'date': date,
      'annotation': annotation,
      'time': time,
      'finished': finished,
    };
  }

  factory TodoItemModel.fromMap({required dynamic map}) {
    final categoryIcon = IconData(
      map['categoryIconCodePoint'],
      fontFamily: 'MaterialIcons',
    );

    final categoryColor = Color(map['categoryColorValue']);

    return TodoItemModel(
      id: map['id'].toString(),
      categoryId: map['categoryId'].toString(),
      categoryIcon: categoryIcon,
      categoryColor: categoryColor,
      title: map['title'],
      subtitle: map['subtitle'],
      date: map['date'],
      annotation: map['annotation'],
      time: map['time'],
      finished: map['finished'],
    );
  }

  factory TodoItemModel.create({
    required String categoryId,
    required IconData categoryIcon,
    required Color categoryColor,
    required String title,
    required String subtitle,
    required String date,
    required String annotation,
    required String time,
    required bool finished,
  }) {
    return TodoItemModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      categoryId: categoryId,
      categoryIcon: categoryIcon,
      categoryColor: categoryColor,
      title: title,
      subtitle: subtitle,
      date: date,
      annotation: annotation,
      time: time,
      finished: finished,
    );
  }

  factory TodoItemModel.fromEntity({
    required TodoItemEntity entity,
    required bool finished,
  }) {
    return TodoItemModel(
      id: entity.id,
      categoryId: entity.categoryId,
      categoryIcon: entity.categoryIcon,
      categoryColor: entity.categoryColor,
      title: entity.title,
      subtitle: entity.subtitle,
      date: entity.date,
      annotation: entity.annotation,
      time: entity.time,
      finished: finished,
    );
  }

  factory TodoItemModel.update({
    required TodoItemEntity entity,
    required String categoryId,
    required IconData categoryIcon,
    required Color categoryColor,
    required String title,
    required String subtitle,
    required String date,
    required String annotation,
    required String time,
  }) {
    return TodoItemModel(
      id: entity.id,
      categoryId: categoryId,
      categoryIcon: categoryIcon,
      categoryColor: categoryColor,
      title: title,
      subtitle: subtitle,
      date: date,
      annotation: annotation,
      time: time,
      finished: false,
    );
  }
}
