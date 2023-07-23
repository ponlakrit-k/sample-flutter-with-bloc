import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/bloc/todo_bloc.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/presentation/pages/todos_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => TodoBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TodosScreen(),
    );
  }
}
