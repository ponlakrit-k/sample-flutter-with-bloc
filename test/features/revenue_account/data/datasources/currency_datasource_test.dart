import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:sample_flutter_with_bloc/core/error/exceptions.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/datasources/currency_datasource.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/currency_model.dart';

import '../datasources/currency_datasource_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('getCurrencyFromTHBToUSD', () {
    final mockHttpClient = MockClient();
    final dataSource = CurrencyDataSourceImpl(client: mockHttpClient);

    const double amountTHB = 5000;
    final CurrencyModel tCurrencyModel = CurrencyModel(
        newAmount: 145.3,
        newCurrency: "USD",
        oldCurrency: "THB",
        oldAmount: 5000);

    test('should perform a GET request on a URL with amount', () async {
      // arrange
      when(mockHttpClient.get(
        any,
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => http.Response(
          '{"new_amount": 145.3, "new_currency": "USD", "old_currency": "THB", "old_amount": 5000}',
          200));
      // act
      dataSource.getCurrencyFromTHBToUSD(amountTHB);
      // assert
      verify(mockHttpClient.get(
        Uri.parse(
            "https://api.api-ninjas.com/v1/convertcurrency?have=THB&want=USD&amount=$amountTHB"),
        headers: {
          'Content-Type': 'application/json',
        },
      ));
    });

    test(
      'should return CurrencyEntity when the response code is 200 (success)',
      () async {
        // arrange
        when(mockHttpClient.get(
          any,
          headers: anyNamed('headers'),
        )).thenAnswer((_) async => http.Response(
            '{"new_amount": 145.3, "new_currency": "USD", "old_currency": "THB", "old_amount": 5000}',
            200));
        // act
        final result = await dataSource.getCurrencyFromTHBToUSD(amountTHB);
        // assert
        expect(result, equals(tCurrencyModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
            (_) async => http.Response('Something went wrong', 404));
        // act
        final call = dataSource.getCurrencyFromTHBToUSD;
        // assert
        expect(() => call(amountTHB),
            throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
