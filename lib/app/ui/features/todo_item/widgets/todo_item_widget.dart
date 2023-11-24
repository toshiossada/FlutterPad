import 'package:flutter/material.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTitleStyle = Theme.of(context).textTheme.titleMedium;

    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Título', style: textTitleStyle,),
            TextFormField(
              decoration: const InputDecoration(),
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
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 16,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 16,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
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
                  Text('Título', style: textTitleStyle,),
                  TextFormField(
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
                  Text('Título', style: textTitleStyle,),
                  TextFormField(
                    decoration: InputDecoration(
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
            Text('Título', style: textTitleStyle,),
            SizedBox(
              height: 177,
              child: TextFormField(
                expands: true,
                maxLines: null,
                minLines: null,
                decoration: const InputDecoration(
                  labelText: 'Anotações',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
