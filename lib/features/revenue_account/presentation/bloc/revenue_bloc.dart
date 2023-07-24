import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/revenue_account_model.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/currency_entity.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/usecases/currency_usecase.dart';

part 'revenue_event.dart';
part 'revenue_state.dart';

class RevenueBloc extends Bloc<RevenueEvent, RevenueState> {
  final CurrencyUsecase currencyUsecase;

  RevenueBloc({required this.currencyUsecase})
      : super(const RevenueLoaded(revenueList: [])) {
    on<RevenueEventAddRevenue>((event, emit) async {
      final verify = await currencyUsecase
          .call(Params(amountTHB: event.revenue.amountTHB));

      verify.fold(
          (failure) => emit(const RevenueError(message: 'Service error')),
          (data) => emit(RevenueLoaded(
              revenueList: _addNewRevenueToList(event.revenue, data))));
    });

    on<RevenueEventUpdateRevenue>((event, emit) {
      final List<RevenueAccountModel> todoList =
          List.from((state as RevenueLoaded).revenueList);

      todoList[event.index] = event.revenue;

      emit(RevenueLoaded(revenueList: todoList));
    });

    on<RevenueEventRemoveRevenue>((event, emit) {
      final List<RevenueAccountModel> todoList =
          List.from((state as RevenueLoaded).revenueList);

      todoList.removeAt(event.index);

      emit(RevenueLoaded(revenueList: todoList));
    });
  }

  List<RevenueAccountModel> _addNewRevenueToList(
      RevenueAccountModel revenue, CurrencyEntity currency) {
    final List<RevenueAccountModel> todoList =
        List.from((state as RevenueLoaded).revenueList);

    revenue.amountUSD = currency.newAmount;
    todoList.add(revenue);

    return todoList;
  }
}
