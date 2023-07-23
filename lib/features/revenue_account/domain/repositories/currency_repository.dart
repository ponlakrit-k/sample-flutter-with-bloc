import 'package:dartz/dartz.dart';
import 'package:sample_flutter_with_bloc/core/error/failures.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/currency_entity.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, CurrencyEntity>> getCurrencyFromTHBToUSD(
      double amountTHB);
}
