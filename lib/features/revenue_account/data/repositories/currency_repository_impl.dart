import 'package:dartz/dartz.dart';
import 'package:sample_flutter_with_bloc/core/error/exceptions.dart';
import 'package:sample_flutter_with_bloc/core/error/failures.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/datasources/currency_datasource.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/currency_entity.dart';

import '../../domain/repositories/currency_repository.dart';

class CurrencyRepositoryImpl implements CurrencyRepository {
  final CurrencyDataSource dataSource;

  CurrencyRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, CurrencyEntity>> getCurrencyFromTHBToUSD(
      double amountTHB) async {
    try {
      final data = await dataSource.getCurrencyFromTHBToUSD(amountTHB);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
