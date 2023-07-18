import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_flutter_with_bloc/models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoLoaded(todoList: [])) {
    on<TodoEventAddTodo>((event, emit) {
      final List<TodoModel> todoList =
          List.from((state as TodoLoaded).todoList);

      todoList.add(event.todo);

      emit(TodoLoaded(todoList: todoList));
    });

    on<TodoEventRemoveTodo>((event, emit) {
      final List<TodoModel> todoList =
          List.from((state as TodoLoaded).todoList);

      todoList.removeAt(event.index);

      emit(TodoLoaded(todoList: todoList));
    });
  }
}
