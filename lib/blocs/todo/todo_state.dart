part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todoList;

  const TodoLoaded({required this.todoList});

  @override
  List<Object> get props => [todoList];
}
