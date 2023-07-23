import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/revenue_account_model.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/currency_entity.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/usecases/currency_usecase.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CurrencyUsecase currencyUsecase;

  TodoBloc({required this.currencyUsecase})
      : super(const TodoLoaded(todoList: [])) {
    on<TodoEventAddTodo>((event, emit) async {
      final verify =
          await currencyUsecase.call(Params(amountTHB: event.todo.amountTHB));

      verify.fold(
          (failure) => emit(const TodoError(message: 'Service error')),
          (data) => emit(
              TodoLoaded(todoList: _addNewRevenueToList(event.todo, data))));
    });

    on<TodoEventUpdateTodo>((event, emit) {
      final List<RevenueAccountModel> todoList =
          List.from((state as TodoLoaded).todoList);

      todoList[event.index] = event.todo;

      emit(TodoLoaded(todoList: todoList));
    });

    on<TodoEventRemoveTodo>((event, emit) {
      final List<RevenueAccountModel> todoList =
          List.from((state as TodoLoaded).todoList);

      todoList.removeAt(event.index);

      emit(TodoLoaded(todoList: todoList));
    });
  }

  List<RevenueAccountModel> _addNewRevenueToList(
      RevenueAccountModel revenue, CurrencyEntity currency) {
    final List<RevenueAccountModel> todoList =
        List.from((state as TodoLoaded).todoList);

    revenue.amountUSD = currency.newAmount;
    todoList.add(revenue);

    return todoList;
  }
}
