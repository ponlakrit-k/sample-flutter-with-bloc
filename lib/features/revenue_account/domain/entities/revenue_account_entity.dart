import 'package:equatable/equatable.dart';

class RevenueAccountEntity extends Equatable {
  final String title;
  final double amountTHB;
  final double amountUSD;

  const RevenueAccountEntity({
    required this.title,
    required this.amountTHB,
    required this.amountUSD,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
