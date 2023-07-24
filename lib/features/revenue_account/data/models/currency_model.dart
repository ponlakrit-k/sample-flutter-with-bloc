import 'dart:convert';

import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/currency_entity.dart';

CurrencyModel currencyModelFromJson(String str) =>
    CurrencyModel.fromJson(json.decode(str));

String currencyModelToJson(CurrencyModel data) => json.encode(data.toJson());

class CurrencyModel extends CurrencyEntity {
  double newAmount;
  String newCurrency;
  String oldCurrency;
  double oldAmount;

  CurrencyModel({
    required this.newAmount,
    required this.newCurrency,
    required this.oldCurrency,
    required this.oldAmount,
  }) : super(
            newAmount: newAmount,
            newCurrency: newCurrency,
            oldCurrency: oldCurrency,
            oldAmount: oldAmount);

  factory CurrencyModel.fromJson(Map<String, dynamic> json) => CurrencyModel(
        newAmount: json["new_amount"]?.toDouble(),
        newCurrency: json["new_currency"],
        oldCurrency: json["old_currency"],
        oldAmount: json["old_amount"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "new_amount": newAmount,
        "new_currency": newCurrency,
        "old_currency": oldCurrency,
        "old_amount": oldAmount,
      };
}
