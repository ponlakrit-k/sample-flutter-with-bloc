import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter_with_bloc/screens/add_todo_screen.dart';

import '../blocs/todo/todo_bloc.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('TODO LIST'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoLoaded) {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = state.todoList[index];

                  return GestureDetector(
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.list),
                        title: Text(item.title),
                        subtitle: Text(item.subTitle),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddTodoScreen(
                                    index: index,
                                  )));
                    },
                    onDoubleTap: () {
                      todoBloc.add(TodoEventRemoveTodo(index: index));
                    },
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoScreen()));
        },
      ),
    );
  }
}
