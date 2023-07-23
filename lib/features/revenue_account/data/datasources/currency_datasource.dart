import 'package:sample_flutter_with_bloc/core/error/exceptions.dart';
import 'package:sample_flutter_with_bloc/features/revenue_account/data/models/currency_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class CurrencyDataSource {
  Future<CurrencyModel> getCurrencyFromTHBToUSD(double amountTHB);
}

class CurrencyDataSourceImpl implements CurrencyDataSource {
  final http.Client client;

  CurrencyDataSourceImpl({required this.client});

  @override
  Future<CurrencyModel> getCurrencyFromTHBToUSD(double amountTHB) async {
    final response = await client.get(
      Uri.parse(
          "https://api.api-ninjas.com/v1/convertcurrency?have=THB&want=USD&amount=$amountTHB"),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return CurrencyModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
