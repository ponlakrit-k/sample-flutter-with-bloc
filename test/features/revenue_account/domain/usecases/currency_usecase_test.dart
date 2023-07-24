import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/currency_entity.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/repositories/currency_repository.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/usecases/currency_usecase.dart';

import 'currency_usecase_test.mocks.dart';

@GenerateMocks([CurrencyRepository])
void main() {
  test(
    'should get currency from the repository',
    () async {
      final repository = MockCurrencyRepository();
      final usecase = CurrencyUsecase(repository);

      const double amountTHB = 5000;
      const CurrencyEntity tCurrencyEntity = CurrencyEntity(
          newAmount: 145.3,
          newCurrency: "USD",
          oldCurrency: "THB",
          oldAmount: 5000);

      // arrange
      when(repository.getCurrencyFromTHBToUSD(any))
          .thenAnswer((_) async => const Right(tCurrencyEntity));
      // act
      final result = await usecase(Params(amountTHB: amountTHB));
      // assert
      expect(result, const Right(tCurrencyEntity));
      verify(repository.getCurrencyFromTHBToUSD(amountTHB));
    },
  );
}
