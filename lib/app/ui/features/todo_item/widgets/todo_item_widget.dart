import 'package:flutter/material.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';
import 'package:flutterpad/app/ui/extensions/datetime_extension.dart';
import 'package:flutterpad/app/ui/stores/todo_list_tile_store.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({
    super.key,
    this.itemEntity,
  });

  final TodoItemEntity? itemEntity;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {

  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final annotationController = TextEditingController();

  void setControllerValuesFromTodoItemEntity(TodoItemEntity todoItemEntity) {
    titleController.text = todoItemEntity.title;
    dateController.text = todoItemEntity.date.toDateString();
    timeController.text = todoItemEntity.date.toDateString();
    annotationController.text = todoItemEntity.annotation;
  }

  @override
  void initState() {
    super.initState();
    if (widget.itemEntity != null) {
      setControllerValuesFromTodoItemEntity(widget.itemEntity!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTitleStyle = Theme.of(context).textTheme.titleMedium;

    return Theme(
      data: Theme.of(context).copyWith(
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            padding: const EdgeInsets.all(12),
            shape: CircleBorder(
              side: BorderSide(
                color: context.colorScheme.surfaceVariant,
                width: 2,
              ),
            ),
          ),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Título',
                style: textTitleStyle,
              ),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Título da tarefa',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                'Categoria',
                style: textTitleStyle,
              ),
              const SizedBox(
                width: 24,
              ),
              IconButton.filledTonal(
                icon: const Icon(
                  Icons.list_alt,
                ), // Icon color
                onPressed: () {},
                style: IconButton.styleFrom(),
              ),
              const SizedBox(
                width: 16,
              ),
              IconButton.filledTonal(
                icon: const Icon(
                  Icons.calendar_today,
                ), // Icon color
                onPressed: () {},
              ),
              const SizedBox(
                width: 16,
              ),
              IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.emoji_events),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data',
                      style: textTitleStyle,
                    ),
                    TextFormField(
                      controller: dateController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Data',
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hora',
                      style: textTitleStyle,
                    ),
                    TextFormField(
                      controller: timeController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Hora',
                        suffixIcon: Icon(Icons.access_time_outlined),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Anotação',
                style: textTitleStyle,
              ),
              SizedBox(
                height: 177,
                child: TextFormField(
                  controller: annotationController,
                  expands: true,
                  maxLines: null,
                  minLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Anotação da tarefa',
                  ),
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.top,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
