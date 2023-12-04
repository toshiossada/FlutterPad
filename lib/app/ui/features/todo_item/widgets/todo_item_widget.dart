import 'package:flutter/material.dart';
import 'package:flutterpad/app/core/shared/items_controller.dart';
import 'package:flutterpad/app/ui/extensions/context_extensions.dart';
import 'package:flutterpad/app/ui/stores/todo_list_tile_store.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({
    super.key,
    this.itemEntity,
    required this.itemsController
  });

  final TodoItemEntity? itemEntity;
  final ItemsController itemsController;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState();
}

class _TodoItemWidgetState extends State<TodoItemWidget> {

  @override
  void dispose() {
    super.dispose();
    widget.itemsController.disposeController();
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
                controller: widget.itemsController.titleController,
                decoration: const InputDecoration(
                  hintText: 'Título da tarefa',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Descrição',
                style: textTitleStyle,
              ),
              TextFormField(
                controller: widget.itemsController.subtitleController,
                decoration: const InputDecoration(
                  hintText: 'Título da tarefa',
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          AnimatedBuilder(
            builder: (context, e) {
              return Row(
                children: [
                  Text(
                    'Categoria',
                    style: textTitleStyle,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  CircleAvatar(
                    backgroundColor: widget.itemsController.listAlt ?  Colors.green : Colors.white,
                    child: IconButton.filledTonal(
                      icon: const Icon(
                        Icons.list_alt,
                      ), // Icon color
                      onPressed: () => widget.itemsController.updateListAlt()
                      ,
                      style: IconButton.styleFrom(),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CircleAvatar(
                    backgroundColor: widget.itemsController.calendarToday ? Colors.green : Colors.white,
                    child: IconButton.filledTonal(
                      icon: const Icon(
                        Icons.calendar_today,
                      ), // Icon color
                      onPressed: () => widget.itemsController.updateCalendarToday()
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  CircleAvatar(
                    backgroundColor: widget.itemsController.emojiEvents ? Colors.green : Colors.white,
                    child: IconButton.filledTonal(
                      onPressed: () => widget.itemsController.updateEmojiEvents(),
                      icon: const Icon(Icons.emoji_events),
                    ),
                  ),
                ],
              );
            }, 
            animation: widget.itemsController,
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
                      controller: widget.itemsController.dateController,
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
                      controller: widget.itemsController.timeController,
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
                  controller: widget.itemsController.annotationController,
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
