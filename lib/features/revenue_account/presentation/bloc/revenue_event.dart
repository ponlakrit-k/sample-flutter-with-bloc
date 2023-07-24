part of 'revenue_bloc.dart';

abstract class RevenueEvent extends Equatable {
  const RevenueEvent();

  @override
  List<Object> get props => [];
}

class RevenueEventAddRevenue extends RevenueEvent {
  final RevenueAccountModel revenue;

  const RevenueEventAddRevenue({required this.revenue});
}

class RevenueEventUpdateRevenue extends RevenueEvent {
  final int index;
  final RevenueAccountModel revenue;

  const RevenueEventUpdateRevenue({required this.index, required this.revenue});
}

class RevenueEventRemoveRevenue extends RevenueEvent {
  final int index;

  const RevenueEventRemoveRevenue({required this.index});
}
