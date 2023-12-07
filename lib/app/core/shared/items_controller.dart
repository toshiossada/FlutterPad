import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterpad/app/core/repositories/todo_repository.dart';
import 'package:flutterpad/app/ui/stores/todo_list_tile_store.dart';

import '../repositories/todo_item_model.dart';

class ItemsController with ChangeNotifier {
  late TodoRepository repository;
  ItemsController() {
    initLists();
  }

  void initLists() async {
    repository = TodoRepository();
    final finishedItems = await repository.finishedList();
    final unfinishedItems = await repository.unfinishedList();

    itemsAdd = finishedItems;
    itemsInitList = unfinishedItems;
  }

  getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100;
  }

  IconData icone = Icons.list_alt;
  bool listAlt = true;
  bool calendarToday = false;
  bool emojiEvents = false;

  updateListAlt() {
    icone = Icons.list_alt;
    listAlt = true;
    calendarToday = false;
    emojiEvents = false;
    notifyListeners();
  }

  updateCalendarToday() {
    icone = Icons.calendar_today;
    listAlt = false;
    calendarToday = true;
    emojiEvents = false;
    notifyListeners();
  }

  updateEmojiEvents() {
    icone = Icons.emoji_events;
    listAlt = false;
    calendarToday = false;
    emojiEvents = true;
    notifyListeners();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController annotationController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();

  List<TodoItemEntity> itemsAdd = [];
  List<TodoItemEntity> itemsInitList = [];
  addItemsInitList() async {
    final item = TodoItemModel.create(
      categoryId: DateTime.now().millisecondsSinceEpoch.toString(),
      categoryIcon: icone,
      categoryColor: getRandomColor(),
      title: titleController.text,
      subtitle: subtitleController.text,
      date: dateController.text,
      annotation: annotationController.text,
      time: titleController.text,
      finished: false,
    );
    await repository.create(item);
    itemsInitList.add(item);
    notifyListeners();
  }

  updateItemsInitList({required TodoItemEntity item}) {
    final finishedItem = TodoItemModel.fromEntity(
      entity: item,
      finished: true,
    );
    repository.update(finishedItem);
    itemsAdd.add(finishedItem);
    itemsInitList.remove(item);
    notifyListeners();
  }

  updateItemsAdd({required TodoItemEntity item}) {
    final unfinishedItem = TodoItemModel.fromEntity(
      entity: item,
      finished: false,
    );
    repository.update(unfinishedItem);
    itemsInitList.add(unfinishedItem);
    itemsAdd.remove(item);
    notifyListeners();
  }

  editeTodo({required TodoItemEntity item}) {
    icone = item.categoryIcon;
    titleController.text = item.title;
    dateController.text = item.date;
    timeController.text = item.time;
    annotationController.text = item.annotation;
    subtitleController.text = item.subtitle;
  }

  updateTodo({required TodoItemEntity item}) {
    itemsInitList.remove(item);
    final updatedItem = TodoItemModel.update(
      entity: item,
      categoryId: DateTime.now().millisecondsSinceEpoch.toString(),
      categoryIcon: icone,
      categoryColor: getRandomColor(),
      title: titleController.text,
      subtitle: subtitleController.text,
      date: dateController.text,
      annotation: annotationController.text,
      time: titleController.text,
    );
    repository.update(updatedItem);
    itemsInitList.add(updatedItem);
    notifyListeners();
  }

  disposeController() {
    titleController.text = "";
    dateController.text = "";
    timeController.text = "";
    annotationController.text = "";
    subtitleController.text = "";
    icone = Icons.list_alt;
    listAlt = true;
    calendarToday = false;
    emojiEvents = false;
  }
}
