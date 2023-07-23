import 'dart:convert';

import 'package:sample_flutter_with_bloc/features/revenue_account/domain/entities/revenue_account_entity.dart';

RevenueAccountModel revenueAccountModelFromJson(String str) =>
    RevenueAccountModel.fromJson(json.decode(str));

String revenueAccountModelToJson(RevenueAccountModel data) =>
    json.encode(data.toJson());

class RevenueAccountModel extends RevenueAccountEntity {
  String title;
  double amountTHB;
  double amountUSD;

  RevenueAccountModel({
    required this.title,
    required this.amountTHB,
    required this.amountUSD,
  }) : super(title: title, amountTHB: amountTHB, amountUSD: amountUSD);

  factory RevenueAccountModel.fromJson(Map<String, dynamic> json) =>
      RevenueAccountModel(
        title: json["title"],
        amountTHB: json["amountTHB"],
        amountUSD: json["amountUSD"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "amountTHB": amountTHB,
        "amountUSD": amountUSD,
      };
}
