import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_flutter_with_bloc/core/error/exceptions.dart';
import 'package:sample_flutter_with_bloc/core/error/failures.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/datasources/currency_datasource.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/currency_model.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/repositories/currency_repository_impl.dart';

import '../repositories/currency_repository_test.mocks.dart';

@GenerateMocks([CurrencyDataSource])
void main() {
  group('getCurrencyFromTHBToUSD', () {
    final dataSource = MockCurrencyDataSource();
    final repository = CurrencyRepositoryImpl(dataSource: dataSource);

    const double amountTHB = 5000;
    final CurrencyModel tCurrencyModel = CurrencyModel(
        newAmount: 145.3,
        newCurrency: "USD",
        oldCurrency: "THB",
        oldAmount: 5000);

    test(
      'should get data source is successful',
      () async {
        // arrange
        when(dataSource.getCurrencyFromTHBToUSD(any))
            .thenAnswer((_) async => tCurrencyModel);
        // act
        await repository.getCurrencyFromTHBToUSD(amountTHB);
        // assert
        verify(dataSource.getCurrencyFromTHBToUSD(amountTHB));
      },
    );

    test(
      'should get data source is unsuccessful',
      () async {
        // arrange
        when(dataSource.getCurrencyFromTHBToUSD(any))
            .thenThrow(ServerException());
        // act
        final result = await repository.getCurrencyFromTHBToUSD(amountTHB);
        // assert
        verify(dataSource.getCurrencyFromTHBToUSD(amountTHB));
        expect(result, equals(Left(ServerFailure())));
      },
    );
  });
}
