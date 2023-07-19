import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todo/todo_bloc.dart';
import '../models/todo_model.dart';

class AddTodoScreen extends StatefulWidget {
  final int? index;

  const AddTodoScreen({super.key, this.index});

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
        title: Text(widget.index == null ? 'ADD TODO' : 'EDIT TODO'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (widget.index != null) {
            final todo = (state as TodoLoaded).todoList[widget.index!];

            titleCtrl.text = todo.title;
            subTitleCtrl.text = todo.subTitle;
          }

          return Padding(
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
                  child: Text(widget.index == null ? 'ADD TODO' : 'EDIT TODO'),
                  onPressed: () {
                    if (widget.index == null) {
                      todoBloc.add(TodoEventAddTodo(
                          todo: TodoModel(
                              title: titleCtrl.text,
                              subTitle: subTitleCtrl.text)));
                    } else {
                      todoBloc.add(TodoEventUpdateTodo(
                          index: widget.index!,
                          todo: TodoModel(
                              title: titleCtrl.text,
                              subTitle: subTitleCtrl.text)));
                    }

                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
