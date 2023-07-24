part of 'revenue_bloc.dart';

abstract class RevenueState extends Equatable {
  const RevenueState();

  @override
  List<Object> get props => [];
}

class RevenueInitial extends RevenueState {}

class RevenueLoaded extends RevenueState {
  final List<RevenueAccountModel> revenueList;

  const RevenueLoaded({required this.revenueList});

  @override
  List<Object> get props => [revenueList];
}

class RevenueError extends RevenueState {
  final String message;

  const RevenueError({required this.message});

  @override
  List<Object> get props => [message];
}
