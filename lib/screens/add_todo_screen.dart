import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todo/todo_bloc.dart';
import '../models/todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final titleCtrl = TextEditingController();
  final subTitleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('ADD TODO'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextField(
              controller: subTitleCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sub title',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              child: const Text('ADD NEW TODO'),
              onPressed: () {
                todoBloc.add(TodoEventAddTodo(
                    todo: TodoModel(
                        title: titleCtrl.text, subTitle: subTitleCtrl.text)));

                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
