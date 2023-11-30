import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/stores/todo_list_tile_store.dart';

class ItemsController with ChangeNotifier{

   getRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)].shade100;
  }

  List<TodoItemEntity> itemsAdd = [];
  List<TodoItemEntity> itemsInitList = [];

  //  List<TodoItemEntity>  get itemsInitList{
  //     return [
  //       TodoItemStoreMock(
  //         categoryIcon: Icons.work,
  //         categoryColor: getRandomColor(),
  //         title: 'Work Meeting',
  //         subtitle: 'Discuss project updates',
  //         date: DateTime.now().add(const Duration(days: 1)),
  //         annotation: 'Prepare presentation slides',
  //         finished: false,
  //       ),
  //       // TodoItemStoreMock(
  //       //   categoryIcon: Icons.home,
  //       //   categoryColor: getRandomColor(),
  //       //   title: 'House Chores',
  //       //   subtitle: 'Cleaning and organizing',
  //       //   date: DateTime.now().add(const Duration(days: 2)),
  //       //   annotation: 'Focus on garage and attic',
  //       //   finished: true,
  //       // ),
  //       TodoItemStoreMock(
  //         categoryIcon: Icons.shopping_cart,
  //         categoryColor: getRandomColor(),
  //         title: 'Grocery Shopping',
  //         subtitle: 'Buy groceries for the week',
  //         date: DateTime.now().add(const Duration(days: 3)),
  //         annotation: 'Remember to buy eggs and milk',
  //         finished: false,
  //       ),
  //       // TodoItemStoreMock(
  //       //   categoryIcon: Icons.fitness_center,
  //       //   categoryColor: getRandomColor(),
  //       //   title: 'Gym Time',
  //       //   subtitle: 'Leg day workout',
  //       //   date: DateTime.now().add(const Duration(days: 4)),
  //       //   annotation: 'Start with squats',
  //       //   finished: true,
  //       // ),
  //       TodoItemStoreMock(
  //         categoryIcon: Icons.book,
  //         categoryColor: getRandomColor(),
  //         title: 'Reading Time',
  //         subtitle: 'Read the next chapter of the novel',
  //         date: DateTime.now().add(const Duration(days: 5)),
  //         annotation: 'Chapter 5: The Mysterious Island',
  //         finished: false,
  //       ),
  //       // TodoItemStoreMock(
  //       //   categoryIcon: Icons.movie,
  //       //   categoryColor: getRandomColor(),
  //       //   title: 'Movie Night',
  //       //   subtitle: 'Watch a new release',
  //       //   date: DateTime.now().add(const Duration(days: 6)),
  //       //   annotation: 'Possibly watch the new sci-fi movie',
  //       //   finished: true,
  //       // ),
  //       TodoItemStoreMock(
  //         categoryIcon: Icons.music_note,
  //         categoryColor: getRandomColor(),
  //         title: 'Piano Practice',
  //         subtitle: 'Practice new songs',
  //         date: DateTime.now().add(const Duration(days: 7)),
  //         annotation: 'Focus on Beethoven pieces',
  //         finished: false,
  //       ),
  //       TodoItemStoreMock(
  //         categoryIcon: Icons.language,
  //         categoryColor: getRandomColor(),
  //         title: 'Language Practice',
  //         subtitle: 'Practice speaking Spanish',
  //         date: DateTime.now().add(const Duration(days: 8)),
  //         annotation: 'Focus on conversational skills',
  //         finished: false,
  //       ),
  //       // TodoItemStoreMock(
  //       //   categoryIcon: Icons.landscape,
  //       //   categoryColor: getRandomColor(),
  //       //   title: 'Gardening',
  //       //   subtitle: 'Plant new flowers',
  //       //   date: DateTime.now().add(const Duration(days: 9)),
  //       //   annotation: 'Need to buy tulips and daisies',
  //       //   finished: true,
  //       // ),
  //       TodoItemStoreMock(
  //         categoryIcon: Icons.computer,
  //         categoryColor: getRandomColor(),
  //         title: 'Software Update',
  //         subtitle: 'Update system software',
  //         date: DateTime.now().add(const Duration(days: 10)),
  //         annotation: 'Check compatibility with existing apps',
  //         finished: false,
  //       ),
  //       // TodoItemStoreMock(
  //       //   categoryIcon: Icons.bike_scooter,
  //       //   categoryColor: getRandomColor(),
  //       //   title: 'Bike Ride',
  //       //   subtitle: 'Evening bike ride in the park',
  //       //   date: DateTime.now().add(const Duration(days: 11)),
  //       //   annotation: 'Invite Sam and Alex for the ride',
  //       //   finished: true,
  //       // ),
  //       TodoItemStoreMock(
  //         categoryIcon: Icons.brush,
  //         categoryColor: getRandomColor(),
  //         title: 'Art Project',
  //         subtitle: 'Complete the canvas painting',
  //         date: DateTime.now().add(const Duration(days: 12)),
  //         annotation: 'Work on the landscape section',
  //         finished: false,
  //       ),
  //       TodoItemStoreMock(
  //         categoryIcon: Icons.star,
  //         categoryColor: getRandomColor(),
  //         title: 'Astronomy Observation',
  //         subtitle: 'Watch the meteor shower',
  //         date: DateTime.now().add(const Duration(days: 13)),
  //         annotation: 'Charge the telescope batteries',
  //         finished: false,
  //       ),
  //       // TodoItemStoreMock(
  //       //   categoryIcon: Icons.cake,
  //       //   categoryColor: getRandomColor(),
  //       //   title: 'Bake a Cake',
  //       //   subtitle: 'Bake a chocolate cake for the party',
  //       //   date: DateTime.now().add(const Duration(days: 14)),
  //       //   annotation: 'Buy chocolate and cream',
  //       //   finished: true,
  //       // ),
  //     ];
  //   }



 
} 