import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/datasources/currency_datasource.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/currency_model.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/currency_entity.dart';

class MockCurrencyDataSource extends Mock implements CurrencyDataSource {}

void main() {
  final tCurrencyModel = CurrencyModel(
    newAmount: 145.3,
    newCurrency: 'USD',
    oldAmount: 5000,
    oldCurrency: 'THB',
  );

  test(
    'should be a subclass of Currency entity',
    () async {
      // assert
      expect(tCurrencyModel, isA<CurrencyEntity>());
    },
  );

  group('toJson', () {
    test(
      'should return a JSON map containing the proper data',
      () async {
        // act
        final result = tCurrencyModel.toJson();
        // assert
        final expectedMap = {
          "new_amount": 145.3,
          "new_currency": 'USD',
          "old_amount": 5000,
          "old_currency": 'THB',
        };
        expect(result, expectedMap);
      },
    );
  });
}
