import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  final double newAmount;
  final String newCurrency;
  final String oldCurrency;
  final double oldAmount;

  const CurrencyEntity({
    required this.newAmount,
    required this.newCurrency,
    required this.oldCurrency,
    required this.oldAmount,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
