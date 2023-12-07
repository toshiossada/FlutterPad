import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo/stores/todo_item_store_mock.dart';
import 'package:flutterpad/app/ui/features/todo/stores/todo_list_tile_store.dart';

class ItemsController with ChangeNotifier{

   getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100;
  }

  IconData icone = Icons.list_alt;
  bool listAlt = true;
  bool calendarToday = false;
  bool emojiEvents = false;

  updateListAlt(){
    icone = Icons.list_alt;
    listAlt = true;
    calendarToday = false;
    emojiEvents = false;
    notifyListeners();
  }
  updateCalendarToday(){
    icone = Icons.calendar_today;
    listAlt = false;
    calendarToday = true;
    emojiEvents = false;
    notifyListeners();
  }
  updateEmojiEvents(){
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
  addItemsInitList(){
    itemsInitList.add(
      TodoItemStoreMock(
          categoryIcon: icone,
          categoryColor: getRandomColor(),
          title: titleController.text,
          subtitle: subtitleController.text,
          date: dateController.text,
          annotation: annotationController.text,
          finished: false, 
          time: titleController.text,
        ),
    );
    notifyListeners();
  }

  updateItemsInitList({required TodoItemEntity item}){
    itemsAdd.add(
       TodoItemStoreMock(
          categoryIcon: item.categoryIcon,
          categoryColor: item.categoryColor,
          title: item.title,
          subtitle: item.subtitle,
          date: item.date,
          annotation: item.annotation,
          finished: true, 
          time: item.time,
        ));
    itemsInitList.remove(item);
    notifyListeners();
  }

    updateItemsAdd({required TodoItemEntity item}){
    itemsInitList.add(
       TodoItemStoreMock(
          categoryIcon: item.categoryIcon,
          categoryColor: item.categoryColor,
          title: item.title,
          subtitle: item.subtitle,
          date: item.date,
          annotation: item.annotation,
          finished: false,
          time: item.time,
        ));
    itemsAdd.remove(item);
    notifyListeners();
  }

  editeTodo({required TodoItemEntity item}){
    icone = item.categoryIcon;
    titleController.text = item.title;
    dateController.text = item.date;
    timeController.text = item.time;
    annotationController.text = item.annotation;
    subtitleController.text = item.subtitle;
  }

  updateTodo({required TodoItemEntity item}){
    itemsInitList.remove(item);
    itemsInitList.add(
      TodoItemStoreMock(
         categoryIcon: icone,
          categoryColor: getRandomColor(),
          title: titleController.text,
          subtitle: subtitleController.text,
          date: dateController.text,
          annotation: annotationController.text,
          finished: false, 
          time: titleController.text,
      ));
      notifyListeners();
  }

  disposeController(){
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