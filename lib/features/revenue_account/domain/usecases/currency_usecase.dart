import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_flutter_with_bloc/core/error/failures.dart';
import 'package:sample_flutter_with_bloc/core/usecase/usecase.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/currency_entity.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/repositories/currency_repository.dart';

class CurrencyUsecase implements UseCase<CurrencyEntity, Params> {
  final CurrencyRepository repository;

  CurrencyUsecase(this.repository);

  @override
  Future<Either<Failure, CurrencyEntity>> call(Params params) async {
    return await repository.getCurrencyFromTHBToUSD(params.amountTHB);
  }
}

class Params extends Equatable {
  final double amountTHB;

  Params(this.amountTHB);

  @override
  List<Object> get props => [amountTHB];
}
