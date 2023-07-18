part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class TodoEventAddTodo extends TodoEvent {
  final TodoModel todo;

  const TodoEventAddTodo({required this.todo});
}

class TodoEventRemoveTodo extends TodoEvent {
  final int index;

  const TodoEventRemoveTodo({required this.index});
}
