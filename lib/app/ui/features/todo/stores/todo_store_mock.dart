import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/features/todo/stores/todo_list_tile_store.dart';
import 'package:flutterpad/app/ui/features/todo/stores/todo_list_tile_store_mock.dart';
import 'package:flutterpad/app/ui/features/todo/stores/todo_store.dart';
import 'package:flutterpad/app/ui/features/todo_item/pages/todo_edit_page.dart';

import '../../todo_item/pages/todo_add_page.dart';

class TodoStoreMock extends TodoStore {
  TodoStoreMock(this.context);

  final BuildContext context;

  @override
  Future<List<TodoListTileStore>> getTodoList() async {
    return [
      TodoListTileStoreMock(
        categoryIcon: Icons.work,
        title: 'Work Meeting',
        subtitle: 'Discuss project updates',
        data: DateTime.now().add(Duration(days: 1)),
        annotation: 'Prepare presentation slides',
        finished: false,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.home,
        title: 'House Chores',
        subtitle: 'Cleaning and organizing',
        data: DateTime.now().add(Duration(days: 2)),
        annotation: 'Focus on garage and attic',
        finished: true,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.shopping_cart,
        title: 'Grocery Shopping',
        subtitle: 'Buy groceries for the week',
        data: DateTime.now().add(Duration(days: 3)),
        annotation: 'Remember to buy eggs and milk',
        finished: false,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.fitness_center,
        title: 'Gym Time',
        subtitle: 'Leg day workout',
        data: DateTime.now().add(Duration(days: 4)),
        annotation: 'Start with squats',
        finished: true,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.book,
        title: 'Reading Time',
        subtitle: 'Read the next chapter of the novel',
        data: DateTime.now().add(Duration(days: 5)),
        annotation: 'Chapter 5: The Mysterious Island',
        finished: false,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.movie,
        title: 'Movie Night',
        subtitle: 'Watch a new release',
        data: DateTime.now().add(Duration(days: 6)),
        annotation: 'Possibly watch the new sci-fi movie',
        finished: true,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.music_note,
        title: 'Piano Practice',
        subtitle: 'Practice new songs',
        data: DateTime.now().add(Duration(days: 7)),
        annotation: 'Focus on Beethoven pieces',
        finished: false,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.language,
        title: 'Language Practice',
        subtitle: 'Practice speaking Spanish',
        data: DateTime.now().add(Duration(days: 8)),
        annotation: 'Focus on conversational skills',
        finished: false,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.landscape,
        title: 'Gardening',
        subtitle: 'Plant new flowers',
        data: DateTime.now().add(Duration(days: 9)),
        annotation: 'Need to buy tulips and daisies',
        finished: true,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.computer,
        title: 'Software Update',
        subtitle: 'Update system software',
        data: DateTime.now().add(Duration(days: 10)),
        annotation: 'Check compatibility with existing apps',
        finished: false,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.bike_scooter,
        title: 'Bike Ride',
        subtitle: 'Evening bike ride in the park',
        data: DateTime.now().add(Duration(days: 11)),
        annotation: 'Invite Sam and Alex for the ride',
        finished: true,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.brush,
        title: 'Art Project',
        subtitle: 'Complete the canvas painting',
        data: DateTime.now().add(Duration(days: 12)),
        annotation: 'Work on the landscape section',
        finished: false,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.star,
        title: 'Astronomy Observation',
        subtitle: 'Watch the meteor shower',
        data: DateTime.now().add(Duration(days: 13)),
        annotation: 'Charge the telescope batteries',
        finished: false,
      ),
      TodoListTileStoreMock(
        categoryIcon: Icons.cake,
        title: 'Bake a Cake',
        subtitle: 'Bake a chocolate cake for the party',
        data: DateTime.now().add(Duration(days: 14)),
        annotation: 'Buy chocolate and cream',
        finished: true,
      ),
    ];
  }

  @override
  Future<void> navigateToAddTodoPage() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TodoAddPage(),
      ),
    );
  }

  @override
  Future<void> navigateToEditTodoPage(TodoListTileStore todoListTileStore) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TodoEditPage(),
      ),
    );
  }
}
