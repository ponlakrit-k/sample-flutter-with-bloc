import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/revenue_account_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(const TodoLoaded(todoList: [])) {
    on<TodoEventAddTodo>((event, emit) {
      final List<RevenueAccountModel> todoList =
          List.from((state as TodoLoaded).todoList);

      todoList.add(event.todo);

      emit(TodoLoaded(todoList: todoList));
    });

    on<TodoEventRemoveTodo>((event, emit) {
      final List<RevenueAccountModel> todoList =
          List.from((state as TodoLoaded).todoList);

      todoList.removeAt(event.index);

      emit(TodoLoaded(todoList: todoList));
    });

    on<TodoEventUpdateTodo>((event, emit) {
      final List<RevenueAccountModel> todoList =
          List.from((state as TodoLoaded).todoList);

      todoList[event.index] = event.todo;

      emit(TodoLoaded(todoList: todoList));
    });
  }
}
